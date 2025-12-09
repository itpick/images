{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-system-upgrade-controller
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-system-upgrade-controller";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-system-upgrade-controller";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-system-upgrade-controller";
    homepage = "https://github.com/TODO/rancher-system-upgrade-controller";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
