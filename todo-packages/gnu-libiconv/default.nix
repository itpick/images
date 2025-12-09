{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gnu-libiconv
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gnu-libiconv";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gnu-libiconv";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gnu-libiconv";
    homepage = "https://github.com/TODO/gnu-libiconv";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
