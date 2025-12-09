{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mosquitto-clients
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mosquitto-clients";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mosquitto-clients";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mosquitto-clients";
    homepage = "https://github.com/TODO/mosquitto-clients";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
