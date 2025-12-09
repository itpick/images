{ lib, stdenv, fetchFromGitHub, ... }:

# Package: liberica-21
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "liberica";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "liberica";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for liberica";
    homepage = "https://github.com/TODO/liberica";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
