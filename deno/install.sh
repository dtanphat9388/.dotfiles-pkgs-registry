if [[ $(command -v asdf) ]]; then
  asdf plugin add deno
  asdf install deno latest
else
  echo "asdf not found"
fi
