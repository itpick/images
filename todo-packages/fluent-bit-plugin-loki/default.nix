{ lib, stdenv, fetchFromGitHub, ... }:

# Package: fluent-bit-plugin-loki
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "fluent-bit-plugin-loki";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "fluent-bit-plugin-loki";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for fluent-bit-plugin-loki";
    homepage = "https://github.com/TODO/fluent-bit-plugin-loki";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
