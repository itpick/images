{ pkgs, lib, ... }:

# TODO: Add tests for minio-operator-sidecar-fips image
{
  name = "minio-operator-sidecar-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for minio-operator-sidecar-fips"
    exit 1
  '';
}
