{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-selenium-router
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-selenium-router";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-selenium-router";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-selenium-router";
    homepage = "https://github.com/TODO/docker-selenium-router";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
