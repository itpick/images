{ lib, stdenv, fetchFromGitHub, ... }:

# Package: eck-operator-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "eck-operator-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "eck-operator-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for eck-operator-fips";
    homepage = "https://github.com/TODO/eck-operator-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
