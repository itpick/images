{ lib, stdenv, fetchFromGitHub, ... }:

# Package: grafana-fips-12.3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "grafana-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "grafana-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for grafana-fips";
    homepage = "https://github.com/TODO/grafana-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
