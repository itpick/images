{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-ui-2.12
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-ui";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-ui";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-ui";
    homepage = "https://github.com/TODO/rancher-ui";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
