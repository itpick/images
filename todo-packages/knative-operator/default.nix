{ lib, stdenv, fetchFromGitHub, ... }:

# Package: knative-operator-1.19
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "knative-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "knative-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for knative-operator";
    homepage = "https://github.com/TODO/knative-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
