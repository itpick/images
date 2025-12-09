{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kots
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kots";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kots";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kots";
    homepage = "https://github.com/TODO/kots";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
