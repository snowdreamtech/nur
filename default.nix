# snowdreamtech NUR repository
# This file defines the package set exposed by this NUR repo.
{ pkgs ? import <nixpkgs> {} }:

{
  # Package modules
  modules = import ./modules;

  # Overlay for use in nixpkgs overlays
  overlay = final: prev: {
    snowdreamtech = {
      unirtm = prev.callPackage ./pkgs/unirtm {};
    };
  };

  # Individual packages
  unirtm = pkgs.callPackage ./pkgs/unirtm {};
}
