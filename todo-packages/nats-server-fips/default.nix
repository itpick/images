{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nats-server-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nats-server-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nats-server-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nats-server-fips";
    homepage = "https://github.com/TODO/nats-server-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
