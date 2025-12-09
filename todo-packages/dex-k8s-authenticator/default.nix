{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dex-k8s-authenticator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dex-k8s-authenticator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dex-k8s-authenticator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dex-k8s-authenticator";
    homepage = "https://github.com/TODO/dex-k8s-authenticator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
