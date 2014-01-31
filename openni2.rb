require 'formula'

class Openni2 < Formula
  homepage 'http://www.openni.org/'
  url 'https://github.com/OpenNI/OpenNI2/archive/2.2-beta2.tar.gz'
  version '2.2.0.33'
  sha1 '8c9a57de7224cd0a0a4c4bb03a7637bd179df34c'
  head 'https://github.com/OpenNI/OpenNI2.git'

  option :universal

  depends_on :python
  depends_on 'libusb' => (build.universal?) ? ['universal'] : []
  depends_on 'doxygen' => :build

  def install
    ENV.universal_binary if build.universal?

    # stdlib of clang changed since mavericks
    ENV.cxx += ' -stdlib=libstdc++' if ENV.compiler == :clang && MacOS.version >= :mavericks

    system 'make', 'all', 'doc'
    mkdir 'out'
    system 'python', 'Packaging/Harvest.py', 'out', 'x64'

    cd 'out'

    (lib+'ni2').install Dir['Redist/*']
    (include+'ni2').install Dir['Include/*']
    (share+'openni2/tools').install Dir['Tools/*']
    (share+'openni2/samples').install Dir['Samples/*']
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
