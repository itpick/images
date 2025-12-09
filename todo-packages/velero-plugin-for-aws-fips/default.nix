{ lib, stdenv, fetchFromGitHub, ... }:

# Package: velero-plugin-for-aws-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "velero-plugin-for-aws-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "velero-plugin-for-aws-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for velero-plugin-for-aws-fips";
    homepage = "https://github.com/TODO/velero-plugin-for-aws-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
