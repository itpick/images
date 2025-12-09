{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-gcp-dns
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-gcp-dns";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-gcp-dns";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-gcp-dns";
    homepage = "https://github.com/TODO/crossplane-provider-gcp-dns";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
