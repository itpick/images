{ lib, stdenv, fetchFromGitHub, ... }:

# Package: falcoctl-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "falcoctl-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "falcoctl-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for falcoctl-fips";
    homepage = "https://github.com/TODO/falcoctl-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
