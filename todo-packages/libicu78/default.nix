{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libicu78
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libicu78";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libicu78";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libicu78";
    homepage = "https://github.com/TODO/libicu78";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
