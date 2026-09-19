# typed: false
# frozen_string_literal: true

cask "fortem" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.0"
  sha256 arm:   "e6172909c728bf76a17d40e7b3e00e64bac9f461ede1590cf04767971705824b",
         intel: "9d4f2d08121743199a4d911bdd70f10955b5f3bf3309509608d7a9cf23581be0"

  url "https://github.com/cybrixcc/fortem-releases/releases/download/v#{version}/fortem_#{version}_macOS_#{arch}.tar.gz"
  name "Fortem"
  desc "Local Kubernetes environment inspector"
  homepage "https://fortem.dev/"

  livecheck do
    skip "Releases are published from a separate private build repository"
  end

  binary "fortem"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "fortem"], chdir: "."
  end

  caveats <<~EOS
    Fortem reads your existing kubeconfig and is read-only unless started
    explicitly with --manage.
  EOS
end
