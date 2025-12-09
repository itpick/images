{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libfabric1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libfabric1";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libfabric1";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libfabric1";
    homepage = "https://github.com/TODO/libfabric1";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
