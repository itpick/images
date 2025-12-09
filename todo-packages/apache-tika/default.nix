{ lib, stdenv, fetchFromGitHub, ... }:

# Package: apache-tika-3.2
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "apache-tika";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "apache-tika";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for apache-tika";
    homepage = "https://github.com/TODO/apache-tika";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
