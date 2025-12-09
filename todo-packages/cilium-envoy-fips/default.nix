{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cilium-envoy-fips-1.18
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cilium-envoy-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cilium-envoy-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cilium-envoy-fips";
    homepage = "https://github.com/TODO/cilium-envoy-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
