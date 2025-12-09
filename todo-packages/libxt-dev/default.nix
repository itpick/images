{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libxt-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libxt-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libxt-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libxt-dev";
    homepage = "https://github.com/TODO/libxt-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
