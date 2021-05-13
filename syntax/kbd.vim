" Vim syntax file
" Language:     kbd
" Maintainer:   Hugo Heagren
" Last Change:	2021 Mar 23
" URL:          https://git.hugoheagren.com/Hugo-Heagren/KMonad.vim
" Version:      0.0.1
" Copyright 2021 Hugo Heagren

" This file is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 3, or (at your option)
" any later version.

" This file is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.

" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <http://www.gnu.org/licenses/>.

" TODO:
" - add leading brackets and corresponding hl offsets to all the `def-` keywords.

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Comments {{{1
syn keyword kmonadTodo TODO FIXME XXX NOTE BUG contained 
hi def link kmonadTODO Todo

syn match kmonadLineComment ";;.*$" contains=kmonadTODO keepend containedin=ALL
hi def link kmonadLineComment Comment
syn region kmonadMultiComment start="#|" end="|#" fold contains=kmonadTODO containedin=ALL
hi def link kmonadMultiComment Comment

set commentstring=;;%s

" }}}1

" TODO is there a better place to put this?
setlocal iskeyword+=-,;,,,.,/,=,',{,},[,],`,\

syn region kmonmadTopBracks start='(' end=')' transparent contains=@kmonadTopLevel
syn cluster kmonadTopLevel contains=kmonaddefcfg,kmonaddefsrc,kmonaddefalias,kmonaddeflayer
hi def link kmonadKeyword Keyword

" Data Types {{{1

" Strings {{{2

syn cluster kmonadString contains=kmonadDoubleQuotes,kmonadSingleQuotes

syn region kmonadSingleQuotes start=/"/ end=/"/ skip=/\\"/ contained
hi def link kmonadSingleQuotes String
syn region kmonadDoubleQuotes start=/'/ end=/'/ skip=/\\'/ contained
hi def link kmonadDoubleQuotes String

" }}}2

" Boolean {{{2

syn keyword kmonadBool true false contained
hi def link kmonadBool Boolean

" }}}2

" Aliases {{{2

" Aliases can't include ')' or '"' characters, which makes it much easier to
" delimit them!
" See `src/KMonad/Args/Parser.hs` in the KMonad source.
syn match kmonadAliascode '@[^ 	)"]\+' contained
hi def link kmonadAliascode Structure

" }}}2

" Numbers {{{2

syn match kmonadNumber '\d\+' contained
hi def link kmonadNumber Number

" }}}2

syn cluster kmonadKeyVals contains=kmonadKeycode,kmonadAliascode

" }}}1

" Keycodes {{{1

syn keyword kmonadKeycode ' contained
syn keyword kmonadKeycode , contained
syn keyword kmonadKeycode - contained
syn keyword kmonadKeycode . contained
syn keyword kmonadKeycode / contained
syn keyword kmonadKeycode 0 contained
syn keyword kmonadKeycode 1 contained
syn keyword kmonadKeycode 102d contained
syn keyword kmonadKeycode 102nd contained
syn keyword kmonadKeycode 2 contained
syn keyword kmonadKeycode 3 contained
syn keyword kmonadKeycode 4 contained
syn keyword kmonadKeycode 5 contained
syn keyword kmonadKeycode 6 contained
syn keyword kmonadKeycode 7 contained
syn keyword kmonadKeycode 8 contained
syn keyword kmonadKeycode 9 contained
syn keyword kmonadKeycode ; contained
syn keyword kmonadKeycode = contained
syn keyword kmonadKeycode a contained
syn keyword kmonadKeycode again contained
syn keyword kmonadKeycode alterase contained
syn keyword kmonadKeycode apostrophe contained
syn keyword kmonadKeycode b contained
syn keyword kmonadKeycode back contained
syn keyword kmonadKeycode backslash contained
syn keyword kmonadKeycode backspace contained
syn keyword kmonadKeycode bassboost contained
syn keyword kmonadKeycode battery contained
syn keyword kmonadKeycode bluetooth contained
syn keyword kmonadKeycode bookmarks contained
syn keyword kmonadKeycode brightnesscycle contained
syn keyword kmonadKeycode brightnessdown contained
syn keyword kmonadKeycode brightnessup contained
syn keyword kmonadKeycode brightnesszero contained
syn keyword kmonadKeycode c contained
syn keyword kmonadKeycode calc contained
syn keyword kmonadKeycode camera contained
syn keyword kmonadKeycode cancel contained
syn keyword kmonadKeycode capslock contained
syn keyword kmonadKeycode chat contained
syn keyword kmonadKeycode close contained
syn keyword kmonadKeycode closecd contained
syn keyword kmonadKeycode coffee contained
syn keyword kmonadKeycode comma contained
syn keyword kmonadKeycode compose contained
syn keyword kmonadKeycode computer contained
syn keyword kmonadKeycode config contained
syn keyword kmonadKeycode connect contained
syn keyword kmonadKeycode copy contained
syn keyword kmonadKeycode cut contained
syn keyword kmonadKeycode cyclewindows contained
syn keyword kmonadKeycode d contained
syn keyword kmonadKeycode dashboard contained
syn keyword kmonadKeycode delete contained
syn keyword kmonadKeycode deletefile contained
syn keyword kmonadKeycode direction contained
syn keyword kmonadKeycode displayoff contained
syn keyword kmonadKeycode documents contained
syn keyword kmonadKeycode dot contained
syn keyword kmonadKeycode down contained
syn keyword kmonadKeycode e contained
syn keyword kmonadKeycode edit contained
syn keyword kmonadKeycode ejectcd contained
syn keyword kmonadKeycode ejectclosecd contained
syn keyword kmonadKeycode email contained
syn keyword kmonadKeycode end contained
syn keyword kmonadKeycode enter contained
syn keyword kmonadKeycode equal contained
syn keyword kmonadKeycode esc contained
syn keyword kmonadKeycode exit contained
syn keyword kmonadKeycode f contained
syn keyword kmonadKeycode f1 contained
syn keyword kmonadKeycode f10 contained
syn keyword kmonadKeycode f11 contained
syn keyword kmonadKeycode f12 contained
syn keyword kmonadKeycode f13 contained
syn keyword kmonadKeycode f14 contained
syn keyword kmonadKeycode f15 contained
syn keyword kmonadKeycode f16 contained
syn keyword kmonadKeycode f17 contained
syn keyword kmonadKeycode f18 contained
syn keyword kmonadKeycode f19 contained
syn keyword kmonadKeycode f2 contained
syn keyword kmonadKeycode f20 contained
syn keyword kmonadKeycode f21 contained
syn keyword kmonadKeycode f22 contained
syn keyword kmonadKeycode f23 contained
syn keyword kmonadKeycode f24 contained
syn keyword kmonadKeycode f3 contained
syn keyword kmonadKeycode f4 contained
syn keyword kmonadKeycode f5 contained
syn keyword kmonadKeycode f6 contained
syn keyword kmonadKeycode f7 contained
syn keyword kmonadKeycode f8 contained
syn keyword kmonadKeycode f9 contained
syn keyword kmonadKeycode fastforward contained
syn keyword kmonadKeycode file contained
syn keyword kmonadKeycode finance contained
syn keyword kmonadKeycode find contained
syn keyword kmonadKeycode fn contained
syn keyword kmonadKeycode forward contained
syn keyword kmonadKeycode forwardmail contained
syn keyword kmonadKeycode front contained
syn keyword kmonadKeycode g contained
syn keyword kmonadKeycode grave contained
syn keyword kmonadKeycode h contained
syn keyword kmonadKeycode hangeul contained
syn keyword kmonadKeycode hanja contained
syn keyword kmonadKeycode help contained
syn keyword kmonadKeycode henkan contained
syn keyword kmonadKeycode hiragana contained
syn keyword kmonadKeycode home contained
syn keyword kmonadKeycode homepage contained
syn keyword kmonadKeycode hp contained
syn keyword kmonadKeycode i contained
syn keyword kmonadKeycode insert contained
syn keyword kmonadKeycode iso contained
syn keyword kmonadKeycode j contained
syn keyword kmonadKeycode k contained
syn keyword kmonadKeycode katakana contained
syn keyword kmonadKeycode katakanahiragana contained
syn keyword kmonadKeycode kbdillumdown contained
syn keyword kmonadKeycode kbdillumtoggle contained
syn keyword kmonadKeycode kbdillumup contained
syn keyword kmonadKeycode kp0 contained
syn keyword kmonadKeycode kp1 contained
syn keyword kmonadKeycode kp2 contained
syn keyword kmonadKeycode kp3 contained
syn keyword kmonadKeycode kp4 contained
syn keyword kmonadKeycode kp5 contained
syn keyword kmonadKeycode kp6 contained
syn keyword kmonadKeycode kp7 contained
syn keyword kmonadKeycode kp8 contained
syn keyword kmonadKeycode kp9 contained
syn keyword kmonadKeycode kpasterisk contained
syn keyword kmonadKeycode kpcomma contained
syn keyword kmonadKeycode kpdot contained
syn keyword kmonadKeycode kpenter contained
syn keyword kmonadKeycode kpequal contained
syn keyword kmonadKeycode kpleftparen contained
syn keyword kmonadKeycode kpminus contained
syn keyword kmonadKeycode kpplus contained
syn keyword kmonadKeycode kpplusminus contained
syn keyword kmonadKeycode kprightparen contained
syn keyword kmonadKeycode kpslash contained
syn keyword kmonadKeycode kpjpcomma contained
syn keyword kmonadKeycode l contained
syn keyword kmonadKeycode launchpad contained
syn keyword kmonadKeycode left contained
syn keyword kmonadKeycode leftalt contained
syn keyword kmonadKeycode leftbrace contained
syn keyword kmonadKeycode leftctrl contained
syn keyword kmonadKeycode leftmeta contained
syn keyword kmonadKeycode leftshift contained
syn keyword kmonadKeycode linefeed contained
syn keyword kmonadKeycode m contained
syn keyword kmonadKeycode macro contained
syn keyword kmonadKeycode mail contained
syn keyword kmonadKeycode media contained
syn keyword kmonadKeycode menu contained
syn keyword kmonadKeycode minus contained
syn keyword kmonadKeycode missing247 contained
syn keyword kmonadKeycode missing248 contained
syn keyword kmonadKeycode missing249 contained
syn keyword kmonadKeycode missing250 contained
syn keyword kmonadKeycode missing251 contained
syn keyword kmonadKeycode missing252 contained
syn keyword kmonadKeycode missing253 contained
syn keyword kmonadKeycode missing254 contained
syn keyword kmonadKeycode missing255 contained
syn keyword kmonadKeycode missionctrl contained
syn keyword kmonadKeycode move contained
syn keyword kmonadKeycode msdos contained
syn keyword kmonadKeycode muhenkan contained
syn keyword kmonadKeycode mute contained
syn keyword kmonadKeycode n contained
syn keyword kmonadKeycode new contained
syn keyword kmonadKeycode nextsong contained
syn keyword kmonadKeycode numlock contained
syn keyword kmonadKeycode o contained
syn keyword kmonadKeycode open contained
syn keyword kmonadKeycode p contained
syn keyword kmonadKeycode pagedown contained
syn keyword kmonadKeycode pageup contained
syn keyword kmonadKeycode paste contained
syn keyword kmonadKeycode pause contained
syn keyword kmonadKeycode pausecd contained
syn keyword kmonadKeycode phone contained
syn keyword kmonadKeycode play contained
syn keyword kmonadKeycode playcd contained
syn keyword kmonadKeycode playpause contained
syn keyword kmonadKeycode power contained
syn keyword kmonadKeycode previoussong contained
syn keyword kmonadKeycode print contained
syn keyword kmonadKeycode prog1 contained
syn keyword kmonadKeycode prog2 contained
syn keyword kmonadKeycode prog3 contained
syn keyword kmonadKeycode prog4 contained
syn keyword kmonadKeycode props contained
syn keyword kmonadKeycode q contained
" TODO sort out which keycodes to include (e.g. there is one for `question` but not for `?`)
syn keyword kmonadKeycode question contained
syn keyword kmonadKeycode r contained
syn keyword kmonadKeycode record contained
syn keyword kmonadKeycode redo contained
syn keyword kmonadKeycode refresh contained
syn keyword kmonadKeycode reply contained
syn keyword kmonadKeycode rewind contained
syn keyword kmonadKeycode right contained
syn keyword kmonadKeycode rightalt contained
syn keyword kmonadKeycode rightbrace contained
syn keyword kmonadKeycode rightctrl contained
syn keyword kmonadKeycode rightmeta contained
syn keyword kmonadKeycode rightshift contained
syn keyword kmonadKeycode ro contained
syn keyword kmonadKeycode s contained
syn keyword kmonadKeycode save contained
syn keyword kmonadKeycode scale contained
syn keyword kmonadKeycode scrolldown contained
syn keyword kmonadKeycode scrolllock contained
syn keyword kmonadKeycode scrollup contained
syn keyword kmonadKeycode search contained
syn keyword kmonadKeycode semicolon contained
syn keyword kmonadKeycode send contained
syn keyword kmonadKeycode sendfile contained
syn keyword kmonadKeycode setup contained
syn keyword kmonadKeycode shop contained
syn keyword kmonadKeycode slash contained
syn keyword kmonadKeycode sleep contained
syn keyword kmonadKeycode sound contained
syn keyword kmonadKeycode space contained
syn keyword kmonadKeycode sport contained
syn keyword kmonadKeycode stop contained
syn keyword kmonadKeycode stopcd contained
syn keyword kmonadKeycode suspend contained
syn keyword kmonadKeycode switchvideomode contained
syn keyword kmonadKeycode sysrq contained
syn keyword kmonadKeycode t contained
syn keyword kmonadKeycode tab contained
syn keyword kmonadKeycode u contained
syn keyword kmonadKeycode undo contained
syn keyword kmonadKeycode unknown contained
syn keyword kmonadKeycode up contained
syn keyword kmonadKeycode uwb contained
syn keyword kmonadKeycode v contained
syn keyword kmonadKeycode videonext contained
syn keyword kmonadKeycode videoprev contained
syn keyword kmonadKeycode volumedown contained
syn keyword kmonadKeycode volumeup contained
syn keyword kmonadKeycode w contained
syn keyword kmonadKeycode wakeup contained
syn keyword kmonadKeycode wimax contained
syn keyword kmonadKeycode wlan contained
syn keyword kmonadKeycode www contained
syn keyword kmonadKeycode x contained
syn keyword kmonadKeycode xfer contained
syn keyword kmonadKeycode y contained
syn keyword kmonadKeycode yen contained
syn keyword kmonadKeycode z contained
syn keyword kmonadKeycode zenkakuhankaku contained
" syn keyword kmonadKeycoes [] contained " TODO include [] keywords
syn keyword kmonadKeycode \\ contained
syn keyword kmonadKeycode ` contained
syn keyword kmonadKeycode alt contained
syn keyword kmonadKeycode apos contained
syn keyword kmonadKeycode bks contained
syn keyword kmonadKeycode bksl contained
syn keyword kmonadKeycode bldn contained
syn keyword kmonadKeycode blup contained
syn keyword kmonadKeycode brdn contained
syn keyword kmonadKeycode brdown contained
syn keyword kmonadKeycode brdwn contained
syn keyword kmonadKeycode bru contained
syn keyword kmonadKeycode brup contained
syn keyword kmonadKeycode bspc contained
syn keyword kmonadKeycode caps contained
syn keyword kmonadKeycode cmp contained
syn keyword kmonadKeycode cmps contained
syn keyword kmonadKeycode comm contained
syn keyword kmonadKeycode comp contained
syn keyword kmonadKeycode ctl contained
syn keyword kmonadKeycode del contained
syn keyword kmonadKeycode ent contained
syn keyword kmonadKeycode eql contained
syn keyword kmonadKeycode fwd contained
syn keyword kmonadKeycode grv contained
syn keyword kmonadKeycode grv contained
syn keyword kmonadKeycode ins contained
syn keyword kmonadKeycode kp* contained
syn keyword kmonadKeycode kp+ contained
syn keyword kmonadKeycode kp- contained
syn keyword kmonadKeycode kp. contained
syn keyword kmonadKeycode kp/ contained
syn keyword kmonadKeycode kprt contained
syn keyword kmonadKeycode lalt contained
syn keyword kmonadKeycode lbrc contained
syn keyword kmonadKeycode lctl contained
syn keyword kmonadKeycode lctrl contained
syn keyword kmonadKeycode lft contained
syn keyword kmonadKeycode lmet contained
syn keyword kmonadKeycode lmeta contained
syn keyword kmonadKeycode lp contained
syn keyword kmonadKeycode lsft contained
syn keyword kmonadKeycode lsgt contained
syn keyword kmonadKeycode lshft contained
syn keyword kmonadKeycode lshift contained
syn keyword kmonadKeycode mctl contained
syn keyword kmonadKeycode met contained
syn keyword kmonadKeycode min contained
syn keyword kmonadKeycode next contained
syn keyword kmonadKeycode nlck contained
syn keyword kmonadKeycode nubs contained
syn keyword kmonadKeycode pgdn contained
syn keyword kmonadKeycode pgup contained
syn keyword kmonadKeycode pp contained
syn keyword kmonadKeycode prev contained
syn keyword kmonadKeycode prnt contained
syn keyword kmonadKeycode ralt contained
syn keyword kmonadKeycode rbrc contained
syn keyword kmonadKeycode rctl contained
syn keyword kmonadKeycode rctrl contained
syn keyword kmonadKeycode ret contained
syn keyword kmonadKeycode return contained
syn keyword kmonadKeycode rght contained
syn keyword kmonadKeycode rmet contained
syn keyword kmonadKeycode rmeta contained
syn keyword kmonadKeycode rsft contained
syn keyword kmonadKeycode rshft contained
syn keyword kmonadKeycode rshift contained
syn keyword kmonadKeycode scln contained
syn keyword kmonadKeycode scrlck contained
syn keyword kmonadKeycode sft contained
syn keyword kmonadKeycode shft contained
syn keyword kmonadKeycode sing195 contained
syn keyword kmonadKeycode sing196 contained
syn keyword kmonadKeycode sing197 contained
syn keyword kmonadKeycode sing198 contained
syn keyword kmonadKeycode sing199 contained
syn keyword kmonadKeycode sing84 contained
syn keyword kmonadKeycode slck contained
syn keyword kmonadKeycode spc contained
syn keyword kmonadKeycode ssrq contained
syn keyword kmonadKeycode sys contained
syn keyword kmonadKeycode vold contained
syn keyword kmonadKeycode voldwn contained
syn keyword kmonadKeycode volu contained
syn keyword kmonadKeycode wkup contained
syn keyword kmonadKeycode zzz contained

hi def link kmonadKeycode Identifier

" }}}1

" defcfg {{{1
syn region kmonaddefcfg end=')' matchgroup=kmonadkeyword start='defcfg' contained contains=@kmonaddefcfgOpts

" defcfg options {{{2

syn cluster kmonaddefcfgOpts contains=@kmonaddefcfgIOOpts,@kmonaddefcfgBoolOpts,kmonaddefcfgOptCmpSeq

" Input/Output Options (`input`, `output`, `init`) {{{3

syn cluster kmonaddefcfgIOOpts contains=kmonaddefcfgOptInput,kmonaddefcfgOptOutput,kmonaddefcfgOptInit  
syn region kmonaddefcfgOptInput  end='$' matchgroup=kmonaddefcfgOptName start='input'  contained
syn region kmonaddefcfgOptOutput end='$' matchgroup=kmonaddefcfgOptName start='output' contained
syn region kmonaddefcfgOptInit   end='$' matchgroup=kmonaddefcfgOptName start='init'   contained

" }}}3

syn region kmonaddefcfgOptCmpSeq end='$' matchgroup=kmonaddefcfgOptName start='cmp-seq' contained contains=kmonadKeycode

" Boolean Options (`fallthrough`, `allow-cmd`) {{{3

syn cluster kmonaddefcfgBoolOpts contains=kmonaddefcfgOptAllowCmd,kmonaddefcfgOptFallthrough
syn region kmonaddefcfgOptAllowCmd    end='$' matchgroup=kmonaddefcfgOptName start='allow-cmd'   contains=kmonadBool contained
syn region kmonaddefcfgOptFallthrough end='$' matchgroup=kmonaddefcfgOptName start='fallthrough' contains=kmonadBool contained

" }}}3

hi def link kmonaddefcfgOptName Constant

" Option functions in brackets {{{3

syn region kmonaddefcfgOptValBrack start='(' end=')' contained keepend contains=@kmonadString,kmonaddefcfgIONames containedin=@kmonaddefcfgIOOpts

syn keyword kmonaddefcfgIONames kext uinput-sink send-event-sink device-file low-level-hook iokit-name contained nextgroup=@kmonadString
hi def link kmonaddefcfgIONames Structure

" }}}3

" }}}2

" }}}1

" defsrc {{{1

syn region kmonaddefsrc end=')' matchgroup=kmonadkeyword start='defsrc' contained contains=kmonadKeycode

" }}}1

" defalias {{{1

syn region kmonaddefalias end=')' matchgroup=kmonadkeyword start='defalias' contained contains=kmonaddefaliasName,kmonaddefaliasBrackVal

syn match kmonaddefaliasName '\(defalias\s\+\|^\)\zs\s*[^ 	#(]\S*' nextgroup=kmonaddefaliasBrackVal
hi def link kmonaddefaliasName Identifier 

hi def link kmonaddefaliasMod Keyword

" TODO so far I've treated these the same. They're different. Some are recursive, some not, etc...
" TODO does tap-hold have other things like numbers? Do THEY need highlighting?
syn region kmonaddefaliasBrackVal end=')' matchgroup=kmonaddefaliasMod start='(\zsaround\(-next\(-single\)\?\)\?' contained contains=@kmonadKeyVals,kmonaddefaliasBrackVal
syn region kmonaddefaliasBrackVal end=')' matchgroup=kmonaddefaliasMod start='(\zscmd-button' contained contains=@kmonadKeyVals,kmonaddefaliasBrackVal
syn region kmonaddefaliasBrackVal end=')' matchgroup=kmonaddefaliasMod start='(\zsmulti-tap' contained contains=@kmonadKeyVals,kmonaddefaliasBrackVal
syn region kmonaddefaliasBrackVal end=')' matchgroup=kmonaddefaliasMod start='(\zslayer-\(add\|delay\|next\|rem\|switch\|toggle\)' contained contains=@kmonadKeyVals,kmonaddefaliasBrackVal
syn region kmonaddefaliasBrackVal end=')' matchgroup=kmonaddefaliasMod start='(\zstap-hold\(-next\(-release\)\?\)\?\|(\zstap-\(macro\|next\(-release\)\?\)' contained contains=@kmonadKeyVals,kmonaddefaliasBrackVal
syn region kmonaddefaliasBrackVal end=')' matchgroup=kmonaddefaliasMod start='#\ze(' contained contains=@kmonadKeyVals,kmonaddefaliasBrackVal keepend
		
" }}}1

" deflayer {{{1

syn region kmonaddeflayer end=')' matchgroup=kmonadkeyword start='deflayer' contained contains=@kmonadKeyVals

" }}}1
