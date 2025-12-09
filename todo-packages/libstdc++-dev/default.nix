{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libstdc++-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libstdc++-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libstdc++-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libstdc++-dev";
    homepage = "https://github.com/TODO/libstdc++-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
