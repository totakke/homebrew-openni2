require 'formula'

class Openni2 < Formula
  homepage 'http://www.openni.org/'
  url 'https://github.com/OpenNI/OpenNI2/archive/2.1-Beta.tar.gz'
  version '2.1-Beta'
  sha1 '4059850b433f8557635a900f32e8d6f74299ebd3'

  head 'https://github.com/OpenNI/OpenNI2.git'

  depends_on :python
  depends_on 'libusb'
  depends_on 'doxygen' => :build

  option :universal

  def install
    ENV.universal_binary if build.universal?

    # Build
    system 'make'
    cd 'Redist'
    system python, 'ReleaseVersion.py', 'x64'
    cd Dir.glob('OpenNI-2*-x64')[0]

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
