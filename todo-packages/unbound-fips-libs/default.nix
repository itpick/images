{ lib, stdenv, fetchFromGitHub, ... }:

# Package: unbound-fips-libs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "unbound-fips-libs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "unbound-fips-libs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for unbound-fips-libs";
    homepage = "https://github.com/TODO/unbound-fips-libs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
