{ lib, stdenv, fetchFromGitHub, ... }:

# Package: descheduler
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "descheduler";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "descheduler";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for descheduler";
    homepage = "https://github.com/TODO/descheduler";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
