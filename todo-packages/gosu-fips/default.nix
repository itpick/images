{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gosu-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gosu-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gosu-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gosu-fips";
    homepage = "https://github.com/TODO/gosu-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
