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
        flake-a = get-flake ../a;

        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        packages = flake-a.packages.${system};
      }
    );
}
