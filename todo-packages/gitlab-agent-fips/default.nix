{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gitlab-agent-fips-18.5
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gitlab-agent-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gitlab-agent-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gitlab-agent-fips";
    homepage = "https://github.com/TODO/gitlab-agent-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
