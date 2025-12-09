{ lib, stdenv, fetchFromGitHub, ... }:

# Package: net-snmp-libs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "net-snmp-libs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "net-snmp-libs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for net-snmp-libs";
    homepage = "https://github.com/TODO/net-snmp-libs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
