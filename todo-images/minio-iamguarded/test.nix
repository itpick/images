{ pkgs, lib, ... }:

# TODO: Add tests for minio-iamguarded image
{
  name = "minio-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for minio-iamguarded"
    exit 1
  '';
}
