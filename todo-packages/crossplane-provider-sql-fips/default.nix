{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-sql-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-sql-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-sql-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-sql-fips";
    homepage = "https://github.com/TODO/crossplane-provider-sql-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
