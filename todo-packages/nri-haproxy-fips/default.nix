{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-haproxy-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-haproxy-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-haproxy-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-haproxy-fips";
    homepage = "https://github.com/TODO/nri-haproxy-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
