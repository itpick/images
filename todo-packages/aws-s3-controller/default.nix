{ lib, stdenv, fetchFromGitHub, ... }:

# Package: aws-s3-controller
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "aws-s3-controller";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "aws-s3-controller";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for aws-s3-controller";
    homepage = "https://github.com/TODO/aws-s3-controller";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
