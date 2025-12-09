{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-gcp-pubsub
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-gcp-pubsub";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-gcp-pubsub";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-gcp-pubsub";
    homepage = "https://github.com/TODO/crossplane-provider-gcp-pubsub";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
