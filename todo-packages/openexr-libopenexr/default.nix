{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openexr-libopenexr
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openexr-libopenexr";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openexr-libopenexr";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openexr-libopenexr";
    homepage = "https://github.com/TODO/openexr-libopenexr";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
