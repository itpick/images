{ lib, stdenv, fetchFromGitHub, ... }:

# Package: apm-server-9.1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "apm-server";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "apm-server";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for apm-server";
    homepage = "https://github.com/TODO/apm-server";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
