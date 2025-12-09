{ lib, stdenv, fetchFromGitHub, ... }:

# Package: metrics-server-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "metrics-server-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "metrics-server-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for metrics-server-fips";
    homepage = "https://github.com/TODO/metrics-server-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
