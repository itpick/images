{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-aws-provider
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-aws-provider";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-aws-provider";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-aws-provider";
    homepage = "https://github.com/TODO/crossplane-aws-provider";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
