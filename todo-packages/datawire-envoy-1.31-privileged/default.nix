{ lib, stdenv, fetchFromGitHub, ... }:

# Package: datawire-envoy-1.31-privileged
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "datawire-envoy-1.31-privileged";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "datawire-envoy-1.31-privileged";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for datawire-envoy-1.31-privileged";
    homepage = "https://github.com/TODO/datawire-envoy-1.31-privileged";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
