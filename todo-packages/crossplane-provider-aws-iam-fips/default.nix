{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-aws-iam-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-aws-iam-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-aws-iam-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-aws-iam-fips";
    homepage = "https://github.com/TODO/crossplane-provider-aws-iam-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
