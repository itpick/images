{ lib, stdenv, fetchFromGitHub, ... }:

# Package: istio-envoy-1.28
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "istio-envoy";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "istio-envoy";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for istio-envoy";
    homepage = "https://github.com/TODO/istio-envoy";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
