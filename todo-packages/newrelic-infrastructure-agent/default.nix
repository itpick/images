{ lib, stdenv, fetchFromGitHub, ... }:

# Package: newrelic-infrastructure-agent
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "newrelic-infrastructure-agent";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "newrelic-infrastructure-agent";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for newrelic-infrastructure-agent";
    homepage = "https://github.com/TODO/newrelic-infrastructure-agent";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
