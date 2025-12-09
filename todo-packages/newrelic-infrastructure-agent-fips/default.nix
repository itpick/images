{ lib, stdenv, fetchFromGitHub, ... }:

# Package: newrelic-infrastructure-agent-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "newrelic-infrastructure-agent-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "newrelic-infrastructure-agent-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for newrelic-infrastructure-agent-fips";
    homepage = "https://github.com/TODO/newrelic-infrastructure-agent-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
