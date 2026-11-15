#!/usr/bin/env bash

usage() {
    echo "cosign, sign and verify container images; checks the signatures kyverno enforces"
    # shellcheck disable=1004,2016
    echo '
                 _
  ___ ___  ___ (_) __ _ _ __
 / __/ _ \/ __|| |/ _` | `_ \
| (_| (_) \__ \| | (_| | | | |
 \___\___/|___/|_|\__, |_| |_|
                  |___/
  '
}

main_brew() {
    require_brew cosign
}

main_pacman() {
    require_pacman cosign
}

main() {
    if command -v cosign &>/dev/null; then
        msg "cosign $(cosign version 2>/dev/null | awk '/GitVersion/ {print $2}') installed successfully" "success"
    fi

    return 0
}
