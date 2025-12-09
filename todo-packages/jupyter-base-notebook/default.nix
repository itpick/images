{ lib, stdenv, fetchFromGitHub, ... }:

# Package: jupyter-base-notebook
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "jupyter-base-notebook";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "jupyter-base-notebook";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for jupyter-base-notebook";
    homepage = "https://github.com/TODO/jupyter-base-notebook";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
