{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-kubernetes
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-kubernetes";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-kubernetes";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-kubernetes";
    homepage = "https://github.com/TODO/crossplane-provider-kubernetes";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
