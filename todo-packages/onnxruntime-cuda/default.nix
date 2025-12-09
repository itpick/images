{ lib, stdenv, fetchFromGitHub, ... }:

# Package: onnxruntime-cuda-13.0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "onnxruntime-cuda";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "onnxruntime-cuda";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for onnxruntime-cuda";
    homepage = "https://github.com/TODO/onnxruntime-cuda";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
