# symlink-b.nix
{ stdenv, lib }:

stdenv.mkDerivation {
  name = "b-wrapper";

  dontUnpack = true;

  installPhase = ''
    mkdir -p /bin/s
    ln -s ~/dotfiles/scripts /bin/s
  '';
}
