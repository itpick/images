{ pkgs, image }:

pkgs.writeShellScript "test-rust-build-env" ''
  set -euo pipefail
  
  echo "🧪 Testing rust-build-env image functionality..."
  
  # Test 1: Rust toolchain
  echo "  ✓ Testing rustc compiler..."
  docker run --rm ${image.imageName}:test rustc --version | grep -q "rustc"
  
  # Test 2: Cargo build tool
  echo "  ✓ Testing cargo..."
  docker run --rm ${image.imageName}:test cargo --version | grep -q "cargo"
  
  # Test 3: Additional tools
  echo "  ✓ Testing development tools..."
  docker run --rm ${image.imageName}:test rustfmt --version | grep -q "rustfmt"
  docker run --rm ${image.imageName}:test cargo clippy --version | grep -q "clippy"
  
  # Test 4: Package management
  echo "  ✓ Testing cargo package management..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    rm -rf rust-build-test &&
    cargo init rust-build-test --name hello &&
    cd rust-build-test &&
    echo "fn main() { println!(\"Hello from Rust build env\"); }" > src/main.rs &&
    cargo check
  '
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All rust-build-env tests passed!"
''