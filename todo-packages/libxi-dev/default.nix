{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libxi-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libxi-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libxi-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libxi-dev";
    homepage = "https://github.com/TODO/libxi-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
