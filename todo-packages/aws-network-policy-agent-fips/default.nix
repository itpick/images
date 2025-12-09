{ lib, stdenv, fetchFromGitHub, ... }:

# Package: aws-network-policy-agent-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "aws-network-policy-agent-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "aws-network-policy-agent-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for aws-network-policy-agent-fips";
    homepage = "https://github.com/TODO/aws-network-policy-agent-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
