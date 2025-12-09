{ lib, stdenv, fetchFromGitHub, ... }:

# Package: knative-serving-1.19-activator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "knative-serving-1.19-activator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "knative-serving-1.19-activator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for knative-serving-1.19-activator";
    homepage = "https://github.com/TODO/knative-serving-1.19-activator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
