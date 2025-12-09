{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kube-scheduler-1.34
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kube-scheduler";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kube-scheduler";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kube-scheduler";
    homepage = "https://github.com/TODO/kube-scheduler";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
