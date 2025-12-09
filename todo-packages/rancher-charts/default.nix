{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-charts-2.12
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-charts";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-charts";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-charts";
    homepage = "https://github.com/TODO/rancher-charts";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
