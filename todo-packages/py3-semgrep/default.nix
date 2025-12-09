{ lib, stdenv, fetchFromGitHub, ... }:

# Package: py3-semgrep
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "py3-semgrep";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "py3-semgrep";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for py3-semgrep";
    homepage = "https://github.com/TODO/py3-semgrep";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
