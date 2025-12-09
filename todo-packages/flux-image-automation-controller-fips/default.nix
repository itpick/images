{ lib, stdenv, fetchFromGitHub, ... }:

# Package: flux-image-automation-controller-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "flux-image-automation-controller-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "flux-image-automation-controller-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for flux-image-automation-controller-fips";
    homepage = "https://github.com/TODO/flux-image-automation-controller-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
