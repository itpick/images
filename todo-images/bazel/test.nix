{ pkgs, lib, ... }:

# TODO: Add tests for bazel image
{
  name = "bazel";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for bazel"
    exit 1
  '';
}
