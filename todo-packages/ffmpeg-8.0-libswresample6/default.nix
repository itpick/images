{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ffmpeg-8.0-libswresample6
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ffmpeg-8.0-libswresample6";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ffmpeg-8.0-libswresample6";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ffmpeg-8.0-libswresample6";
    homepage = "https://github.com/TODO/ffmpeg-8.0-libswresample6";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
