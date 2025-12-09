{ lib, stdenv, fetchFromGitHub, ... }:

# Package: newrelic-nri-statsd
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "newrelic-nri-statsd";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "newrelic-nri-statsd";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for newrelic-nri-statsd";
    homepage = "https://github.com/TODO/newrelic-nri-statsd";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
