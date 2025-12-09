{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gst-plugins-base
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gst-plugins-base";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gst-plugins-base";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gst-plugins-base";
    homepage = "https://github.com/TODO/gst-plugins-base";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
