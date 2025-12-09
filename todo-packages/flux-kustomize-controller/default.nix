{ lib, stdenv, fetchFromGitHub, ... }:

# Package: flux-kustomize-controller
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "flux-kustomize-controller";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "flux-kustomize-controller";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for flux-kustomize-controller";
    homepage = "https://github.com/TODO/flux-kustomize-controller";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
