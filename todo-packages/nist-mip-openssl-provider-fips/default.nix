{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nist-mip-openssl-provider-fips-3.6
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nist-mip-openssl-provider-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nist-mip-openssl-provider-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nist-mip-openssl-provider-fips";
    homepage = "https://github.com/TODO/nist-mip-openssl-provider-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
