{ lib, stdenv, fetchFromGitHub, ... }:

# Package: prometheus-podman-exporter
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "prometheus-podman-exporter";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "prometheus-podman-exporter";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for prometheus-podman-exporter";
    homepage = "https://github.com/TODO/prometheus-podman-exporter";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
