{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "prolog";

  packages = with pkgs; [
    swi-prolog
  ];

  shellHook = ''
    echo "Welcome to your Prolog development shell!"
  '';
}