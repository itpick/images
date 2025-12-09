{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gst-plugins-good
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gst-plugins-good";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gst-plugins-good";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gst-plugins-good";
    homepage = "https://github.com/TODO/gst-plugins-good";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
