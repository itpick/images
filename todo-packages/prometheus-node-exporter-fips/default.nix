{ lib, stdenv, fetchFromGitHub, ... }:

# Package: prometheus-node-exporter-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "prometheus-node-exporter-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "prometheus-node-exporter-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for prometheus-node-exporter-fips";
    homepage = "https://github.com/TODO/prometheus-node-exporter-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
