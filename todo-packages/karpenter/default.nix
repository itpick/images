{ lib, stdenv, fetchFromGitHub, ... }:

# Package: karpenter-1.8
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "karpenter";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "karpenter";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for karpenter";
    homepage = "https://github.com/TODO/karpenter";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
