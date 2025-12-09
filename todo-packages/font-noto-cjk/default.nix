{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-noto-cjk
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-noto-cjk";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-noto-cjk";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-noto-cjk";
    homepage = "https://github.com/TODO/font-noto-cjk";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
