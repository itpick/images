{ lib, stdenv, fetchFromGitHub, ... }:

# Package: external-dns-fips-0.20
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "external-dns-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "external-dns-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for external-dns-fips";
    homepage = "https://github.com/TODO/external-dns-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
