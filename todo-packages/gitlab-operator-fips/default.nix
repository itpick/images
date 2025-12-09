{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gitlab-operator-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gitlab-operator-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gitlab-operator-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gitlab-operator-fips";
    homepage = "https://github.com/TODO/gitlab-operator-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
