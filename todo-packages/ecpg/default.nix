{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ecpg-15
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ecpg";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ecpg";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ecpg";
    homepage = "https://github.com/TODO/ecpg";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
