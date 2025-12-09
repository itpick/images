{ lib, stdenv, fetchFromGitHub, ... }:

# Package: opentelemetry-java-contrib-jmx-metrics
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "opentelemetry-java-contrib-jmx-metrics";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "opentelemetry-java-contrib-jmx-metrics";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for opentelemetry-java-contrib-jmx-metrics";
    homepage = "https://github.com/TODO/opentelemetry-java-contrib-jmx-metrics";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
