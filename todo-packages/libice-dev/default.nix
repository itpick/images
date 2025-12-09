{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libice-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libice-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libice-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libice-dev";
    homepage = "https://github.com/TODO/libice-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
