{ lib, stdenv, fetchFromGitHub, ... }:

# Package: external-secrets-operator-fips-1.1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "external-secrets-operator-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "external-secrets-operator-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for external-secrets-operator-fips";
    homepage = "https://github.com/TODO/external-secrets-operator-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
