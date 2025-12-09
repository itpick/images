{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nextcloud-server-32
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nextcloud-server";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nextcloud-server";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nextcloud-server";
    homepage = "https://github.com/TODO/nextcloud-server";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
