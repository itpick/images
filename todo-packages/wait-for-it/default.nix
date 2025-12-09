{ lib, stdenv, fetchFromGitHub, ... }:

# Package: wait-for-it
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "wait-for-it";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "wait-for-it";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for wait-for-it";
    homepage = "https://github.com/TODO/wait-for-it";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
