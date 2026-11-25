#!/usr/bin/env bash

usage() {
    echo "
          __ _  _____   _____
         / _\` |/ _ \ \ / / __|
        | (_| | (_) \ V / (__
         \__, |\___/ \_/ \___|
         |___/

       govc is a command-line interface for VMware vSphere (vCenter and ESXi)
    "
}

main_brew() {
    require_brew govc
}

main_pacman() {
    require_github_release "vmware/govmomi" "govc" "govc_Linux_x86_64" "tar.gz"
}

main_apt() {
    require_github_release "vmware/govmomi" "govc" "govc_Linux_x86_64" "tar.gz"
}

main() {
    if command -v govc &>/dev/null; then
        msg "$(govc version 2>/dev/null | head -1) installed successfully" "success"
    fi

    return 0
}
