{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-lohit-beng-bengali
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-lohit-beng-bengali";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-lohit-beng-bengali";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-lohit-beng-bengali";
    homepage = "https://github.com/TODO/font-lohit-beng-bengali";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
