{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-gcp-storage-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-gcp-storage-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-gcp-storage-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-gcp-storage-fips";
    homepage = "https://github.com/TODO/crossplane-provider-gcp-storage-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
