{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nvidia-nccl-cuda-12.3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nvidia-nccl-cuda";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nvidia-nccl-cuda";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nvidia-nccl-cuda";
    homepage = "https://github.com/TODO/nvidia-nccl-cuda";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
