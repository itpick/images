{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-terraform
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-terraform";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-terraform";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-terraform";
    homepage = "https://github.com/TODO/crossplane-provider-terraform";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
