{ lib, stdenv, fetchFromGitHub, ... }:

# Package: hailo-ai-onnxruntime
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "hailo-ai-onnxruntime";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "hailo-ai-onnxruntime";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for hailo-ai-onnxruntime";
    homepage = "https://github.com/TODO/hailo-ai-onnxruntime";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
