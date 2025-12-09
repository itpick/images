{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nextcloud-server-32-apache2-config
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nextcloud-server-32-apache2-config";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nextcloud-server-32-apache2-config";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nextcloud-server-32-apache2-config";
    homepage = "https://github.com/TODO/nextcloud-server-32-apache2-config";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
