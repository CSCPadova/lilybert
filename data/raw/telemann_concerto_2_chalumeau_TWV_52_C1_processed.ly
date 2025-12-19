\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

tr = \trill

dolce = _\markup \italic \center-align"doux"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

terzinesenza = \override TupletNumber.transparent = ##t

terzinecon = \override TupletNumber.transparent = ##f

upl =
#(let ((m (make-articulation "stopped")))
   (set! (ly:music-property m 'tweaks)
         (acons 'font-size 3
                (acons 'stencil (lambda (grob)
                                  (grob-interpret-markup
                                   grob
                                   (make-draw-line-markup '(0 . 1))))
                       (ly:music-property m 'tweaks))))
   m)
mbreak = { }

Iglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
		\terzine \terzinesenza
			}

IchIn = \relative do'' {

   sol4 la8.(si32 do) si4-+ r8 la
   sol4 fa8 (mi16)fa mi4 r8 re
   do4 re8.(mi32 fa) mi4 fa8 re

   %4
   do4 re8.(mi32 fa) mi4 fa8 re
   mi4 fad-+ sol8la16(si do8) mi,
   sol4(fad8.)-+ sol16 sol4 r sol4 r

   %7
   si4 do16(si) la(sol) do4 r8 si
   la sold la si sold4-+ r8 la\mbreak
   re8 re16(dod re8) re mi,4 mi'8 re

   %10
   do4(si8.-+) la16 la4 r
   do4 re8.(do16) si4 r
   sib do8.(sib16) la4 r

   %13
   sol4 la16(sol) fa(mi) fa8 re16(mi fa8) sol
   mi4.-+ fa8 re4-+ r
   do re8.(mi32 fa)mi4 fa8 re

   %16
   do4 re8.(mi32 fa) mi4 fa8 re
   mi4 fa-+ sol8 la16(si do8) re,
   mi4(re8.-+) do16 do4\fermata r do4\fermata r

}

IchIIn = \relative do {

   mi4 fad sol r8 do,
   do4 si do r8 si
   do16 (sol) do4 si8 do4 re8 si

   %4
   do16 (sol) do4 si8 do4 re8 si
   do4 la sol4. do8
   si4(la8.-+) sol16 sol4 r sol4 r

   %7
   re' re8.-+(do32 re) do4 r8 mi
   do8 mi16(re do8) re si4-+ r8 la\mbreak
   fad'8 fad16(mi fad8) re~re do16(si do8) la

   %10
   la4 (sold8.-+) la16 la4 r
   mi' fad-+ sol r
   re mi-+ fa! r

   %13
   mi8 do16(re mi8) dod re la re4~
   re8 do16 si do8 re si4-+ r
   sol8 do4 si8 do4 re8 si

   %16
   sol do4 si8 do4 re8 si
   do4 do do r8 do
   do4(si8.-+) do16 do4\fermata r do4\fermata r

}

IfgIn = \relative do {

   sol'4 la8.(si32 do) si4-+ r8 la
   sol4 fa8 (mi16)fa mi4 r8 re
   do4 re8.(mi32 fa) mi4 fa8 re

   %4
   do4 re8.(mi32 fa) mi4 fa8 re
   mi4 fad-+ sol8la16(si do8) mi,
   sol4(fad8.)-+ sol16 sol4 r sol4 r

   %7
   si4 do16(si) la(sol) do4 r8 si
   la sold la si sold4-+ r8 la\mbreak
   re8 re16(dod re8) re mi,4 mi'8 re

   %10
   do4(si8.-+) la16 la4 r
   do4 re8.(do16) \parenthesize si4 r
   sib do8.(sib16) la4 r

   %13
   sol4 la16(sol) fa(mi) fa8 re16(mi fa8) sol
   mi4.-+ fa8 re4-+ r
   do re8.(mi32 fa)mi4 fa8 re

   %16
   do4 re8.(mi32 fa) mi4 fa8 re
   mi4 fa-+ sol8 la16(si do8) re,
   mi4(re8.-+) do16 do4\fermata r do4\fermata r

}

IfgIIn = \relative do {

   mi4 fad sol r8 do,
   do4 si do r8 si
   do16 (sol) do4 si8 do4 re8 si

   %4
   do16 (sol) do4 si8 do4 re8 si
   do4 la sol4. do8
   si4(la8.-+) sol16 sol4 r sol4 r

   %7
   re' re8.-+(do32 re) do4 r8 mi
   do8 mi16(re do8) re si4-+ r8 la\mbreak
   fad'8 fad16(mi fad8) re~re do16(si do8) la

   %10
   la4 (sold8.-+) la16 la4 r
   mi' fad-+ sol r
   re mi-+ fa! r

   %13
   mi8 do16(re mi8) dod re la re4~
   re8 do16 si do8 re si4-+ r
   sol8 do4 si8 do4 re8 si

   %16
   sol do4 si8 do4 re8 si
   do4 do do r8 do
   do4(si8.-+) do16 do4\fermata r do4\fermata r

}


Ivln = \relative do'' {

   sol4 la8.(si32 do) si4-+ r8 la
   sol4 fa8 (mi16)fa mi4 r8 re
   do4 re8.(mi32 fa) mi4 fa8 re

   %4
   do4 re8.(mi32 fa) mi4 fa8 re
   mi4 fad-+ sol8la16(si do8) mi,
   sol4(fad8.)-+ sol16 sol4 r sol4 r

   %7
   si4 do16(si) la(sol) do4 r8 si
   la sold la si sold4-+ r8 la\mbreak
   re8 re16(dod re8) re mi,4 mi'8 re

   %10
   do4(si8.-+) la16 la4 r
   do4 re8.(do16) si4 r
   sib do8.(sib16) la4 r

   %13
   sol4 la16(sol) fa(mi) fa8 re16(mi fa8) sol
   mi4.-+ fa8 re4-+ r
   do re8.(mi32 fa)mi4 fa8 re

   %16
   do4 re8.(mi32 fa) mi4 fa8 re
   mi4 fa-+ sol8 la16(si do8) re,
   mi4(re8.-+) do16 do4\fermata r do4\fermata r

}

Ivlan = \relative do' {

   mi4 fad sol r8 do,
   do4 si do r8 si
   do16 (sol) do4 si8 do4 re8 si

   %4
   do16 (sol) do4 si8 do4 re8 si
   do4 la sol4. do8
   si4(la8.-+) sol16 sol4 r sol4 r

   %7
   re' re8.-+(do32 re) do4 r8 mi
   do8 mi16(re do8) re si4-+ r8 la\mbreak
   fad'8 fad16(mi fad8) re~re do16(si do8) la

   %10
   la4 (sold8.-+) la16 la4 r
   mi' fad-+ sol r
   re mi-+ fa! r

   %13
   mi8 do16(re mi8) dod re la re4~
   re8 do16 si do8 re si4-+ r
   sol8 do4 si8 do4 re8 si

   %16
   sol do4 si8 do4 re8 si
   do4 do do r8 do
   do4(si8.-+) do16 do4\fermata r do4\fermata r

}

Ibcn = \relative do {

   do8 si la re sol sol, sol' fa
   mi do re sol, do sol do do,
   mi la fa sol do, do' fa, sol

   %4
   mi la fa sol do, do' fa, sol
   do la re do si sol mi'[do]
   re4 re, sol8 sol'16 fa mi8[re] sol, sol si[re]

   %7
   sol sol, sol' fa mi re mi do
   fa mi fa re mi mi, mi' do\mbreak
   si4 si'8 la sold sold la [re,]

   %10
   mi re mi mi, la la do mi
   la, la' re,[re'] sol, sol, si[re]
   sol, sol' do, [do'] fa, fa, la[fa]

   %13
   do' mi dod[la] re do? si[sol]
   do do, do'[fa,] sol4 sol8 fa
   mi la fa[sol] do, do' fa,[sol]

   %16
   mi la fa[sol] do, do' fa,[sol]
   do do' la fa mi4 r8 fa
   sol fa sol sol, do re mi do do4\fermata r

}

Ibfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	s4 <6\\>8 <_+> s4 s8 <5 3>
	<6>4 <6> s2
	<6>4 <6 5> s <6>
	<6> <6 5> s <6>
	s <_+> <6> <6>
	<6 4> <5 _+> s2 s
	s <6>
	s8 <_+> s <6> <_+>4 s8 <6>
	<5->2 <6 5>
	<6 4>4 <5 3> s2
	s4 <_+> s2
	<_->2 s4 <6>
	s <6> s <6 5>
	s s8 <6> s2
	<6>4 <6 5> s <6>
	<6> <6 5> s <6>
	s <6> <6> s

}


forma = {

\key do\major
\time 4/4
\tempo 4 = 55
\repeat volta 2 {s1*5 s2}
\alternative {{s}{s}} \break
\set Score.currentBarNumber = #7
\repeat volta 2 {s1*11 s2}
\alternative {{s2}{s}}
\bar"|."

}

IchI = {
	\Iglobal
	\notypeset
	<<\IchIn \forma>>

}

IchII = {
	\Iglobal
	\clef bass
	<<\IchIIn \forma>>

}

IfgI = {
	\Iglobal
	\clef bass
	<<\IfgIn \forma>>

}

IfgII = {
	\Iglobal
	\clef bass
	<<\IfgIIn \forma>>

}

Ivl = {
	\Iglobal
	<<\Ivln \forma>>

}


Ivla = {
	\Iglobal
	\clef alto
	<<\Ivlan \forma>>

}


Ibc = {
	\Iglobal
	\clef bass
	<< \Ibcn \forma \Ibfn >>
	\typeset

}

IIglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
		\terzine \terzinesenza
			}

IIchIn = \relative do'' {

   do,16 re mi fa sol8[do,] sol' do,
   sol' do, r la' sol fa
   mi16 re mi fa sol8 do, sol'[do,]

   %4
   sol' do, r sol' la si
   do16 re do re do re do re do re do re
   si do si do si do si do si do si do

   %7
   la si la si la si la si la si la si
   sol la sol la sol la sol la sol  la sol la
   fa sol fa sol fa sol fa sol fa sol fa sol\mbreak

   %10
   mi fa  mi fa mi fa mi fa mi fa mi fa
   re4 r8 mi re do
   re4 r8 mi re do

   %13
   re8 re16 mi fa mi fa sol la sol la si
   do8 si16 la sol8 fa16 mi re4-+
   do16 re mi fa sol la sol la sol la sol la

   %16
   sol4 mi fa-+
   sol r r
   r mi fa-+

   %19
   sol la8(sol) la(fa)
   sol(si) do(sol) la(fa)\mbreak
   sol4 r r

   %22
   r sol8 la sib sol
   la la16 sol la8 la16 sol la8 sol
   fa fa16 mi fa8 fa16 mi fa8 sol16 la

   %25
   sib8 sib16 la sib8 sib16 la sib8 la
   sol8 sol16 fa sol8 sol16 fa sol8 la16 sib
   do8 fa,4 sib8 sol4

   %28
   fa r r
   R2.
   r4 do'8 si! do la\mbreak

   %31
   si8 si16 la si8 si16 la si8 la
   sol8 sol16 fad sol8 sol16 fad sol8 la16 si
   do8 do16 si do8 do16 si do8 si

   %34
   la8 la16 sol la8 la16 sol la8 si16 do
   re8 sol,4 do8 la4
   sol r r

   %37
   R2.*13
   sol16 re sol si sol re sol si sol re sol si\mbreak
   la re, la' do la re, la' do la re, la' do

   %52
   si4 r r
   sol16 re sol si sol re sol si sol re sol si
   la re, la' do la re, la' do la re, la' do

   %55
   si sol si re si sol si re si sol si re
   do sol do re do sol do re  do sib la sol
   la fa la do la fa la do la fa la do

   %58
   si? fa si do si fa si do si la sol fa
   sol mi sol si sol mi sol si sol mi sol si
   la mi la si la mi la si la sol fa mi\mbreak

   %61
   fa re fa la fa re fa la fa re fa la
   sol re sol la sol re sol la sol fa mi re
   mi4 r r

   %64
   r8 do' si(la) la(sold)
   sold4 r r
   r8 si do si16 la do8 si16 la

   %67
   sold4 r r
   r8 si do re16 do si8 do
   re4. re8 do si

   %70
   do la sold4. la8\mbreak
   la4 r r
   R2.*2

   %74
   r8 do si do16 si la8 si16 la
   sol4 r r
   r8 sol fa sol16 fa mi8 fa16 mi

   %77
   re4 r r
   r8 la' sol la16 sol fa8 sol16 fa
   mi do mi sol mi do mi sol mi do mi sol\mbreak

   %80
   fa do fa la fa do fa la fa do fa la
   fad re fad la fad re fad la fad re fad la
   sol re sol si sol re sol si sol re sol si

   %83
   sol mi sol do sol mi sol do sol mi sol do
   la fa la do la fa la do la fa la do
   sol mi sol do sol mi sol do sol mi sol do

   %86
   fa,4 r r
   fa16 re fa si fa re fa re' fa, re fa si
   fa4 r r

   %89
   fa r r\mbreak
   do16 re mi fa sol8 do, sol'[do,]
   sol' do, r la' sol fa

   %92
   mi16 re mi fa sol8 do, sol'[do,]
   sol' do, r sol' la si
   do16 re do re do re do re do re do re

   %95
   si do si do si do si do si do si do
   la si la si la si la si la si la si
   sol la sol la sol la sol la sol  la sol la

   %98
   fa sol fa sol fa sol fa sol fa sol fa sol\mbreak
   mi fa  mi fa mi fa mi fa mi fa mi fa
   re8re16 mi fa mi fa sol la sol la si

   %101
   do8 si16 la sol8 fa16 mi re4-+
   do8 sib' r sol la mi
   fa do' r la si! fad

   %104
   sol16 la sol la sol la sol la sol la sol la
   sol16 la sol la sol la sol la sol la sol la
   sol8 re' r fa,16 mi fa8 mi16 re

   %107
   mi8 do' re, do' re, si'
   do4\fermata r r

}

IIchIIn = \relative do {

   do16 re mi fa sol8[do,] sol' do,
   sol' do, r la' sol fa
   mi16 re mi fa sol8 do, sol'[do,]

   %4
   sol' do, r4 r
   r8 si do re mi fad
   sol la, si do re mi

   %7
   fa sol, la si do re
   mi16 fa mi fa mi fa mi fa mi fa mi fa
   re mi re mi re mi re mi re mi re mi\mbreak

   %10
   do re do re do re do re do re do re
   si4 r8 do si la
   si4 r8 do si la

   %13
   si si16 do  re do re mi fa mi fa re
   mi8 fa mi re16 do sol8 si
   do16 si do re mi fa mi fa mi fa mi fa

   %16
   mi4 do re-+
   mi r r
   r do re-+

   %19
   mi4 fa8(mi) fa(re)
   mi sol4 mi8 fa re\mbreak
   mi4 r r

   %22
   r mi8 fa sol mi
   fa fa16 mi fa8 fa16 mi fa8 mi
   re re16 do re8 re16 do re8 mi16 fa

   %25
   sol8 sol16 fa sol8 sol16 fa sol8 fa
   mi8 mi16 re mi8 mi16 re mi8 fa16 sol
   do,8 re16 mi fa8 sol mi4-+

   %28
   fa r r
   r4 fa8(mi) fa[(re)]
   mi2 fad4\mbreak

   %31
   sol8 sol16 fad sol8 sol16 fad sol8 fad
   mi8 mi16 re mi8 mi16 re mi8 fad16 sol
   la8 la16 sol la8 la16 sol la8 sol

   %34
   fad8 fad16 mi fad8 fad16 mi fad8 sol16 la
   re,8 mi16 fad sol8 mi fad4-+
   sol r r

   %37
   R2.*13
   sol,8 si si sol si sol\mbreak
   re' fad fad re fad re

   %52
   sol4 r r
   r8 si, si sol si sol
   re' fad fad re fad re

   %55
   r re sol re sol re
   r sol mi sol mi do
   r do fa do fa do

   %58
   r fa re fa re si
   r si mi si mi si
   r mi do mi do la\mbreak

   %61
   r la re la re la
   r re si sol si sol
   do4 r r

   %64
   r8 mi re(do) do(si)
   si4 r r
   r8 mi mi re16 do mi8 re16 do

   %67
   si4 r r
   r8 mi mi mi mi mi
   mi mi mi mi mi mi

   %70
   mi fa si,4. la8\mbreak
   la4 r r
   R2.*2

   %74
   r8 la' sol la16 sol fa8 sol16 fa
   mi4 r r
   r8 mi re mi16 re do8 re16 do

   %77
   si4 r r
   r8 fa'mi fa16 mi re8 mi16 re
   do sol do mi do sol do mi do sol do mi\mbreak

   %80
   la, fa la do la fa la do la fa la do
   re la re fad re la re fad re la re fad
   si, sol si re si sol si re si sol si re

   %83
   mi do mi sol mi do mi sol mi do mi sol
   do, la do fa do la do fa do la do fa
   mi do mi sol mi do mi sol mi do mi sol

   %86
   re4 r r
   re16 si re fa re si re fa re si re fa
   re4 r r

   %89
   re r r\mbreak
   do16 re mi fa sol8[do,] sol' do,
   sol' do, r la' sol fa

   %92
   mi16 re mi fa sol8 do, sol'[do,]
   sol' do, r4 r
   r8 si do re mi fad

   %95
   sol la, si do re mi
   fa sol, la si do re
   mi16 fa mi fa mi fa mi fa mi fa mi fa

   %98
   re mi re mi re mi re mi re mi re mi\mbreak
   do re do re do re do re do re do re
   si8 si16 do re do re mi fa mi fa re

   %101
   mi8 re16 do mi8 re16 do sol8 si
   do4 r8 sol la mi'
   fa4 r8 la, si fad'

   %104
   sol mi re do re mi
   si mi re do re mi
   si4 r8 do re si

   %107
   do sol'4 fa16 mi fa8 re
   do4\fermata  r r

}

IIfgIn = \relative do {

   do16 re mi fa sol8[do,] sol' do,
   sol' do, r la' sol fa
   mi16 re mi fa sol8 do, sol'[do,]

   %4
   sol' do, r sol' la si
   do16 re do re do re do re do re do re
   si do si do si do si do si do si do

   %7
   la si la si la si la si la si la si
   sol la sol la sol la sol la sol  la sol la
   fa sol fa sol fa sol fa sol fa sol fa sol\mbreak

   %10
   mi fa  mi fa mi fa mi fa mi fa mi fa
   re4 r8 mi re do
   re4 r8 mi re do

   %13
   re8 re16 mi fa mi fa sol la sol la si
   do8 si16 la sol8 fa16 mi re4-+
   do16 re mi fa sol la sol la sol la sol la

   %16
   sol4 r r
   do,16 re mi fa sol8 do, sol'[do,]
  sol' do, r4 r

   %19
   R2.*2
   do16 re mi fa sol8 do, sol'[do,]

   %22
   sol' do, r4 r
   R2.*5

   %28
   fa16 sol la sib do8 fa, do'[fa,]
   do' fa, r4 r
   R2.*6

   %36
   sol16 la si do re8 sol, re'[sol,]
   re' sol, r mi' re do
   si16 la si do re8 sol, re'[sol,]

   %39
   re' sol, r4 r
   r8 fad sol la si dod\mbreak
   re mi, fad sol la si

   %42
   do re, mi fad sol la
   si16 do si do si do si do si do si do
   la si la si la si la si la si la si

   %45
   sol la sol la sol la sol la sol la sol la
   fad4 r8 sol fad mi
   fad4 r8 sol fad mi

   %48
   fad? fad16 sol la sol la si do si do la
   si8 la16 sol si8 la16 sol re8 fad
   sol4 r r\mbreak

   %51
   R2.
   sol16 la si do re8 sol, re'[sol,]
   re' sol, r4 r

   %54
   R2.*9
   do,16 re mi fa sol8 do, sol'[do,]
   sol' do, r4 r

   %65
   mi16 fad sold la si8 mi, si'[mi,]
   si' mi, r4 r
   mi16 fad sold la si8 mi, si'[mi,]

   %68
   si' mi, r4 r
   R2.*2\mbreak
   la16 si do re mi8 la, mi' [la,]

   %72
   mi' la, r fa' mi re
   do16 si do re mi8 la, mi' [la,]
   mi' la, r4 r

   %75
   sol16 la sol la sol la sol la sol la sol la
   sol4 r r
   re16 mi re mi re mi re mi re mi re mi

   %78
   re4 r r
   R2.*7
   fa16 sol fa sol fa sol fa sol fa sol fa sol

   %87
   fa4 r r
   fa16 sol fa sol fa sol fa sol fa sol fa sol
   fa4 r r\mbreak

   %90
   do16 re mi fa sol8 do, sol'[do,]
   sol' do, r la' sol fa

   %92
   mi16 re mi fa sol8 do, sol'[do,]
   sol' do, r sol' la si
   do16 re do re do re do re do re do re

   %95
   si do si do si do si do si do si do
   la si la si la si la si la si la si
   sol la sol la sol la sol la sol  la sol la

   %98
   fa sol fa sol fa sol fa sol fa sol fa sol\mbreak
   mi fa  mi fa mi fa mi fa mi fa mi fa
   re8re16 mi fa mi fa sol la sol la si

   %101
   do8 si16 la sol8 fa16 mi re4-+
   do8 sib' r sol la mi
   fa do' r la si! fad

   %104
   sol16 la sol la sol la sol la sol la sol la
   sol16 la sol la sol la sol la sol la sol la
   sol8 re' r fa,16 mi fa8 mi16 re

   %107
   mi8 do' re, do' re, si'
   do4\fermata r r

}

IIfgIIn = \relative do {

   do16 re mi fa sol8[do,] sol' do,
   sol' do, r la' sol fa
   mi16 re mi fa sol8 do, sol'[do,]

   %4
   sol' do, r4 r
   r8 si do re mi fad
   sol la, si do re mi

   %7
   fa sol, la si do re
   mi16 fa mi fa mi fa mi fa mi fa mi fa
   re mi re mi re mi re mi re mi re mi\mbreak

   %10
   do re do re do re do re do re do re
   si4 r8 do si la
   si4 r8 do si la

   %13
   si si16 do  re do re mi fa mi fa re
   mi8 fa mi re16 do sol8 si
   do16 si do re mi fa mi fa mi fa mi fa

   %16
   mi4 r r
   do16 re mi fa sol8 do, sol'[do,]
   sol' do, r4 r

   %19
   R2.*2
   do16 re mi fa sol8 do, sol'[do,]

   %22
   sol' do, r4 r
   R2.*5

   %28
   fa16 sol la sib do8 fa, do'[fa,]
   do' fa, r4 r
   R2.*6

   %36
   sol16 la si do re8 sol, re'[sol,]
   re' sol, r mi' re do
   si16 la si do re8 sol, re'[sol,]

   %39
   re' sol, r re mi fad
   sol16 la sol la sol la sol la sol la sol la\mbreak
   fad sol fad sol fad sol fad sol fad sol fad sol

   %42
   mi fad mi fad mi fad mi fad mi fad mi fad
   re mi re mi re mi re mi re mi re mi
   do re do re do re do re do re do re

   %45
   si do si do si do si do si do si do
   la4 r8 si la sol
   la4 r8 si la sol

   %48
   la  la16 si do si do re mi re mi  fad
   sol8 fad16 mi re8 do16 si la4-+
   sol r r\mbreak

   %51
   R2.
   sol'16 la si do re8 sol, re'[sol,]
   re' sol, r4 r

   %54
   R2.*9
   do,16 re mi fa sol8 do, sol'[do,]
   sol' do, r4 r

   %65
   mi16 fad sold la si8 mi, si'[mi,]
   si' mi, r4 r
   mi16 fad sold la si8 mi, si'[mi,]

   %68
   si' mi, r4 r
   R2.*2\mbreak
   la,16 si do re mi8 la, mi' [la,]

   %72
   mi' la, r fa' mi re
   do16 si do re mi8 la, mi' [la,]
   mi' la, r4 r

   %75
   mi'16 fa mi fa mi fa mi fa mi fa mi fa
   mi4 r r
   si16 do si do si do si do si do si do

   %78
   si4 r r
   R2.*7
   re16 mi re mi re mi re mi re mi re mi

   %87
   re4 r r
   re16 mi re mi re mi re mi re mi re mi
   re4 r r\mbreak

   %90
   do16 re mi fa sol8 do, sol'[do,]
   sol' do, r la' sol fa

   %92
   mi16 re mi fa sol8 do, sol'[do,]
   sol' do, r4 r
   r8 si do re mi fad

   %95
   sol la, si do re mi
   fa sol, la si do re
   mi16 fa mi fa mi fa mi fa mi fa mi fa

   %98
   re mi re mi re mi re mi re mi re mi\mbreak
   do re do re do re do re do re do re
   si8 si16 do re do re mi fa mi fa re

   %101
   mi8 re16 do mi8 re16 do sol8 si
   do4 r8 sol la mi'
   fa4 r8 la, si fad'

   %104
   sol mi re do re mi
   si mi re do re mi
   si4 r8 do re si

   %107
   do sol'4 fa16 mi fa8 re
   do4\fermata  r r

}


IIvln = \relative do'' {

   do,16 re mi fa sol8[do,] sol' do,
   sol' do, r la' sol fa
   mi16 re mi fa sol8 do, sol'[do,]

   %4
   sol' do, r sol' la si
   do16 re do re do re do re do re do re
   si do si do si do si do si do si do

   %7
   la si la si la si la si la si la si
   sol la sol la sol la sol la sol  la sol la
   fa sol fa sol fa sol fa sol fa sol fa sol\mbreak

   %10
   mi fa  mi fa mi fa mi fa mi fa mi fa
   re4 r8 mi re do
   re4 r8 mi re do

   %13
   re8 re16 mi fa mi fa sol la sol la si
   do8 si16 la sol8 fa16 mi re4-+
   do16 re mi fa sol la sol la sol la sol la

   %16
   sol4 r r
   do,16 re mi fa sol la sol la sol la sol la
   sol8 do, r4 r

   %19
   R2.*2
   do16 re mi fa sol8 do, sol'[do,]

   %22
   sol' do, r4 r
   R2.*5

   %28
   fa16 sol la sib do8 fa, do'[fa,]
   do' fa, r4 r
   R2.*6

   %36
   sol16 la si do re8 sol, re'[sol,]
   re' sol, r mi' re do
   si16 la si do re8 sol, re'[sol,]

   %39
   re' sol, r4 r
   r8 fad sol la si dod\mbreak
   re mi, fad sol la si

   %42
   do re, mi fad sol la
   si16 do si do si do si do si do si do
   la si la si la si la si la si la si

   %45
   sol la sol la sol la sol la sol la sol la
   fad4 r8 sol fad mi
   fad4 r8 sol fad mi

   %48
   fad? fad16 sol la sol la si do si do la
   si8 la16 sol si8 la16 sol re8 fad
   sol4 r r\mbreak

   %51
   R2.
   sol16 la si do re8 sol, re'[sol,]
   re' sol, r4 r

   %54
   R2.*9
   do,16 re mi fa sol8 do, sol'[do,]
   sol' do, r4 r

   %65
   mi16 fad sold la si8 mi, si'[mi,]
   si' mi, r4 r
   mi16 fad sold la si8 mi, si'[mi,]

   %68
   si' mi, r4 r
   R2.*2\mbreak
   la16 si do re mi8 la, mi' [la,]

   %72
   mi' la, r fa' mi re
   do16 si do re mi8 la, mi' [la,]
   mi' la, r4 r

   %75
   sol16 la sol la sol la sol la sol la sol la
   sol4 r r
   re16 mi re mi re mi re mi re mi re mi

   %78
   re4 r r
   R2.*7
   fa16 sol fa sol fa sol fa sol fa sol fa sol

   %87
   fa4 r r
   fa16 sol fa sol fa sol fa sol fa sol fa sol
   fa4 r r\mbreak

   %90
   do16 re mi fa sol8 do, sol'[do,]
   sol' do, r la' sol fa

   %92
   mi16 re mi fa sol8 do, sol'[do,]
   sol' do, r sol' la si
   do16 re do re do re do re do re do re

   %95
   si do si do si do si do si do si do
   la si la si la si la si la si la si
   sol la sol la sol la sol la sol  la sol la

   %98
   fa sol fa sol fa sol fa sol fa sol fa sol\mbreak
   mi fa  mi fa mi fa mi fa mi fa mi fa
   re8re16 mi fa mi fa sol la sol la si

   %101
   do8 si16 la sol8 fa16 mi re4-+
   do8 sib' r sol la mi
   fa do' r la si! fad

   %104
   sol16 la sol la sol la sol la sol la sol la
   sol16 la sol la sol la sol la sol la sol la
   sol8 re' r fa,16 mi fa8 mi16 re

   %107
   mi8 do' re, do' re, si'
   do4\fermata r r

}

IIvlan = \relative do' {

   do16 re mi fa sol8[do,] sol' do,
   sol' do, r la' sol fa
   mi16 re mi fa sol8 do, sol'[do,]

   %4
   sol' do, r4 r
   r8 si do re mi fad
   sol la, si do re mi

   %7
   fa sol, la si do re
   mi16 fa mi fa mi fa mi fa mi fa mi fa
   re mi re mi re mi re mi re mi re mi\mbreak

   %10
   do re do re do re do re do re do re
   si4 r8 do si la
   si4 r8 do si la

   %13
   si si16 do  re do re mi fa mi fa re
   mi8 fa mi re16 do sol8 si
   do16 si do re mi fa mi fa mi fa mi fa

   %16
   mi4 r r
   do16 re mi fa sol8 do, sol'[do,]
   sol' do, r4 r

   %19
   R2.*2
   do16 re mi fa sol8 do, sol'[do,]

   %22
   sol' do, r4 r
   R2.*5

   %28
   fa16 sol la sib do8 fa, do'[fa,]
   do' fa, r4 r
   R2.*6

   %36
   sol16 la si do re8 sol, re'[sol,]
   re' sol, r mi' re do
   si16 la si do re8 sol, re'[sol,]

   %39
   re' sol, r re mi fad
   sol16 la sol la sol la sol la sol la sol la\mbreak
   fad sol fad sol fad sol fad sol fad sol fad sol

   %42
   mi fad mi fad mi fad mi fad mi fad mi fad
   re mi re mi re mi re mi re mi re mi
   do re do re do re do re do re do re

   %45
   si do si do si do si do si do si do
   la4 r8 si la sol
   la4 r8 si la sol

   %48
   la  la16 si do si do re mi re mi  fad
   sol8 fad16 mi re8 do16 si la4-+
   sol r r\mbreak

   %51
   R2.
   sol'16 la si do re8 sol, re'[sol,]
   re' sol, r4 r

   %54
   R2.*9
   do,16 re mi fa sol8 do, sol'[do,]
   sol' do, r4 r

   %65
   mi16 fad sold la si8 mi, si'[mi,]
   si' mi, r4 r
   mi16 fad sold la si8 mi, si'[mi,]

   %68
   si' mi, r4 r
   R2.*2\mbreak
   la,16 si do re mi8 la, mi' [la,]

   %72
   mi' la, r fa' mi re
   do16 si do re mi8 la, mi' [la,]
   mi' la, r4 r

   %75
   mi'16 fa mi fa mi fa mi fa mi fa mi fa
   mi4 r r
   si16 do si do si do si do si do si do

   %78
   si4 r r
   R2.*7
   re16 mi re mi re mi re mi re mi re mi

   %87
   re4 r r
   re16 mi re mi re mi re mi re mi re mi
   re4 r r\mbreak

   %90
   do16 re mi fa sol8 do, sol'[do,]
   sol' do, r la' sol fa

   %92
   mi16 re mi fa sol8 do, sol'[do,]
   sol' do, r4 r
   r8 si do re mi fad

   %95
   sol la, si do re mi
   fa sol, la si do re
   mi16 fa mi fa mi fa mi fa mi fa mi fa

   %98
   re mi re mi re mi re mi re mi re mi\mbreak
   do re do re do re do re do re do re
   si8 si16 do re do re mi fa mi fa re

   %101
   mi8 re16 do mi8 re16 do sol8 si
   do4 r8 sol la mi'
   fa4 r8 la, si fad'

   %104
   sol mi re do re mi
   si mi re do re mi
   si4 r8 do re si

   %107
   do sol'4 fa16 mi fa8 re
   do4\fermata  r r

}

IIbcn = \relative do {

   do4 r r
   do16 si do re mi8 fa mi re
   do4 r r

   %4
   do16 si do re mi8 do fa[re]
   la'4  la la
   sol sol sol

   %7
   fa fa fa
   mi8 re' dod[si] la dod
   re, do'! si[la] sol si\mbreak

   %10
   do, re mi[sol] mi do
   sol16 la sol la sol la sol la sol la sol la
   sol la sol la sol la sol la sol la sol la

   %13
   sol4 re'2
   do8 re mi fa sol sol,
   do4 do8 do do do

   %16
   do4 r r
   do do do
   do r r

   %19
   do fa fa,
   do'2 fa,4\mbreak
   do' r r

   %22
   r do do
   fa,2 r4
   sib2 la4

   %25
   sol r r
   do2 sib4
   la re8 sib do4

   %28
   fa, fa fa
   fa r re'
   do r la\mbreak

   %31
   sol2 r4
   do2 si!4
   la2 r4

   %34
   re2 do4
   si mi8 do re4
   sol, r r

   %37
   sol'16 fad sol la si8 do si la
   sol4 r r
   sol,16 fad sol la si8 sol do la

   %40
   mi'4 mi mi\mbreak
   re re re
   do do do

   %43
   si8 la' sold[fad] mi sold
   la, sol' fad8[mi] re fad
   sol, la si[re] si sol

   %46
   re'16 mi re mi re mi re mi re mi re mi
   re mi re mi re mi re mi re mi re mi
   re4 la2

   %49
   mi'4 si8 do re[fa,]
   sol4 r r\mbreak
   R2.

   %52
   sol'4 sol sol
   sol r r
   re r r

   %55
   sol, r r
   mi' r r
   fa r r

   %58
   re r r
   mi r r
   do r r\mbreak

   %61
   re r r
   si r sol'
   do, r r

   %64
   do re2
   mi4 r r
   mi do re

   %67
   mi r r
   mi la sold8 la
   si4 sold r

   %70
   la8 re, mi4 mi,\mbreak
   la r r
   la'16 sold la si do8 re do si

   %73
   la4 r r
   la, si2
   do4 r r

   %76
   do fa,2
   sol4 r r
   sol sol' sol,

   %79
   do r r\mbreak
   fa, r r
   re' r r

   %82
   sol, r r
   do r r
   fa r r

   %85
   do' r r
   si sol sol
   sol r r

   %88
   si sol sol
   sol r r\mbreak
   do,16 re mi fa sol8 do, sol'[do,]

   %91
   sol'8 do, r fa mi re
   do16 re mi fa sol8 do, sol'[do,]
   sol' do, r mi fa re

   %94
   la'4 la la
   sol sol sol
   fa fa fa

   %97
   mi8 mi' dod si la dod
   re, re' si la sol si\mbreak
   do, re mi sol mi do

   %100
   sol'4 re2
   la'4 mi8 fa sol sol,
   do4 r8 mi fa do

   %103
   fa,4 r8 fad' sol re
   sol, do si la si do
   sol do si la si do

   %106
   sol4 r8 sol la si
   do mi, fa4 sol
   do\fermata r r

}

IIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	s2.
	s4 <6> <6>8 <6>
	s2.
	s4 <6> s8 <6>
	s2 <5>8 <6\\>
	s2 <5>8 <6>
	s2 <5>8 <6>
	s4 <6 5> s
	s4 <6 5> s
	s <6> s
	<5 3> s8 <6 4> <5 3> <4 2>
	<5 3>4 s8 <6 4> <5 3> <4 2>
	s4 <5> <5>8 <6>
	s8 <6> <6> s s4
	s2.*9
	s2 <6 4>4
	<_->2.
	s2 <4 2>4
	<6>2.
	s
	s2 <5>8 <6\\>
	s2 <5>8 <6\\>
	s2.
	s2 <6 4>4
	s2.
	<_+>2 <4\+ 2>4
	<6>2 <_+>4
	s2.
	s4 <6> <6>8 <6\\>
	s2.
	s4 <6> s8 <6\\>
	s2 <5>8 <6\\>
	<_+>2 <5 _+>8 <6\\>
	s2 <5 3>8 <6>
	s8 <6\\> <6 5>4 <_+>
	s <6 5> s
	s <6> s
	<_+> s8 <6 4> <5 _+> <4 2>
	<5 _+>4 s8 <6 4> <5 _+> <4 2>
	<_+>4 <5> <5>8 <6\\>
	s4 <6> s8 <_+>
	s2.*4
	<_+>2.
	s
	<6>
	s
	<6 _->
	<5>
	s
	<5>
	<6>
	s
	s4 <6> <5>
	s2.
	<_+>4 s <9 7>
	<_+>2.
	<_+>2 <6>4
	s <5> s
	s2.*2
	s2 s8 <6\\>
	s2.
	s4 <6> <5>
	s2.
	s4 <6> <5>
	s2.*4
	<_+>2.
	s2.*4
	<6 5>4 <7> s
	<7>2.
	<6 5>
	<7>
	s4 <6 4> s
	<6 4> s <6>8 <6>
	s4 <6 4> s
	<6 4> s8 <6> s <6>
	s2 <5>8 <6\\>
	s2 <5>8 <6>
	s2 <5>8 <6>
	<5 3>4 <6 5> s
	s <6 5> s
	s <6> s
	s <5> <5>8 <6>
	s4 <6> s
	s s8 <6> s4
	s s8 <6> s <_+>
	s s <6> <6> <6> <6>
	s <6> s2
	s4 s8 <2> <6> <6>
	s <6> <6 5>4 s

}


forma = {

\key do\major
\time 3/4
\tempo 2 = 60
s2.*108
\bar"|."

}

IIchI = {
	\IIglobal
	\notypeset
	<<\IIchIn \forma>>

}

IIchII = {
	\IIglobal
	\clef bass
	<<\IIchIIn \forma>>

}

IIfgI = {
	\IIglobal
	\clef bass
	<<\IIfgIn \forma>>

}

IIfgII = {
	\IIglobal
	\clef bass
	<<\IIfgIIn \forma>>

}

IIvl = {
	\IIglobal
	<<\IIvln \forma>>

}


IIvla = {
	\IIglobal
	\clef alto
	<<\IIvlan \forma>>

}


IIbc = {
	\IIglobal
	\clef bass
	<< \IIbcn \forma \IIbfn >>
	\typeset

}

IIIglobal = 	{
   \override Score.MetronomeMark #'transparent = ##t
   \override Score.BarNumber #'font-size = #0.5
   \override Score.BarNumber #'padding = #1.3
   \override TupletBracket #'bracket-visibility = ##f
   \terzine \terzinesenza
}

IIIchIn = \relative do'' {

   sol2 sol2. sol4
   sol1.
   sib2 la2. sol4

   %4
   fa2. mi4 re2
   la' la2. la4
   la1.

   %7
   do2 si2. la4
   sol2. fad4 mi2
   si' do2. do4

   %10
   do2. la4 si2~
   si4 do la2. sol4\mbreak
   sol1.

   %13
   mi8(fa) sol2 sol4 la8(sol la do)
   la4 sol2 la8(si do4) mi,
   fa8(sol) la2 sol8(fa) sol(re mi fa)

   %16
   mi(re) do4 r mi8(sol) fa[(mi re do)]
   sol'(re do re) sol (re do re) sol (re do re)
   sol(mi re mi) sol(mi re mi) sol(mi re mi)

   %19
   la(mi re mi) la(mi re mi) la(mi re mi)
   la(fa mi fa) la(fa mi fa) la(fa mi fa)
   sib8 la sib2 sib4 do, sib'

   %22
   la8(sol) fa4 r la8(do) sib(la sol fa)\mbreak
   do'(sol fa sol) do(sol fa sol) do(sol fa sol)
   do(la sol la) do(la sol la) do(la sol la)

   %25
   re(la sol la) re (la sol la) re(la sol la)
   re(si la si) re(si la si) re(si la si)
   sol2 sol2. sol4

   %28
   sol1.
   sib2 la2. sol4
   fa2.-+  mi4 re2

   %31
   la' la2. la4
   la1.
   do2 si2. la4

   %34
   sol2. fad4 mi2
   do' fa,!2.-+ fa4
   fa2. re4 mi2~

   %37
   mi4 fa re2.-+ do4
   do1.\fermata

}

IIIchIIn = \relative do {

   mi2 mi2. mi4
   mi1.
   dod2 dod2. mi4

   %4
   re2.-+ dod4 re2
   fad fad2. fad4
   fad?1.

   %7
   red2 red2. fad4
   mi2. red4 mi2
   sol la2. sol4

   %10
   fad2. fad4 sol2~
   sol4 la fad2. sol4\mbreak
   sol1.

   %13
   do,4 re mi do fa fa,
   do' do8 re mi4 fa mi do
   re do si la si sol

   %16
   do2_\upl do_\upl do_\upl
   si_\upl si_\upl si_\upl
   do_\upl do_\upl do_\upl

   %19
   dod2_\upl dod_\upl dod_\upl
   re\upl re\upl re\upl
   sol4 fa mi re mi do

   %22
   fa2\upl fa\upl fa\upl
   mi\upl mi\upl mi\upl
   fa\upl fa\upl fa\upl

   %25
   fad\upl fad\upl fad\upl
   sol\upl sol\upl sol\upl
   mi mi2. mi4

   %28
   mi1.
   dod2 dod2. mi4
   re2.-+ dod4 re2

   %31
   fad fad2. fad4
   fad?1.
   red2 red2. fad4

   %34
   mi2. red4 mi2
   mi re!2. re4
   sol,1 do2~

   %37
   do4 re si2. do4
   do1.\fermata

}

IIIfgIn = \relative do {

   sol'2 sol2. sol4
   sol1.
   sib2 la2. sol4

   %4
   fa2. mi4 re2
   la' la2. la4
   la1.

   %7
   do2 si2. la4
   sol2. fad4 mi2
   si' do2. do4

   %10
   do2. la4 si2~
   si4 do la2. sol4\mbreak
   sol1.

   %13
   R1.*14
   sol2 sol2. sol4

   %28
   sol1.
   sib2 la2. sol4
   fa2.-+  mi4 re2

   %31
   la' la2. la4
   la1.
   do2 si2. la4

   %34
   sol2. fad4 mi2
   do' fa,!2.-+ fa4
   fa2. re4 mi2~

   %37
   mi4 fa re2.-+ do4
   do1.\fermata

}

IIIfgIIn = \relative do {

   mi2 mi2. mi4
   mi1.
   dod2 dod2. mi4

   %4
   re2.-+ dod4 re2
   fad fad2. fad4
   fad?1.

   %7
   red2 red2. fad4
   mi2. red4 mi2
   sol la2. sol4

   %10
   fad2. fad4 sol2~
   sol4 la fad2. sol4\mbreak
   sol1.

   %13
   R1.*14
   mi2 mi2. mi4

   %28
   mi1.
   dod2 dod2. mi4
   re2.-+ dod4 re2

   %31
   fad fad2. fad4
   fad?1.
   red2 red2. fad4

   %34
   mi2. red4 mi2
   mi re!2. re4
   sol,1 do2~

   %37
   do4 re si2. do4
   do1.\fermata

}


IIIvln = \relative do'' {

   sol2 sol2. sol4
   sol1.
   sib2 la2. sol4

   %4
   fa2. mi4 re2
   la' la2. la4
   la1.

   %7
   do2 si2. la4
   sol2. fad4 mi2
   si' do2. do4

   %10
   do2. la4 si2~
   si4 do la2. sol4\mbreak
   sol1.

   %13
   R1.*14
   sol2 sol2. sol4

   %28
   sol1.
   sib2 la2. sol4
   fa2.-+  mi4 re2

   %31
   la' la2. la4
   la1.
   do2 si2. la4

   %34
   sol2. fad4 mi2
   do' fa,!2.-+ fa4
   fa2. re4 mi2~

   %37
   mi4 fa re2.-+ do4
   do1.\fermata

}

IIIvlan = \relative do' {

   mi2 mi2. mi4
   mi1.
   dod2 dod2. mi4

   %4
   re2.-+ dod4 re2
   fad fad2. fad4
   fad?1.

   %7
   red2 red2. fad4
   mi2. red4 mi2
   sol la2. sol4

   %10
   fad2. fad4 sol2~
   sol4 la fad2. sol4\mbreak
   sol1.

   %13
   R1.*14
   mi2 mi2. mi4

   %28
   mi1.
   dod2 dod2. mi4
   re2.-+ dod4 re2

   %31
   fad fad2. fad4
   fad?1.
   red2 red2. fad4

   %34
   mi2. red4 mi2
   mi re!2. re4
   sol,1 do2~

   %37
   do4 re si2. do4
   do1.\fermata

}

IIIbcn = \relative do {

   do2 do2. do4
   sib1.
   la2 la2. la4

   %4
   re1 re,2
   re' re2. re4
   do1.

   %7
   si2 si2. si4
   mi1 mi,2
   mi' do la

   %10
   re1 sol2
   do, re re,\mbreak
   sol1.

   %13
   R1.*14
   do2 do2. do4
   sib1.

   %29
   la2 la2. la4
   re1 re,2
   re' re2. re4

   %32
   do1.
   si2 si2. si4
   mi1 mi,2

   %35
   la re do
   si1 do2
   fa, sol1

   %38
   do,1.\fermata

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1.
   <4 2>
   <9- _+>2 <8 _+>1
   s1.
   <_+>
   <4\+ 2>
   <9 _+>2 <8 _+>1
   s1.
   s2 <6> s
   <7 _+>1.
   s1.*17
   <4 2>1.
   <9- _+>2 <8 _+>1
   s1.
   <_+>
   <4\+ 2>
   <9 _+>2 <8 _+>1
   s1.
   s2 <_-> <4 2>
   <6 5>

}


forma = {

   \key do\major
   \time 3/2
   \tempo 1 = 35
   s1.*38
   \bar"|."

}

IIIchI = {
   \IIIglobal
   \notypeset
   <<\IIIchIn \forma>>

}

IIIchII = {
   \IIIglobal
   \clef bass
   <<\IIIchIIn \forma>>

}

IIIfgI = {
   \IIIglobal
   \clef bass
   <<\IIIfgIn \forma>>

}

IIIfgII = {
   \IIIglobal
   \clef bass
   <<\IIIfgIIn \forma>>

}

IIIvl = {
   \IIIglobal
   <<\IIIvln \forma>>

}


IIIvla = {
   \IIIglobal
   \clef alto
   <<\IIIvlan \forma>>

}


IIIbc = {
   \IIIglobal
   \clef bass
   << \IIIbcn \forma \IIIbfn >>
   \typeset

}

IVglobal = 	{
   \override Score.MetronomeMark #'transparent = ##t
   \override Score.BarNumber #'font-size = #0.5
   \override Score.BarNumber #'padding = #1.3
   \override TupletBracket #'bracket-visibility = ##f
   \terzine \terzinesenza
}

IVchIn = \relative do'' {

   do4 si
   do8 si16 la sol fa mi re
   do'4 si

   %4
   do8 si16 la sol fa mi re
   la'4 sol
   fa8[re mi do]

   %7
   fa4 mi
   re r
   do'4\p si

   %10
   do8 si16 la sol fa mi re
   do'4 si
   do8 si16 la sol fa mi re

   %13
   la'4 sol
   fa8[re mi do]
   fa4 mi

   %16
   re r
   sol2\f
   la\mbreak

   %19
   si
   r8 do[do do]
   sol do do4

   %22
   la8 re re4
   si r8 si
   do4 r8 do

   %25
   re4 r8 re
   mi do re4
   mi8 do re4

   %28
   mi8 re16 mi fa8 mi
   re[do sol do]
   si16(do re8) re4

   %31
   do4 si
   do8 si16 la sol fa mi re
   do'4 si

   %34
   do8 si16 la sol fa mi re
   la'4 sol
   fa8[re mi do']

   %37
   mi,4 re
   do2
   sol'4.(la8)

   %40
   sol4.(la8)
   sol16 fa mi fa sol8 la
   sol4 r

   %43
   sol4.(la8)
   sol4.(la8)
   sol16 fa mi fa sol8 la

   %46
   sol4 r8 sol
   do[sol mi sol]
   do16 sol mi sol do8 sol\mbreak

   %49
   la16 fa la8 la4
   fa16 do fa8 fa la
   re[la fad la]

   %52
   re16[la fad la] re8 la\mbreak
   si16 sol si8 si4
   sol16 re sol8 sol4

   %55
   R2*4
   sol2
   si

   %61
   dod
   re4 r8 do!
   si16 sol sol si la fad fad la

   %64
   si sol sol si la fad fad la
   si sol sol si si sol sol si
   do sol sol do do sol sol do

   %67
   re sol, sol re' re sol, sol re'\mbreak
   mi8 fad, sol do
   si4 la

   %70
   sol r
   R2*12
   sol16 mi do mi sol4

   %84
   sib16 sol mi sol sib4
   re8 do4 sib8\mbreak
   la16 fa la8 fa4

   %87
   R2*4
   la16 fa do fa la4
   sol16 mi do mi sol4

   %93
   fa8 si16 do re8 fa,
   mi16 do mi8 re4
   sol r

   %96
   sol r
   sol r
   sol r

   %99
   do16 sol sol do do sol sol do
   la fa fa la la fa fa la
   la mi mi la la mi mi la\mbreak

   %102
   fa re re fa fa re re fa
   sol re re sol sol re re sol
   mi8[do' do do]

   %105
   sol do do4
   la8 re re4
   si r8 si

   %108
   do4 r8 do
   re4 r8 re
   mi[do re sol,]

   %111
   do4 si
   do8 si16 la sol fa mi re
   do'4 si

   %114
   do8 si16 la sol fa mi re
   la'4 sol
   fa8[re mi do']

   %117
   mi,4 re\mbreak
   do8 mi mi4
   sol16 mi sol8 sol4

   %120
   do16 sol do8 do4
   R2*3
   sol2

   %125
   la
   si
   do

   %128
   re
   mi8 do re4
   mi8 re16 mi fa8 mi

   %131
   re[do sol do]
   si16(do re8) re4
   do4 si

   %134
   do8 si16 la sol fa mi re
   do'4 si
   do8 si16 la sol fa mi re

   %137
   la'4 sol
   fa8 mi16 re mi8 do'
   mi,4 re

   %140
   do2\fermata
   R2*16
   sib'8[sol sol sib]

   %158
   sib16(sol sib8) la4
   sib16 sol sib8 do4
   sib16 sol sib8 la4

   %161
   sib4(la8) sib
   do4 r8 do
   do4(sib8) do\mbreak

   %164
   re4(do8) sib
   do4. sol8
   la4 sib8 do

   %167
   la4. sib8
   sib[fa fa sib]
   sib16 fa sib8 la4

   %170
   sib16 fa sib8 do4
   sib16 fa sib8 la4
   sib8[fa sib do]

   %173
   la4. sib8
   sib2
   R2*8

   %183
   sib8\p[(sib) sib(sib)]
   sib[(sib) sib(sib)]
   sib[(sib) sib(sib)]

   %186
   sib[(sib) sib(sib)]
   R2*4
   sol8\p[(sol) sol(sol)]

   %192
   sol[(sol) sol(sol)]
   sol[(sol) sol(sol)]
   sol[(sol) sol(sol)]\mbreak

   %195
   R2*14

}

IVchIIn = \relative do {

   mi4 re
   mi r
   mi re

   %4
   mi r
   do do
   si do

   %7
   re do
   si r
   mi\p re

   %10
   mi r
   mi re
   mi r

   %13
   do do
   si do
   re do

   %16
   si r
   r8 sol'\f[sol sol]
   do, fa fa4\mbreak

   %19
   re8 sol sol4
   mi r8 mi
   sol4 r8 sol

   %22
   la4 r8 la
   sol,2
   la

   %25
   si
   do8 mi sol4
   do,8 mi sol4

   %28
   mi8 re16 mi fa8 mi
   re[do sol do]
   si16(do re8) re4

   %31
   mi re
   mi r
   mi re

   %34
   mi r\mbreak
   do do
   si do~

   %37
   do si
   do2
   mi4. (fa8)

   %40
   mi4.(fa8)
   mi16 re do re mi8 fa

   %42
   mi4 r
   mi4.(fa8)
   mi4.(fa8)

   %45
   mi16 re do re mi8 fa
   mi4 r
   r8 mi[do mi]

   %48
   r8 do mi16 do mi8
   fa16 do fa8 fa4
   la,16 fa la8 la4

   %51
   r8 fad'[re fad]
   r re fad16 re fad8\mbreak
   sol16 re sol8 sol4

   %54
   si,16 sol si8 si4
   R2*4
   r8 sol'[sol sol]

   %60
   re sol sol4
   mi8 la la4
   fad r8 fad

   %63
   sol16 re re sol fad re re fad
   sol re re sol fad re re fad
   sol re re sol sol re re sol

   %66
   sol mi mi sol sol mi mi sol
   sol re re sol sol re re sol\mbreak
   sol4 r8 sol

   %69
   sol4 fad
   sol r
   R2*12

   %83
   mi16 do sol do mi4
   sol16 mi do mi sol4
   mi  fa8 sol\mbreak

   %86
   do,16 la do8 la4
   R2*4
   do16 la fa la do4

   %92
   mi16 do sol do mi4
   re8 sol, 4 re'8
   do16 sol do8 si4

   %95
   sol' r
   sol r
   sol r

   %98
   sol r
   sol16 mi mi sol sol mi mi sol
   fa do do fa fa do do fa

   %101
   mi dod dod mi mi dod dod mi\mbreak
   re16 la la re re la la re
   re si si re re si si re

   %104
   do2
   mi
   fad

   %107
   r8 sol[sol sol]
   do, fa fa4
   re8 sol sol4

   %110
   sol,8 do si4
   sol' re
   mi r

   %113
   mi re
   mi r
   do do

   %116
   si do~
   do si\mbreak
   do16 sol do8 do4

   %119
   mi16 do mi8 mi4
   sol16 mi sol8 mi4
   R2*3

   %124
   r8 sol[sol sol]
   do, fa fa4
   re8 sol sol4

   %127
   do,8 mi mi4
   re8 fa fa4
   mi8 do re4

   %130
   mi8 re16 mi fa8 mi
   re[do sol do]
   si16 (do re8) re4

   %133
   mi re\mbreak
   mi r
   mi re

   %136
   mi r
   do do
   si do~

   %139
   do si
   do2\fermata
   R2*16

   %157
   sol'8[re re sol]
   sol16(re sol8) fad4
   sol16 re sol8 la4

   %160
   sol16 re sol8 fad4
   r sib,~
   sib la8 sol

   %163
   la4 r8 la\mbreak
   sib4 fa'
   sol8 fa mib4~

   %166
   mib8[do re mib]
   do4. sib8
   sib[re re sib]

   %169
   re16 sib re8 do4
   re16 sib re8 mib4
   re16 sib re8 do4

   %172
   re8 do16(sib) fa'8 mib
   do4. sib8
   sib2

   %175
   R2*8
   sib8\p[(sib) sib(sib)]
   sib[(sib) sib(sib)]

   %185
   sib[(sib) sib(sib)]
   sib[(sib) sib(sib)]
   R2*4

   %191
   sol8\p[(sol) sol(sol)]
   sol8[(sol) sol(sol)]
   sol8[(sol) sol(sol)]

   %194
   sol8[(sol) sol(sol)]\mbreak
   R2*14

}

IVfgIn = \relative do {

   do'4 si
   do8 si16 la sol fa mi re
   do'4 si

   %4
   do8 si16 la sol fa mi re
   la'4 sol
   fa8[re mi do]

   %7
   fa4 mi
   re r
   do'4\p si

   %10
   do8 si16 la sol fa mi re
   do'4 si
   do8 si16 la sol fa mi re

   %13
   la'4 sol
   fa8[re mi do]
   fa4 mi

   %16
   re r
   sol2\f
   la\mbreak

   %19
   si
   r8 do[do do]
   sol do do4

   %22
   la8 re re4
   si r8 si
   do4 r8 do

   %25
   re4 r8 re
   mi do re4
   mi8 do re4

   %28
   mi8 re16 mi fa8 mi
   re[do sol do]
   si16(do re8) re4

   %31
   do4 si
   do8 si16 la sol fa mi re
   do'4 si

   %34
   do8 si16 la sol fa mi re
   la'4 sol
   fa8[re mi do']

   %37
   mi,4 re
   do2
   R2*3

   %42
   sol8 do do4
   R2*3
   sol8 do do4

   %47
   R2*8
   r8 re'[re re]
   sol, do do4

   %57
   la8 re re4
   si16(do re8) sol,4
   R2*3

   %62
   la,8 re re4
   R2*7
   re8 la' la4

   %71
   si8 sol la4
   si8 la16 si do8 si
   la sol re sol

   %74
   fad16(sol la8) la4
   sol' fad
   sol8 fad16 mi re do si la

   %77
   sol'4 fad
   sol8 fad16 mi re do si la
   mi'4 re

   %80
   do8[la si sol']
   si,4 la
   sol2

   %83
   R2*4
   fa'4 mi
   fa8 mi16 re do sib la sol

   %89
   fa4 mi
   fa r
   R2*4

   %95
   sol,8 do do4
   sol8 re' re4
   sol,8 mi' mi4

   %98
   sol,8 re' re4
   R2*22
   do2

   %122
   mi
   fad
   sol

   %125
   la
   si
   do

   %128
   re
   mi8 do re4
   mi8 re16 mi fa8 mi

   %131
   re[do sol do]
   si16(do re8) re4
   do4 si

   %134
   do8 si16 la sol fa mi re
   do'4 si
   do8 si16 la sol fa mi re

   %137
   la'4 sol
   fa8 mi16 re mi8 do'
   mi,4 re

   %140
   do2\fermata
   mib4(re8-+) mib
   re4 r8 sol

   %143
   fa4(mib8-+) re
   mib4 do
   lab'(sol8-+) fa

   %146
   sib4 r8 lab
   sol4(fa8-+) mib
   mib2\mbreak

   %149
   sol4(fa8) mib
   fa4. sol8
   lab4(sol8) lab

   %152
   sol2
   do4 sib8 (la?)
   re4. do8

   %155
   sib4 (la8.) sol16
   sol2
   R2*18

   %175
   lab4(sol8) fa
   sol4 r8 reb'
   do4. sib8

   %178
   lab4 sol8(fa)
   solb4 fa8(mi)\mbreak
   fa4. sib8

   %181
   lab4(sol8.) fa16
   fa2
   lab4(sol8) lab

   %184
   sol4 r
   lab4(sol8) lab
   sol4 r

   %187
   sol fa8(mib)
   re4 mib8(fa)
   mib4 re8(do)

   %190
   re4 sol,
   mib'(re8) mib
   re4 r

   %193
   mib(re8) mib
   re4 r\mbreak
   mib8[do do mib]

   %196
   mib16(do) mib8 re4
   mib16(do) mib8 fa4
   mib16(do) mib8 re4

   %199
   lab'4. sol8
   fa4(mib8) re
   mib4(re8.) do16

   %202
   fad4 r
   fa! r
   mib4(re8) mib

   %205
   re4 r
   lab'4. sol8
   fa4(mib8) re

   %208
   mib4(re8.-+) do16

}

IVfgIIn = \relative do {

   mi4 re
   mi r
   mi re

   %4
   mi r
   do do
   si do

   %7
   re do
   si r
   mi\p re

   %10
   mi r
   mi re
   mi r

   %13
   do do
   si do
   re do

   %16
   si r
   r8 sol'\f[sol sol]
   do, fa fa4\mbreak

   %19
   re8 sol sol4
   mi r8 mi
   sol4 r8 sol

   %22
   la4 r8 la
   sol,2
   la

   %25
   si
   do8 mi sol4
   do,8 mi sol4

   %28
   mi8 re16 mi fa8 mi
   re[do sol do]
   si16(do re8) re4

   %31
   mi re
   mi r
   mi re

   %34
   mi r\mbreak
   do do
   si do~

   %37
   do si
   do2
   R2*3

   %42
   sol8 do do4
   R2*3
   sol8 do do4

   %47
   R2*8
   fad4 r8 fad
   sol4 r8 sol

   %57
   la4 r8 la
   re, sol si,4
   R2*3

   %62
   la8 re re4
   R2*7
   si8 re re4

   %71
   sol8 re fad4
   sol8 re sol fad
   mi4 re8 dod

   %74
   re16(mi fad8) fad4
   si la
   si r

   %77
   si la
   si r
   sol sol

   %80
   fad sol~
   sol fad
   sol2

   %83
   R2*4
   la4 sol
   la r

   %89
   la, sol
   la r
   R2*4

   %95
   sol8 do do4
   sol8 re' re4
   sol,8 mi' mi4

   %98
   sol,8 re' re4
   R2*22
   r8 do[do do]

   %122
   sol do do4
   la8 re re4
   si8[sol' sol sol]

   %125
   do, fa fa4
   re8 sol sol4
   do,8 mi mi4

   %128
   re8 fa fa4
   mi8 do re4
   mi8 re16 mi fa8 mi

   %131
   re[do sol do]
   si16(do re8) re4
   mi re\mbreak

   %134
   mi r
   mi re
   mi r

   %137
   do do
   si do~
   do si

   %140
   do2\fermata
   do4(si8-+) do
   si4 r8 do

   %143
   re4(do8)-+ si
   do4 sol
   do re

   %146
   mib r8 mib
   mib4(re8.-+) mib16
   mib2\mbreak

   %149
   mib4(re8) do
   re4. mib8
   re8[(fa) mib(re)]

   %152
   mib2
   mi4 fad
   sol4. sol8

   %155
   sol4(fad8.) sol16
   sol2
   R2*18

   %175
   fa4(mi8) fa
   mi4 r8 fa
   fa4 mi

   %178
   fa4. do8
   reb8 do reb4\mbreak
   do fa

   %181
   fa(mi8.) fa16
   fa2
   fa4(mib!8) re

   %184
   mib4 r
   fa4(mib8) re
   mib4 r

   %187
   mib re8(do)
   si4 do8(re)
   do4 si8(la)

   %190
   si4 r
   do(si8) do
   si4 r

   %193
   do4(si8) do
   si4 r\mbreak
   do8[sol sol do]

   %196
   do16(sol) do8  si4
   do16(sol) do8 re4
   do16(sol) do8 si4

   %199
   do4~do
   si do~
   do(si8.) do16

   %202
   do4 r
   re r
   do(si8) do

   %205
   si4 r
   do~do
   si do~

   %208
   do(si8.-+) do16

}


IVvln = \relative do'' {

   do4 si
   do8 si16 la sol fa mi re
   do'4 si

   %4
   do8 si16 la sol fa mi re
   la'4 sol
   fa8[re mi do]

   %7
   fa4 mi
   re r
   do'4\p si

   %10
   do8 si16 la sol fa mi re
   do'4 si
   do8 si16 la sol fa mi re

   %13
   la'4 sol
   fa8[re mi do]
   fa4 mi

   %16
   re r
   sol2\f
   la\mbreak

   %19
   si
   r8 do[do do]
   sol do do4

   %22
   la8 re re4
   si r8 si
   do4 r8 do

   %25
   re4 r8 re
   mi do re4
   mi8 do re4

   %28
   mi8 re16 mi fa8 mi
   re[do sol do]
   si16(do re8) re4

   %31
   do4 si
   do8 si16 la sol fa mi re
   do'4 si

   %34
   do8 si16 la sol fa mi re
   la'4 sol
   fa8[re mi do']

   %37
   mi,4 re
   do2

   R2*3

   %42
   sol8 do do4
   R2*3
   sol8 do do4

   %47
   R2*8
   r8 re'[re re]
   sol, do do4

   %57
   la8 re re4
   si16(do re8) sol,4
   R2*3

   %62
   la,8 re re4
   R2*7
   re8 la' la4

   %71
   si8 sol la4
   si8 la16 si do8 si
   la sol re sol

   %74
   fad16(sol la8) la4
   sol' fad
   sol8 fad16 mi re do si la

   %77
   sol'4 fad
   sol8 fad16 mi re do si la
   mi'4 re

   %80
   do8[la si sol']
   si,4 la
   sol2

   %83
   R2*4
   fa'4 mi
   fa r

   %89
   fa,4 mi
   fa r
   R2*4

   %95
   sol,8 do do4
   sol8 re' re4
   sol,8 mi' mi4

   %98
   sol,8 re' re4
   R2*22
   do2

   %122
   mi
   fad
   sol

   %125
   la
   si
   do

   %128
   re
   mi8 do re4
   mi8 re16 mi fa8 mi

   %131
   re[do sol do]
   si16(do re8) re4
   do4 si

   %134
   do8 si16 la sol fa mi re
   do'4 si
   do8 si16 la sol fa mi re

   %137
   la'4 sol
   fa8 mi16 re mi8 do'
   mi,4 re

   %140
   do2\fermata
   mib4(re8-+) mib
   re4 r8 sol

   %143
   fa4(mib8-+) re
   mib4 do
   lab'(sol8-+) fa

   %146
   sib4 r8 lab
   sol4(fa8-+) mib
   mib2\mbreak

   %149
   sol4(fa8) mib
   fa4. sol8
   lab4(sol8) lab

   %152
   sol2
   do4 sib8 (la?)
   re4. do8

   %155
   sib4 (la8.) sol16
   sol2
   R2*18

   %175
   lab4(sol8) fa
   sol4 r8 reb'
   do4. sib8

   %178
   lab4 sol8(fa)
   solb4 fa8(mi)\mbreak
   fa4. sib8

   %181
   lab4(sol8.) fa16
   fa2
   lab4(sol8) lab

   %184
   sol4 r
   lab4(sol8) lab
   sol4 r

   %187
   sol fa8(mib)
   re4 mib8(fa)
   mib4 re8(do)

   %190
   re4 sol,
   mib'(re8) mib
   re4 r

   %193
   mib(re8) mib
   re4 r\mbreak
   mib8[do do mib]

   %196
   mib16(do) mib8 re4
   mib16(do) mib8 fa4
   mib16(do) mib8 re4

   %199
   lab'4. sol8
   fa4(mib8) re
   mib4(re8.) do16

   %202
   fad4 r
   fa! r
   mib4(re8) mib

   %205
   re4 r
   lab'4. sol8
   fa4(mib8) re

   %208
   mib4(re8.-+) do16

}

IVvlan = \relative do' {

   mi4 re
   mi r
   mi re

   %4
   mi r
   do do
   si do

   %7
   re do
   si r
   mi\p re

   %10
   mi r
   mi re
   mi r

   %13
   do do
   si do
   re do

   %16
   si r
   r8 sol'\f[sol sol]
   do, fa fa4\mbreak

   %19
   re8 sol sol4
   mi r8 mi
   sol4 r8 sol

   %22
   la4 r8 la
   sol,2
   la

   %25
   si
   do8 mi sol4
   do,8 mi sol4

   %28
   mi8 re16 mi fa8 mi
   re[do sol do]
   si16(do re8) re4

   %31
   mi re
   mi r
   mi re

   %34
   mi r\mbreak
   do do
   si do~

   %37
   do si
   do2
   R2*3

   %42
   sol8 do do4
   R2*3
   sol8 do do4

   %47
   R2*8
   fad4 r8 fad
   sol4 r8 sol

   %57
   la4 r8 la
   re, sol si,4
   R2*3

   %62
   la8 re re4
   R2*7
   si8 re re4

   %71
   sol8 re fad4
   sol8 re sol fad
   mi4 re8 dod

   %74
   re16(mi fad8) fad4
   si la
   si r

   %77
   si la
   si r
   sol sol

   %80
   fad sol~
   sol fad
   sol2

   %83
   R2*4
   la4 sol
   la r

   %89
   la, sol
   la r
   R2*4

   %95
   sol8 do do4
   sol8 re' re4
   sol,8 mi' mi4

   %98
   sol,8 re' re4
   R2*22
   r8 do[do do]

   %122
   sol do do4
   la8 re re4
   si8[sol' sol sol]

   %125
   do, fa fa4
   re8 sol sol4
   do,8 mi mi4

   %128
   re8 fa fa4
   mi8 do re4
   mi8 re16 mi fa8 mi

   %131
   re[do sol do]
   si16(do re8) re4
   mi re\mbreak

   %134
   mi r
   mi re
   mi r

   %137
   do do
   si do~
   do si

   %140
   do2\fermata
   do4(si8-+) do
   si4 r8 do

   %143
   re4(do8)-+ si
   do4 sol
   do re

   %146
   mib r8 mib
   mib4(re8.-+) mib16
   mib2\mbreak

   %149
   mib4(re8) do
   re4. mib8
   re8[(fa) mib(re)]

   %152
   mib2
   mi4 fad
   sol4. sol8

   %155
   sol4(fad8.) sol16
   sol2
   R2*18

   %175
   fa4(mi8) fa
   mi4 r8 fa
   fa4 mi

   %178
   fa4. do8
   reb8 do reb4\mbreak
   do fa

   %181
   fa(mi8.) fa16
   fa2
   fa4(mib!8) re

   %184
   mib4 r
   fa4(mib8) re
   mib4 r

   %187
   mib re8(do)
   si4 do8(re)
   do4 si8(la)

   %190
   si4 r
   do(si8) do
   si4 r

   %193
   do4(si8) do
   si4 r\mbreak
   do8[sol sol do]

   %196
   do16(sol) do8  si4
   do16(sol) do8 re4
   do16(sol) do8 si4

   %199
   do4~do
   si do~
   do(si8.) do16

   %202
   do4 r
   re r
   do(si8) do

   %205
   si4 r
   do~do
   si do~

   %208
   do(si8.-+) do16

}

IVbcn = \relative do {

   do'4 sol
   do, r
   do' sol

   %4
   do, r
   fa mi
   re do

   %7
   si do
   sol' r
   do\p sol

   %10
   do, r
   do' sol
   do, r

   %13
   fa mi
   re do
   si do

   %16
   sol' r
   R2*3
   do,2

   %21
   mi
   fad
   r8 sol[sol sol]

   %24
   do, fa fa4
   re8 sol sol4
   do, r8 si'

   %27
   do4 r8 si
   do[si la sol]
   fa4 mi8 do

   %30
   sol'4 sol,
   do sol'
   do, r

   %33
   do sol'
   do, r\mbreak
   fa mi

   %36
   re do
   sol' sol,
   do2

   %39
   R2*3
   sol8 do do4
   R2*3

   %46
   sol8 do do4
   do, r
   do' r

   %49
   fa, r
   fa r
   re r

   %52
   re' r\mbreak
   sol, r
   sol' r

   %55
   re2
   mi
   fad

   %58
   sol
   sol,4 r8 sol
   sol'4 r8 mi

   %61
   la4 r8 la,
   re4 r8 re
   sol,4 re'

   %64
   sol re
   sol, r
   mi' r

   %67
   si r\mbreak
   do si8 do
   re4 re,

   %70
   sol r8 fad'
   sol4 re'8 re,
   sol[fad mi re]

   %73
   do4 si8 mi
   re4 r
   sol re

   %76
   sol, r
   sol' re
   sol, r

   %79
   do si
   la sol
   re' re,

   %82
   sol8[la si sol]
   do4 r8 do
   mi4 r8 mi

   %85
   do4 re8 mi\mbreak
   fa4 r
   fa do'

   %88
   fa, r
   fa do
   fa8 mi16 re do sib la sol

   %91
   fa4 r8 fa'
   do4 r8 do
   si4 r8 si

   %94
   do4 sol'
   mi r
   si r

   %97
   do r
   sol' r
   mi4 r8 do

   %100
   fa4 r
   dod r8 la\mbreak
   re4 r

   %103
   si r8 sol
   do4 r
   R2*2

   %107
   sol2
   la
   si

   %110
   do4 sol'
   mi sol
   do, r

   %113
   do' sol
   do, r
   fa mi

   %116
   re do
   sol' sol,\mbreak
   do4 r

   %119
   R2*5
   r8 sol'[sol sol]
   do, fa fa4

   %126
   re8 sol sol4
   mi8 do' do4
   sol8 re' re4

   %129
   do sol
   do8[si la sol]
   fa4 mi8 do

   %132
   sol'4 sol,
   do' sol\mbreak
   do, r

   %135
   do' sol
   do, r
   fa mi

   %138
   re do
   sol' sol,
   do2\fermata

   %141
   do4~do
   sol'(mib)
   fa (sol)

   %144
   do,(mib)
   fa,(sib)
   sol(lab)

   %147
   sib~sib
   mib,~mib\mbreak
   mib'~mib

   %150
   sib'~sib
   sib,~sib
   mib~mib

   %153
   la,!(re)
   sib(do)
   re~re

   %156
   sol,2
   sol'4 sol,
   r re'

   %159
   r re
   r re
   sol~sol

   %162
   mib~mib
   fa~fa\mbreak
   sib,~sib

   %165
   mib~mib
   fa (sib,)
   fa' fa,

   %168
   sib sib'
   r fa
   r fa

   %171
   r fa
   sib,8[do re mib]
   fa4 fa,

   %174
   sib2
   fa'4~fa
   do (sib)

   %177
   do~do
   fa,~fa
   sib~sib\mbreak

   %180
   lab(sib)
   do~do
   fa (mib)

   %183
   re (sib)
   mib r
   re (sib)

   %186
   mib r
   mib (fa)
   sol r

   %189
   do, r
   sol r
   do~do

   %192
   sol' r
   do,~do
   sol r\mbreak

   %195
   do mib8 do
   do sol' sol4
   do,8 sol' sol4

   %198
   do,8 sol' sol4
   fa(mib)
   re(do)

   %201
   sol' sol,
   la! r
   si r

   %204
   do~do
   sol r
   fa'(mib)

   %207
   re(do)
   sol' sol,

}

IVbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s2*4
   s4 <6>
   <6>2
   <6 5>
   s2*5
   s4 <6>
   <6>2
   <6 5>
   s2*6
   <6>2
   s
   <6>
   <6>
   s4 s8 <6>
   s2
   s8 <6> <6> <6>
   <6 5>4 <6>
   s2*5
   s4 <6>
   <6>2
   <6 4>4 <5/ 3>
   s2*4
   <6 4>2
   s2*3
   <6 4>2
   s2*4
   <_+>2
   <_+>
   s
   s
   <_+>
   <6>
   <6>
   s2*3
   <_+>2
   <_+>
   s4 <_+>
   s <_+>
   s2
   <6>
   <6>
   s
   s
   s4 s8 <6>
   s4 <_+>
   s8 <6> <6> <6 _+>
   <5>4 <6>8 <6\\>
   s2
   s4 <_+>
   s2
   s4 <_+>
   s2
   s4 <6>
   <6\\>2
   <6 4>4 <5 _+>
   s <6>
   s2
   <6 5->
   <7+>4 s8 <6>
   s2*7
   <6 5>2
   s
   <6>
   <6>
   s
   s
   <6>
   s2*3
   <6>2
   s2*4
   <7>4 <6>
   <6>2
   s
   <6>
   s2*3
   s4 <6>
   <6>2
   <6 4>4 <5 3>
   s2*7
   <6>2
   <6>
   <6>
   s8 <6> s4
   s2
   s8 <6> <6> <6>
   <6>8 <5> <6>4
   s2*5
   s4 <6>
   <6>2
   <6 4>4 <5 3>
   s2*2
   <_!>4 <6>
   <6 5 _-> <_!>
   s <6>
   s2
   <6>
   <6 4>4 <5 3>
   s2*3
   <7 ->2
   s
   <5/>4 <_+>
   <6> <_->
   <6 4> <5 _+>
   s2*2
   s4 <_+>
   s <_+>
   s <_+>
   s2
   <6 5>
   s2*2
   <6>2
   <7>4 <_->
   s2*5
   s4 <6>
   <6 4> <5 3>
   s2
   <_->
   <_!>4 <_- 5>
   <6- 4> <5 _!>
   <_->2
   <6- _->2
   <6>4 <_->
   <6- 4> <5 _!>
   <_->2
   <6 5->
   s
   <6 5->
   s
   s4 <6>
   <_!>2
   s
   <_!>
   s
   <_!>
   s
   <_!>
   s4 <6>
   s4 <_!>
   s <_!>
   s <_!>
   <_-> <6>
   <6\\>2
   <6 4>4 <5 _!>
   <6\\>2
   <6 5->
   s
   <_!>
   <_->4 <6>
   <6\\>2
   <6 4>4 <5 _!>

}


forma = {

   \key do\major
   \time 2/4
   \tempo 2 = 60
   s2*140
   \bar"||"\break
   \key sol\minor
   s2*68
   \key do\major
   \mark\markup\smaller \center-column {"Da""Capo"}
   \bar"||"

}

IVchI = {
   \IVglobal
   %\notypeset
   <<\IVchIn \forma>>

}

IVchII = {
   \IVglobal
   \clef bass
   <<\IVchIIn \forma>>

}

IVfgI = {
   \IVglobal
   \clef bass
   <<\IVfgIn \forma>>

}

IVfgII = {
   \IVglobal
   \clef bass
   <<\IVfgIIn \forma>>

}

IVvl = {
   \IVglobal
   <<\IVvln \forma>>

}


IVvla = {
   \IVglobal
   \clef alto
   <<\IVvlan \forma>>

}


IVbc = {
   \IVglobal
   \clef bass
   << \IVbcn \forma \IVbfn >>
   \typeset

}
#(set-global-staff-size 15)


\pointAndClickOff

\paper  {

   systems-per-page = #3
   print-first-page-number = ##t
   first-page-number = #2

}

\markup \huge {[1.] Dolce}

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
   } <<

      \new PianoStaff <<

         \new Staff 																				<<
            \set Staff.midiInstrument = #"clarinet"
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \numericTimeSignature \key do\major\time 4/4  sol'4^\markup\center-align"Chalumeaux 1"}
                \clef violin
            \IchI
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"clarinet"
            \set Staff.instrumentName = \markup \center-column{"Chalumeaux 2"}
            \IchII
         >>
      >>

      \new PianoStaff <<

         \new Staff 																				<<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Fagotto 1"}
            \IfgI
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Fagotto 2"}
            \IfgII
         >>
      >>

      \new Staff 																				<<
         \set Staff.midiInstrument = #"violin"
         \set Staff.instrumentName = \markup \center-column{"Violino""sordinato"}
         \Ivl
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"viola"
         \set Staff.instrumentName = \markup \center-column{"Viola""sord[inata]"}
         \Ivla
      >>

      \new Staff <<
         \set Staff.midiInstrument = #"cello"
         \set Staff.instrumentName = \markup \center-column{"Basso"}
         \Ibc
      >>
   >>


   \layout {

            indent = 2.5\cm
            incipit-width = 1.5\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #1
         \override StaffGrouper.staff-staff-spacing.basic-distance = #5
         \override BarLine.hair-thickness = #1.2
         \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
         skipBars = ##t
      }

   }

   \midi {
      \context {
         \Voice
         \remove Dynamic_performer
      }
   }

}

\pageBreak

\markup \huge {[2.] Allegro}

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
   } <<

      \new PianoStaff <<

         \new Staff 																				<<
            \set Staff.midiInstrument = #"clarinet"
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \numericTimeSignature \key do\major\time 4/4  do'16}
                \clef violin
            \IIchI
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"clarinet"
            \IIchII
         >>
      >>

      \new PianoStaff <<

         \new Staff 																				<<
            \set Staff.midiInstrument = #"bassoon"
            \IIfgI
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"bassoon"
            \IIfgII
         >>
      >>

      \new Staff 																				<<
         \set Staff.midiInstrument = #"violin"
         \IIvl
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"viola"
         \IIvla
      >>

      \new Staff <<
         \set Staff.midiInstrument = #"cello"
         \IIbc
      >>
   >>


   \layout {

            indent = 1\cm
            incipit-width = 1\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #1
         \override StaffGrouper.staff-staff-spacing.basic-distance = #5
         \override BarLine.hair-thickness = #1.2
         \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
         skipBars = ##t
      }

   }

   \midi {
      \context {
         \Voice
         \remove Dynamic_performer
      }
   }

}

\pageBreak

\markup \huge {[3.] Largo}

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
   } <<

      \new PianoStaff <<

         \new Staff 																				<<
            \set Staff.midiInstrument = #"clarinet"
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \numericTimeSignature \key do\major\time 3/2  sol'2}
                \clef violin
            \IIIchI
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"clarinet"
            \IIIchII
         >>
      >>

      \new PianoStaff <<

         \new Staff 																				<<
            \set Staff.midiInstrument = #"bassoon"
            \IIIfgI
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"bassoon"
            \IIIfgII
         >>
      >>

      \new Staff 																				<<
         \set Staff.midiInstrument = #"violin"
         \IIIvl
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"viola"
         \IIIvla
      >>

      \new Staff <<
         \set Staff.midiInstrument = #"cello"
         \IIIbc
      >>
   >>


   \layout {

            indent = 1\cm
            incipit-width = 1\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #1
         \override StaffGrouper.staff-staff-spacing.basic-distance = #5
         \override BarLine.hair-thickness = #1.2
         \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
         skipBars = ##t
      }

   }

   \midi {
      \context {
         \Voice
         \remove Dynamic_performer
      }
   }

}

\pageBreak

\markup \huge {[4.] Vivace}

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
   } <<

      \new PianoStaff <<

         \new Staff 																				<<
            \set Staff.midiInstrument = #"clarinet"
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \numericTimeSignature \key do\major\time 2/4  do''4}
                \clef violin
            \IVchI
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"clarinet"
            \IVchII
         >>
      >>

      \new PianoStaff <<

         \new Staff 																				<<
            \set Staff.midiInstrument = #"bassoon"
            \IVfgI
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"bassoon"
            \IVfgII
         >>
      >>

      \new Staff 																				<<
         \set Staff.midiInstrument = #"violin"
         \IVvl
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = #"viola"
         \IVvla
      >>

      \new Staff <<
         \set Staff.midiInstrument = #"cello"
         \IVbc
      >>
   >>


   \layout {

            indent = 1\cm
            incipit-width = 1\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #1
         \override StaffGrouper.staff-staff-spacing.basic-distance = #5
         \override BarLine.hair-thickness = #1.2
         \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
         skipBars = ##t
      }

   }

   \midi {
      \context {
         \Voice
         \remove Dynamic_performer
      }
   }

}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
