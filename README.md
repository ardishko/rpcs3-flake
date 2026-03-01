# rpcs3-flake

Nix flake for the [RPCS3](https://rpcs3.net/) Playstation 3 emulator.

## Usage

This is just the package, no options or anything. Plain and simple.

### 1. Add the flake input

```nix
inputs.rpcs3-flake.url = "github:ardishko/rpcs3-flake";
```

### 2. Install the package

(given that you've passed the inputs to the file where you define your packages...)

**Home Manager:**
```nix
home.packages = [ inputs.rpcs3-flake.packages.${pkgs.system}.rpcs3 ];
```

**NixOS:**
```nix
environment.systemPackages = [ inputs.rpcs3-flake.packages.${pkgs.system}.rpcs3 ];
```

## Updates

The auto-updater is currently WIP, however below is how it's supposed to work:

The package is automatically updated on-release (from [here](https://github.com/RPCS3/rpcs3-binaries-linux/releases)) via GitHub Actions. When a new RPCS3 release is detected with a Linux AppImage, the package link is updated and a PR is opened. If the build passes, the PR is merged automatically.

## Why was this created when there's already an RPCS3 package on nixpkgs?

RPCN requires a relatively up to date version of RPCS3 to function properly and I feel that nixpkgs's packages don't land in unstable fast enough nor do backports to stable come fast enough for most programs. I also created this because a derivation based on the appimage is far easier to package and maintain than the full source code. The goal of this flake is to provide a newer version of RPCS3 than Nixpkgs Unstable (and of course Nixpkgs Stable) for online play. The appimage is also how the developer intend RPCS3 to be used on Linux-based systems, so they control what's inside the appimage bundle, making my and your life easier.
