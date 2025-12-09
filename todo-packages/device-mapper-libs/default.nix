{ lib, stdenv, fetchFromGitHub, ... }:

# Package: device-mapper-libs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "device-mapper-libs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "device-mapper-libs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for device-mapper-libs";
    homepage = "https://github.com/TODO/device-mapper-libs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
