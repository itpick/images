{ lib, stdenv, fetchFromGitHub, ... }:

# Package: flux-image-reflector-controller-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "flux-image-reflector-controller-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "flux-image-reflector-controller-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for flux-image-reflector-controller-fips";
    homepage = "https://github.com/TODO/flux-image-reflector-controller-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
