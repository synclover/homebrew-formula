require 'formula'

class CustomFreetype <Formula
  url 'http://downloads.sourceforge.net/project/freetype/freetype2/2.4.2/freetype-2.4.2.tar.gz'
  homepage ''
  md5 '5a3920aa1a8a0f3734612e8729df54d8'

  def install
    system "./configure", "--disable-debug",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
