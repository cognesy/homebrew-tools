class YamlSchema < Formula
  desc "Validate YAML documents against a YAML Schema"
  homepage "https://yaml-schema.net/"
  url "https://github.com/yaml-schema/yaml-schema/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "5a500918a36c38fb8f217bcd51dbbf02f7b393c46fc97d6288213a0e2fa0147d"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
    (bin / "ys").rename(bin / "yaml-schema-validator")
  end

  test do
    assert_match "0.9.1", shell_output("#{bin}/yaml-schema-validator version")

    (testpath / "schema.yaml").write <<~YAML
      type: object
      required:
        - name
      properties:
        name:
          type: string
    YAML

    (testpath / "document.yaml").write <<~YAML
      name: Homebrew
    YAML

    system bin / "yaml-schema-validator", "-f", testpath / "schema.yaml", testpath / "document.yaml"
  end
end
