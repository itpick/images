{ lib, stdenv, fetchFromGitHub, ... }:

# Package: spark-3.5-scala-2.12
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "spark-3.5-scala";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "spark-3.5-scala";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for spark-3.5-scala";
    homepage = "https://github.com/TODO/spark-3.5-scala";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
