{ lib, stdenv, fetchFromGitHub, ... }:

# Package: step-kms-plugin-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "step-kms-plugin-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "step-kms-plugin-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for step-kms-plugin-fips";
    homepage = "https://github.com/TODO/step-kms-plugin-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
