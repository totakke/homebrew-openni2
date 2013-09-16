require 'formula'

class Openni2 < Formula
  homepage 'http://www.openni.org/'
  url 'https://github.com/OpenNI/OpenNI2.git', :revision => '5b88c95e4f8d19b95713e3c873c7d07e48e5605b'
  version '2.2.0.30'
  sha1 '5b88c95e4f8d19b95713e3c873c7d07e48e5605b'

  head 'https://github.com/OpenNI/OpenNI2.git'

  depends_on :python
  depends_on 'libusb'
  depends_on 'doxygen' => :build

  def install
    # Universal build
    ENV.universal_binary

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
