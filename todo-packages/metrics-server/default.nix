{ lib, stdenv, fetchFromGitHub, ... }:

# Package: metrics-server
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "metrics-server";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "metrics-server";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for metrics-server";
    homepage = "https://github.com/TODO/metrics-server";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
