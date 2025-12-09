{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-sql
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-sql";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-sql";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-sql";
    homepage = "https://github.com/TODO/crossplane-provider-sql";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
