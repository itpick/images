{ lib, stdenv, fetchFromGitHub, ... }:

# Package: prometheus-pushgateway-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "prometheus-pushgateway-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "prometheus-pushgateway-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for prometheus-pushgateway-fips";
    homepage = "https://github.com/TODO/prometheus-pushgateway-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
