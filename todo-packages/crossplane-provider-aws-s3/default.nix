{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-aws-s3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-aws-s3";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-aws-s3";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-aws-s3";
    homepage = "https://github.com/TODO/crossplane-provider-aws-s3";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
