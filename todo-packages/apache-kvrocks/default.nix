{ lib, stdenv, fetchFromGitHub, ... }:

# Package: apache-kvrocks
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "apache-kvrocks";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "apache-kvrocks";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for apache-kvrocks";
    homepage = "https://github.com/TODO/apache-kvrocks";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
