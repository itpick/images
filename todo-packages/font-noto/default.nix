{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-noto
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-noto";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-noto";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-noto";
    homepage = "https://github.com/TODO/font-noto";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
