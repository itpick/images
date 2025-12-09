{ lib, stdenv, fetchFromGitHub, ... }:

# Package: grafana-pyroscope-1.13
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "grafana-pyroscope";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "grafana-pyroscope";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for grafana-pyroscope";
    homepage = "https://github.com/TODO/grafana-pyroscope";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
