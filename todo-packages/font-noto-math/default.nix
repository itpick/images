{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-noto-math
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-noto-math";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-noto-math";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-noto-math";
    homepage = "https://github.com/TODO/font-noto-math";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
