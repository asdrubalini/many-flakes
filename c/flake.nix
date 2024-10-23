{
  description = "Flake B";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    get-flake.url = "github:ursi/get-flake";
  };

  outputs = { self, nixpkgs, flake-utils, get-flake }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        flake-b = get-flake ../b;

        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        packages = flake-b.packages.${system};
      }
    );
}
