{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-selenium-node-chromium
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-selenium-node-chromium";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-selenium-node-chromium";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-selenium-node-chromium";
    homepage = "https://github.com/TODO/docker-selenium-node-chromium";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
