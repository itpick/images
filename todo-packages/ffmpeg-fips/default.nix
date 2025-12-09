{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ffmpeg-fips-8.0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ffmpeg-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ffmpeg-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ffmpeg-fips";
    homepage = "https://github.com/TODO/ffmpeg-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
