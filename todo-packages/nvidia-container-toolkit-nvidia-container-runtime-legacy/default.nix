{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nvidia-container-toolkit-nvidia-container-runtime-legacy
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nvidia-container-toolkit-nvidia-container-runtime-legacy";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nvidia-container-toolkit-nvidia-container-runtime-legacy";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nvidia-container-toolkit-nvidia-container-runtime-legacy";
    homepage = "https://github.com/TODO/nvidia-container-toolkit-nvidia-container-runtime-legacy";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
