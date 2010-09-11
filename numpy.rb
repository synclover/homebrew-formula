require 'formula'

class Numpy <Formula
  url 'http://downloads.sourceforge.net/project/numpy/NumPy/1.5.0/numpy-1.5.0.tar.gz'
  homepage ''
  md5 '3a8bfdc434df782d647161c48943ee09'

  def install
    ENV['MACOSX_DEPLOYMENT_TARGET'] = "10.6"
    ENV['CFLAGS'] = "-arch x86_64"
    ENV['FFLAGS'] = "-arch x86_64"
    ENV['LDFLAGS'] = "-Wall -undefined dynamic_lookup -bundle -arch x86_64"
    ENV['PYTHONPATH'] = "/usr/local/lib/python2.7/site-packages/"
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
