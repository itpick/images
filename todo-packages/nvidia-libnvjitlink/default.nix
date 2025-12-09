{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nvidia-libnvjitlink-12.3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nvidia-libnvjitlink";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nvidia-libnvjitlink";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nvidia-libnvjitlink";
    homepage = "https://github.com/TODO/nvidia-libnvjitlink";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
