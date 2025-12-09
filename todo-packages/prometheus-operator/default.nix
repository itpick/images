{ lib, stdenv, fetchFromGitHub, ... }:

# Package: prometheus-operator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "prometheus-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "prometheus-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for prometheus-operator";
    homepage = "https://github.com/TODO/prometheus-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
