# snowdreamtech NUR repository
# https://github.com/nix-community/NUR
#
# This file defines the package set exposed by this NUR repo.
# GoReleaser will automatically update pkgs/unirtm/default.nix on each release.
{ pkgs ? import <nixpkgs> {} }:

{
  # Individual packages (GoReleaser manages pkgs/unirtm/default.nix)
  unirtm = pkgs.callPackage ./pkgs/unirtm {};

  # NixOS modules
  modules = {
    # Add NixOS modules here as attribute-to-path mappings
    # example = ./modules/example.nix;
  };

  # Overlays
  overlays = {
    snowdreamtech = final: prev: {
      snowdreamtech-unirtm = final.callPackage ./pkgs/unirtm {};
    };
  };
}
