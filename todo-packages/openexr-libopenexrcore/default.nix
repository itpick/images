{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openexr-libopenexrcore
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openexr-libopenexrcore";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openexr-libopenexrcore";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openexr-libopenexrcore";
    homepage = "https://github.com/TODO/openexr-libopenexrcore";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
