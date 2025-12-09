{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libwasmtime
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libwasmtime";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libwasmtime";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libwasmtime";
    homepage = "https://github.com/TODO/libwasmtime";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
