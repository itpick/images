{ lib, stdenv, fetchFromGitHub, ... }:

# Package: bind-libs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "bind-libs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "bind-libs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for bind-libs";
    homepage = "https://github.com/TODO/bind-libs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
