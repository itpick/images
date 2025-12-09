{ lib, stdenv, fetchFromGitHub, ... }:

# Package: aspnet-10-runtime
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "aspnet-10-runtime";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "aspnet-10-runtime";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for aspnet-10-runtime";
    homepage = "https://github.com/TODO/aspnet-10-runtime";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
