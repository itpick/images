{ lib, stdenv, fetchFromGitHub, ... }:

# Package: grafana-mimir
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "grafana-mimir";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "grafana-mimir";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for grafana-mimir";
    homepage = "https://github.com/TODO/grafana-mimir";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
