{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tetragon-bash-completion
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tetragon-bash-completion";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tetragon-bash-completion";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tetragon-bash-completion";
    homepage = "https://github.com/TODO/tetragon-bash-completion";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
