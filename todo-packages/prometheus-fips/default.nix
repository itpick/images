{ lib, stdenv, fetchFromGitHub, ... }:

# Package: prometheus-fips-3.5
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "prometheus-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "prometheus-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for prometheus-fips";
    homepage = "https://github.com/TODO/prometheus-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
