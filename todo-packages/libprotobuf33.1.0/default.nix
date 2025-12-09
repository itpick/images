{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libprotobuf33.1.0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libprotobuf33.1.0";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libprotobuf33.1.0";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libprotobuf33.1.0";
    homepage = "https://github.com/TODO/libprotobuf33.1.0";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
