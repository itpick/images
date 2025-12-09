{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libxml2-utils
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libxml2-utils";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libxml2-utils";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libxml2-utils";
    homepage = "https://github.com/TODO/libxml2-utils";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
