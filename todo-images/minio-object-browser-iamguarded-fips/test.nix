{ pkgs, lib, ... }:

# TODO: Add tests for minio-object-browser-iamguarded-fips image
{
  name = "minio-object-browser-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for minio-object-browser-iamguarded-fips"
    exit 1
  '';
}
