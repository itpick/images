{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubectl-argo-rollouts-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubectl-argo-rollouts-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubectl-argo-rollouts-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubectl-argo-rollouts-fips";
    homepage = "https://github.com/TODO/kubectl-argo-rollouts-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
