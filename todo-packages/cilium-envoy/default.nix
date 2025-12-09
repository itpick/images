{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cilium-envoy-1.18
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cilium-envoy";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cilium-envoy";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cilium-envoy";
    homepage = "https://github.com/TODO/cilium-envoy";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
