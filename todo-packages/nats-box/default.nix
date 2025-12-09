{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nats-box
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nats-box";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nats-box";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nats-box";
    homepage = "https://github.com/TODO/nats-box";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
