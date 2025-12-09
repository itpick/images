{ lib, stdenv, fetchFromGitHub, ... }:

# Package: erl27-elixir-fips-1.19
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "erl27-elixir-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "erl27-elixir-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for erl27-elixir-fips";
    homepage = "https://github.com/TODO/erl27-elixir-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
