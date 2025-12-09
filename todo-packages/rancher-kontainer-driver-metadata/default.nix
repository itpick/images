{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-kontainer-driver-metadata-2.12
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-kontainer-driver-metadata";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-kontainer-driver-metadata";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-kontainer-driver-metadata";
    homepage = "https://github.com/TODO/rancher-kontainer-driver-metadata";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
