{ lib, stdenv, fetchFromGitHub, ... }:

# Package: secrets-store-csi-driver-crds
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "secrets-store-csi-driver-crds";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "secrets-store-csi-driver-crds";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for secrets-store-csi-driver-crds";
    homepage = "https://github.com/TODO/secrets-store-csi-driver-crds";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
