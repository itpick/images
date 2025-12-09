{ lib, stdenv, fetchFromGitHub, ... }:

# Package: envoy-1.36-oci-entrypoint
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "envoy-1.36-oci-entrypoint";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "envoy-1.36-oci-entrypoint";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for envoy-1.36-oci-entrypoint";
    homepage = "https://github.com/TODO/envoy-1.36-oci-entrypoint";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
