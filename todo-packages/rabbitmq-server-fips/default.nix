{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rabbitmq-server-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rabbitmq-server-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rabbitmq-server-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rabbitmq-server-fips";
    homepage = "https://github.com/TODO/rabbitmq-server-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
