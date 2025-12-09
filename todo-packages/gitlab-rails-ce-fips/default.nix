{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gitlab-rails-ce-fips-18.5
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gitlab-rails-ce-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gitlab-rails-ce-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gitlab-rails-ce-fips";
    homepage = "https://github.com/TODO/gitlab-rails-ce-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
