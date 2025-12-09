{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-gcp-storage
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-gcp-storage";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-gcp-storage";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-gcp-storage";
    homepage = "https://github.com/TODO/crossplane-provider-gcp-storage";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
