{ pkgs, lib, ... }:

# TODO: Add tests for spark-iamguarded image
{
  name = "spark-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spark-iamguarded"
    exit 1
  '';
}
