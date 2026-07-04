#!/bin/bash
# .chezmoiscripts/linux/run_once_before_bootstrap.sh
# Ensures Nushell is present on the Linux host system

if ! command -v nu &>/dev/null; then
  echo "=== Bootstrapping: Installing Nushell via Apt ==="
  sudo apt-get update -y
  sudo apt-get install -y nushell
fi
