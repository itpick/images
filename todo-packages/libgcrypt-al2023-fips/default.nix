{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libgcrypt-al2023-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libgcrypt-al2023-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libgcrypt-al2023-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libgcrypt-al2023-fips";
    homepage = "https://github.com/TODO/libgcrypt-al2023-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
