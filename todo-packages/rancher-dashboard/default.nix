{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-dashboard-2.12
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-dashboard";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-dashboard";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-dashboard";
    homepage = "https://github.com/TODO/rancher-dashboard";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
