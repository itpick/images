{ lib, stdenv, fetchFromGitHub, ... }:

# Package: percona-server-mongodb-operator-mongodb-healthcheck
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "percona-server-mongodb-operator-mongodb-healthcheck";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "percona-server-mongodb-operator-mongodb-healthcheck";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for percona-server-mongodb-operator-mongodb-healthcheck";
    homepage = "https://github.com/TODO/percona-server-mongodb-operator-mongodb-healthcheck";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
