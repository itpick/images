{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nvidia-cuda-nvrtc-12.3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nvidia-cuda-nvrtc";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nvidia-cuda-nvrtc";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nvidia-cuda-nvrtc";
    homepage = "https://github.com/TODO/nvidia-cuda-nvrtc";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
