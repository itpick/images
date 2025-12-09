{ lib, stdenv, fetchFromGitHub, ... }:

# Package: consul-fips-1.22
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "consul-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "consul-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for consul-fips";
    homepage = "https://github.com/TODO/consul-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
