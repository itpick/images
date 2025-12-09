{ lib, stdenv, fetchFromGitHub, ... }:

# Package: datadog-cluster-agent
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "datadog-cluster-agent";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "datadog-cluster-agent";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for datadog-cluster-agent";
    homepage = "https://github.com/TODO/datadog-cluster-agent";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
