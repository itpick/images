{ lib, stdenv, fetchFromGitHub, ... }:

# Package: fluent-plugin-prometheus
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "fluent-plugin-prometheus";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "fluent-plugin-prometheus";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for fluent-plugin-prometheus";
    homepage = "https://github.com/TODO/fluent-plugin-prometheus";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
