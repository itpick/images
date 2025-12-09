{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-unfonts-core
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-unfonts-core";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-unfonts-core";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-unfonts-core";
    homepage = "https://github.com/TODO/font-unfonts-core";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
