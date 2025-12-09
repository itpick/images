{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gtk-3-compiled-gschemas
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gtk-3-compiled-gschemas";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gtk-3-compiled-gschemas";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gtk-3-compiled-gschemas";
    homepage = "https://github.com/TODO/gtk-3-compiled-gschemas";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
