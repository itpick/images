{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-wqy-zenhei
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-wqy-zenhei";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-wqy-zenhei";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-wqy-zenhei";
    homepage = "https://github.com/TODO/font-wqy-zenhei";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
