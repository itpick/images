{ lib, stdenv, fetchFromGitHub, ... }:

# Package: pushprox-client-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "pushprox-client-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "pushprox-client-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for pushprox-client-fips";
    homepage = "https://github.com/TODO/pushprox-client-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
