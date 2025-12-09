{ pkgs, lib, ... }:

# TODO: Add tests for minio-client-iamguarded image
{
  name = "minio-client-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for minio-client-iamguarded"
    exit 1
  '';
}
