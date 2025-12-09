{ lib, stdenv, fetchFromGitHub, ... }:

# Package: fluent-plugin-elasticsearch
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "fluent-plugin-elasticsearch";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "fluent-plugin-elasticsearch";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for fluent-plugin-elasticsearch";
    homepage = "https://github.com/TODO/fluent-plugin-elasticsearch";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
