{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libedit-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libedit-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libedit-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libedit-dev";
    homepage = "https://github.com/TODO/libedit-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
