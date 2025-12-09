{ lib, stdenv, fetchFromGitHub, ... }:

# Package: miniperl
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "miniperl";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "miniperl";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for miniperl";
    homepage = "https://github.com/TODO/miniperl";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
