{ lib, stdenv, fetchFromGitHub, ... }:

# Package: util-linux-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "util-linux-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "util-linux-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for util-linux-dev";
    homepage = "https://github.com/TODO/util-linux-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
