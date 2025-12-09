{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-azure
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-azure";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-azure";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-azure";
    homepage = "https://github.com/TODO/crossplane-provider-azure";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
