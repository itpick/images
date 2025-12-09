{ lib, stdenv, fetchFromGitHub, ... }:

# Package: flannel-cni-plugin-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "flannel-cni-plugin-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "flannel-cni-plugin-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for flannel-cni-plugin-fips";
    homepage = "https://github.com/TODO/flannel-cni-plugin-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
