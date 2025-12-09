{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-linux-libertine
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-linux-libertine";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-linux-libertine";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-linux-libertine";
    homepage = "https://github.com/TODO/font-linux-libertine";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
