{ lib, stdenv, fetchFromGitHub, ... }:

# Package: aspnet-8-runtime
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "aspnet-8-runtime";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "aspnet-8-runtime";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for aspnet-8-runtime";
    homepage = "https://github.com/TODO/aspnet-8-runtime";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
