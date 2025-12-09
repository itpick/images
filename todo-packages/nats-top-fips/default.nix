{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nats-top-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nats-top-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nats-top-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nats-top-fips";
    homepage = "https://github.com/TODO/nats-top-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
