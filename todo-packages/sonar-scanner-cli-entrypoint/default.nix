{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sonar-scanner-cli-entrypoint
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sonar-scanner-cli-entrypoint";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sonar-scanner-cli-entrypoint";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sonar-scanner-cli-entrypoint";
    homepage = "https://github.com/TODO/sonar-scanner-cli-entrypoint";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
