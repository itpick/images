{ lib, stdenv, fetchFromGitHub, ... }:

# Package: containers-shortnames
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "containers-shortnames";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "containers-shortnames";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for containers-shortnames";
    homepage = "https://github.com/TODO/containers-shortnames";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
