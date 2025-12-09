{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kube-logging-operator-fluentd-outputs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kube-logging-operator-fluentd-outputs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kube-logging-operator-fluentd-outputs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kube-logging-operator-fluentd-outputs";
    homepage = "https://github.com/TODO/kube-logging-operator-fluentd-outputs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
