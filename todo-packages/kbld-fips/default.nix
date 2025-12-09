{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kbld-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kbld-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kbld-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kbld-fips";
    homepage = "https://github.com/TODO/kbld-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
