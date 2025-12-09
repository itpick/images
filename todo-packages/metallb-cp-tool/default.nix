{ lib, stdenv, fetchFromGitHub, ... }:

# Package: metallb-cp-tool
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "metallb-cp-tool";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "metallb-cp-tool";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for metallb-cp-tool";
    homepage = "https://github.com/TODO/metallb-cp-tool";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
