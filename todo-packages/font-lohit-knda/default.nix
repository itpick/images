{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-lohit-knda
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-lohit-knda";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-lohit-knda";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-lohit-knda";
    homepage = "https://github.com/TODO/font-lohit-knda";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
