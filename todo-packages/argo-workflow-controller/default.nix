{ lib, stdenv, fetchFromGitHub, ... }:

# Package: argo-workflow-controller-3.7
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "argo-workflow-controller";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "argo-workflow-controller";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for argo-workflow-controller";
    homepage = "https://github.com/TODO/argo-workflow-controller";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
