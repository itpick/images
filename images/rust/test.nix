{ pkgs, image }:

pkgs.writeShellScript "test-rust" ''
  set -euo pipefail
  
  echo "🧪 Testing rust image functionality..."
  
  # Test 1: Rust version
  echo "  ✓ Testing rustc version..."
  docker run --rm ${image.imageName}:test rustc --version | grep -q "rustc"
  
  # Test 2: Cargo version
  echo "  ✓ Testing cargo version..."
  docker run --rm ${image.imageName}:test cargo --version | grep -q "cargo"
  
  # Test 3: Basic Rust compilation
  echo "  ✓ Testing Rust compilation..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    rm -rf rust-test &&
    cargo init rust-test --name hello &&
    cd rust-test &&
    echo "fn main() { println!(\"Hello from Rust\"); }" > src/main.rs &&
    cargo build &&
    ./target/debug/hello
  ' | grep -q "Hello from Rust"
  
  # Test 4: Rustfmt availability
  echo "  ✓ Testing rustfmt..."
  docker run --rm ${image.imageName}:test rustfmt --version | grep -q "rustfmt"
  
  # Test 5: Clippy availability
  echo "  ✓ Testing clippy..."
  docker run --rm ${image.imageName}:test cargo clippy --version | grep -q "clippy"
  
  echo "✅ All rust tests passed!"
''