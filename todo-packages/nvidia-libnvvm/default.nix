{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nvidia-libnvvm-13.0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nvidia-libnvvm";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nvidia-libnvvm";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nvidia-libnvvm";
    homepage = "https://github.com/TODO/nvidia-libnvvm";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
