{ lib, stdenv, fetchFromGitHub, ... }:

# Package: haproxy-ingress
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "haproxy-ingress";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "haproxy-ingress";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for haproxy-ingress";
    homepage = "https://github.com/TODO/haproxy-ingress";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
