{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kaniko-warmer
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kaniko-warmer";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kaniko-warmer";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kaniko-warmer";
    homepage = "https://github.com/TODO/kaniko-warmer";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
