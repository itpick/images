{ lib, stdenv, fetchFromGitHub, ... }:

# Package: metallb-frr
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "metallb-frr";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "metallb-frr";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for metallb-frr";
    homepage = "https://github.com/TODO/metallb-frr";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
