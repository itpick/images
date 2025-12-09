{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-shell-0.5
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-shell";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-shell";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-shell";
    homepage = "https://github.com/TODO/rancher-shell";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
