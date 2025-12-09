{ lib, stdenv, fetchFromGitHub, ... }:

# Package: containers-common
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "containers-common";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "containers-common";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for containers-common";
    homepage = "https://github.com/TODO/containers-common";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
