{ lib, stdenv, fetchFromGitHub, ... }:

# Package: electric
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "electric";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "electric";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for electric";
    homepage = "https://github.com/TODO/electric";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
