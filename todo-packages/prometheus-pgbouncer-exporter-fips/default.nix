{ lib, stdenv, fetchFromGitHub, ... }:

# Package: prometheus-pgbouncer-exporter-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "prometheus-pgbouncer-exporter-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "prometheus-pgbouncer-exporter-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for prometheus-pgbouncer-exporter-fips";
    homepage = "https://github.com/TODO/prometheus-pgbouncer-exporter-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
