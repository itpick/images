{ lib, stdenv, fetchFromGitHub, ... }:

# Package: xtail
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "xtail";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "xtail";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for xtail";
    homepage = "https://github.com/TODO/xtail";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
