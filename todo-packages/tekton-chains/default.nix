{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tekton-chains
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tekton-chains";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tekton-chains";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tekton-chains";
    homepage = "https://github.com/TODO/tekton-chains";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
