{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ingress-nginx-custom-error-pages-1.14
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ingress-nginx-custom-error-pages";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ingress-nginx-custom-error-pages";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ingress-nginx-custom-error-pages";
    homepage = "https://github.com/TODO/ingress-nginx-custom-error-pages";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
