{ nixpkgs ? import <nixpkgs> {} }:
let
  inherit (nixpkgs) pkgs;
in
pkgs.stdenv.mkDerivation rec {
  name = "vscode-env-selector";
  buildInputs = with pkgs; [
    nodejs
    yarn
  ];
  postInstall = ''
    yarn install
    export PATH="$(yarn bin):$PATH"
  '';
  shellHook = postInstall;
}
