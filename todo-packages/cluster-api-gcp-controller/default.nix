{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cluster-api-gcp-controller
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cluster-api-gcp-controller";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cluster-api-gcp-controller";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cluster-api-gcp-controller";
    homepage = "https://github.com/TODO/cluster-api-gcp-controller";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
