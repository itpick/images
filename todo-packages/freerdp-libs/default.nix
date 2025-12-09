{ lib, stdenv, fetchFromGitHub, ... }:

# Package: freerdp-libs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "freerdp-libs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "freerdp-libs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for freerdp-libs";
    homepage = "https://github.com/TODO/freerdp-libs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
