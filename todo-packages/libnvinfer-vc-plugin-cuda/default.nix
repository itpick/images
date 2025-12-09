{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libnvinfer-vc-plugin-cuda-12
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libnvinfer-vc-plugin-cuda";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libnvinfer-vc-plugin-cuda";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libnvinfer-vc-plugin-cuda";
    homepage = "https://github.com/TODO/libnvinfer-vc-plugin-cuda";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
