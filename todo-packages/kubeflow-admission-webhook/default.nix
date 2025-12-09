{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubeflow-admission-webhook
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubeflow-admission-webhook";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubeflow-admission-webhook";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubeflow-admission-webhook";
    homepage = "https://github.com/TODO/kubeflow-admission-webhook";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
