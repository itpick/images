{ lib, stdenv, fetchFromGitHub, ... }:

# Package: coredns-fips-1.13
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "coredns-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "coredns-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for coredns-fips";
    homepage = "https://github.com/TODO/coredns-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
