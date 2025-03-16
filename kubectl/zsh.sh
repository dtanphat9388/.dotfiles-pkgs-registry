#!/bin/bash

# -- ALIASES

alias k="kubectl"
compdef k=kubectl

# -- COMPLETIONS

if [[ ! -s "$ZSH_COMPLETIONS_DIR/_kubectl" ]]; then
  kubectl completion zsh >$ZSH_COMPLETIONS_DIR/_kubectl
  source $ZSH_COMPLETIONS_DIR/_kubectl
fi

# -- FUNCTIONS

kconf() {
  eval "$KUBE_EDITOR $KUBECONFIG"
}

_k_server_healthcheck() {
  local server
  server=$(kubectl config view --minify -o jsonpath='{.clusters[].cluster.server}')
  curl --connect-timeout 0.3 -s -k "${server}/livez" >/dev/null
  return $?
}

kping() {
  _k_server_healthcheck && echo pong || echo "Ops! Server failed connect"
}

# -- kresources [$query]
kresources() {
  _k_server_healthcheck || return
  local query=$1
  kubectl api-resources | fzf --header-lines=1 -q ${query:-""} | awk '{print $1}'
}

# -- kget $resource [$query]
kget() {
  _k_server_healthcheck || return
  local resource=$1
  local query=${2:-" "}
  [ -z "$resource" ] && resource=$(kresources)
  [ -n "$resource" ] && k get $resource | fzf --header-lines=1 --prompt="$resource: " --query $query --bind 'enter:execute(echo {1})+abort'
}

kdes() {
  _k_server_healthcheck || return
  local resource selected
  resource=$1
  [ -n "$resource" ] && selected=$(kget $resource)
  [ -n "$selected" ] && k describe $resource $selected | code -
}

klog() {
  _k_server_healthcheck || return
  local selected query
  fzf_query=$1
  selected=$(kget po $fzf_query)
  [ -n "$selected" ] && k logs -f $selected
}

kex() {
  _k_server_healthcheck || return
  local command=${@:-bash}
  local selected=$(kget po)
  [ -n "$selected" ] && kubectl exec -ti $selected -- $command
}

# syntax: kedit [resource]
ke() {
  _k_server_healthcheck || return
  local resource selected query
  resource=$1
  [ -z "$resource" ] && resource=$(kresources)
  [ -n "$resource" ] && selected=$(kget $resource)
  [ -n "$selected" ] && kubectl edit $resource $selected
}

# syntax: kdel [resource]
kdel() {
  _k_server_healthcheck || return
  local resource selected
  resource=$1
  [ -z "$resource" ] && resource=$(kresources)
  [ -n "$resource" ] && selected=$(kget $resource)
  [ -n "$selected" ] && echo $selected | xargs -d '\n' -L 1 kubectl delete $resource
}

# syntax: kc
kc() {
  selected=$(kubectl config get-contexts --output name | fzf --prompt="Contexts: ")
  [ -z "$selected" ] && return
  kubectl config use-context $selected
}

# syntax: kns [namespace_name]
kns() {
  _k_server_healthcheck || return
  fzf_query=$1
  selected=$(kget ns $fzf_query)
  [ -n "$selected" ] && kubectl config set-context --current --namespace $selected
}

# restart
kre() {
  _k_server_healthcheck || return
  resource=$1
  [ -z "$resource" ] && resource=$(kresources '^deployments | statefulsets | daemonsets')
  [ -n "$resource" ] && selected=$(kget $resource | tr -s '\n')
  [ -n "$selected" ] && echo $selected | xargs -L 1 kubectl rollout restart $resource
}

kgc() {
  _k_server_healthcheck || return
  #-- clean all pods with status=Evicted
  kubectl get po --all-namespaces | grep Evicted | xargs -L 1 sh -c 'kubectl delete po -n $0 $1'
  #-- comming soon
  # clean old replicasets
  # clean jobs is done
  # clean ing with service not found
  # clean namespace with no pod
}

# path ecr registry secret
# syntax: kecr [namespace,...]
kecr() {
  _k_server_healthcheck || return
  NAMESPACE=$1
  [[ -z $NAMESPACE ]] && NAMESPACES=$(kget ns)
  [[ -z "$NAMESPACES" ]] && return 1
  credential=$(kubectl create secret docker-registry $SECRET_NAME \
    --docker-server=$DOCKER_SERVER --docker-username=$DOCKER_USER --docker-password=$DOCKER_PASS --docker-email=$DOCKER_EMAIL \
    --dry-run=client \
    -o jsonpath='{.data.\.dockerconfigjson}')
  IFS=','
  for NS in $NAMESPACES; do
    kubectl patch secret $SECRET_NAME -n $NS -p '{"data": {".dockerconfigjson": "'$credential'"}}'
  done
}

# kssl "path/to/key" "path/to/crt"
kssl() {
  _k_server_healthcheck || return
  local key cert ns name newkey newcert tempName tempNS
  key=$1
  cert=$2
  [ -z "$key" ] && return 1
  [ -z "$cert" ] && return 1
  ns=$(kget ns)
  [ -z "$ns" ] && return 1
  name=$(kget secret)
  [ -z "$name" ] && return 1
  tempName=temp-ssl
  tempNS=kube-public
  kubectl create secret tls $tempName --key $key --cert $cert -n $tempNS
  newkey=$(kubectl get secret $tempName -n $tempNS -o jsonpath='{.data.tls\.key}')
  newcrt=$(kubectl get secret $tempName -n $tempNS -o jsonpath='{.data.tls\.crt}')
  kubectl patch secret $name -n $ns -p '{"data": {"tls.key": "'$newkey'", "tls.crt": "'$newcrt'"}}'
  kubectl delete secret $tempName -n $tempNS
}

kimg() {
  _k_server_healthcheck || return
  local params=$1
  local output=$(
    kubectl get pods $params -o jsonpath="{.items[*].spec.containers[*].image}" |
      tr -s '[[:space:]]' '\n' |
      sort |
      uniq -c |
      # fzf |\
      awk '{print $2}'
  )
  echo -n $output
}
