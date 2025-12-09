{ lib, stdenv, fetchFromGitHub, ... }:

# Package: opa-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "opa-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "opa-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for opa-fips";
    homepage = "https://github.com/TODO/opa-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
