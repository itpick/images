{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libarrow_compute
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libarrow_compute";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libarrow_compute";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libarrow_compute";
    homepage = "https://github.com/TODO/libarrow_compute";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
