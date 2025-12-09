{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libguac-client-telnet
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libguac-client-telnet";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libguac-client-telnet";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libguac-client-telnet";
    homepage = "https://github.com/TODO/libguac-client-telnet";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
