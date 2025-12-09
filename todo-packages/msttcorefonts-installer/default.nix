{ lib, stdenv, fetchFromGitHub, ... }:

# Package: msttcorefonts-installer
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "msttcorefonts-installer";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "msttcorefonts-installer";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for msttcorefonts-installer";
    homepage = "https://github.com/TODO/msttcorefonts-installer";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
