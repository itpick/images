{ lib, stdenv, fetchFromGitHub, ... }:

# Package: thingsboard-tb-node
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "thingsboard-tb-node";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "thingsboard-tb-node";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for thingsboard-tb-node";
    homepage = "https://github.com/TODO/thingsboard-tb-node";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
