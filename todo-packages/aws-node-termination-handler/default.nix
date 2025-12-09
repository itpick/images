{ lib, stdenv, fetchFromGitHub, ... }:

# Package: aws-node-termination-handler
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "aws-node-termination-handler";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "aws-node-termination-handler";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for aws-node-termination-handler";
    homepage = "https://github.com/TODO/aws-node-termination-handler";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
