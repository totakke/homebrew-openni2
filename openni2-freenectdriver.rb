require 'formula'

class Openni2Freenectdriver < Formula
  homepage 'https://github.com/piedar/OpenNI2-FreenectDriver'
  url 'https://github.com/piedar/OpenNI2-FreenectDriver.git', :revision => 'c1458aebf1df501dc6606f3472d52e357de987c1'
  version 'c1458aebf1'
  sha1 'c1458aebf1df501dc6606f3472d52e357de987c1'

  head 'https://github.com/piedar/OpenNI2-FreenectDriver.git'

  depends_on 'openni2'
  depends_on :python
  depends_on 'libfreenect'

  def patches
    DATA
  end

  def install
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

__END__
diff --git a/wscript b/wscript
index 6f5e994..f4a8737 100644
--- a/wscript
+++ b/wscript
@@ -28,7 +28,7 @@ def build(bld):
 		name = APPNAME,
 		vnum = VERSION,
 		install_path = None,
-		includes = ['extern/OpenNI-Linux-x64-2.2/Include', '/usr/include/libfreenect', '/usr/local/include/libfreenect'],
+		includes = ['/usr/local/include/ni2', '/usr/include/libfreenect', '/usr/local/include/libfreenect'],
 		source = bld.path.ant_glob('src/*.cpp'),

 		use = 'freenect',
