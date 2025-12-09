{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kaniko-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kaniko-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kaniko-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kaniko-fips";
    homepage = "https://github.com/TODO/kaniko-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
