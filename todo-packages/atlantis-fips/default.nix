{ lib, stdenv, fetchFromGitHub, ... }:

# Package: atlantis-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "atlantis-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "atlantis-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for atlantis-fips";
    homepage = "https://github.com/TODO/atlantis-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
