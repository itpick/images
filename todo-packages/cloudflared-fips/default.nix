{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cloudflared-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cloudflared-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cloudflared-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cloudflared-fips";
    homepage = "https://github.com/TODO/cloudflared-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
