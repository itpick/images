{ pkgs, lib, ... }:

# TODO: Add tests for minio-client-fips image
{
  name = "minio-client-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for minio-client-fips"
    exit 1
  '';
}
