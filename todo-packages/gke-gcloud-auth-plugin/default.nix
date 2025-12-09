{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gke-gcloud-auth-plugin
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gke-gcloud-auth-plugin";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gke-gcloud-auth-plugin";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gke-gcloud-auth-plugin";
    homepage = "https://github.com/TODO/gke-gcloud-auth-plugin";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
