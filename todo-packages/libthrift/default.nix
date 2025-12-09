{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libthrift
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libthrift";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libthrift";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libthrift";
    homepage = "https://github.com/TODO/libthrift";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
