{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-abyssinica
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-abyssinica";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-abyssinica";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-abyssinica";
    homepage = "https://github.com/TODO/font-abyssinica";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
