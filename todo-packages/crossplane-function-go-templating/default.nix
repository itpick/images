{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crossplane-function-go-templating
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crossplane-function-go-templating";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crossplane-function-go-templating";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crossplane-function-go-templating";
    homepage = "https://github.com/TODO/crossplane-function-go-templating";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
