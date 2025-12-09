{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tekton-pipelines-entrypoint-fips-1.5
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tekton-pipelines-entrypoint-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tekton-pipelines-entrypoint-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tekton-pipelines-entrypoint-fips";
    homepage = "https://github.com/TODO/tekton-pipelines-entrypoint-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
