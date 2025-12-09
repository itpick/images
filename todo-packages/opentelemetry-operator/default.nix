{ lib, stdenv, fetchFromGitHub, ... }:

# Package: opentelemetry-operator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "opentelemetry-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "opentelemetry-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for opentelemetry-operator";
    homepage = "https://github.com/TODO/opentelemetry-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
