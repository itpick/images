{ pkgs, lib, ... }:

# TODO: Add tests for camunda-zeebe image
{
  name = "camunda-zeebe";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for camunda-zeebe"
    exit 1
  '';
}
