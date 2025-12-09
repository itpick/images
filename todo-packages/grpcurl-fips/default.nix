{ lib, stdenv, fetchFromGitHub, ... }:

# Package: grpcurl-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "grpcurl-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "grpcurl-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for grpcurl-fips";
    homepage = "https://github.com/TODO/grpcurl-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
