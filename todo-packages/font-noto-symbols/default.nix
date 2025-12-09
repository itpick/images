{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-noto-symbols
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-noto-symbols";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-noto-symbols";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-noto-symbols";
    homepage = "https://github.com/TODO/font-noto-symbols";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
