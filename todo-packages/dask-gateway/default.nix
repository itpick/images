{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dask-gateway
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dask-gateway";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dask-gateway";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dask-gateway";
    homepage = "https://github.com/TODO/dask-gateway";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
