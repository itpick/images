{ lib, stdenv, fetchFromGitHub, ... }:

# Package: erl28-elixir-fips-1.19
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "erl28-elixir-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "erl28-elixir-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for erl28-elixir-fips";
    homepage = "https://github.com/TODO/erl28-elixir-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
