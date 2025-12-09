{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nvidia-device-plugin
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nvidia-device-plugin";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nvidia-device-plugin";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nvidia-device-plugin";
    homepage = "https://github.com/TODO/nvidia-device-plugin";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
