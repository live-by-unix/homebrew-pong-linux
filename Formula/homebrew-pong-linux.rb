class HomebrewPongLinux < Formula
  desc "Pong game in GDScript (Source: TheLinuxGroup)"
  homepage "https://github.com/TheLinuxGroup/Pong"
  
  # Pointing to the actual source of the binaries
  url "https://github.com/TheLinuxGroup/Pong/releases/download/v0.9.0/pong-linux.tar.gz"
  sha256 "081d482db6c2861e78b57ee99c657bf7eebb486c6e048f3b1ce682f0006c629d"
  license "MIT"

  def install
    # Look for the files inside the tar.gz from TheLinuxGroup
    if File.exist?("pong.x86_64")
      bin.install "pong.x86_64" => "pong"
    elsif File.exist?("Pong.x86_64")
      bin.install "Pong.x86_64" => "pong"
    end

    if File.exist?("pong.pck")
      bin.install "pong.pck"
    elsif File.exist?("Pong.pck")
      bin.install "Pong.pck"
    end
  end

  def caveats
    <<~EOS
      Successfully installed from TheLinuxGroup/Pong.
      Type 'pong' to launch the game.
    EOS
  end

  test do
    assert_predicate bin/"pong", :executable?
  end
end
