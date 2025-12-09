{ lib, stdenv, fetchFromGitHub, ... }:

# Package: metricbeat-fips-9.2
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "metricbeat-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "metricbeat-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for metricbeat-fips";
    homepage = "https://github.com/TODO/metricbeat-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
