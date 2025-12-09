{ lib, stdenv, fetchFromGitHub, ... }:

# Package: render-template
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "render-template";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "render-template";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for render-template";
    homepage = "https://github.com/TODO/render-template";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
