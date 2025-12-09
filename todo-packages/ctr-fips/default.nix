{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ctr-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ctr-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ctr-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ctr-fips";
    homepage = "https://github.com/TODO/ctr-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
