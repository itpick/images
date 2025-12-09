{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libxext-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libxext-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libxext-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libxext-dev";
    homepage = "https://github.com/TODO/libxext-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
