{ lib, stdenv, fetchFromGitHub, ... }:

# Package: aws-sigv4-proxy
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "aws-sigv4-proxy";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "aws-sigv4-proxy";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for aws-sigv4-proxy";
    homepage = "https://github.com/TODO/aws-sigv4-proxy";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
