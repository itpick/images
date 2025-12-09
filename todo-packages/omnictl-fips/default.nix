{ lib, stdenv, fetchFromGitHub, ... }:

# Package: omnictl-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "omnictl-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "omnictl-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for omnictl-fips";
    homepage = "https://github.com/TODO/omnictl-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
