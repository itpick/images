{ lib, stdenv, fetchFromGitHub, ... }:

# Package: k8s-sidecar
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "k8s-sidecar";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "k8s-sidecar";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for k8s-sidecar";
    homepage = "https://github.com/TODO/k8s-sidecar";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
