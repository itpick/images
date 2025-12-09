{ lib, stdenv, fetchFromGitHub, ... }:

# Package: aws-eks-pod-identity-agent
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "aws-eks-pod-identity-agent";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "aws-eks-pod-identity-agent";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for aws-eks-pod-identity-agent";
    homepage = "https://github.com/TODO/aws-eks-pod-identity-agent";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
