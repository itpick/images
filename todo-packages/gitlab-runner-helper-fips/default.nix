{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gitlab-runner-helper-fips-18.6
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gitlab-runner-helper-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gitlab-runner-helper-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gitlab-runner-helper-fips";
    homepage = "https://github.com/TODO/gitlab-runner-helper-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
