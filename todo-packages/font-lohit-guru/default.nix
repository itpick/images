{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-lohit-guru
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-lohit-guru";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-lohit-guru";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-lohit-guru";
    homepage = "https://github.com/TODO/font-lohit-guru";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
