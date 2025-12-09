{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-misc
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-misc";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-misc";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-misc";
    homepage = "https://github.com/TODO/font-misc";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
