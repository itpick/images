{ lib, stdenv, fetchFromGitHub, ... }:

# Package: json-c-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "json-c-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "json-c-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for json-c-dev";
    homepage = "https://github.com/TODO/json-c-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
