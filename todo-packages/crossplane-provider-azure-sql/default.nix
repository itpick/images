{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-azure-sql
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-azure-sql";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-azure-sql";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-azure-sql";
    homepage = "https://github.com/TODO/crossplane-provider-azure-sql";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
