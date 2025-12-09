{ pkgs, lib, ... }:

# TODO: Add tests for minio-client-iamguarded-fips image
{
  name = "minio-client-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for minio-client-iamguarded-fips"
    exit 1
  '';
}
