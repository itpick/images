{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dynamic-localpv-provisioner
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dynamic-localpv-provisioner";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dynamic-localpv-provisioner";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dynamic-localpv-provisioner";
    homepage = "https://github.com/TODO/dynamic-localpv-provisioner";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
