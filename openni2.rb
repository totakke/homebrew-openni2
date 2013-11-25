require 'formula'

class Openni2 < Formula
  homepage 'http://www.openni.org/'
  url 'https://github.com/OpenNI/OpenNI2/archive/2.2-beta2.tar.gz'
  version '2.2.0.33'
  sha1 '8c9a57de7224cd0a0a4c4bb03a7637bd179df34c'

  head 'https://github.com/OpenNI/OpenNI2.git'

  depends_on :python
  depends_on 'libusb' => 'universal'
  depends_on 'doxygen' => :build

  def install
    # Universal build
    ENV.universal_binary

    # stdlib of clang changed since mavericks
    ENV.cxx += ' -stdlib=libstdc++' if ENV.compiler == :clang && MacOS.version >= :mavericks

    # Build
    system 'make', 'all', 'doc'
    mkdir 'out'
    system python, 'Packaging/Harvest.py', 'out', 'x64'

    # Install libs
    cd 'out'
    mkpath "#{lib}/ni2"
    cp_r Dir['Redist/*'], "#{lib}/ni2"

    # Install includes
    mkpath "#{include}/ni2"
    cp_r Dir['Include/*'], "#{include}/ni2"

    # Install tools
    mkpath "#{prefix}/tools"
    cp_r Dir['Tools/*'], "#{prefix}/tools"

    # Install samples
    sample_dir = "#{prefix}/samples"
    mkpath sample_dir
    cp_r Dir['Samples/*'], sample_dir

    # Install docs
    doc.install Dir['Documentation']
  end

  def caveats; <<-EOS.undent
    Add the recommended variables to your dotfiles.
     * On Bash, add them to `~/.bash_profile`.
     * On Zsh, add them to `~/.zprofile` instead.

    export OPENNI2_INCLUDE=#{HOMEBREW_PREFIX}/include/ni2
    export OPENNI2_REDIST=#{HOMEBREW_PREFIX}/lib/ni2
    EOS
  end
end
