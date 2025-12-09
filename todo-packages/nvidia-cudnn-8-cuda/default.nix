{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nvidia-cudnn-8-cuda-12
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nvidia-cudnn-8-cuda";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nvidia-cudnn-8-cuda";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nvidia-cudnn-8-cuda";
    homepage = "https://github.com/TODO/nvidia-cudnn-8-cuda";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
