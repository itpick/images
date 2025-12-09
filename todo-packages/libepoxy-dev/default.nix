{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libepoxy-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libepoxy-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libepoxy-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libepoxy-dev";
    homepage = "https://github.com/TODO/libepoxy-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
