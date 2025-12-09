{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libxcb-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libxcb-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libxcb-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libxcb-dev";
    homepage = "https://github.com/TODO/libxcb-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
