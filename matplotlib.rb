require 'formula'

class Matplotlib <Formula
  url 'http://downloads.sourceforge.net/project/matplotlib/matplotlib/matplotlib-1.0/matplotlib-1.0.0.tar.gz'
  homepage ''
  md5 '7d964de548c9887917762a11e0ffecd3'

  def install
    ENV['PKG_CONFIG_PATH'] = "/usr/local/lib/pkgconfig"
    ENV['MACOSX_DEPLOYMENT_TARGET'] = "10.6"
    ENV['OSX_SDK_VER'] = "10.6"
    ENV['CFLAGS'] = "-arch x86_64 -I/usr/local/include -isysroot /Developer/SDKs/MacOSX" + ENV['MACOSX_DEPLOYMENT_TARGET'] + ".sdk"
    ENV['LDFLAGS'] = "-arch x86_64 -syslibroot,/Developer/SDKs/MacOSX" + ENV['MACOSX_DEPLOYMENT_TARGET'] + ".sdk"
    ENV['FFLAGS'] = "-arch x86_64"
    ENV['PYTHONPATH'] = "/usr/local/lib/python2.7/site-packages/"
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
