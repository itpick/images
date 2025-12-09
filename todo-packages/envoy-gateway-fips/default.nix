{ lib, stdenv, fetchFromGitHub, ... }:

# Package: envoy-gateway-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "envoy-gateway-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "envoy-gateway-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for envoy-gateway-fips";
    homepage = "https://github.com/TODO/envoy-gateway-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
