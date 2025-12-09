{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cilium-fips-1.18-host-utils
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cilium-fips-1.18-host-utils";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cilium-fips-1.18-host-utils";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cilium-fips-1.18-host-utils";
    homepage = "https://github.com/TODO/cilium-fips-1.18-host-utils";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
