{ lib, stdenv, fetchFromGitHub, ... }:

# Package: omni-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "omni-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "omni-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for omni-fips";
    homepage = "https://github.com/TODO/omni-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
