{ lib, stdenv, fetchFromGitHub, ... }:

# Package: yunikorn-k8shim
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "yunikorn-k8shim";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "yunikorn-k8shim";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for yunikorn-k8shim";
    homepage = "https://github.com/TODO/yunikorn-k8shim";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
