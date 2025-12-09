{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rabbitmq-cluster-operator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rabbitmq-cluster-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rabbitmq-cluster-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rabbitmq-cluster-operator";
    homepage = "https://github.com/TODO/rabbitmq-cluster-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
