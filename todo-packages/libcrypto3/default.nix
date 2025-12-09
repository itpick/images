{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libcrypto3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libcrypto3";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libcrypto3";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libcrypto3";
    homepage = "https://github.com/TODO/libcrypto3";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
