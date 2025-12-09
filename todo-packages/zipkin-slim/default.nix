{ lib, stdenv, fetchFromGitHub, ... }:

# Package: zipkin-slim
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "zipkin-slim";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "zipkin-slim";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for zipkin-slim";
    homepage = "https://github.com/TODO/zipkin-slim";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
