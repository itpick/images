{ lib, stdenv, fetchFromGitHub, ... }:

# Package: just-newuidmap-newgidmap
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "just-newuidmap-newgidmap";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "just-newuidmap-newgidmap";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for just-newuidmap-newgidmap";
    homepage = "https://github.com/TODO/just-newuidmap-newgidmap";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
