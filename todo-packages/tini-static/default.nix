{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tini-static
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tini-static";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tini-static";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tini-static";
    homepage = "https://github.com/TODO/tini-static";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
