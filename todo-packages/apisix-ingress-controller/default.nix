{ lib, stdenv, fetchFromGitHub, ... }:

# Package: apisix-ingress-controller
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "apisix-ingress-controller";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "apisix-ingress-controller";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for apisix-ingress-controller";
    homepage = "https://github.com/TODO/apisix-ingress-controller";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
