{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mattermost-fips-11.1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mattermost-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mattermost-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mattermost-fips";
    homepage = "https://github.com/TODO/mattermost-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
