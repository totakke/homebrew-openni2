require 'formula'

class Openni2Freenectdriver < Formula
  homepage 'https://github.com/piedar/OpenNI2-FreenectDriver'
  url 'https://github.com/piedar/OpenNI2-FreenectDriver.git', :revision => 'ef9fd1693d40eaebd06a6237c161fae0858cdd91'
  version 'ef9fd1693d'
  sha1 'ef9fd1693d40eaebd06a6237c161fae0858cdd91'

  head 'https://github.com/piedar/OpenNI2-FreenectDriver.git'

  depends_on 'openni2'
  depends_on :python
  depends_on 'libfreenect'

  def install
    system python, 'waf', 'configure', 'build'

    driver = 'libFreenectDriver.dylib'
    prefix.install 'build/' + driver

    src = "#{prefix}/" + driver
    openni2_cellar = Dir.glob("#{HOMEBREW_PREFIX}/Cellar/openni2/*")[0]
    ln_s src, openni2_cellar + '/lib/ni2/OpenNI2/Drivers/' + driver, :force => true
    ln_s src, openni2_cellar + '/tools/OpenNI2/Drivers/' + driver, :force => true
    ln_s src, openni2_cellar + '/sample/Bin/OpenNI2/Drivers/' + driver, :force => true
  end
end
