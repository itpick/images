{ pkgs, lib, ... }:

# TODO: Add tests for minio-iamguarded-fips image
{
  name = "minio-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for minio-iamguarded-fips"
    exit 1
  '';
}
