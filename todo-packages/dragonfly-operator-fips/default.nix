{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dragonfly-operator-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dragonfly-operator-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dragonfly-operator-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dragonfly-operator-fips";
    homepage = "https://github.com/TODO/dragonfly-operator-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
