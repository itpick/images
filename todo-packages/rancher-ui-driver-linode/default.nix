{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-ui-driver-linode
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-ui-driver-linode";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-ui-driver-linode";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-ui-driver-linode";
    homepage = "https://github.com/TODO/rancher-ui-driver-linode";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
