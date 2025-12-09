{ lib, stdenv, fetchFromGitHub, ... }:

# Package: headlamp-plugin-flux
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "headlamp-plugin-flux";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "headlamp-plugin-flux";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for headlamp-plugin-flux";
    homepage = "https://github.com/TODO/headlamp-plugin-flux";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
