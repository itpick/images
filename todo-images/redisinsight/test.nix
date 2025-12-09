{ pkgs, lib, ... }:

# TODO: Add tests for redisinsight image
{
  name = "redisinsight";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for redisinsight"
    exit 1
  '';
}
