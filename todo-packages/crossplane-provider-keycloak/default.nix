{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-provider-keycloak
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-provider-keycloak";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-provider-keycloak";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-provider-keycloak";
    homepage = "https://github.com/TODO/crossplane-provider-keycloak";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
