{
  description = "Flake B";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-b.url = "path:../b";
  };

  outputs = { self, nixpkgs, flake-utils, flake-b }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        packages = flake-b.packages.${system};
      }
    );
}
