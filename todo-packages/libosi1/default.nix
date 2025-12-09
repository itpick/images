{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libosi1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libosi1";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libosi1";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libosi1";
    homepage = "https://github.com/TODO/libosi1";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
