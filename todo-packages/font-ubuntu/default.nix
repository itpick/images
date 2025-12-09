{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-ubuntu
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-ubuntu";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-ubuntu";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-ubuntu";
    homepage = "https://github.com/TODO/font-ubuntu";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
