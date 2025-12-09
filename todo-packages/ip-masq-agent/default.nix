{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ip-masq-agent
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ip-masq-agent";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ip-masq-agent";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ip-masq-agent";
    homepage = "https://github.com/TODO/ip-masq-agent";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
