{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gitlab-rails-ce-assets-fips-18.5
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gitlab-rails-ce-assets-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gitlab-rails-ce-assets-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gitlab-rails-ce-assets-fips";
    homepage = "https://github.com/TODO/gitlab-rails-ce-assets-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
