{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-rabbitmq
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-rabbitmq";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-rabbitmq";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-rabbitmq";
    homepage = "https://github.com/TODO/nri-rabbitmq";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
