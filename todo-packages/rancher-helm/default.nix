{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-helm-3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-helm";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-helm";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-helm";
    homepage = "https://github.com/TODO/rancher-helm";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
