{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-azure-family
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-azure-family";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-azure-family";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-azure-family";
    homepage = "https://github.com/TODO/crossplane-provider-azure-family";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
