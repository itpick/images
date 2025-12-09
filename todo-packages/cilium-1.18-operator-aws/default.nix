{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cilium-1.18-operator-aws
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cilium-1.18-operator-aws";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cilium-1.18-operator-aws";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cilium-1.18-operator-aws";
    homepage = "https://github.com/TODO/cilium-1.18-operator-aws";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
