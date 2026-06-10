# NUR Repository (snowdreamtech/nur)

[![NUR](https://img.shields.io/badge/NUR-snowdreamtech-blue.svg)](https://github.com/nix-community/NUR)

Personal [NUR](https://github.com/nix-community/NUR) repository for [snowdreamtech](https://github.com/snowdreamtech) packages.

## Available Packages

| Package                           | Description                                                                         |
| --------------------------------- | ----------------------------------------------------------------------------------- |
| [unirtm](pkgs/unirtm/default.nix) | UniRTM (Uni Runtime and Tools Manager) — cross-platform developer toolchain manager |

## Usage

### As a NUR repository

Add to your `flake.nix`:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:snowdreamtech/nur";
  };

  outputs = { self, nixpkgs, nur, ... }: {
    # Use as overlay
    nixosConfigurations.my-machine = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nur.nixosModules.nur
        # ...
      ];
    };
  };
}
```

### Without flakes

```nix
{ ... }:
let
  nur = import (builtins.fetchTarball "https://github.com/snowdreamtech/nur/archive/master.tar.gz") {
    inherit pkgs;
  };
in
{
  environment.systemPackages = [ nur.repos.snowdreamtech.unirtm ];
}
```

### Direct install

```bash
nix profile install github:snowdreamtech/nur#unirtm
```

## License

MIT
