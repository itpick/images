{ lib, stdenv, fetchFromGitHub, ... }:

# Package: heimdal-libs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "heimdal-libs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "heimdal-libs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for heimdal-libs";
    homepage = "https://github.com/TODO/heimdal-libs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
