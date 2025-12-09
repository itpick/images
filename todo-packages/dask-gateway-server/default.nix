{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dask-gateway-server
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dask-gateway-server";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dask-gateway-server";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dask-gateway-server";
    homepage = "https://github.com/TODO/dask-gateway-server";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
