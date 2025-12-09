{ lib, stdenv, fetchFromGitHub, ... }:

# Package: solr
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "solr";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "solr";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for solr";
    homepage = "https://github.com/TODO/solr";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
