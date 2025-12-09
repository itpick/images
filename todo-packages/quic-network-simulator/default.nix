{ lib, stdenv, fetchFromGitHub, ... }:

# Package: quic-network-simulator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "quic-network-simulator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "quic-network-simulator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for quic-network-simulator";
    homepage = "https://github.com/TODO/quic-network-simulator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
