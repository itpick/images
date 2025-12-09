{ lib, stdenv, fetchFromGitHub, ... }:

# Package: py3.11-jsonpointer
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "py3.11-jsonpointer";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "py3.11-jsonpointer";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for py3.11-jsonpointer";
    homepage = "https://github.com/TODO/py3.11-jsonpointer";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
