{ pkgs, lib, ... }:

# TODO: Add tests for fluent-bit-watcher image
{
  name = "fluent-bit-watcher";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for fluent-bit-watcher"
    exit 1
  '';
}
