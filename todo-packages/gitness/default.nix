{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gitness
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gitness";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gitness";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gitness";
    homepage = "https://github.com/TODO/gitness";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
