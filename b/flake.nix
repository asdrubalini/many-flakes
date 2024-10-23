{
  description = "Flake B";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-a.url = "path:../a";
  };

  outputs = { self, nixpkgs, flake-utils, flake-a }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        packages = flake-a.packages.${system};
      }
    );
}
