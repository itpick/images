{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ruby3.2-llhttp-mri
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ruby3.2-llhttp-mri";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ruby3.2-llhttp-mri";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ruby3.2-llhttp-mri";
    homepage = "https://github.com/TODO/ruby3.2-llhttp-mri";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
