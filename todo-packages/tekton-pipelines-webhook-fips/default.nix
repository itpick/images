{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tekton-pipelines-webhook-fips-1.5
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tekton-pipelines-webhook-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tekton-pipelines-webhook-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tekton-pipelines-webhook-fips";
    homepage = "https://github.com/TODO/tekton-pipelines-webhook-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
