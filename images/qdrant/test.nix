{ pkgs, lib, ... }:

# TODO: Add tests for qdrant image
{
  name = "qdrant";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for qdrant"
    exit 1
  '';
}
