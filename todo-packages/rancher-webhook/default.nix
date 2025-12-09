{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-webhook-0.6
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-webhook";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-webhook";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-webhook";
    homepage = "https://github.com/TODO/rancher-webhook";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
