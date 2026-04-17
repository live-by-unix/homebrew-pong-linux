class HomebrewPongLinux < Formula
  desc "A simple Pong game written in GDScript (Linux Build) "
  homepage "https://github.com/TheLinuxGroup/homebrew-pong-linux"
  url "https://github.com/TheLinuxGroup/homebrew-pong-linux/releases/download/v0.9.0/pong-linux.tar.gz"
  sha256 "081d482db6c2861e78b57ee99c657bf7eebb486c6e048f3b1ce682f0006c629d"
  license "MIT"

  def install
    if File.exist?("pong.x86_64")
      bin.install "pong.x86_64" => "pong"
    elsif File.exist?("homebrew-pong-linux.x86_64")
      bin.install "homebrew-pong-linux.x86_64" => "pong"
    end

    # Checking for the data pack
    if File.exist?("pong.pck")
      bin.install "pong.pck"
    elsif File.exist?("homebrew-pong-linux.pck")
      bin.install "homebrew-pong-linux.pck"
    end
  end

  def caveats
    <<~EOS
      To start the game, simply type:
        pong
      
      If you get a Vulkan or Graphics error, ensure your drivers are up to date.
    EOS
  end

  test do
    assert_predicate bin/"pong", :executable?
  end
end
