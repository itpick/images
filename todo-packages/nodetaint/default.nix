{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nodetaint
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nodetaint";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nodetaint";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nodetaint";
    homepage = "https://github.com/TODO/nodetaint";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
