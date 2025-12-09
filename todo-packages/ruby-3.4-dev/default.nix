{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ruby-3.4-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ruby-3.4-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ruby-3.4-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ruby-3.4-dev";
    homepage = "https://github.com/TODO/ruby-3.4-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
