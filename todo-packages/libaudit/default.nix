{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libaudit
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libaudit";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libaudit";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libaudit";
    homepage = "https://github.com/TODO/libaudit";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
