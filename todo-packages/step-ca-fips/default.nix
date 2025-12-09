{ lib, stdenv, fetchFromGitHub, ... }:

# Package: step-ca-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "step-ca-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "step-ca-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for step-ca-fips";
    homepage = "https://github.com/TODO/step-ca-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
