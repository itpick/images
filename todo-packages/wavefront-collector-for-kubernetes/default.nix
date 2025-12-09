{ lib, stdenv, fetchFromGitHub, ... }:

# Package: wavefront-collector-for-kubernetes-1.13
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "wavefront-collector-for-kubernetes";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "wavefront-collector-for-kubernetes";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for wavefront-collector-for-kubernetes";
    homepage = "https://github.com/TODO/wavefront-collector-for-kubernetes";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
