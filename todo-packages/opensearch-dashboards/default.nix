{ lib, stdenv, fetchFromGitHub, ... }:

# Package: opensearch-dashboards-3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "opensearch-dashboards";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "opensearch-dashboards";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for opensearch-dashboards";
    homepage = "https://github.com/TODO/opensearch-dashboards";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
