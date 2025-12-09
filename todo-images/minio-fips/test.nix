{ pkgs, lib, ... }:

# TODO: Add tests for minio-fips image
{
  name = "minio-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for minio-fips"
    exit 1
  '';
}
