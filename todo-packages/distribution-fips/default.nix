{ lib, stdenv, fetchFromGitHub, ... }:

# Package: distribution-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "distribution-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "distribution-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for distribution-fips";
    homepage = "https://github.com/TODO/distribution-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
