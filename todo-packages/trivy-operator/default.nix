{ lib, stdenv, fetchFromGitHub, ... }:

# Package: trivy-operator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "trivy-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "trivy-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for trivy-operator";
    homepage = "https://github.com/TODO/trivy-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
