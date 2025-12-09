{ lib, stdenv, fetchFromGitHub, ... }:

# Package: xtables
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "xtables";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "xtables";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for xtables";
    homepage = "https://github.com/TODO/xtables";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
