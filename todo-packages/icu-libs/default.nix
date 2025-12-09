{ lib, stdenv, fetchFromGitHub, ... }:

# Package: icu-libs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "icu-libs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "icu-libs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for icu-libs";
    homepage = "https://github.com/TODO/icu-libs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
