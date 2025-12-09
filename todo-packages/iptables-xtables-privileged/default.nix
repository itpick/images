{ lib, stdenv, fetchFromGitHub, ... }:

# Package: iptables-xtables-privileged
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "iptables-xtables-privileged";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "iptables-xtables-privileged";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for iptables-xtables-privileged";
    homepage = "https://github.com/TODO/iptables-xtables-privileged";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
