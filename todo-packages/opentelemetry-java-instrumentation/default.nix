{ lib, stdenv, fetchFromGitHub, ... }:

# Package: opentelemetry-java-instrumentation
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "opentelemetry-java-instrumentation";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "opentelemetry-java-instrumentation";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for opentelemetry-java-instrumentation";
    homepage = "https://github.com/TODO/opentelemetry-java-instrumentation";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
