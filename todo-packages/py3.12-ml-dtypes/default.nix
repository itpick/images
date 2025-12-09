{ lib, stdenv, fetchFromGitHub, ... }:

# Package: py3.12-ml-dtypes
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "py3.12-ml-dtypes";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "py3.12-ml-dtypes";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for py3.12-ml-dtypes";
    homepage = "https://github.com/TODO/py3.12-ml-dtypes";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
