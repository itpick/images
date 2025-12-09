{ lib, stdenv, fetchFromGitHub, ... }:

# Package: py3.12-ipython
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "py3.12-ipython";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "py3.12-ipython";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for py3.12-ipython";
    homepage = "https://github.com/TODO/py3.12-ipython";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
