#!/usr/bin/env bash
# appback bash completion
# shellcheck disable=SC2207,SC2012

_appback() {
  local cur prev commands apps
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  commands="export import list install-completions"

  # appback이 있는 디렉토리에서 apps/ 목록 로드
  local script_dir apps_dir
  script_dir="$(cd "$(dirname "$(command -v appback 2>/dev/null || echo "${COMP_WORDS[0]}")")" && pwd)"
  if [[ -d "$script_dir/apps" ]]; then
    apps_dir="$script_dir/apps"
  elif [[ -d "$script_dir/../share/appback/apps" ]]; then
    apps_dir="$script_dir/../share/appback/apps"
  fi
  apps=$(ls "$apps_dir/" 2>/dev/null | sed 's/\.sh$//')

  case "$prev" in
    appback)
      COMPREPLY=($(compgen -W "$commands --help --version --completions" -- "$cur"))
      ;;
    export|import)
      COMPREPLY=($(compgen -W "$apps --output --no-keychain --non-interactive --help" -- "$cur"))
      ;;
    --output)
      COMPREPLY=($(compgen -d -- "$cur"))
      ;;
  esac
}

complete -F _appback appback
