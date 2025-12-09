{ lib, stdenv, fetchFromGitHub, ... }:

# Package: temporal-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "temporal-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "temporal-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for temporal-fips";
    homepage = "https://github.com/TODO/temporal-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
