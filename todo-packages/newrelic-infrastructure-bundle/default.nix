{ lib, stdenv, fetchFromGitHub, ... }:

# Package: newrelic-infrastructure-bundle
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "newrelic-infrastructure-bundle";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "newrelic-infrastructure-bundle";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for newrelic-infrastructure-bundle";
    homepage = "https://github.com/TODO/newrelic-infrastructure-bundle";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
