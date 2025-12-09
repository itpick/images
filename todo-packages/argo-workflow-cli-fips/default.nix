{ lib, stdenv, fetchFromGitHub, ... }:

# Package: argo-workflow-cli-fips-3.7
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "argo-workflow-cli-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "argo-workflow-cli-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for argo-workflow-cli-fips";
    homepage = "https://github.com/TODO/argo-workflow-cli-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
