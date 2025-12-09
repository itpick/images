{ lib, stdenv, fetchFromGitHub, ... }:

# Package: istio-pilot-agent-1.28
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "istio-pilot-agent";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "istio-pilot-agent";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for istio-pilot-agent";
    homepage = "https://github.com/TODO/istio-pilot-agent";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
