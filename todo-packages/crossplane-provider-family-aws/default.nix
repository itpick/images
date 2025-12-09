{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-family-aws
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-family-aws";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-family-aws";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-family-aws";
    homepage = "https://github.com/TODO/crossplane-provider-family-aws";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
