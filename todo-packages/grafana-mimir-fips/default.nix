{ lib, stdenv, fetchFromGitHub, ... }:

# Package: grafana-mimir-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "grafana-mimir-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "grafana-mimir-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for grafana-mimir-fips";
    homepage = "https://github.com/TODO/grafana-mimir-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
