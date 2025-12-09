{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crane-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crane-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crane-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crane-fips";
    homepage = "https://github.com/TODO/crane-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
