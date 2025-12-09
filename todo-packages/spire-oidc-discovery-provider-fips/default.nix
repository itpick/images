{ lib, stdenv, fetchFromGitHub, ... }:

# Package: spire-oidc-discovery-provider-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "spire-oidc-discovery-provider-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "spire-oidc-discovery-provider-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for spire-oidc-discovery-provider-fips";
    homepage = "https://github.com/TODO/spire-oidc-discovery-provider-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
