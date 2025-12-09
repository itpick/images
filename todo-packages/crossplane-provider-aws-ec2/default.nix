{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-aws-ec2
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-aws-ec2";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-aws-ec2";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-aws-ec2";
    homepage = "https://github.com/TODO/crossplane-provider-aws-ec2";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
