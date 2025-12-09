{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ttf-arphic-ukai
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ttf-arphic-ukai";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ttf-arphic-ukai";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ttf-arphic-ukai";
    homepage = "https://github.com/TODO/ttf-arphic-ukai";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
