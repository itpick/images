{ lib, stdenv, fetchFromGitHub, ... }:

# Package: stakater-reloader
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "stakater-reloader";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "stakater-reloader";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for stakater-reloader";
    homepage = "https://github.com/TODO/stakater-reloader";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
