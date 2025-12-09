{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ffmpeg-cuda-7.1-nozeromq
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ffmpeg-cuda-7.1-nozeromq";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ffmpeg-cuda-7.1-nozeromq";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ffmpeg-cuda-7.1-nozeromq";
    homepage = "https://github.com/TODO/ffmpeg-cuda-7.1-nozeromq";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
