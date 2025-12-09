{ lib, stdenv, fetchFromGitHub, ... }:

# Package: newrelic-infrastructure-bundle-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "newrelic-infrastructure-bundle-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "newrelic-infrastructure-bundle-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for newrelic-infrastructure-bundle-fips";
    homepage = "https://github.com/TODO/newrelic-infrastructure-bundle-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
