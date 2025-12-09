{ lib, stdenv, fetchFromGitHub, ... }:

# Package: erlang-fips-27
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "erlang-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "erlang-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for erlang-fips";
    homepage = "https://github.com/TODO/erlang-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
