{ lib, stdenv, fetchFromGitHub, ... }:

# Package: grafana-rollout-operator-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "grafana-rollout-operator-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "grafana-rollout-operator-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for grafana-rollout-operator-fips";
    homepage = "https://github.com/TODO/grafana-rollout-operator-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
