{ lib, stdenv, fetchFromGitHub, ... }:

# Package: jenkins-entrypoint
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "jenkins-entrypoint";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "jenkins-entrypoint";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for jenkins-entrypoint";
    homepage = "https://github.com/TODO/jenkins-entrypoint";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
