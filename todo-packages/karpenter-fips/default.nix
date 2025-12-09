{ lib, stdenv, fetchFromGitHub, ... }:

# Package: karpenter-fips-1.8
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "karpenter-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "karpenter-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for karpenter-fips";
    homepage = "https://github.com/TODO/karpenter-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
