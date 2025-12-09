{ pkgs, lib, ... }:

# TODO: Add tests for solr image
{
  name = "solr";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for solr"
    exit 1
  '';
}
