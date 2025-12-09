{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libsystemd-shared
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libsystemd-shared";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libsystemd-shared";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libsystemd-shared";
    homepage = "https://github.com/TODO/libsystemd-shared";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
