{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libquiche
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libquiche";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libquiche";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libquiche";
    homepage = "https://github.com/TODO/libquiche";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
