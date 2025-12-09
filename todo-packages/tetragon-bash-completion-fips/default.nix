{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tetragon-bash-completion-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tetragon-bash-completion-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tetragon-bash-completion-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tetragon-bash-completion-fips";
    homepage = "https://github.com/TODO/tetragon-bash-completion-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
