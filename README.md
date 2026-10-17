# Tecelon releases

Releases of Tecelon for your own computer. Each release is published here when it is cut:
its install files are on the [Releases](../../releases) page, and its images are on
GitHub's container registry, `ghcr.io/tecelon`.

## Install

With Docker running (Docker Desktop on a Mac or Windows, or Docker Engine on Linux):

```bash
curl -fsSL https://raw.githubusercontent.com/tecelon/releases/main/install.sh | bash
```

Run the same line again to upgrade. Your settings and data are kept.

## What is here

- `install.sh`: installs the latest release, or `VERSION=<version>`.
- `latest.json` and `releases.json`: the newest release and every release, which installed
  instances check for updates.
- A GitHub Release per version, holding `bundle.tar.gz`, which is what installs it.

This repository is written by the release job; changes made here by hand are overwritten.
