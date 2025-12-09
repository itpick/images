{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openldap-2.6-back-meta
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openldap-2.6-back-meta";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openldap-2.6-back-meta";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openldap-2.6-back-meta";
    homepage = "https://github.com/TODO/openldap-2.6-back-meta";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
