{ lib, stdenv, fetchFromGitHub, ... }:

# Package: jaeger-2-query
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "jaeger-2-query";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "jaeger-2-query";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for jaeger-2-query";
    homepage = "https://github.com/TODO/jaeger-2-query";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
