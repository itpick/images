{ lib, stdenv, fetchFromGitHub, ... }:

# Package: vendir-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "vendir-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "vendir-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for vendir-fips";
    homepage = "https://github.com/TODO/vendir-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
