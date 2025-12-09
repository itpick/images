{ lib, stdenv, fetchFromGitHub, ... }:

# Package: newrelic-prometheus-configurator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "newrelic-prometheus-configurator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "newrelic-prometheus-configurator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for newrelic-prometheus-configurator";
    homepage = "https://github.com/TODO/newrelic-prometheus-configurator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
