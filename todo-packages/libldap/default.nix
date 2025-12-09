{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libldap-2.6
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libldap";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libldap";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libldap";
    homepage = "https://github.com/TODO/libldap";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
