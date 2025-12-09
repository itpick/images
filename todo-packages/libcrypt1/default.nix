{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libcrypt1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libcrypt1";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libcrypt1";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libcrypt1";
    homepage = "https://github.com/TODO/libcrypt1";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
