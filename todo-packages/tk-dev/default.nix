{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tk-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tk-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tk-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tk-dev";
    homepage = "https://github.com/TODO/tk-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
