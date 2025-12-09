{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-partner-charts
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-partner-charts";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-partner-charts";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-partner-charts";
    homepage = "https://github.com/TODO/rancher-partner-charts";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
