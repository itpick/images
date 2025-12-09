{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-selenium-node-base
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-selenium-node-base";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-selenium-node-base";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-selenium-node-base";
    homepage = "https://github.com/TODO/docker-selenium-node-base";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
