{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gst-plugins-bad
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gst-plugins-bad";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gst-plugins-bad";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gst-plugins-bad";
    homepage = "https://github.com/TODO/gst-plugins-bad";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
