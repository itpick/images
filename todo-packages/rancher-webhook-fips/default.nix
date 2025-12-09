{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-webhook-fips-0.6
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-webhook-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-webhook-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-webhook-fips";
    homepage = "https://github.com/TODO/rancher-webhook-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
