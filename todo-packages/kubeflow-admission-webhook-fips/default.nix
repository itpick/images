{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubeflow-admission-webhook-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubeflow-admission-webhook-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubeflow-admission-webhook-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubeflow-admission-webhook-fips";
    homepage = "https://github.com/TODO/kubeflow-admission-webhook-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
