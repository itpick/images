{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-ipa
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-ipa";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-ipa";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-ipa";
    homepage = "https://github.com/TODO/font-ipa";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
