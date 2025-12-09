{ lib, stdenv, fetchFromGitHub, ... }:

# Package: envoy-ratelimit-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "envoy-ratelimit-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "envoy-ratelimit-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for envoy-ratelimit-fips";
    homepage = "https://github.com/TODO/envoy-ratelimit-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
