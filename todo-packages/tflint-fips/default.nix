{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tflint-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tflint-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tflint-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tflint-fips";
    homepage = "https://github.com/TODO/tflint-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
