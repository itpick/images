{ lib, stdenv, fetchFromGitHub, ... }:

# Package: selenium-server
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "selenium-server";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "selenium-server";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for selenium-server";
    homepage = "https://github.com/TODO/selenium-server";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
