{ lib, stdenv, fetchFromGitHub, ... }:

# Package: strimzi-kafka-operator-cluster-operator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "strimzi-kafka-operator-cluster-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "strimzi-kafka-operator-cluster-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for strimzi-kafka-operator-cluster-operator";
    homepage = "https://github.com/TODO/strimzi-kafka-operator-cluster-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
