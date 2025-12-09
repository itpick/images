{ lib, stdenv, fetchFromGitHub, ... }:

# Package: datadog-operator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "datadog-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "datadog-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for datadog-operator";
    homepage = "https://github.com/TODO/datadog-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
