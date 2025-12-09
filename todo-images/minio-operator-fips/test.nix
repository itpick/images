{ pkgs, lib, ... }:

# TODO: Add tests for minio-operator-fips image
{
  name = "minio-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for minio-operator-fips"
    exit 1
  '';
}
