{ lib, stdenv, fetchFromGitHub, ... }:

# Package: helm-fips-3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "helm-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "helm-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for helm-fips";
    homepage = "https://github.com/TODO/helm-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
