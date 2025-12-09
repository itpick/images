{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gnupg-utils
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gnupg-utils";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gnupg-utils";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gnupg-utils";
    homepage = "https://github.com/TODO/gnupg-utils";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
