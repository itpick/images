{ pkgs, image }:

pkgs.writeShellScript "test-jdk" ''
  set -euo pipefail
  
  echo "🧪 Testing jdk image functionality..."
  
  # Test 1: Java version
  echo "  ✓ Testing java version..."
  docker run --rm ${image.imageName}:test java --version | grep -q "openjdk"
  
  # Test 2: Javac compiler
  echo "  ✓ Testing javac compiler..."
  docker run --rm ${image.imageName}:test javac --version | grep -q "javac"
  
  # Test 3: Basic Java compilation and execution
  echo "  ✓ Testing Java compilation..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    cat > Hello.java << EOF
public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello from Java");
    }
}
EOF
    javac Hello.java &&
    java Hello
  ' | grep -q "Hello from Java"
  
  # Test 4: JAVA_HOME environment
  echo "  ✓ Testing JAVA_HOME..."
  docker run --rm ${image.imageName}:test bash -c 'echo $JAVA_HOME' | grep -q "/nix/store"
  
  echo "✅ All jdk tests passed!"
''