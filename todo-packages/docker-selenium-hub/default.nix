{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-selenium-hub
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-selenium-hub";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-selenium-hub";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-selenium-hub";
    homepage = "https://github.com/TODO/docker-selenium-hub";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
