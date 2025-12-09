{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gitlab-operator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gitlab-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gitlab-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gitlab-operator";
    homepage = "https://github.com/TODO/gitlab-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
