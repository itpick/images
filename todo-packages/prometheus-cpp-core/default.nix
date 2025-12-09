{ lib, stdenv, fetchFromGitHub, ... }:

# Package: prometheus-cpp-core
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "prometheus-cpp-core";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "prometheus-cpp-core";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for prometheus-cpp-core";
    homepage = "https://github.com/TODO/prometheus-cpp-core";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
