{ lib, stdenv, fetchFromGitHub, ... }:

# Package: prometheus-alertmanager-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "prometheus-alertmanager-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "prometheus-alertmanager-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for prometheus-alertmanager-fips";
    homepage = "https://github.com/TODO/prometheus-alertmanager-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
