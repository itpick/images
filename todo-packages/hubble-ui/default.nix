{ lib, stdenv, fetchFromGitHub, ... }:

# Package: hubble-ui
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "hubble-ui";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "hubble-ui";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for hubble-ui";
    homepage = "https://github.com/TODO/hubble-ui";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
