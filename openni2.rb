require 'formula'

class Openni2 < Formula
  homepage 'http://www.openni.org/'
  url 'https://github.com/OpenNI/OpenNI2.git', :branch => 'master', :revision => 'b9527e91e51fb2333ccfdbcc4a2d3b5f213c2c08'
  version '2.2-Beta'
  sha1 'b9527e91e51fb2333ccfdbcc4a2d3b5f213c2c08'

  head 'https://github.com/OpenNI/OpenNI2.git'

  depends_on :python
  depends_on 'libusb'
  depends_on 'doxygen' => :build

  option :universal

  def install
    ENV.universal_binary if build.universal?

    # Build
    system 'make'
    cd 'Packaging'
    system python, 'ReleaseVersion.py', 'x64'
    cd Dir.glob('OpenNI-*')[0]

    # Install libs
    mkpath "#{lib}/ni2"
    cp_r Dir['Redist/*'], "#{lib}/ni2"

    # Install includes
    mkpath "#{include}/ni2"
    cp_r Dir['Include/*'], "#{include}/ni2"

    # Install tools
    mkpath "#{prefix}/tools"
    cp_r Dir['Tools/*'], "#{prefix}/tools"

    # Install samples
    sample_dir = "#{prefix}/sample"
    mkpath sample_dir
    cp_r Dir['Samples/*'], sample_dir

    # Install docs
    doc.install Dir['Documentation']
  end

  def caveats; <<-EOS.undent
    OPENNI2_INCLUDE=#{HOMEBREW_PREFIX}/include/ni2
    OPENNI2_REDIST=#{HOMEBREW_PREFIX}/lib/ni2
    EOS
  end
end
