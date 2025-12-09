{ lib, stdenv, fetchFromGitHub, ... }:

# Package: hubble-ui-backend
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "hubble-ui-backend";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "hubble-ui-backend";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for hubble-ui-backend";
    homepage = "https://github.com/TODO/hubble-ui-backend";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
