{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubectl-fips-latest
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubectl-fips-latest";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubectl-fips-latest";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubectl-fips-latest";
    homepage = "https://github.com/TODO/kubectl-fips-latest";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
