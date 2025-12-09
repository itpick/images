{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gitaly-fips-18.6
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gitaly-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gitaly-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gitaly-fips";
    homepage = "https://github.com/TODO/gitaly-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
