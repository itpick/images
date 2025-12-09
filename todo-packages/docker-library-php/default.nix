{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-library-php
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-library-php";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-library-php";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-library-php";
    homepage = "https://github.com/TODO/docker-library-php";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
