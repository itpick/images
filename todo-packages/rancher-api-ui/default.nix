{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-api-ui
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-api-ui";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-api-ui";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-api-ui";
    homepage = "https://github.com/TODO/rancher-api-ui";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
