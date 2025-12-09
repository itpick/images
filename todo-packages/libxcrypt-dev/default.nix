{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libxcrypt-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libxcrypt-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libxcrypt-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libxcrypt-dev";
    homepage = "https://github.com/TODO/libxcrypt-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
