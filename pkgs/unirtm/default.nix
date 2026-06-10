# This file is auto-generated. DO NOT EDIT.
# To regenerate, run: nix eval --json .#packages.x86_64-linux.unirtm.meta

{ lib, fetchurl, stdenvNoCC, ... }:

let
  version = "0.0.0";
in
stdenvNoCC.mkDerivation {
  pname = "unirtm";
  inherit version;

  # Placeholder — GoReleaser will replace this file on each release.
  src = fetchurl {
    url = "https://github.com/snowdreamtech/UniRTM/releases/download/v${version}/unirtm_Linux_x86_64.tar.gz";
    sha256 = lib.fakeHash;
  };

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./unirtm $out/bin/unirtm
  '';

  meta = {
    description = "UniRTM (Uni Runtime and Tools Manager) is a cross-platform developer toolchain manager";
    homepage = "https://github.com/snowdreamtech/UniRTM";
    license = lib.licenses.mit;
    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "armv6l-linux"
      "armv7l-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    maintainers = [ ];
  };
}
