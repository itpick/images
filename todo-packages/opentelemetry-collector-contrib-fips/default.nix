{ lib, stdenv, fetchFromGitHub, ... }:

# Package: opentelemetry-collector-contrib-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "opentelemetry-collector-contrib-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "opentelemetry-collector-contrib-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for opentelemetry-collector-contrib-fips";
    homepage = "https://github.com/TODO/opentelemetry-collector-contrib-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
