{ lib, stdenv, fetchFromGitHub, ... }:

# Package: grafana-grafonnet
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "grafana-grafonnet";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "grafana-grafonnet";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for grafana-grafonnet";
    homepage = "https://github.com/TODO/grafana-grafonnet";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
