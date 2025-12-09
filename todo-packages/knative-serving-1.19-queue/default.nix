{ lib, stdenv, fetchFromGitHub, ... }:

# Package: knative-serving-1.19-queue
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "knative-serving-1.19-queue";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "knative-serving-1.19-queue";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for knative-serving-1.19-queue";
    homepage = "https://github.com/TODO/knative-serving-1.19-queue";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
