#!/usr/bin/env bash
# A control plane on this computer, from https://tecelon.github.io/releases: the latest release, or
# VERSION. Run it again to upgrade; INSTANCE=<name> for another.
# Its modules, named after it (curl … | bash -s -- control-plane conversations):
# core always; the control plane alone, when a new one names none.
set -euo pipefail
FROM='https://tecelon.github.io/releases'
VERSION="${VERSION:-$(curl -fsSL "$FROM/releases/latest" | sed -n 's/.*"version":"\([^"]*\)".*/\1/p')}"
[ -n "$VERSION" ] || { echo "no release to install from $FROM" >&2; exit 1; }
DIR="${CONTROL_PLANE_HOME:-$HOME/.control-plane}/releases/$VERSION"
mkdir -p "$DIR"
curl -fsSL "$FROM/releases/$VERSION/bundle.tar.gz" | tar -xz -C "$DIR"
echo "release $VERSION, in $DIR"
RELEASE="$VERSION" RELEASES_URL="$FROM/releases" IMAGES_FROM='ghcr.io/tecelon' exec bash "$DIR/infra/local/install.sh" "$@"
