{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libdebuginfod
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libdebuginfod";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libdebuginfod";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libdebuginfod";
    homepage = "https://github.com/TODO/libdebuginfod";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
