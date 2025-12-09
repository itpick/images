{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-selenium-standalone-chromium
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-selenium-standalone-chromium";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-selenium-standalone-chromium";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-selenium-standalone-chromium";
    homepage = "https://github.com/TODO/docker-selenium-standalone-chromium";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
