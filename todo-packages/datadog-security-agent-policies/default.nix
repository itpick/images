{ lib, stdenv, fetchFromGitHub, ... }:

# Package: datadog-security-agent-policies
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "datadog-security-agent-policies";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "datadog-security-agent-policies";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for datadog-security-agent-policies";
    homepage = "https://github.com/TODO/datadog-security-agent-policies";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
