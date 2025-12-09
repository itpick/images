{ pkgs, lib, ... }:

# TODO: Add tests for wso2is image
{
  name = "wso2is";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for wso2is"
    exit 1
  '';
}
