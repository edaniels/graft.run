#!/bin/sh
# Bootstrap installer for graft - fetches and runs the real install script from GitHub.
# Usage: curl --proto '=https' --tlsv1.2 -sSf https://graft.run/install.sh | sh

set -e

INSTALL_SCRIPT_URL="https://raw.githubusercontent.com/edaniels/graft/main/scripts/install.sh"

if command -v curl >/dev/null 2>&1; then
    exec sh -c "$(curl --proto '=https' --tlsv1.2 -sSf "$INSTALL_SCRIPT_URL")" -- "$@"
elif command -v wget >/dev/null 2>&1; then
    exec sh -c "$(wget --https-only -qO- "$INSTALL_SCRIPT_URL")" -- "$@"
else
    echo "error: need 'curl' or 'wget' (neither found)" >&2
    exit 1
fi
