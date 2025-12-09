{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libxft-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libxft-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libxft-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libxft-dev";
    homepage = "https://github.com/TODO/libxft-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
