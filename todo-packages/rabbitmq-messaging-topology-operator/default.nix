{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rabbitmq-messaging-topology-operator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rabbitmq-messaging-topology-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rabbitmq-messaging-topology-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rabbitmq-messaging-topology-operator";
    homepage = "https://github.com/TODO/rabbitmq-messaging-topology-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
