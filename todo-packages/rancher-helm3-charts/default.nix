{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-helm3-charts
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-helm3-charts";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-helm3-charts";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-helm3-charts";
    homepage = "https://github.com/TODO/rancher-helm3-charts";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
