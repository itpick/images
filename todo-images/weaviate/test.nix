{ pkgs, lib, ... }:

# TODO: Add tests for weaviate image
{
  name = "weaviate";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for weaviate"
    exit 1
  '';
}
