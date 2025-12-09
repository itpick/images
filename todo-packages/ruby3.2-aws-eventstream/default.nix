{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ruby3.2-aws-eventstream
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ruby3.2-aws-eventstream";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ruby3.2-aws-eventstream";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ruby3.2-aws-eventstream";
    homepage = "https://github.com/TODO/ruby3.2-aws-eventstream";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
