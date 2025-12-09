{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cloudwatch-exporter
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cloudwatch-exporter";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cloudwatch-exporter";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cloudwatch-exporter";
    homepage = "https://github.com/TODO/cloudwatch-exporter";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
