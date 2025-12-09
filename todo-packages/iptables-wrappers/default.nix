{ lib, stdenv, fetchFromGitHub, ... }:

# Package: iptables-wrappers
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "iptables-wrappers";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "iptables-wrappers";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for iptables-wrappers";
    homepage = "https://github.com/TODO/iptables-wrappers";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
