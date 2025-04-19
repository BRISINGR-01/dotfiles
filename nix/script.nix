# symlink-b.nix
{ stdenv, lib }:

stdenv.mkDerivation {
  name = "b-wrapper";

  dontUnpack = true;

  installPhase = ''
    mkdir -p /bin/b
    mkdir -p /bin/s
    ln -s ~/dotfiles/bin /bin/b
    ln -s ~/dotfiles/scripts /bin/s
  '';
}
