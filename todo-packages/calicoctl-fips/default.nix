{ lib, stdenv, fetchFromGitHub, ... }:

# Package: calicoctl-fips-3.31
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "calicoctl-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "calicoctl-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for calicoctl-fips";
    homepage = "https://github.com/TODO/calicoctl-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
