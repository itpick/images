{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-aws-route53
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-aws-route53";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-aws-route53";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-aws-route53";
    homepage = "https://github.com/TODO/crossplane-provider-aws-route53";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
