{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cni-plugins-bandwidth
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cni-plugins-bandwidth";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cni-plugins-bandwidth";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cni-plugins-bandwidth";
    homepage = "https://github.com/TODO/cni-plugins-bandwidth";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
