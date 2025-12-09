{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tekton-pipelines-nop-1.5
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tekton-pipelines-nop";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tekton-pipelines-nop";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tekton-pipelines-nop";
    homepage = "https://github.com/TODO/tekton-pipelines-nop";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
