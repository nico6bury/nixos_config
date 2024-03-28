#!/bin/sh
pushd ~/nixos-flake
alejandra . &>/dev/null
git diff -U0 *.nix
echo "NixOS Rebuilding..."
sudo nixos-rebuild switch &>nixos-switch.log || (
cat nixos-switch.log | grep --color error && false)
#gen=$(nixos-rebuild list-generation | grep current)
#git commit -am "$gen"
git commit -am "changed system configuration"
popd
