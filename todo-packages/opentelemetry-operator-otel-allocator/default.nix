{ lib, stdenv, fetchFromGitHub, ... }:

# Package: opentelemetry-operator-otel-allocator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "opentelemetry-operator-otel-allocator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "opentelemetry-operator-otel-allocator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for opentelemetry-operator-otel-allocator";
    homepage = "https://github.com/TODO/opentelemetry-operator-otel-allocator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
