{ lib, stdenv, fetchFromGitHub, ... }:

# Package: hubble-export-stdout
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "hubble-export-stdout";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "hubble-export-stdout";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for hubble-export-stdout";
    homepage = "https://github.com/TODO/hubble-export-stdout";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
