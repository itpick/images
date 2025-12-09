{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libxdp
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libxdp";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libxdp";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libxdp";
    homepage = "https://github.com/TODO/libxdp";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
