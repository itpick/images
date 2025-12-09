{ lib, stdenv, fetchFromGitHub, ... }:

# Package: jaeger-2-tracegen
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "jaeger-2-tracegen";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "jaeger-2-tracegen";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for jaeger-2-tracegen";
    homepage = "https://github.com/TODO/jaeger-2-tracegen";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
