{ pkgs, lib, ... }:

# TODO: Add tests for minio-object-browser-iamguarded image
{
  name = "minio-object-browser-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for minio-object-browser-iamguarded"
    exit 1
  '';
}
