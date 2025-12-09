{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libtbb-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libtbb-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libtbb-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libtbb-dev";
    homepage = "https://github.com/TODO/libtbb-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
