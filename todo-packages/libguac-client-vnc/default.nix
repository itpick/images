{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libguac-client-vnc
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libguac-client-vnc";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libguac-client-vnc";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libguac-client-vnc";
    homepage = "https://github.com/TODO/libguac-client-vnc";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
