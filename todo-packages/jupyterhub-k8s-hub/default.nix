{ lib, stdenv, fetchFromGitHub, ... }:

# Package: jupyterhub-k8s-hub
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "jupyterhub-k8s-hub";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "jupyterhub-k8s-hub";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for jupyterhub-k8s-hub";
    homepage = "https://github.com/TODO/jupyterhub-k8s-hub";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
