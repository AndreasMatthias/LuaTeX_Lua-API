---% language=us runpath=texruns:manuals/luametatex
---
---\environment luametatex-style
---
---\startcomponent luametatex-lua
---
---# Using *Lua*METATEX
---
---\startsection[title={Initialization},reference=init]
---
---# A bare bone engine
---
---Although the *Lua*METATEX\ engine will start up when you call the program it will
---not do much useful. You can compare it to computer hardware without (high level)
---operating system with a *TeX* kernel being the bios. It can interpret *TeX* code
---but for typesetting you need a reasonable setup. You also need to load fonts, and
---for output you need a backend, and both can be implemented in *Lua*. If you don't
---like that and want to get up and running immediately, you will be more happy with
---*LuaTeX*, *PDF*TEX\ or \XETEX, combined with your favorite macro package.
---
---If you just want to play around you can install the *ConTeXt* distribution which
---(including manuals and some fonts) is tiny compared to a full *TeX*LIVE\
---installation and can be run alongside it without problems. If there are issues
---you can go to the usual *ConTeXt* support platforms and seek help where you can
---find the people who made *LuaTeX* and *Lua*METATEX.
---
----------------------------------------------------------------


---
---# *Lua*METATEX\ as a *Lua* interpreter
---
---Although *Lua*METATEX\ is primarily meant as a *TeX* engine, it can also serve as
---a stand alone *Lua* interpreter. There are two ways to make *Lua*METATEX\ behave
---like a standalone *Lua* interpreter. The first method uses the command line
---option `--luaonly` followed by a filename. The second is more automatic: if
---the only non-option argument (file) on the commandline has the extension `lmt` or `lua`. The `luc` extension has been dropped because bytecode
---compiled files are not portable and one can always load indirect. The `lmt`
---suffix is more *ConTeXt* specific and makes it possible to have files for
---*LuaTeX* and *Lua*METATEX\ alongside.
---
---In this mode, it will set *Lua*'s `arg[0]` to the found script name, pushing
---preceding options in negative values and the rest of the command line in the
---positive values, just like the *Lua* interpreter does.
---
---*Lua*METATEX\ will exit immediately after executing the specified *Lua* script and
---is, in effect, a somewhat bulky stand alone *Lua* interpreter with a bunch of
---extra preloaded libraries. But we really want to keep the binary small, if
---possible below the 3MB which is okay for a script engine.
---
---When no argument is given, *Lua*METATEX\ will look for a *Lua* file with the same
---name as the binary and run that one when present. This makes it possible to use
---the engine as a stub. For instance, in *ConTeXt* a symlink from `mtxrun` to
---type {luametatex} will run the `mtxrun.lmt` or `mtxrun.lua` script
---when present in the same path as the binary itself. As mentioned before first
---checking for (*ConTeXt*) `lmt` files permits different files for different
---engines in the same path.
---
----------------------------------------------------------------


---
---# Other commandline processing
---
---When the *Lua*METATEX\ executable starts, it looks for the `--lua` command line
---option. If there is no `--lua` option, the command line is interpreted in a
---similar fashion as the other *TeX* engines. All options are accepted but only some
---are understood by *Lua*METATEX\ itself:
---
--- commandline argument     explanation 
---
--- `--credits`         display credits and exit 
--- `--fmt=FORMAT`      load the format file `FORMAT` \NR
--- `--help`            display help and exit \NR
--- `--ini`             be `iniluatex`, for dumping formats \NR
--- `--jobname=STRING`  set the job name to `STRING` 
--- `--lua=FILE`        load and execute a *Lua* initialization script \NR
--- `--version`         display version and exit 
---
---There are less options than with *LuaTeX*, because one has to deal with them in
---*Lua* anyway. So for instance there are no options to enter a safer mode or
---control executing programs because this can easily be achieved with a startup
---*Lua* script.
---
---Next the initialization script is loaded and executed. From within the script,
---the entire command line is available in the *Lua* table `arg`, beginning
---with `arg[0]`, containing the name of the executable. As consequence
---warnings about unrecognized options are suppressed.
---
---Command line processing happens very early on. So early, in fact, that none of
---*TeX*'s initializations have taken place yet. The *Lua* libraries that don't deal
---with *TeX* are initialized rather soon so you have these available.
---
---*Lua*METATEX\ allows some of the command line options to be overridden by reading
---values from the `texconfig` table at the end of script execution (see the
---description of the `texconfig` table later on in this document for more
---details on which ones exactly).
---
---The value to use for `jobname` is decided as follows:
---
---* If `--jobname` is given on the command line, its argument will be the
---    value for `jobname`, without any changes. The argument will not be
---    used for actual input so it need not exist. The `--jobname` switch only
---    controls the `jobname` setting.
---
---* Otherwise, `jobname` will be the name of the first file that is read
---    from the file system, with any path components and the last extension (the
---    part following the last `.`) stripped off.
---
---* There is an exception to the previous point: if the command line goes into
---    interactive mode (by starting with a command) and there are no files input
---    via `everyjob` either, then the `jobname` is set to `texput` as a last resort.
---
---So let's summarize this. The handling of what is called jobname is a bit complex.
---There can be explicit names set on the command line but when not set they can be
---taken from the `texconfig` table.
---
--- startup filename  --lua      a *Lua* file                        
--- startup jobname   --jobname  a *TeX* tex    texconfig.jobname    
--- startup dumpname  --fmt      a format file  texconfig.formatname 
---
---These names are initialized according to `--luaonly` or the first filename
---seen in the list of options. Special treatment of `&` and `*` as well
---as interactive startup is gone but we still enter *TeX* via an forced `\input`
---into the input buffer. \footnote {This might change at some point into an explicit
---loading triggered via *Lua*.}
---
---When we are in *TeX* mode at some point the engine needs a filename, for instance
---for opening a log file. At that moment the set jobname becomes the internal one
---and when it has not been set which internalized to jobname but when not set
---becomes `texput`. When you see a `texput.log` file someplace on your
---system it normally indicates a bad run.
---
---When running on \MSWINDOWS\ the command line, filenames, environment variable
---access etc. internally uses the current code page but to the user is exposed as
---*UTF-8*. Normally users won't notice this.
---
---% fileio_state     .jobname         : a tex string (set when a (log) file is opened)
---% engine_state     .startup_jobname : handles by option parser
---% environment_state.input_name      : temporary interceptor
---
---There is an extra options `--permitloadlib` that needs to be given when you
---load external libraries via *Lua*. Although you could manage this via *Lua* itself
---in a startup script, the reason for having this as option is the wish for
---security (at some point that became a demand for *LuaTeX*), so this might give an
---extra feeling of protection.
---
----------------------------------------------------------------


---
----------------------------------------------------------------


---
---# *Lua* behaviour
---
---# The *Lua* version
---
---We currently use *Lua* 5.4 and will follow developments of the language but
---normally with some delay. Therefore the user needs to keep an eye on (subtle)
---differences in successive versions of the language. Here is an example of one
---aspect.
---
---*Lua* s `tostring` function (and `string.format`) may return values in
---scientific notation, thereby confusing the *TeX* end of things when it is used as
---the right-hand side of an assignment to a `dimen` or `count`. The
---output of these serializers also depend on the *Lua* version, so in *Lua* 5.3 you
---can get different output than from 5.2. It is best not to depend the automatic
---cast from string to number and vise versa as this can change in future versions.
---
----------------------------------------------------------------


---
---# Locales
---
---\index {locales}
---
---In stock *Lua*, many things depend on the current locale. In *Lua*METATEX, we can't
---do that, because it makes documents non-portable. While *Lua*METATEX\ is running
---if forces the following locale settings:
---
---```
---LC_CTYPE=C
---LC_COLLATE=C
---LC_NUMERIC=C
---```
---
---There is no way to change that as it would interfere badly with the often
---language specific conversions needed at the *TeX* end.
---
----------------------------------------------------------------


---
----------------------------------------------------------------


---
---# *Lua* modules
---
---Of course the regular *Lua* modules are present. In addition we provide the `lpeg` library by Roberto Ierusalimschy, This library is not *Unicode*-aware,
---but interprets strings on a byte-per-byte basis. This mainly means that `lpeg.S` cannot be used with *UTF-8* characters that need more than one byte, and
---thus `lpeg.S` will look for one of those two bytes when matching, not the
---combination of the two. The same is true for `lpeg.R`, although the latter
---will display an error message if used with multibyte characters. Therefore `lpeg.R('aä')` results in the message `bad argument #1 to 'R' (range must
---have two characters)`, since to `lpeg`, `ä` is two 'characters'
---(bytes), so `aä` totals three. In practice this is no real issue and with
---some care you can deal with *Unicode* just fine.
---
---There are some more libraries present. These are discussed on a later chapter.
---For instance we embed `luasocket` but contrary to *LuaTeX* don't embed the
---related *Lua* code. The `luafilesystem` module has been replaced by a more
---efficient one that also deals with the \MSWINDOWS\ file and environment
---properties better (*Unicode* support in \MSWINDOWS\ dates from before *UTF-8*
---became dominant so we need to deal with wide *Unicode*16).
---
---There are more extensive math libraries and there are libraries that deal with
---encryption and compression. There are also some optional libraries that we do
---interface but that are loaded on demand. The interfaces are as minimal as can be
---because we so much in *Lua*, which also means that one can tune behaviour to
---usage better.
---
----------------------------------------------------------------


---
---# Files
---
---# File syntax
---
---*Lua*METATEX\ will accept a braced argument as a file name:
---
---```
---\input {plain}
---\openin 0 {plain}
---```
---
---This allows for embedded spaces, without the need for double quotes. Macro
---expansion takes place inside the argument. Keep in mind that as side effect of
---delegating \IO\ to *Lua* the \tex {openin} primitive is not provided by the
---engine and has to be implemented by the macro package. This also means that the
---limit on the number of open files is not enforced by the engine.
---
----------------------------------------------------------------


---
---# Writing to file
---
---Writing to a file in *TeX* has two forms: delayed and immediate. Delayed writing
---means that the to be written text is anchored in the node list and flushed by the
---backend. As all \IO\ is delegated to *Lua*, this also means that it has to deal
---with distinction. In *LuaTeX* the number of open files was already bumped to 127,
---but in *Lua*METATEX\ it depends on the macro package. The special meaning of
---channel 18 was already dropped in *LuaTeX* because we have `os.execute`.
---
----------------------------------------------------------------


---
----------------------------------------------------------------


---
---# Testing
---
---For development reasons you can influence the used startup date and time. By
---setting the `start_time` variable in the `texconfig` table; as with
---other variables we use the internal name there. When Universal Time is needed,
---set the entry `use_utc_time` in the `texconfig` table.
---
---In *ConTeXt* we provide the command line argument `--nodates` that does
---a bit more than disabling dates; it avoids time dependent information in the
---output file for instance.
---
----------------------------------------------------------------


---
---# The internals
---
---This is a reference manual and not a tutorial. This means that we discuss changes
---relative to traditional *TeX* and also present new (or extended) functionality.
---As a consequence we will refer to concepts that we assume to be known or that
---might be explained later. Because the *LuaTeX* and *Lua*METATEX\ engines open up
---*TeX* there's suddenly quite some more to explain, especially about the way a (to
---be) typeset stream moves through the machinery. However, discussing all that in
---detail makes not much sense, because deep knowledge is only relevant for those
---who write code not possible with regular *TeX* and who are already familiar with
---these internals (or willing to spend time on figuring it out).
---
---So, the average user doesn't need to know much about what is in this manual. For
---instance fonts and languages are normally dealt with in the macro package that
---you use. Messing around with node lists is also often not really needed at the
---user level. If you do mess around, you'd better know what you're dealing with.
---Reading \quotation {The *TeX* Book} by Donald Knuth is a good investment of time
---then also because it's good to know where it all started. A more summarizing
---overview is given by \quotation {*TeX* by Topic} by Victor Eijkhout. You might
---want to peek in \quotation {The \ETEX\ manual} too.
---
---But \unknown\ if you're here because of *Lua*, then all you need to know is that
---you can call it from within a run. If you want to learn the language, just read
---the well written *Lua* book. The macro package that you use probably will provide
---a few wrapper mechanisms but the basic `directlua` command that does the job
---is:
---
---```
---\directlua{tex.print("Hi there")}
---```
---
---You can put code between curly braces but if it's a lot you can also put it in a
---file and load that file with the usual *Lua* commands. If you don't know what
---this means, you definitely need to have a look at the *Lua* book first.
---
---If you still decide to read on, then it's good to know what nodes are, so we do a
---quick introduction here. If you input this text:
---
---```
---Hi There ...
---```
---
---eventually we will get a linked lists of nodes, which in \ASCII\ art looks like:
---
---```
---H <=> i <=> [glue] <=> T <=> h <=> e <=> r <=> e ...
---```
---
---When we have a paragraph, we actually get something like this, where a `par` node stores some metadata and is followed by a `hlist` flagged as
---indent box:
---
---```
---[par] <=> [hlist] <=> H <=> i <=> [glue] <=> T <=> h <=> e <=> r <=> e ...
---```
---
---Each character becomes a so called glyph node, a record with properties like the
---current font, the character code and the current language. Spaces become glue
---nodes. There are many node types and nodes can have many properties but that will
---be discussed later. Each node points back to a previous node or next node, given
---that these exist. Sometimes multiple characters are represented by one glyph
---(shape), so one can also get:
---
---```
---[par] <=> [hlist] <=> H <=> i <=> [glue] <=> Th <=> e <=> r <=> e ...
---```
---
---And maybe some characters get positioned relative to each other, so we might
---see:
---
---```
---[par] <=> [hlist] <=> H <=> [kern] <=> i <=> [glue] <=> Th <=> e <=> r <=> e ...
---```
---
---Actually, the above representation is one view, because in *Lua*METATEX\ we can
---choose for this:
---
---```
---[par] <=> [glue] <=> H <=> [kern] <=> i <=> [glue] <=> Th <=> e <=> r <=> e ...
---```
---
---where glue (currently fixed) is used instead of an empty hlist (think of a `\hbox`). Options like this are available because want a certain view on these
---lists from the *Lua* end and the result being predicable is part of that.
---
---It's also good to know beforehand that *TeX* is basically centered around
---creating paragraphs and pages. The par builder takes a list and breaks it into
---lines. At some point horizontal blobs are wrapped into vertical ones. Lines are
---so called boxes and can be separated by glue, penalties and more. The page
---builder accumulates lines and when feasible triggers an output routine that will
---take the list so far. Constructing the actual page is not part of *TeX* but done
---using primitives that permit manipulation of boxes. The result is handled back to
---*TeX* and flushed to a (often *PDF*) file.
---
---```
---\setbox\scratchbox\vbox\bgroup
---    line 1\par line 2
---\egroup
---
---\showbox\scratchbox
---```
---
---The above code produces the next log lines that reveal how the engines sees a
---paragraph (wrapped in a `\vbox`):
---
---```[style=small]
---1:4: > \box257=
---1:4: \vbox[normal][16=1,17=1,47=1], width 483.69687, height 27.58083, depth 0.1416, direction l2r
---1:4: .\list
---1:4: ..\hbox[line][16=1,17=1,47=1], width 483.69687, height 7.59766, depth 0.1416, glue 455.40097fil, direction l2r
---1:4: ...\list
---1:4: ....\glue[left hang][16=1,17=1,47=1] 0.0pt
---1:4: ....\glue[left][16=1,17=1,47=1] 0.0pt
---1:4: ....\glue[parfillleft][16=1,17=1,47=1] 0.0pt
---1:4: ....\par[newgraf][16=1,17=1,47=1], hangafter 1, hsize 483.69687, pretolerance 100, tolerance 3000, adjdemerits 10000, linepenalty 10, doublehyphendemerits 10000, finalhyphendemerits 5000, clubpenalty 2000, widowpenalty 2000, brokenpenalty 100, emergencystretch 12.0, parfillskip 0.0pt plus 1.0fil, hyphenationmode 499519
---1:4: ....\glue[indent][16=1,17=1,47=1] 0.0pt
---1:4: ....\glyph[32768][16=1,17=1,47=1], language (n=1,l=2,r=3), hyphenationmode 499519, options 128 , font <30: DejaVuSerif @ 10.0pt>, glyph U+00006C l
---1:4: ....\glyph[32768][16=1,17=1,47=1], language (n=1,l=2,r=3), hyphenationmode 499519, options 128 , font <30: DejaVuSerif @ 10.0pt>, glyph U+000069 i
---1:4: ....\glyph[32768][16=1,17=1,47=1], language (n=1,l=2,r=3), hyphenationmode 499519, options 128 , font <30: DejaVuSerif @ 10.0pt>, glyph U+00006E n
---1:4: ....\glyph[32768][16=1,17=1,47=1], language (n=1,l=2,r=3), hyphenationmode 499519, options 128 , font <30: DejaVuSerif @ 10.0pt>, glyph U+000065 e
---1:4: ....\glue[space][16=1,17=1,47=1] 3.17871pt plus 1.58936pt minus 1.05957pt, font 30
---1:4: ....\glyph[32768][16=1,17=1,47=1], language (n=1,l=2,r=3), hyphenationmode 499519, options 128 , font <30: DejaVuSerif @ 10.0pt>, glyph U+000031 1
---1:4: ....\penalty[line][16=1,17=1,47=1] 10000
---1:4: ....\glue[parfill][16=1,17=1,47=1] 0.0pt plus 1.0fil
---1:4: ....\glue[right][16=1,17=1,47=1] 0.0pt
---1:4: ....\glue[right hang][16=1,17=1,47=1] 0.0pt
---1:4: ..\glue[par][16=1,17=1,47=1] 5.44995pt plus 1.81665pt minus 1.81665pt
---1:4: ..\glue[baseline][16=1,17=1,47=1] 6.79396pt
---1:4: ..\hbox[line][16=1,17=1,47=1], width 483.69687, height 7.59766, depth 0.1416, glue 455.40097fil, direction l2r
---1:4: ...\list
---1:4: ....\glue[left hang][16=1,17=1,47=1] 0.0pt
---1:4: ....\glue[left][16=1,17=1,47=1] 0.0pt
---1:4: ....\glue[parfillleft][16=1,17=1,47=1] 0.0pt
---1:4: ....\par[newgraf][16=1,17=1,47=1], hangafter 1, hsize 483.69687, pretolerance 100, tolerance 3000, adjdemerits 10000, linepenalty 10, doublehyphendemerits 10000, finalhyphendemerits 5000, clubpenalty 2000, widowpenalty 2000, brokenpenalty 100, emergencystretch 12.0, parfillskip 0.0pt plus 1.0fil, hyphenationmode 499519
---1:4: ....\glue[indent][16=1,17=1,47=1] 0.0pt
---1:4: ....\glyph[32768][16=1,17=1,47=1], language (n=1,l=2,r=3), hyphenationmode 499519, options 128 , font <30: DejaVuSerif @ 10.0pt>, glyph U+00006C l
---1:4: ....\glyph[32768][16=1,17=1,47=1], language (n=1,l=2,r=3), hyphenationmode 499519, options 128 , font <30: DejaVuSerif @ 10.0pt>, glyph U+000069 i
---1:4: ....\glyph[32768][16=1,17=1,47=1], language (n=1,l=2,r=3), hyphenationmode 499519, options 128 , font <30: DejaVuSerif @ 10.0pt>, glyph U+00006E n
---1:4: ....\glyph[32768][16=1,17=1,47=1], language (n=1,l=2,r=3), hyphenationmode 499519, options 128 , font <30: DejaVuSerif @ 10.0pt>, glyph U+000065 e
---1:4: ....\glue[space][16=1,17=1,47=1] 3.17871pt plus 1.58936pt minus 1.05957pt, font 30
---1:4: ....\glyph[32768][16=1,17=1,47=1], language (n=1,l=2,r=3), hyphenationmode 499519, options 128 , font <30: DejaVuSerif @ 10.0pt>, glyph U+000032 2
---1:4: ....\penalty[line][16=1,17=1,47=1] 10000
---1:4: ....\glue[parfill][16=1,17=1,47=1] 0.0pt plus 1.0fil
---1:4: ....\glue[right][16=1,17=1,47=1] 0.0pt
---1:4: ....\glue[right hang][16=1,17=1,47=1] 0.0pt
---```
---
---The *LuaTeX* engine provides hooks for *Lua* code at nearly every reasonable
---point in the process: collecting content, hyphenating, applying font features,
---breaking into lines, etc. This means that you can overload *TeX*'s natural
---behaviour, which still is the benchmark. When we refer to “callbacks” we
---means these hooks. The *TeX* engine itself is pretty well optimized but when you
---kick in much *Lua* code, you will notices that performance drops. Don't blame and
---bother the authors with performance issues. In *ConTeXt* over 50\% of the time
---can be spent in *Lua*, but so far we didn't get many complaints about efficiency.
---Adding more callbacks makes no sense, also because at some point the performance
---hit gets too large. There are plenty of ways to achieve goals. For that reason:
---take remarks about *LuaTeX*, features, potential, performance etc. with a natural
---grain of salt.
---
---Where plain *TeX* is basically a basic framework for writing a specific style,
---macro packages like *ConTeXt* and \LATEX\ provide the user a whole lot of
---additional tools to make documents look good. They hide the dirty details of font
---management, language support, turning structure into typeset results, wrapping
---pages, including images, and so on. You should be aware of the fact that when you
---hook in your own code to manipulate lists, this can interfere with the macro
---package that you use. Each successive step expects a certain result and if you
---mess around to much, the engine eventually might bark and quit. It can even
---crash, because testing everywhere for what users can do wrong is no real option.
---
---When you read about nodes in the following chapters it's good to keep in mind
---what commands relate to them. Here are a few:
---
--- command               node           explanation 
---
--- `hbox`           `hlist`  horizontal box 
--- `vbox`           `vlist`  vertical box with the baseline at the bottom 
--- `vtop`           `vlist`  vertical box with the baseline at the top 
--- `hskip`          `glue`   horizontal skip with optional stretch and shrink 
--- `vskip`          `glue`   vertical skip with optional stretch and shrink 
--- `kern`           `kern`   horizontal or vertical fixed skip 
--- `discretionary`  `disc`   hyphenation point (pre, post, replace) 
--- `char`           `glyph`  a character 
--- `hrule`          `rule`   a horizontal rule 
--- `vrule`          `rule`   a vertical rule 
--- `textdirection`  `dir`    a change in text direction 
---
---Whatever we feed into *TeX* at some point becomes a token which is either
---interpreted directly or stored in a linked list. A token is just a number that
---encodes a specific command (operator) and some value (operand) that further
---specifies what that command is supposed to do. In addition to an interface to
---nodes, there is an interface to tokens, as later chapters will demonstrate.
---
---Text (interspersed with macros) comes from an input medium. This can be a file,
---token list, macro body cq.\ arguments, some internal quantity (like a number),
---*Lua*, etc. Macros get expanded. In the process *TeX* can enter a group. Inside
---the group, changes to registers get saved on a stack, and restored after leaving
---the group. When conditionals are encountered, another kind of nesting happens,
---and again there is a stack involved. Tokens, expansion, stacks, input levels are
---all terms used in the next chapters. Don't worry, they loose their magic once you
---use *TeX* a lot. You have access to most of the internals and when not, at least
---it is possible to query some state we're in or level we're at.
---
---When we talk about pack(ag)ing it can mean two things. When *TeX* has consumed
---some tokens that represent text they are added to the current list. When the text
---is put into a so called `hbox` (for instance a line in a paragraph) it
---(normally) first gets hyphenated, next ligatures are build, and finally kerns are
---added. Each of these stages can be overloaded using *Lua* code. When these three
---stages are finished, the dimension of the content is calculated and the box gets
---its width, height and depth. What happens with the box depends on what macros do
---with it.
---
---The other thing that can happen is that the text starts a new paragraph. In that
---case some information is stored in a leading `par` node. Then indentation
---is appended and the paragraph ends with some glue. Again the three stages are
---applied but this time afterwards, the long line is broken into lines and the
---result is either added to the content of a box or to the main vertical list (the
---running text so to say). This is called par building. At some point *TeX* decides
---that enough is enough and it will trigger the page builder. So, building is
---another concept we will encounter. Another example of a builder is the one that
---turns an intermediate math list into something typeset.
---
---Wrapping something in a box is called packing. Adding something to a list is
---described in terms of contributing. The more complicated processes are wrapped
---into builders. For now this should be enough to enable you to understand the next
---chapters. The text is not as enlightening and entertaining as Don Knuths books,
---sorry.
---
----------------------------------------------------------------


---
---\stopchapter
---
---\stopcomponent
---