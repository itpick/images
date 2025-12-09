{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libnvinfer-plugin-cuda-12
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libnvinfer-plugin-cuda";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libnvinfer-plugin-cuda";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libnvinfer-plugin-cuda";
    homepage = "https://github.com/TODO/libnvinfer-plugin-cuda";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
