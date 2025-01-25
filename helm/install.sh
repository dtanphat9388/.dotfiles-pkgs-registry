#!/bin/bash

brew install helm
helm plugin install https://github.com/databus23/helm-diff
helm plugin install https://github.com/chartmuseum/helm-push
