{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gitlab-rails-ce-18.5
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gitlab-rails-ce";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gitlab-rails-ce";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gitlab-rails-ce";
    homepage = "https://github.com/TODO/gitlab-rails-ce";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
