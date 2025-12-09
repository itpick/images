{ lib, stdenv, fetchFromGitHub, ... }:

# Package: boost-filesystem
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "boost-filesystem";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "boost-filesystem";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for boost-filesystem";
    homepage = "https://github.com/TODO/boost-filesystem";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
