{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gitlab-operator-charts
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gitlab-operator-charts";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gitlab-operator-charts";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gitlab-operator-charts";
    homepage = "https://github.com/TODO/gitlab-operator-charts";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
