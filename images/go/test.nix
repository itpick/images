{ pkgs, image }:

pkgs.writeShellScript "test-go" ''
  set -euo pipefail
  
  echo "🧪 Testing go image functionality..."
  
  # Test 1: Go version
  echo "  ✓ Testing go version..."
  docker run --rm ${image.imageName}:test go version | grep -q "go version"
  
  # Test 2: Basic Go compilation
  echo "  ✓ Testing Go compilation..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    cat > hello.go << EOF
package main
import "fmt"
func main() {
    fmt.Println("Hello from Go")
}
EOF
    go build -o hello hello.go &&
    ./hello
  ' | grep -q "Hello from Go"
  
  # Test 3: Go mod functionality
  echo "  ✓ Testing go mod functionality..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    rm -rf go-test &&
    mkdir go-test &&
    cd go-test &&
    go mod init test &&
    echo "module test" > go.mod
  '
  
  # Test 4: Environment variables
  echo "  ✓ Testing Go environment..."
  docker run --rm ${image.imageName}:test go env GOPATH | grep -q "/home/nonroot/go"
  
  # Test 5: Git availability (needed for go get)
  echo "  ✓ Testing git availability..."
  docker run --rm ${image.imageName}:test which git | grep -q "git"
  
  echo "✅ All go tests passed!"
''