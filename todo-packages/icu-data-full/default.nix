{ lib, stdenv, fetchFromGitHub, ... }:

# Package: icu-data-full
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "icu-data-full";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "icu-data-full";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for icu-data-full";
    homepage = "https://github.com/TODO/icu-data-full";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
