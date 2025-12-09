{ lib, stdenv, fetchFromGitHub, ... }:

# Package: py3.10-zipp
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "py3.10-zipp";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "py3.10-zipp";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for py3.10-zipp";
    homepage = "https://github.com/TODO/py3.10-zipp";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
