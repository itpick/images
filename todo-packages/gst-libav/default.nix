{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gst-libav
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gst-libav";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gst-libav";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gst-libav";
    homepage = "https://github.com/TODO/gst-libav";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
