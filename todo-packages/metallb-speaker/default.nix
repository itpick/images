{ lib, stdenv, fetchFromGitHub, ... }:

# Package: metallb-speaker
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "metallb-speaker";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "metallb-speaker";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for metallb-speaker";
    homepage = "https://github.com/TODO/metallb-speaker";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
