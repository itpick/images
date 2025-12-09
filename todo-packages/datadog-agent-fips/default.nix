{ lib, stdenv, fetchFromGitHub, ... }:

# Package: datadog-agent-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "datadog-agent-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "datadog-agent-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for datadog-agent-fips";
    homepage = "https://github.com/TODO/datadog-agent-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
