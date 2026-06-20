# NUR Repository (snowdreamtech/nur)

[English](README.md) | [简体中文](README-zh.md)

[![NUR](https://img.shields.io/badge/NUR-snowdreamtech-blue.svg)](https://github.com/nix-community/NUR)

Personal [NUR](https://github.com/nix-community/NUR) repository for [snowdreamtech](https://github.com/snowdreamtech) packages.

## Available Packages

| Package                           | Description                                                                         |
| --------------------------------- | ----------------------------------------------------------------------------------- |
| [unirtm](pkgs/unirtm/default.nix) | **UniRTM** (Uni Runtime and Tools Manager) — cross-platform developer toolchain manager |

### What is UniRTM?
**UniRTM** is a cross-platform tool that runs on Linux, macOS, and Windows. It helps developers unify and easily manage runtime environments, tools, and project-level tasks. For detailed usage, visit the [UniRTM Official Repository](https://github.com/snowdreamtech/UniRTM).

## Usage

You can use the packages in this repository in several ways within your Nix environment.

### Method 1: Direct Install (Recommended for Nix Flakes Users)

If you have Flakes enabled, you can run UniRTM directly for testing:
```bash
nix run github:snowdreamtech/nur#unirtm -- --help
```

Or install it to your current user profile:
```bash
nix profile install github:snowdreamtech/nur#unirtm
```

### Method 2: As a Flake Input

Add it to your project `flake.nix` or NixOS configuration:
```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:snowdreamtech/nur";
  };

  outputs = { self, nixpkgs, nur, ... }: {
    nixosConfigurations.my-machine = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nur.nixosModules.nur
        # ... other configs ...
      ];
    };
  };
}
```

### Method 3: Traditional (Non-flakes)

Include it in `configuration.nix` or other configurations by fetching the tarball:
```nix
{ ... }:
let
  nur = import (builtins.fetchTarball "https://github.com/snowdreamtech/nur/archive/master.tar.gz") {
    inherit pkgs;
  };
in
{
  environment.systemPackages = [ 
    nur.repos.snowdreamtech.unirtm 
  ];
}
```

## License

This project is licensed under the MIT License.
