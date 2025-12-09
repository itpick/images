{ lib, stdenv, fetchFromGitHub, ... }:

# Package: prometheus-mysqld-exporter-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "prometheus-mysqld-exporter-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "prometheus-mysqld-exporter-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for prometheus-mysqld-exporter-fips";
    homepage = "https://github.com/TODO/prometheus-mysqld-exporter-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
