{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gitlab-container-registry-fips-18.6
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gitlab-container-registry-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gitlab-container-registry-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gitlab-container-registry-fips";
    homepage = "https://github.com/TODO/gitlab-container-registry-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
