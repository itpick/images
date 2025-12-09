{ lib, stdenv, fetchFromGitHub, ... }:

# Package: regclient-regctl-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "regclient-regctl-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "regclient-regctl-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for regclient-regctl-fips";
    homepage = "https://github.com/TODO/regclient-regctl-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
