{ lib, stdenv, fetchFromGitHub, ... }:

# Package: helm-mapkubeapis
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "helm-mapkubeapis";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "helm-mapkubeapis";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for helm-mapkubeapis";
    homepage = "https://github.com/TODO/helm-mapkubeapis";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
