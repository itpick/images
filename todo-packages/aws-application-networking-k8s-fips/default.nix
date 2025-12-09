{ lib, stdenv, fetchFromGitHub, ... }:

# Package: aws-application-networking-k8s-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "aws-application-networking-k8s-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "aws-application-networking-k8s-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for aws-application-networking-k8s-fips";
    homepage = "https://github.com/TODO/aws-application-networking-k8s-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
