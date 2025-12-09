{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-amiri
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-amiri";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-amiri";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-amiri";
    homepage = "https://github.com/TODO/font-amiri";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
