{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cloudnative-pg-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cloudnative-pg-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cloudnative-pg-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cloudnative-pg-fips";
    homepage = "https://github.com/TODO/cloudnative-pg-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
