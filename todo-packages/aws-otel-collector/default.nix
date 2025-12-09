{ lib, stdenv, fetchFromGitHub, ... }:

# Package: aws-otel-collector
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "aws-otel-collector";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "aws-otel-collector";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for aws-otel-collector";
    homepage = "https://github.com/TODO/aws-otel-collector";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
