{ lib, stdenv, fetchFromGitHub, ... }:

# Package: fleet-server-9.1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "fleet-server";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "fleet-server";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for fleet-server";
    homepage = "https://github.com/TODO/fleet-server";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
