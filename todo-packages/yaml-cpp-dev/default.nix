{ lib, stdenv, fetchFromGitHub, ... }:

# Package: yaml-cpp-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "yaml-cpp-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "yaml-cpp-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for yaml-cpp-dev";
    homepage = "https://github.com/TODO/yaml-cpp-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
