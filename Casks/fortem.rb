# typed: false
# frozen_string_literal: true

cask "fortem" do
  version "0.1.0"

  on_macos do
    on_arm do
      sha256 "e6172909c728bf76a17d40e7b3e00e64bac9f461ede1590cf04767971705824b"
      url "https://github.com/cybrixcc/fortem-releases/releases/download/v#{version}/fortem_#{version}_macOS_arm64.tar.gz"
    end
    on_intel do
      sha256 "9d4f2d08121743199a4d911bdd70f10955b5f3bf3309509608d7a9cf23581be0"
      url "https://github.com/cybrixcc/fortem-releases/releases/download/v#{version}/fortem_#{version}_macOS_x86_64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "d24c400586bdc3d63c71de1f2d56d5cbbbdd4aa7941b565910bd9cbab9340bcf"
      url "https://github.com/cybrixcc/fortem-releases/releases/download/v#{version}/fortem_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "ca5befbee84ec7db57465ad5bd74fdd03128740f1bc11d3e0d4c9087e6e068ce"
      url "https://github.com/cybrixcc/fortem-releases/releases/download/v#{version}/fortem_#{version}_linux_x86_64.tar.gz"
    end
  end

  name "Fortem"
  desc "Local Kubernetes environment inspector"
  homepage "https://fortem.dev/"

  livecheck do
    skip "Updated automatically with each Fortem release"
  end

  binary "fortem"

  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "fortem"], chdir: "."
    end
  end

  caveats <<~EOS
    Fortem reads your existing kubeconfig and is read-only unless started
    explicitly with --manage. Release archives are not yet notarized.
  EOS
end
