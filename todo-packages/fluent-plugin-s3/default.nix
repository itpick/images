{ lib, stdenv, fetchFromGitHub, ... }:

# Package: fluent-plugin-s3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "fluent-plugin-s3";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "fluent-plugin-s3";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for fluent-plugin-s3";
    homepage = "https://github.com/TODO/fluent-plugin-s3";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
