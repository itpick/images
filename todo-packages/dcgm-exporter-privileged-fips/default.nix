{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dcgm-exporter-privileged-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dcgm-exporter-privileged-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dcgm-exporter-privileged-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dcgm-exporter-privileged-fips";
    homepage = "https://github.com/TODO/dcgm-exporter-privileged-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
