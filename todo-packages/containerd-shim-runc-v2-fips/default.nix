{ lib, stdenv, fetchFromGitHub, ... }:

# Package: containerd-shim-runc-v2-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "containerd-shim-runc-v2-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "containerd-shim-runc-v2-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for containerd-shim-runc-v2-fips";
    homepage = "https://github.com/TODO/containerd-shim-runc-v2-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
