{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-agent-2.9
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-agent";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-agent";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-agent";
    homepage = "https://github.com/TODO/rancher-agent";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
