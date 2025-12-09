{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libatomic
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libatomic";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libatomic";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libatomic";
    homepage = "https://github.com/TODO/libatomic";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
