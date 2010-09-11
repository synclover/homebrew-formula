require 'formula'

class CustomZsh <Formula
  url 'http://downloads.sourceforge.net/project/zsh/zsh-dev/4.3.10/zsh-4.3.10.tar.gz'
  homepage 'http://www.zsh.org/'
  md5 '031efc8c8efb9778ffa8afbcd75f0152'

  depends_on 'gdbm' => :optional

  skip_clean :all
  
  # def patches
  #   DATA
  # end

  def install
    system "./configure", "--disable-debug",
                          "--prefix=#{prefix}",
                          "--disable-dependency-tracking",
                          # don't version stuff in Homebrew, we already do that!
                          "--enable-fndir=#{share}/zsh/functions",
                          "--enable-scriptdir=#{share}/zsh/scripts",
                          "--enable-pcre",
                          "--enable-multibyte",
                          "--enable-locale"

    # Again, don't version installation directories
    inreplace ["Makefile", "Src/Makefile"],
      "$(libdir)/$(tzsh)/$(VERSION)", "$(libdir)"

    system "make install"
  end
end

# __END__
# --- a/Src/zsh.h
# +++ b/Src/zsh.h
# @@ -2491,7 +2491,7 @@
#  #define MB_METASTRLEN2(str, widthp)	mb_metastrlen(str, widthp)
 
#  #ifdef BROKEN_WCWIDTH
# -#define WCWIDTH(wc)	mk_wcwidth(wc)
# +#define WCWIDTH(wc)	mk_wcwidth_cjk(wc)
#  #else
#  #define WCWIDTH(wc)	wcwidth(wc)
#  #endif
# --- a/Src/compat.c
# +++ b/Src/compat.c
# @@ -805,7 +805,7 @@
 
#    return width;
#  }
# -
# +#endif
 
#  /*
#   * The following functions are the same as mk_wcwidth() and
# @@ -883,7 +883,7 @@
#    return mk_wcwidth(ucs);
#  }
 
# -
# +#if 0
#  int mk_wcswidth_cjk(const wchar_t *pwcs, size_t n)
#  {
#    int w, width = 0;
