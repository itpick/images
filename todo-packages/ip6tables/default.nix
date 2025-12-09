{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ip6tables
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ip6tables";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ip6tables";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ip6tables";
    homepage = "https://github.com/TODO/ip6tables";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
