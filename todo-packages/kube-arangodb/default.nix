{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kube-arangodb-1.3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kube-arangodb";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kube-arangodb";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kube-arangodb";
    homepage = "https://github.com/TODO/kube-arangodb";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
