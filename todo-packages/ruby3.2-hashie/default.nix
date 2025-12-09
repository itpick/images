{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ruby3.2-hashie
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ruby3.2-hashie";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ruby3.2-hashie";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ruby3.2-hashie";
    homepage = "https://github.com/TODO/ruby3.2-hashie";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
