{ lib, stdenv, fetchFromGitHub, ... }:

# Package: yunikorn-k8shim-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "yunikorn-k8shim-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "yunikorn-k8shim-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for yunikorn-k8shim-fips";
    homepage = "https://github.com/TODO/yunikorn-k8shim-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
