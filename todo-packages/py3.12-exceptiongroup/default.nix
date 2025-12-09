{ lib, stdenv, fetchFromGitHub, ... }:

# Package: py3.12-exceptiongroup
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "py3.12-exceptiongroup";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "py3.12-exceptiongroup";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for py3.12-exceptiongroup";
    homepage = "https://github.com/TODO/py3.12-exceptiongroup";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
