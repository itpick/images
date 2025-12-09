{ lib, stdenv, fetchFromGitHub, ... }:

# Package: jenkins-utils
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "jenkins-utils";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "jenkins-utils";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for jenkins-utils";
    homepage = "https://github.com/TODO/jenkins-utils";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
