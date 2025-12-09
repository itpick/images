{ pkgs, lib, ... }:

# TODO: Add tests for meilisearch image
{
  name = "meilisearch";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for meilisearch"
    exit 1
  '';
}
