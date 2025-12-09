{ pkgs, lib, ... }:

# TODO: Add tests for mlflow-iamguarded image
{
  name = "mlflow-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mlflow-iamguarded"
    exit 1
  '';
}
