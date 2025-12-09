{ lib, stdenv, fetchFromGitHub, ... }:

# Package: aws-signer-notation-plugin
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "aws-signer-notation-plugin";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "aws-signer-notation-plugin";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for aws-signer-notation-plugin";
    homepage = "https://github.com/TODO/aws-signer-notation-plugin";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
