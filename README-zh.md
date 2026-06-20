# NUR Repository (snowdreamtech/nur)

[English](README.md) | [简体中文](README-zh.md)

[![NUR](https://img.shields.io/badge/NUR-snowdreamtech-blue.svg)](https://github.com/nix-community/NUR)

这是为 [snowdreamtech](https://github.com/snowdreamtech) 提供的个人 [Nix User Repository (NUR)](https://github.com/nix-community/NUR) 仓库。

## 包含的软件包

| 软件包名 | 描述 |
| --- | --- |
| [unirtm](pkgs/unirtm/default.nix) | **UniRTM** (Uni Runtime and Tools Manager) — 跨平台开发者工具链管理器 |

### 什么是 UniRTM？
**UniRTM** 是一个支持在 Linux、macOS 和 Windows 上运行的跨平台工具。它能够帮助开发者统一、便捷地管理各种开发环境运行时 (Runtime)、工具 (Tools) 以及执行项目级任务 (Tasks)。有关详细用法，请访问 [UniRTM 官方主页](https://github.com/snowdreamtech/UniRTM)。

## 如何使用

你可以通过多种方式在 Nix 环境中使用本仓库的包。

### 方式一：直接运行或安装 (推荐 Nix Flakes 用户)

如果你开启了 Flakes，可以直接运行以下命令测试 UniRTM：
```bash
nix run github:snowdreamtech/nur#unirtm -- --help
```

或者将它安装到当前用户的环境中：
```bash
nix profile install github:snowdreamtech/nur#unirtm
```

### 方式二：作为 Flake Inputs 引入

在你的项目 `flake.nix` 或 NixOS 配置中引入：
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
        # ... 其他配置 ...
      ];
    };
  };
}
```

### 方式三：传统方式 (Non-flakes)

在 `configuration.nix` 或其他配置文件中通过拉取源码方式引入：
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

## 开源协议

本项目基于 MIT 协议开源。
