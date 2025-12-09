{ lib, stdenv, fetchFromGitHub, ... }:

# Package: spire-oidc-discovery-provider
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "spire-oidc-discovery-provider";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "spire-oidc-discovery-provider";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for spire-oidc-discovery-provider";
    homepage = "https://github.com/TODO/spire-oidc-discovery-provider";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
