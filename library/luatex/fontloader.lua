---A helper table to better navigate through the documentation using the
---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n
_N = {}

---
---@meta
---
---The fontloader library is sort of independent of the rest in the sense that it
---can load font into a *Lua* table that then can be converted into a table suitable
---for *TeX*. The library is an adapted subset of *FontForge* and as such gives a
---similar view on a font (which has advantages when you want to debug).
fontloader = {}

_N._12_the_fontloader = 0

_N._12_1_getting_quick_information_on_a_font = 239

---
---@class FontInfo
---@field fontname string # the *PostScript* name of the font
---@field fullname string # the formal name of the font
---@field familyname string # the family name this font belongs to
---@field weight string # a string indicating the color value of the font
---@field version string # the internal font version
---@field italicangle number # the slant angle
---@field units_per_em number # 1000 for *PostScript*-based fonts, usually 2048 for *TrueType*NC \NR
---@field pfminfo table # see fontloaderpfminfotable

---
---This function returns either `nil`, or a `table`, or an array of
---small tables (in the case of a *TrueType* collection). The returned table(s) will
---contain some fairly interesting information items from the font(s) defined by the
---file.
---
---Getting information through this function is (sometimes much) more efficient than
---loading the font properly, and is therefore handy when you want to create a
---dictionary of available fonts based on a directory contents.
---
---@param filename string
---
---@return FontInfo
function fontloader.info(filename) end

_N._12_2_loading_an_opentype_or_truetype_file = 0

---
---Open an *OpenType* font.
---
---If you want to use an *OpenType* font, you have to get the metric information
---from somewhere. Using the `fontloader` library, the simplest way to get
---that information is thus:
---
---```lua
---function load_font (filename)
---  local metrics = nil
---  local font = fontloader.open(filename)
---  if font then
---     metrics = fontloader.to_table(font)
---     fontloader.close(font)
---  end
---  return metrics
---end
---
---myfont = load_font('/opt/tex/texmf/fonts/data/arial.ttf')
---```
---
---@param filename string
---@param fontname? string
---
---@return userdata font # The first return value is a userdata representation of the font.
---@return table warnings # The second return value is a table containing any warnings and errors reported by fontloader while opening the font. In normal typesetting, you would probably ignore the second argument, but it can be useful for debugging purposes.
function fontloader.open(filename, fontname) end

---
---@param font userdata
---
---@return FontloaderField f
function fontloader.to_table(font) end

---
---@param font userdata
function fontloader.close(font) end

_N._12_3_applying_a_feature_file = 241

---
---@param font userdata
---@param filename string
---
---@return table errors
function fontloader.apply_featurefile(font, filename) end

_N._12_4_applying_an_afm_file = 241

---
---@param font userdata
---@param filename string
---
---@return table errors
function fontloader.apply_afmfile(font, filename) end

_N._12_5_fontloader_font_tables = 241

---
---@param font userdata
---
---@return table FontloaderField
function fontloader.fields(font) end

---
---@param font_glyph userdata
---
---@return table fields
function fontloader.fields(font_glyph) end

_N._12_6_Table_types = 0

_N._main_table = "FontloaderField"

---
---@class FontloaderField
---@field table_version number # indicates the metrics version (currently 0.3)
---@field fontname string # *PostScript* font name
---@field fullname string # official (human-oriented) font name
---@field familyname string # family name
---@field weight string # weight indicator
---@field copyright string # copyright information
---@field filename string # the file name
---@field version string # font version
---@field italicangle number # slant angle
---@field units_per_em integer # 1000 for *PostScript*-based fonts, usually 2048 for *TrueType*
---@field ascent integer # height of ascender in `units_per_em`
---@field descent integer # depth of descender in `units_per_em`
---@field upos number #
---@field uwidth number #
---@field uniqueid integer #
---@field glyphs FontloaderGlyph[] # The `glyphs` is an array containing the per-character information (quite a few of these are only present if non-zero).
---@field glyphcnt integer # number of included glyphs
---@field glyphmax integer # maximum used index the glyphs array
---@field glyphmin integer # minimum used index the glyphs array
---@field notdef_loc integer # location of the `.notdef` glyph or `-1` when not present
---@field hasvmetrics integer #
---@field onlybitmaps integer #
---@field serifcheck integer #
---@field isserif integer #
---@field issans integer #
---@field encodingchanged integer #
---@field strokedfont integer #
---@field use_typo_metrics integer #
---@field weight_width_slope_only integer #
---@field head_optimized_for_cleartype integer #
---@field uni_interp `unset`|`none`|`adobe`|`greek`|`japanese`|`trad_chinese`|`simp_chinese`|`korean`|`ams`
---@field origname string # the file name, as supplied by the user
---@field map FontloaderMap #
---@field public private number #
---@field xuid string #
---@field pfminfo FontloaderPfminfo #
---@field names FontloaderNames #
---@field cidinfo FontloaderCidinfo #
---@field subfonts table
---@field commments string #
---@field fontlog string #
---@field cvt_names string #
---@field anchor_classes table #
---@field ttf_tables FontloaderTtfTables #
---@field ttf_tab_saved FontloaderTtfTables #
---@field kerns table #
---@field vkerns table #
---@field texdata table #
---@field lookups table #
---@field gpos FontloaderGpos #
---@field gsub FontloaderGsub #
---@field mm FontloaderMm #
---@field chosenname string #
---@field macstyle integer #
---@field fondname string #
---@field design_size number
---@field fontstyle_id integer #
---@field fontstyle_name table #
---@field design_range_bottom number
---@field design_range_top number
---@field strokewidth number #
---@field mark_classes table #
---@field creationtime integer #
---@field modificationtime integer #
---@field os2_version integer #
---@field math table #
---@field validation_state table #
---@field horiz_base table #
---@field vert_base table #
---@field extrema_bound integer #
---@field truetype integer # signals a *TrueType* font

_N._12_6_2_glyphs = 244

_N._glyphs = "Glyph"

---
---@class FontloaderGlyph
---@field name string # the glyph name
---@field unicode number # unicode code point, or -1
---@field boundingbox integer[] array of four numbers, see note below
---@field width number # only for horizontal fonts
---@field vwidth number # only for vertical fonts
---@field tsidebearing number # only for vertical ttf/otf fonts, and only if non-zero
---@field lsidebearing number # only if non-zero and not equal to boundingbox[1]
---@field class string # one of "none", "base", "ligature", "mark", "component" (if not present, the glyph class is “automatic”)
---@field kerns table only for horizontal fonts, if set
---@field vkerns table only for vertical fonts, if set
---@field dependents string[] linear array of glyph name strings, only if nonempty
---@field lookups table # only if nonempty
---@field ligatures table # only if nonempty
---@field anchors table # only if set
---@field comment string # only if set
---@field tex_height number # only if set
---@field tex_depth number # only if set
---@field italic_correction number # only if set
---@field top_accent number # only if set
---@field is_extended_shape number # only if this character is part of a math extension list
---@field altuni table # alternate *Unicode* items
---@field vert_variants table #
---@field horiz_variants table #
---@field mathkern table #

_N._12_6_3_map = 247

---
---The top-level map is a list of encoding mappings. Each of those is a table
---itself.
---
---* Corresponding C source code: [luafflib.c#L1346-L1404](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1346-L1404)
---
---@class FontloaderMap
---@field enccount integer # for example `65537`
---@field encmax integer # for example `65537`
---@field backmax integer # for example `855`
---@field remap FontloaderRemap #
---@field map table<integer, integer> # non-linear array of mappings, for example `{ [32] = 1, [33] = 2, [34] = 3 }`
---@field backmap integer[] # non-linear array of backward mappings, for example `{ 32, 33, 34, 35, 36, 37, 38, 8217 }`
---@field enc FontloaderEnc #
---

---
---* Corresponding C source code: [luafflib.c#L1353-L1359](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1353-L1359)
---
---@class FontloaderRemap
---@field firstenc integer #
---@field lastenc integer #
---@field infont integer #

---
---* Corresponding C source code: [luafflib.c#L1284-L1336](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1284-L1336)
---
---@class FontloaderEnc
---@field enc_name string #
---@field char_cnt integer #
---@field char_max integer #
---@field unicode integer[] array of *Unicode* position numbers
---@field psnames string[] array of *PostScript* glyph names
---@field builtin integer #
---@field hidden integer #
---@field only_1byte integer #
---@field has_1byte integer #
---@field has_2byte integer #
---@field is_unicodebmp integer # only if non-zero
---@field is_unicodefull integer # only if non-zero
---@field is_custom integer # only if non-zero
---@field is_original integer # only if non-zero
---@field is_compact integer # only if non-zero
---@field is_japanese integer # only if non-zero
---@field is_korean integer # only if non-zero
---@field is_tradchinese integer # only if non-zero [name?]
---@field is_simplechinese integer # only if non-zero
---@field low_page integer #
---@field high_page integer #
---@field iconv_name string #
---@field iso_2022_escape string #

_N._12_6_4_private = 248

---
---# `private`
---
---This is the font's private *PostScript* dictionary, if any. Keys and values are
---both strings.
---

_N._12_6_5_cidinfo = 248

---
---@class FontloaderCidinfo
---@field registry string #
---@field ordering string #
---@field supplement number #
---@field version number #

_N._12_6_6_pfminfo = 248

---
---The `pfminfo` table contains most of the OS/2 information:
---
---@class FontloaderPfminfo
---@field pfmset number #
---@field winascent_add number #
---@field windescent_add number #
---@field hheadascent_add number #
---@field hheaddescent_add number #
---@field typoascent_add number #
---@field typodescent_add number #
---@field subsuper_set number #
---@field panose_set number #
---@field hheadset number #
---@field vheadset number #
---@field pfmfamily number #
---@field weight number #
---@field width number #
---@field avgwidth number #
---@field firstchar number #
---@field lastchar number #
---@field fstype number #
---@field linegap number #
---@field vlinegap number #
---@field hhead_ascent number #
---@field hhead_descent number #
---@field os2_typoascent number #
---@field os2_typodescent number #
---@field os2_typolinegap number #
---@field os2_winascent number #
---@field os2_windescent number #
---@field os2_subxsize number #
---@field os2_subysize number #
---@field os2_subxoff number #
---@field os2_subyoff number #
---@field os2_supxsize number #
---@field os2_supysize number #
---@field os2_supxoff number #
---@field os2_supyoff number #
---@field os2_strikeysize number #
---@field os2_strikeypos number #
---@field os2_family_class number #
---@field os2_xheight number #
---@field os2_capheight number #
---@field os2_defaultchar number #
---@field os2_breakchar number #
---@field os2_vendor string #
---@field codepages table # A two-number array of encoded code pages
---@field unicoderages table # A four-number array of encoded unicode ranges
---@field panose table #

---
---@class FontloaderPanose
---@field familytype string # Values as in the *OpenType* font specification: `Any`, `No Fit`, `Text and Display`, `Script`, `Decorative`, `Pictorial`
---@field serifstyle string # See the *OpenType* font specification for values
---@field weight string # idem
---@field proportion string # idem
---@field contrast string # idem
---@field strokevariation string # idem
---@field armstyle string # idem
---@field letterform string # idem
---@field midline string # idem
---@field xheight string # idem
---

_N._12_6_7_names = 249

---
---@class FontloaderNames
---@field lang string # language for this entry
---@field names table # The `names` keys are the actual *TrueType* name strings. The possible keys are: `copyright`, `family`, `subfamily`, `uniqueid`, `fullname`, `version`, `postscriptname`, `trademark`, `manufacturer`, `designer`, `descriptor`, `venderurl`, `designerurl`, `license`, `licenseurl`, `idontknow`, `preffamilyname`, `prefmodifiers`, `compatfull`, `sampletext`, `cidfindfontname`, `wwsfamily` and `wwssubfamily`.

_N._12_6_8_anchor_classes = 250

---
---@class FontloaderAnchorClasses
---@field name string # a descriptive id of this anchor class
---@field lookup string #
---@field type `mark`|`mkmk`|`curs`|`mklg` # type is actually a lookup subtype, not a feature name. Officially, these strings should be gpos_mark2mark etc.

_N._12_6_9_gpos = 250

---
---@class FontloaderGposSub
---@field flags FontloaderGposFlags #
---@field name string #
---@field features FontloaderGposFeatures
---@field subtables FontloaderGposSubtables

---
---The `gpos` table has one array entry for each lookup. (The `gpos_`
---prefix is somewhat redundant.)
---
---@class FontloaderGpos: FontloaderGposSub
---@field type `gpos_single`|`gpos_pair`|`gpos_cursive`|`gpos_mark2base`|`gpos_mark2ligature`|`gpos_mark2mark`|`gpos_context`|`gpos_contextchain`

---
---The flags table has a true value for each of the lookup flags that is actually
---set:
---
---@class FontloaderGposFlags
---@field r2l boolean #
---@field ignorebaseglyphs boolean #
---@field ignoreligatures boolean #
---@field ignorecombiningmarks boolean #
---@field mark_class string #
---

---
---The features subtable items of gpos have:
---
---@class FontloaderGposFeatures
---@field tag string #
---@field scripts FontloaderGposFeaturesScripts #

---
---The scripts table within features has:
---
---@class FontloaderGposFeaturesScripts
---@field script string #
---@field langs string[]
---

---
---The subtables table has:
---
---@class FontloaderGposSubtables
---@field name string #
---@field suffix string # (only if used) % used by gpos_single to get a default
---@field anchor_classes number # (only if used)
---@field vertical_kerning number # (only if used)
---@field kernclass FontloaderGposSubtablesKernclass # (only if used)
---

---
---Note: the kernclass (as far as we can see) always has one entry so it could be one level
---deep instead. Also the seconds start at `[2]` which is close to the fontforge
---internals so we keep that too.
---@class FontloaderGposSubtablesKernclass
---@field firsts string[]
---@field seconds string[]
---@field lookup string # or an array of associated lookup(s)
---@field offsets integer[]

_N._12_6_10_gsub = 251

---
------
---This has identical layout to the `gpos` table, except for the
---type:
---@class FontloaderGsub: FontloaderGposSub
---@field type `gsub_single`|`gsub_multiple`|`gsub_alternate`|`gsub_ligature`|`gsub_context`|`gsub_contextchain`|`gsub_reversecontextchain`
---

_N._12_6_11_ttf_tables_and_ttf_tab_saved = 251

---
---@class FontloaderTtfTables
---@field tag string #
---@field len number #
---@field maxlen number #
---@field data number #

_N._12_6_12_mm = 251

---
---@class FontloaderMm
---@field axes table # array of axis names
---@field instance_count number #
---@field positions table # array of instance positions (\#axes * instances )
---@field defweights table # array of default weights for instances
---@field cdv string #
---@field ndv string #
---@field axismaps table #

---
---@class FontloaderAxismaps
---@field blends table # an array of blend points
---@field designs table # an array of design values
---@field min number #
---@field def number #
---@field max number #
---

_N._12_6_13_mark_classes = 252

---
---# `mark_classes`
---
---The keys in this table are mark class names, and the values are a
---space-separated string of glyph names in this class.

_N._12_6_14_math = 252

---
---# `math`
---
---The math table has the variables that are also discussed in the chapter aboout
---math: `ScriptPercentScaleDown`, `ScriptScriptPercentScaleDown`, `DelimitedSubFormulaMinHeight`, `DisplayOperatorMinHeight`, `MathLeading`, `AxisHeight`, `AccentBaseHeight`, `FlattenedAccentBaseHeight`, `SubscriptShiftDown`, `SubscriptTopMax`,
---`SubscriptBaselineDropMin`, `SuperscriptShiftUp`, `SuperscriptShiftUpCramped`, `SuperscriptBottomMin`, `SuperscriptBaselineDropMax`, `SubSuperscriptGapMin`, `SuperscriptBottomMaxWithSubscript`, `SpaceAfterScript`, `UpperLimitGapMin`, `UpperLimitBaselineRiseMin`, `LowerLimitGapMin`,
---`LowerLimitBaselineDropMin`, `StackTopShiftUp`, `StackTopDisplayStyleShiftUp`, `StackBottomShiftDown`, `StackBottomDisplayStyleShiftDown`, `StackGapMin`, `StackDisplayStyleGapMin`, `StretchStackTopShiftUp`, `StretchStackBottomShiftDown`, `StretchStackGapAboveMin`, `StretchStackGapBelowMin`, `FractionNumeratorShiftUp`, `FractionNumeratorDisplayStyleShiftUp`, `FractionDenominatorShiftDown`,
---`FractionDenominatorDisplayStyleShiftDown`, `FractionNumeratorGapMin`, `FractionNumeratorDisplayStyleGapMin` `FractionRuleThickness`, `FractionDenominatorGapMin`, `FractionDenominatorDisplayStyleGapMin`, `SkewedFractionHorizontalGap`,
---`SkewedFractionVerticalGap`, `OverbarVerticalGap`, `OverbarRuleThickness`, `OverbarExtraAscender`, `UnderbarVerticalGap`, `UnderbarRuleThickness`, `UnderbarExtraDescender`, `RadicalVerticalGap`, `RadicalDisplayStyleVerticalGap`, `RadicalRuleThickness`, `RadicalExtraAscender`, `RadicalKernBeforeDegree`, `RadicalKernAfterDegree`, `RadicalDegreeBottomRaisePercent`, `MinConnectorOverlap`, `FractionDelimiterSize` and `FractionDelimiterDisplayStyleSize`.

_N._12_6_15_validation_state = 253

---
---# `validation_state`
---
---This is just a bonus table with keys: `bad_ps_fontname`, `bad_glyph_table`, `bad_cff_table`, `bad_metrics_table`, `bad_cmap_table`, `bad_bitmaps_table`, `bad_gx_table`, `bad_ot_table`, `bad_os2_version` and `bad_sfnt_header`.

_N._12_6_16_horiz_base_and_vert_base = 253

---
---@class FontloaderHorizVertBase
---@field tags table # an array of script list tags
---@field scripts FontloaderScripts #

---
---@class FontloaderScripts
---@field baseline table #
---@field default_baseline number #
---@field lang FontloaderLang #

---
---@class FontloaderLang
---@field tag string # a script tag
---@field ascent number #
---@field descent number #
---@field features table # The `features` points to an array of tables with the same layout except that in those nested tables, the tag represents a language.

_N._12_6_17_altuni = 253

---
---An array of alternate *Unicode* values. Inside that array are hashes with:
---@class FontloaderAltuni
---@field unicode number # this glyph is also used for this unicode
---@field variant number # the alternative is driven by this unicode selector

_N._12_6_18_vert_variants_and_horiz_variants = 253

---
---@class FontloaderVertHorizVariants
---@field variants string #
---@field italic_correction number #
---@field parts FontloaderParts[] # The `parts` table is an array of smaller tables.

---
---@class FontloaderParts
---@field component string #
---@field extender number #
---@field start number #
---@field end number #
---@field advance number #

_N._12_6_19_mathkern = 254

---
---@class FontloaderMathkern
---@field top_right FontloaderMathkernSubtable #
---@field bottom_right FontloaderMathkernSubtable #
---@field top_left FontloaderMathkernSubtable #
---@field bottom_left FontloaderMathkernSubtable #

---
---@class FontloaderMathkernSubtable
---@field height number #
---@field kern number #

_N._12_6_20_kerns = 254

---
---# `kerns`
---
---Substructure is identical to the per-glyph subtable.

_N._12_6_21_vkerns = 254

---
---# `vkerns`
---
---Substructure is identical to the per-glyph subtable.

_N._12_6_22_texdata = 254

---
---@class FontloaderTexdata
---@field type `unset`|`text`|`math`|`mathext`
---@field params table # 22 font numeric parameters

_N._12_6_23_lookups = 254

--
---Top-level `lookups` is quite different from the ones at character level.
---The keys in this hash are strings, the values the actual lookups, represented as
---dictionary tables.
---
---* Corresponding C source code: [luafflib.c#L1628-L1661](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1628-L1661)
---
---@class FontloaderLockup
---@field type string #
---@field format `glyphs`|`class`|`coverage`|`reversecoverage`
---@field tag string #
---@field current_class string[]
---@field before_class string[]
---@field after_class string[]
---@field rules FontloaderLockupRule[] # an array of rule items

---
---Rule items have one common item and one specialized item:
---
---@class FontloaderLockupRule
---@field lookups string[] a linear array of lookup names
---@field glyphs FontloaderLockupGlyph[] only if the parent's format is `glyphs`
---@field class FontloaderLockupClass[] only if the parent's format is `class`
---@field coverage FontloaderLockupsCoverage[] only if the parent's format is `coverage`
---@field reversecoverage FontloaderLockupReverseCoverage[] only if the parent's format is `reversecoverage`

---
---* Corresponding C source code: [luafflib.c#L1562-L1568](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1562-L1568)
---
---@class FontloaderLockupGlyph
---@field names string #
---@field back string #
---@field fore string #

---
---* Corresponding C source code: [luafflib.c#L1570-L1580](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1570-L1580)
---
---@class FontloaderLockupClass
---@field before number[]
---@field after number[]

---
---* Corresponding C source code: [luafflib.c#L1582-L1591](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1582-L1591)
---
---@class FontloaderLockupsCoverage
---@field current string[]
---@field before string[]
---@field after string[]

---
---* Corresponding C source code: [luafflib.c#L1593-L1604](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luafontloader/src/luafflib.c#L1593-L1604)
---
---@class FontloaderLockupReverseCoverage
---@field current string[]
---@field before string[]
---@field after string[]
---@field replacements string #
