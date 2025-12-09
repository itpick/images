{ lib, stdenv, fetchFromGitHub, ... }:

# Package: restic-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "restic-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "restic-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for restic-fips";
    homepage = "https://github.com/TODO/restic-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
