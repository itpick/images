{ lib, stdenv, fetchFromGitHub, ... }:

# Package: fluent-plugin-tag-normaliser
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "fluent-plugin-tag-normaliser";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "fluent-plugin-tag-normaliser";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for fluent-plugin-tag-normaliser";
    homepage = "https://github.com/TODO/fluent-plugin-tag-normaliser";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
