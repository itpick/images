{ lib, stdenv, fetchFromGitHub, ... }:

# Package: knative-eventing-1.19-jobsink
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "knative-eventing-1.19-jobsink";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "knative-eventing-1.19-jobsink";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for knative-eventing-1.19-jobsink";
    homepage = "https://github.com/TODO/knative-eventing-1.19-jobsink";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
