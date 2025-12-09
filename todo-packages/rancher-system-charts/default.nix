{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-system-charts-2.9
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-system-charts";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-system-charts";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-system-charts";
    homepage = "https://github.com/TODO/rancher-system-charts";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
