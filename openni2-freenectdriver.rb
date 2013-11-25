require 'formula'

class Openni2Freenectdriver < Formula
  homepage 'https://github.com/piedar/OpenNI2-FreenectDriver'
  url 'https://github.com/piedar/OpenNI2-FreenectDriver.git', :revision => 'd18720c8c9ef14b3a1603ccf4416c266c36c4ed1'
  version '1.2.1'
  sha1 'd18720c8c9ef14b3a1603ccf4416c266c36c4ed1'

  head 'https://github.com/piedar/OpenNI2-FreenectDriver.git'

  depends_on 'openni2'
  depends_on :python
  depends_on 'libfreenect'

  def install
    inreplace 'wscript', 'extern/OpenNI-Linux-x64-2.2.0.33/Include', "#{HOMEBREW_PREFIX}/include/ni2"
    inreplace 'wscript', '/usr/local/include/libfreenect', "#{HOMEBREW_PREFIX}/include/libfreenect"

    system python, 'waf', 'configure', 'build'

    driver = 'libFreenectDriver.dylib'
    prefix.install 'build/' + driver

    src = "#{prefix}/" + driver
    openni2_cellar = Dir.glob("#{HOMEBREW_PREFIX}/Cellar/openni2/*")[0]
    ln_s src, openni2_cellar + '/lib/ni2/OpenNI2/Drivers/' + driver, :force => true
    ln_s src, openni2_cellar + '/tools/OpenNI2/Drivers/' + driver, :force => true
    ln_s src, openni2_cellar + '/samples/Bin/OpenNI2/Drivers/' + driver, :force => true
  end
end
