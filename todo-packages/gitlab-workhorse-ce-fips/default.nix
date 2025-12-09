{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gitlab-workhorse-ce-fips-18.6
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gitlab-workhorse-ce-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gitlab-workhorse-ce-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gitlab-workhorse-ce-fips";
    homepage = "https://github.com/TODO/gitlab-workhorse-ce-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
