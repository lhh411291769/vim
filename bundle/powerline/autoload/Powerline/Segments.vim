let g:Powerline#Segments#segments = Pl#Segment#Init([
	\ Pl#Segment#Create('SPLIT'   , '__split__'),
	\ Pl#Segment#Create('TRUNCATE', '__truncate__'),
	\
	\ Pl#Segment#Create('paste_indicator' , '%{&paste ? "PASTE" : ""}', Pl#Segment#Modes('!N')),
	\ Pl#Segment#Create('mode_indicator'  , '%{Powerline#Functions#GetMode()}', Pl#Segment#Modes('!N')),
	\ Pl#Segment#Create('fileinfo',
		\ Pl#Segment#Create('flags.ro'    , '%{&readonly ? "$RO" : ""}'),
		\ Pl#Segment#Create('filepath'    , '%{Powerline#Functions#GetFilepath()}', Pl#Segment#NoPadding()),
		\ Pl#Segment#Create('filename'    , '%t'),
		\ Pl#Segment#Create('flags.mod'   , '%M'),
		\ Pl#Segment#Create('flags.type'  , '%H%W'),
	\ ),
	\ Pl#Segment#Create('filename'        , '%t'),
	\ Pl#Segment#Create('filesize'        , '%{Powerline#Functions#GetFilesize()}', Pl#Segment#Modes('!N')),
	\ Pl#Segment#Create('pwd'             , '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'),
	\ Pl#Segment#Create('static_str'      , '%%{"%s"}'),
	\ Pl#Segment#Create('raw'             , '%s'),
	\ Pl#Segment#Create('fileformat'      , '%{&fileformat}', Pl#Segment#Modes('!N')),
	\ Pl#Segment#Create('fileencoding'    , '%{(&fenc == "" ? &enc : &fenc)}', Pl#Segment#Modes('!N')),
	\ Pl#Segment#Create('filetype'        , '%{strlen(&ft) ? &ft : "no ft"}', Pl#Segment#Modes('!N')),
    \ Pl#Segment#Create('currentascii'    , '%02.2B'),
	\ Pl#Segment#Create('lineinfo',
        \ Pl#Segment#Create('scrollpercent'   , '%3p%%'),
		\ Pl#Segment#Create('line.cur'    , '$LINE %3l'),
		\ Pl#Segment#Create('line.tot'    , ':%-2v', Pl#Segment#NoPadding()),
	\ ),
	\ Pl#Segment#Create('charcode'        , '%{Powerline#Functions#GetCharCode()}', Pl#Segment#Modes('!N')),
	\ Pl#Segment#Create('currhigroup'     , '%{synIDattr(synID(line("."), col("."), 1), "name")}', Pl#Segment#Modes('!N')),
	\ Pl#Segment#Create('ws_marker'       , '%{Powerline#Functions#GetWSMarker()}', Pl#Segment#Modes('!N')),
    \ Pl#Segment#Create('currenttag'      , '%{tagbar#currenttag("%s", "")}', Pl#Segment#Modes('!N')),
\ ])

"lidong add 
"上面currenttag currentascii"
"lidong end
