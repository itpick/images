{ lib, stdenv, fetchFromGitHub, ... }:

# Package: harfbuzz-icu
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "harfbuzz-icu";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "harfbuzz-icu";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for harfbuzz-icu";
    homepage = "https://github.com/TODO/harfbuzz-icu";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
