{ lib, stdenv, fetchFromGitHub, ... }:

# Package: aws-network-policy-agent
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "aws-network-policy-agent";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "aws-network-policy-agent";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for aws-network-policy-agent";
    homepage = "https://github.com/TODO/aws-network-policy-agent";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
