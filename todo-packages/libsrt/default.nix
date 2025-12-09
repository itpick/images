{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libsrt
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libsrt";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libsrt";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libsrt";
    homepage = "https://github.com/TODO/libsrt";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
