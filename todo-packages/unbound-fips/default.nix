{ lib, stdenv, fetchFromGitHub, ... }:

# Package: unbound-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "unbound-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "unbound-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for unbound-fips";
    homepage = "https://github.com/TODO/unbound-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
