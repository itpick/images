{ lib, stdenv, fetchFromGitHub, ... }:

# Package: azure-service-operator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "azure-service-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "azure-service-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for azure-service-operator";
    homepage = "https://github.com/TODO/azure-service-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
