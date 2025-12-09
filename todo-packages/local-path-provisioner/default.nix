{ lib, stdenv, fetchFromGitHub, ... }:

# Package: local-path-provisioner
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "local-path-provisioner";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "local-path-provisioner";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for local-path-provisioner";
    homepage = "https://github.com/TODO/local-path-provisioner";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
