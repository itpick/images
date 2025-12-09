{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cni-plugins-fips-loopback
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cni-plugins-fips-loopback";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cni-plugins-fips-loopback";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cni-plugins-fips-loopback";
    homepage = "https://github.com/TODO/cni-plugins-fips-loopback";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
