{ lib, stdenv, fetchFromGitHub, ... }:

# Package: containers-storage
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "containers-storage";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "containers-storage";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for containers-storage";
    homepage = "https://github.com/TODO/containers-storage";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
