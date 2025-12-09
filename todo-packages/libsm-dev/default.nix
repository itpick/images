{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libsm-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libsm-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libsm-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libsm-dev";
    homepage = "https://github.com/TODO/libsm-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
