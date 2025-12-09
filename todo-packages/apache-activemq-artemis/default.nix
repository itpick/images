{ lib, stdenv, fetchFromGitHub, ... }:

# Package: apache-activemq-artemis
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "apache-activemq-artemis";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "apache-activemq-artemis";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for apache-activemq-artemis";
    homepage = "https://github.com/TODO/apache-activemq-artemis";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
