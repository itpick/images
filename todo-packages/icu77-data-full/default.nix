{ lib, stdenv, fetchFromGitHub, ... }:

# Package: icu77-data-full
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "icu77-data-full";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "icu77-data-full";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for icu77-data-full";
    homepage = "https://github.com/TODO/icu77-data-full";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
