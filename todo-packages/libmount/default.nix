{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libmount
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libmount";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libmount";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libmount";
    homepage = "https://github.com/TODO/libmount";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
