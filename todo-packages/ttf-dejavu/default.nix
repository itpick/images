{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ttf-dejavu
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ttf-dejavu";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ttf-dejavu";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ttf-dejavu";
    homepage = "https://github.com/TODO/ttf-dejavu";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
