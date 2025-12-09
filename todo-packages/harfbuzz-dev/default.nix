{ lib, stdenv, fetchFromGitHub, ... }:

# Package: harfbuzz-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "harfbuzz-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "harfbuzz-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for harfbuzz-dev";
    homepage = "https://github.com/TODO/harfbuzz-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
