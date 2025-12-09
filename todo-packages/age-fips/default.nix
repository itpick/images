{ lib, stdenv, fetchFromGitHub, ... }:

# Package: age-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "age-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "age-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for age-fips";
    homepage = "https://github.com/TODO/age-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
