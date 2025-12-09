{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libguac-client-ssh
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libguac-client-ssh";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libguac-client-ssh";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libguac-client-ssh";
    homepage = "https://github.com/TODO/libguac-client-ssh";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
