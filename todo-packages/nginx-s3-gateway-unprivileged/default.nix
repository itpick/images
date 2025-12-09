{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nginx-s3-gateway-unprivileged
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nginx-s3-gateway-unprivileged";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nginx-s3-gateway-unprivileged";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nginx-s3-gateway-unprivileged";
    homepage = "https://github.com/TODO/nginx-s3-gateway-unprivileged";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
