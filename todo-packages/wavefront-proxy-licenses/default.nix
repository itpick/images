{ lib, stdenv, fetchFromGitHub, ... }:

# Package: wavefront-proxy-licenses
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "wavefront-proxy-licenses";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "wavefront-proxy-licenses";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for wavefront-proxy-licenses";
    homepage = "https://github.com/TODO/wavefront-proxy-licenses";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
