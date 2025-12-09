{ lib, stdenv, fetchFromGitHub, ... }:

# Package: wavefront-proxy-config
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "wavefront-proxy-config";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "wavefront-proxy-config";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for wavefront-proxy-config";
    homepage = "https://github.com/TODO/wavefront-proxy-config";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
