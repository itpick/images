{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ruby3.4-psych
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ruby3.4-psych";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ruby3.4-psych";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ruby3.4-psych";
    homepage = "https://github.com/TODO/ruby3.4-psych";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
