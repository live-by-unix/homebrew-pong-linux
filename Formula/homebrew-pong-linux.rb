class HomebrewPongLinux < Formula
  desc "A simple Pong game written in GDScript"
  homepage "https://github.com/live-by-unix/homebrew-pong-linux"
  url "https://github.com/live-by-unix/homebrew-pong-linux/releases/download/v0.9.0/pong-linux.tar.gz"
  sha256 "081d482db6c2861e78b57ee99c657bf7eebb486c6e048f3b1ce682f0006c629d"
  license "MIT"

  def install
    # This handles both potential naming conventions from your Godot export
    if File.exist?("pong.x86_64")
      bin.install "pong.x86_64" => "pong"
    elsif File.exist?("homebrew-pong-linux.x86_64")
      bin.install "homebrew-pong-linux.x86_64" => "pong"
    end

    if File.exist?("pong.pck")
      bin.install "pong.pck"
    elsif File.exist?("homebrew-pong-linux.pck")
      bin.install "homebrew-pong-linux.pck"
    end
  end

  def caveats
    <<~EOS
      Pong has been installed! 
      To play, simply type 'pong' in your terminal.
      
      Note: If the game fails to launch, ensure you have Vulkan or OpenGL 
      drivers installed for your Linux distribution.
    EOS
  end

  test do
    # This checks if the 'pong' command was successfully linked to the bin
    assert_predicate bin/"pong", :executable?
  end
end
