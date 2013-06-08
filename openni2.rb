#
#   homebrew-openni2
#   https://github.com/totakke/homebrew-openni2
#   Copyright (C) 2013, Toshiki TAKEUCHI.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

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
    lib.install Dir['Redist/*']

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
