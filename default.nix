{ nixpkgs ? import <nixpkgs> {} }:
let
  inherit (nixpkgs) pkgs;

  nixPackages = [
    pkgs.nodejs-10_x
    pkgs.yarn
  ];
in
pkgs.stdenv.mkDerivation rec {
  name = "vscode-env-selector";
  buildInputs = nixPackages;
  postInstall =
    ''
      yarn install
      export PATH="$PWD/node_modules/.bin/:$PATH"
    '';
  shellHook = postInstall;
}
