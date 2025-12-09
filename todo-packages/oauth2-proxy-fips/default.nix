{ lib, stdenv, fetchFromGitHub, ... }:

# Package: oauth2-proxy-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "oauth2-proxy-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "oauth2-proxy-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for oauth2-proxy-fips";
    homepage = "https://github.com/TODO/oauth2-proxy-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
