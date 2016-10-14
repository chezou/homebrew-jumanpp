class Jumanpp < Formula
  desc "Japanese Morphological Analyzer based on RNNLM"
  homepage "http://nlp.ist.i.kyoto-u.ac.jp/EN/index.php?JUMAN%2B%2B"
  url "http://lotus.kuee.kyoto-u.ac.jp/nl-resource/jumanpp/jumanpp-1.01.tar.xz"
  sha256 "0d587416a3eb7123638f9c1e30a649b72dfb483448839168dcb48be572c5919a"

  depends_on "boost"
  depends_on "boost-build"
  depends_on "gperftools"

  patch do
    url "https://gist.githubusercontent.com/chezou/076cb9c407de729ad2e2d04749f07f3e/raw/8115a2dfca48e9f9f5aee12cea39377238c5110f/jumanpp-Makefilein.patch"
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    ENV["LANG"] = "C.UTF-8" # prevent "invalid byte sequence in UTF-8" on sierra build
    system bin/"jumanpp", "--version"
    IO.popen(bin/"jumanpp", "w") { |io| io.puts "こんにちは" }
  end
end
