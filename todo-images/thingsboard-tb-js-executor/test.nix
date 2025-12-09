{ pkgs, lib, ... }:

# TODO: Add tests for thingsboard-tb-js-executor image
{
  name = "thingsboard-tb-js-executor";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for thingsboard-tb-js-executor"
    exit 1
  '';
}
