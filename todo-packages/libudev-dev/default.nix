{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libudev-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libudev-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libudev-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libudev-dev";
    homepage = "https://github.com/TODO/libudev-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
