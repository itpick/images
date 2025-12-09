{ pkgs, lib, ... }:

# TODO: Add tests for ctlog-trillian-ctserver image
{
  name = "ctlog-trillian-ctserver";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ctlog-trillian-ctserver"
    exit 1
  '';
}
