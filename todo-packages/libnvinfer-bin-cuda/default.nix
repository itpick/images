{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libnvinfer-bin-cuda-12
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libnvinfer-bin-cuda";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libnvinfer-bin-cuda";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libnvinfer-bin-cuda";
    homepage = "https://github.com/TODO/libnvinfer-bin-cuda";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
