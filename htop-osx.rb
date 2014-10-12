require 'formula'

class HtopOsx < Formula
  homepage 'https://github.com/max-horvath/htop-osx'
  url 'https://github.com/max-horvath/htop-osx/archive/0.8.2.2.tar.gz'
  sha1 '17c56fe5efe81cf6b0f4c13a958fa7e4d8591b23'

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  patch :p1, <<-EOS.undent
    --- a/CRT.h
    +++ b/CRT.h
    @@ -20,6 +20,7 @@ in the source distribution for its full text.
     #define COLORSCHEME_BLACKONWHITE2 3
     #define COLORSCHEME_MIDNIGHT 4
     #define COLORSCHEME_BLACKNIGHT 5
    +#define COLORSCHEME_SOLARIZED 6
     
     #define Black COLOR_BLACK
     #define Red COLOR_RED
    --- a/ColorsPanel.c
    +++ b/ColorsPanel.c
    @@ -41,6 +41,7 @@ static const char* ColorSchemes[] = {
        "Light Terminal",
        "MC",
        "Black Night",
    +   "Solarized",
        NULL
     };
     
    EOS
  patch :p1, <<-EOS.undent
    --- a/Settings.c
    +++ b/Settings.c
    @@ -131,7 +131,7 @@ static bool Settings_read(Settings* this, char* fileName, int cpuCount) {
           } else if (String_eq(option[0], "color_scheme")) {
              this->colorScheme = atoi(option[1]);
              if (this->colorScheme < 0) this->colorScheme = 0;
    -         if (this->colorScheme > 5) this->colorScheme = 5;
    +         if (this->colorScheme > 6) this->colorScheme = 6;
           } else if (String_eq(option[0], "left_meters")) {
              Settings_readMeters(this, option[1], LEFT_HEADER);
              readMeters = true;
    EOS
  patch :p1, <<-EOS.undent
    --- a/CRT.c
    +++ b/CRT.c
    @@ -25,6 +25,7 @@
     #define COLORSCHEME_BLACKONWHITE2 3
     #define COLORSCHEME_MIDNIGHT 4
     #define COLORSCHEME_BLACKNIGHT 5
    +#define COLORSCHEME_SOLARIZED 6
     
     #define Black COLOR_BLACK
     #define Red COLOR_RED
    @@ -483,6 +484,66 @@
           CRT_colors[FAN_RPM_WARM] = ColorPair(Black,Yellow);
           CRT_colors[FAN_RPM_NORMAL] = ColorPair(Black,Green);
           CRT_colors[HOSTNAME] = ColorPair(White,Blue);
    +   } else if (CRT_colorScheme == COLORSCHEME_SOLARIZED) {
    +      CRT_colors[RESET_COLOR] = ColorPair(Cyan,Black);
    +      CRT_colors[DEFAULT_COLOR] = ColorPair(Cyan,Black);
    +      CRT_colors[FUNCTION_BAR] = ColorPair(Black,Green);
    +      CRT_colors[FUNCTION_KEY] = ColorPair(Cyan,Black);
    +      CRT_colors[PANEL_HEADER_FOCUS] = ColorPair(Black,Green);
    +      CRT_colors[PANEL_HEADER_UNFOCUS] = ColorPair(Black,Green);
    +      CRT_colors[PANEL_HIGHLIGHT_FOCUS] = ColorPair(Black,Cyan);
    +      CRT_colors[PANEL_HIGHLIGHT_UNFOCUS] = ColorPair(Black,White);
    +      CRT_colors[FAILED_SEARCH] = ColorPair(Red,Cyan);
    +      CRT_colors[UPTIME] = ColorPair(Green,Black);
    +      CRT_colors[BATTERY] = ColorPair(Green,Black);
    +      CRT_colors[LARGE_NUMBER] = A_BOLD | ColorPair(Red,Black);
    +      CRT_colors[METER_TEXT] = ColorPair(Cyan,Black);
    +      CRT_colors[METER_VALUE] = ColorPair(Green,Black);
    +      CRT_colors[LED_COLOR] = ColorPair(Green,Black);
    +      CRT_colors[TASKS_RUNNING] = A_BOLD | ColorPair(Green,Black);
    +      CRT_colors[PROCESS] = ColorPair(Cyan,Black);
    +      CRT_colors[PROCESS_SHADOW] = A_BOLD | ColorPair(Green,Black);
    +      CRT_colors[PROCESS_TAG] = A_BOLD | ColorPair(Yellow,Black);
    +      CRT_colors[PROCESS_MEGABYTES] = A_BOLD | ColorPair(Green,Black);
    +      CRT_colors[PROCESS_BASENAME] = A_BOLD | ColorPair(Green,Black);
    +      CRT_colors[PROCESS_TREE] = ColorPair(Cyan,Black);
    +      CRT_colors[PROCESS_THREAD] = ColorPair(Green,Black);
    +      CRT_colors[PROCESS_THREAD_BASENAME] = A_BOLD | ColorPair(Blue,Black);
    +      CRT_colors[PROCESS_R_STATE] = ColorPair(Green,Black);
    +      CRT_colors[PROCESS_HIGH_PRIORITY] = ColorPair(Red,Black);
    +      CRT_colors[PROCESS_LOW_PRIORITY] = ColorPair(Red,Black);
    +      CRT_colors[BAR_BORDER] = A_BOLD | ColorPair(Green,Black);
    +      CRT_colors[BAR_SHADOW] = ColorPair(Green,Black);
    +      CRT_colors[SWAP] = ColorPair(Red,Black);
    +      CRT_colors[GRAPH_1] = A_BOLD | ColorPair(Red,Black);
    +      CRT_colors[GRAPH_2] = ColorPair(Red,Black);
    +      CRT_colors[GRAPH_3] = A_BOLD | ColorPair(Yellow,Black);
    +      CRT_colors[GRAPH_4] = A_BOLD | ColorPair(Green,Black);
    +      CRT_colors[GRAPH_5] = ColorPair(Green,Black);
    +      CRT_colors[GRAPH_6] = ColorPair(Cyan,Black);
    +      CRT_colors[GRAPH_7] = A_BOLD | ColorPair(Blue,Black);
    +      CRT_colors[GRAPH_8] = ColorPair(Blue,Black);
    +      CRT_colors[GRAPH_9] = A_BOLD | ColorPair(Green,Black);
    +      CRT_colors[MEMORY_USED] = ColorPair(Green,Black);
    +      CRT_colors[MEMORY_BUFFERS] = ColorPair(Blue,Black);
    +      CRT_colors[MEMORY_CACHE] = ColorPair(Yellow,Black);
    +      CRT_colors[LOAD_AVERAGE_FIFTEEN] = ColorPair(Green,Black);
    +      CRT_colors[LOAD_AVERAGE_FIVE] = ColorPair(Green,Black);
    +      CRT_colors[LOAD_AVERAGE_ONE] = A_BOLD | ColorPair(Green,Black);
    +      CRT_colors[LOAD] = A_BOLD;
    +      CRT_colors[HELP_BOLD] = A_BOLD | ColorPair(Cyan,Black);
    +      CRT_colors[CLOCK] = ColorPair(Green,Black);
    +      CRT_colors[CHECK_BOX] = ColorPair(Green,Black);
    +      CRT_colors[CHECK_MARK] = A_BOLD | ColorPair(Green,Black);
    +      CRT_colors[CHECK_TEXT] = ColorPair(Cyan,Black);
    +      CRT_colors[HOSTNAME] = ColorPair(Green,Black);
    +      CRT_colors[CPU_NICE] = ColorPair(Blue,Black);
    +      CRT_colors[CPU_NORMAL] = ColorPair(Green,Black);
    +      CRT_colors[CPU_KERNEL] = ColorPair(Red,Black);
    +      CRT_colors[CPU_IOWAIT] = ColorPair(Green,Black);
    +      CRT_colors[CPU_IRQ] = A_BOLD | ColorPair(Blue,Black);
    +      CRT_colors[CPU_SOFTIRQ] = ColorPair(Blue,Black);
    +      CRT_colors[CPU_TEMP] = ColorPair(Cyan,Black);
        } else if (CRT_colorScheme == COLORSCHEME_BLACKNIGHT) {
           CRT_colors[RESET_COLOR] = ColorPair(Cyan,Black);
           CRT_colors[DEFAULT_COLOR] = ColorPair(Cyan,Black);
    EOS

  def install
    # Otherwise htop will segfault when resizing the terminal
    ENV.no_optimization if ENV.compiler == :clang

    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install", "DEFAULT_INCLUDES='-iquote .'"
  end

  def caveats; <<-EOS.undent
    htop-osx requires root privileges to correctly display all running processes.
    You can either run the program via `sudo` or set the setuid bit:

      sudo chown root:wheel #{bin}/htop
      sudo chmod u+s #{bin}/htop

    You should be certain that you trust any software you grant root privileges.
    EOS
  end
end
