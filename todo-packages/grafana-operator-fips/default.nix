{ lib, stdenv, fetchFromGitHub, ... }:

# Package: grafana-operator-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "grafana-operator-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "grafana-operator-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for grafana-operator-fips";
    homepage = "https://github.com/TODO/grafana-operator-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
