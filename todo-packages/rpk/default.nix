{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rpk-25.2.12
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rpk";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rpk";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rpk";
    homepage = "https://github.com/TODO/rpk";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
