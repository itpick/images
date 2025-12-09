{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gops-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gops-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gops-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gops-fips";
    homepage = "https://github.com/TODO/gops-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
