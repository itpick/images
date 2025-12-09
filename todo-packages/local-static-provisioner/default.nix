{ lib, stdenv, fetchFromGitHub, ... }:

# Package: local-static-provisioner
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "local-static-provisioner";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "local-static-provisioner";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for local-static-provisioner";
    homepage = "https://github.com/TODO/local-static-provisioner";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
