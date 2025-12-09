{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gnupg-dirmngr
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gnupg-dirmngr";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gnupg-dirmngr";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gnupg-dirmngr";
    homepage = "https://github.com/TODO/gnupg-dirmngr";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
