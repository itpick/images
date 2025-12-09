{ lib, stdenv, fetchFromGitHub, ... }:

# Package: argo-rollouts-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "argo-rollouts-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "argo-rollouts-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for argo-rollouts-fips";
    homepage = "https://github.com/TODO/argo-rollouts-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
