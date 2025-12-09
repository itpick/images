{ lib, stdenv, fetchFromGitHub, ... }:

# Package: azure-functions-host
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "azure-functions-host";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "azure-functions-host";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for azure-functions-host";
    homepage = "https://github.com/TODO/azure-functions-host";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
