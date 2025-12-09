{ lib, stdenv, fetchFromGitHub, ... }:

# Package: envoy-fips-1.36
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "envoy-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "envoy-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for envoy-fips";
    homepage = "https://github.com/TODO/envoy-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
