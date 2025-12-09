{ lib, stdenv, fetchFromGitHub, ... }:

# Package: syncthing-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "syncthing-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "syncthing-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for syncthing-fips";
    homepage = "https://github.com/TODO/syncthing-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
