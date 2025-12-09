{ lib, stdenv, fetchFromGitHub, ... }:

# Package: json-mock
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "json-mock";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "json-mock";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for json-mock";
    homepage = "https://github.com/TODO/json-mock";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
