{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ingress-nginx-controller-1.14
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ingress-nginx-controller";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ingress-nginx-controller";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ingress-nginx-controller";
    homepage = "https://github.com/TODO/ingress-nginx-controller";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
