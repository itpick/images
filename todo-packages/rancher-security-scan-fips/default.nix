{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-security-scan-fips-0.6
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-security-scan-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-security-scan-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-security-scan-fips";
    homepage = "https://github.com/TODO/rancher-security-scan-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
