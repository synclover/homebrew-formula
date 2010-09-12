require 'formula'

class Scipy <Formula
  url 'http://downloads.sourceforge.net/project/scipy/scipy/0.8.0/scipy-0.8.0.tar.gz'
  homepage ''
  md5 'f0bfc6141b90e6a31555b31486602251'

  def install
    ENV['MACOSX_DEPLOYMENT_TARGET'] = "10.6"
    ENV['CFLAGS'] = "-arch x86_64"
    ENV['FFLAGS'] = "-arch x86_64"
    ENV['LDFLAGS'] = "-Wall -undefined dynamic_lookup -bundle -arch x86_64"
    ENV['PYTHONPATH'] = "/usr/local/Cellar/python/2.7/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages"
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
