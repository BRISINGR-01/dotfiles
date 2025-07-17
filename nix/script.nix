# symlink-b.nix
{ stdenv, lib }:

stdenv.mkDerivation {
  name = "b-wrapper";

  dontUnpack = true;

  installPhase = ''
    ln -s /home/alex/files/hyprland-crashes /home/alex/.cache/hyprland
  '';
}
