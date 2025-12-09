{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gpgsm-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gpgsm-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gpgsm-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gpgsm-fips";
    homepage = "https://github.com/TODO/gpgsm-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
