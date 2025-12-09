{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tempo-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tempo-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tempo-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tempo-fips";
    homepage = "https://github.com/TODO/tempo-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
