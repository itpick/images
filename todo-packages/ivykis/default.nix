{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ivykis
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ivykis";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ivykis";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ivykis";
    homepage = "https://github.com/TODO/ivykis";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
