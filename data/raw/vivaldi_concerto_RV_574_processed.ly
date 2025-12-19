\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

dolce = _\markup\italic "dol."


arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

parentSlur =
 -\tweak stencil
 #(lambda (grob)
   (let* ((cp (ly:grob-property grob 'control-points))
          (lp (grob-interpret-markup grob (markup #:teeny "(")))
          (rp (grob-interpret-markup grob (markup #:teeny ")"))))
     (set! lp (ly:stencil-aligned-to lp Y CENTER))
     (set! lp (ly:stencil-aligned-to lp X 0.2))
     (set! lp (ly:stencil-translate lp (first cp)))
     (set! rp (ly:stencil-aligned-to rp Y CENTER))
     (set! rp (ly:stencil-aligned-to rp X -0.2))
     (set! rp (ly:stencil-translate rp (last cp)))
     (list-set! cp 0
       (cons (cdr (ly:stencil-extent lp X))
             (cdr (first cp))))
     (list-set! cp (1- (length cp))
       (cons (car (ly:stencil-extent rp X))
             (cdr (last cp))))
     (ly:grob-set-property! grob 'control-points cp)
     (apply ly:stencil-add (list lp rp
       (ly:slur::print grob)))))
 \etc


upl =
#(let ((m (make-articulation 'stopped)))
   (set! (ly:music-property m 'tweaks)
         (acons 'font-size 3
                (acons 'stencil (lambda (grob)
                                  (grob-interpret-markup
                                   grob
                                   (make-draw-line-markup '(0 . 1))))
                       (ly:music-property m 'tweaks))))
   m)

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-0
    \center-column {
	  \musicglyph "scripts.turn"
      \musicglyph "scripts.prall"}}
mbreak = { }


Iglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
   		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletNumber.transparent = ##t
		\override TupletBracket.bracket-visibility = ##f
		\terzinequarto \con
			}


IcrIn = %\transpose do fa, {
		\relative do'' {

sol8
sol [mi16 mi mi8 mi] do4 r8 sol'
do [do16 do do8 do] mi16 mi sol sol mi mi re re
mi mi sol sol mi mi re re mi mi sol sol mi mi re re\mbreak

%4
mi8 [do16 do do8 do] do [sol16 sol sol8 sol]
sol [mi16 mi mi8 mi] mi [do16 do do8 do]
do [mi16 mi mi8 mi] mi [do16 do do8 do]

%7
do sol do sol do sol do sol
do1\fermata_\tr
do'~

%10
do\mbreak
re~
re

%13
mi~
mi
fa

%16
sol8[sol,16 sol sol8 sol] sol4 r
sol'8[sol,16 sol sol8 sol] sol4 r
sol'8[sol,16 sol sol8 sol] sol4 r

%19
re'8[re16 re re8 re]\mbreak do[do16 do do8 do]
do[do16 do do8 do] re8[re16 re re8 re]
re8[re16 re re8 re] mi[mi16 mi mi8 mi]

%22
mi[mi16 mi mi8 mi] fa[fa16 fa fa8 fa]
fa4 r fa r
fa r fa r

%25
fa r\mbreak fa r
fa r fa r
R1

%28
re4 r sol8[sol,16 sol sol8 sol]
sol4 r sol'8[sol,16 sol sol8 sol]
sol4 r do8[do,16 do do8 do]

%31
do'8[do,16 do do8 do] do'8[do,16 do do8 do]\mbreak
do'8[do,16 do do8 do] do'8[do,16 do do8 do]
do'8[do,16 do do8 do] re'[re16 re re8 re]

%34
do\soli sol mi sol do sol mi sol
do4.(re16 mi) do8 sol mi sol
do sol mi sol do4.(re16 mi)

%37
re8 sol, re' sol,\mbreak re' sol, re' sol,
re'4.(mi16 fa) re8 sol, re' sol,
re' sol, re' sol, re'4.(mi16 fa)

%40
mi8 do sol do mi do sol do
mi1\tr
R1*9

%51
r2 r4 r8 re
re1\tr\mbreak
r8 re16[re re8 re] re2\tr~

%54
re r8 re16[re re8 re]
re1~
re~

%57
re4 r r2
R1*33
do8\solo [do,16 do do8 do] do4 r

%92
do'8[do,16 do do8 do]\mbreak do4 r
do8[do16 do do8 do] do4 r
do8[do16 do do8 do] do4 r

%95
do8[do16 do do8 do] do4 r8 sol'
sol[mi16 mi mi8 mi] do4 r8 sol'
do[do16 do do8 re] mi16 mi sol sol mi mi re re\mbreak

%98
mi mi sol sol mi mi re re mi mi sol sol mi mi re re
mi4 r8 sol,\soli do sol mi sol
do sol mi sol do4.(re16 mi)

%101
re8 sol, re' sol, re' sol, re' sol,
re'4.(mi16 fa) mi8 re~re mi16(fa)\mbreak
mi8 re~re mi16 fa mi4 r8 sol,16 sol

%104
do do sol sol mi mi do do sol'4 r8 sol16 sol
do do sol sol mi mi do do sol'4 r8 do16 do
mi mi sol sol mi mi re re mi mi sol sol mi mi re re\mbreak

%107
mi8[do16 do do8 do] do[sol16 sol sol8 sol]
sol[mi16 mi mi8 mi] mi[do16 do do8 do]
do[do'16 do do8 do] do[do16 do do8 do]

%110
re[re16 re re8 re] re[re16 re re8 re]
mi[mi16 mi mi8 mi] mi[mi16 mi mi8 mi]
fa[fa16 fa fa8 fa]\mbreak fa4 r

%113
fa r fa r
fa r fa r
fa8[re16 re re8 re] mi[mi16 mi mi8 mi]

%116
re[re16 re re8 re] mi[mi16 mi mi8 mi]
re[re16 re re8 re] re[re16 re re8 re]
\footnote #' (-1 . 3) \markup\column\smaller {"  ""Le battute seguenti risultano cancellate nell'autografo però sono leggibili e quindi le ho trascritte come ha fatto Pisendel nella versione di Dresda,""pubblicata come versione 2.0""  "} mi4 r8 re\soli mi(re4) fa8

%119
mi(re4) fa8\mbreak mi(re4) fa8
mi(re4) r8 r2
R1

%122
r2 do8[do,16 do do8 do]
do4 r do'8[do,16 do do8 do]
do4 r do'8[do,16 do do8 do]

%125
do4 r re'8[re16 re re8 re]
mi[sol,16 sol sol8 sol] sol[mi16 mi mi8 mi]
mi[do16 do do8 do] do[do16 do do8 do]

%128
do sol do sol do sol do sol
do4 r8 mi' re4 re
do1\fermata

}

%}


IcrIIn = %\transpose do fa, {
\relative do'' {

r8
r4 r8 sol sol[mi16 mi mi8 mi]
do4 r8 sol' do16 do mi mi do do sol sol
do do mi mi do do sol sol do do mi mi do do sol sol

%4
do8[sol16 sol sol8 sol]\mbreak sol[mi16 mi mi8 mi]
mi[do16 do do8 do] do[sol16 sol sol8 sol]
sol[do16 do do8 do] do[sol16 sol sol8 sol]

%7
sol8 sol sol sol sol sol sol sol
sol1\tr
do'~

%10
do
re~\mbreak
re

%13
mi~
mi
fa

%16
r2 sol8[sol,16 sol sol8 sol]
sol4 r sol'8[sol,16 sol sol8 sol]
sol4 r sol'8[sol,16 sol sol8 sol]

%19
sol[sol16 sol sol8 sol] sol[sol16 sol sol8 sol]\mbreak
do[do16 do do8 do]re[re16 re re8 re]
sol,[sol16 sol sol8 sol] sol[sol16 sol sol8 sol]

%22
do[do16 do do8 do] do[do16 do do8 do]
re4 r re4 r
re4 r re4 r

%25
re4 r re4 r
re4 r re4 r\mbreak
R1

%28
sol,4 r r2
sol'8[sol,16 sol sol8 sol] sol4 r
sol'8[sol,16 sol sol8 sol] sol4 r

%31
do1\tr~
do~
do2 sol

%34
sol8\soli mi do mi sol mi do mi
sol2\mbreak sol8 mi do mi
sol mi do mi sol2

%37
sol8 r sol r sol r sol r
sol2 sol8 r sol r
sol r sol r sol4 re'

%40
do8 sol mi sol do sol mi sol
do1\tr\mbreak
R1*10

%52
sol8[sol16 sol sol8 sol] sol4 r
sol8[sol16 sol sol8] r sol[sol16 sol sol8] r
sol[sol16 sol sol8] r sol[sol16 sol sol8] r

%55
sol[sol16 sol sol8 sol] sol[sol16 sol sol8 sol]
sol[sol16 sol sol8 sol] sol[sol16 sol sol8 sol]\mbreak
sol4 r r2

%58
R1*33
r2 do8\solo[do,16 do do8 do]
do4 r do'8[do,16 do do8 do]

%93
do4 r do8[do16 do do8 do]
do4 r do8[do16 do do8 do]
do4 r r2\mbreak

%96
r4 r8 sol' sol[mi16 mi mi8 mi]
do4 r8 sol' do16 do mi mi do do sol sol
do do mi mi do do sol sol do do mi mi do do sol sol

%99
do4 r8 mi,\soli sol mi do mi
sol mi do mi sol2\mbreak
sol8 r sol r sol r sol r

%102
sol2 do8 sol4 re'8
do sol4 re'8 do16 do mi mi do do sol sol
mi4 r8 sol16 sol do do sol sol mi mi do do

%105
sol'4 r8 sol16 sol do do sol sol mi mi sol sol\mbreak
do do mi mi do do sol sol do do mi mi do do sol sol
do8[sol16 sol sol8 sol] sol[mi16 mi mi8 mi]

%108
mi[do16 do do8 do] do[sol16 sol sol8 sol]
sol[sol'16 sol sol8 sol] do[do16 do do8 do]
re[re16 re re8 re] sol,[sol16 sol sol8 sol]\mbreak

%111
sol[sol16 sol sol8 sol] do[do16 do do8 do]
do[do16 do do8 do] re4 r
re r re r

%114
re r re r
re8[sol,16 sol sol8 sol] do[do16 do do8 do]
sol[sol16 sol sol8 sol] do[do16 do do8 do]

%117
do[do16 do do8 do]\mbreak sol[sol16 sol sol8 sol]
do4 r8 sol\soli do (sol4) re'8
do(sol4) re'8 do(sol4) re'8

%120
do(sol4) r8 r2
R1*2
do8[do,16 do do8 do] do4 r

%124
do'8[do,16 do do8 do] do4 r
do'8[do,16 do do8 do]\mbreak sol'[sol16 sol sol8 sol]
sol[mi16 mi mi8 mi] mi[do16 do do8 do]

%127
do[do16 do do8 do] do[do16 do do8 do]
do sol do sol do sol do sol
do4 r8 do' sol4 sol

%130
mi1\fermata

}

%}

IobIn = \relative do'' {

do8
do[la16 la la8 la] fa4 r8 do'
fa[fa16 fa fa8 sol] la16 la do do la la sol sol
la la do do la la sol sol la la do do la la sol sol\mbreak

%4
la8[fa16 fa fa8 fa] fa[do16 do do8 do]
do[la16 la la8 la] la[fa16 fa fa8 fa]
fa[la16 la la8 la] la[fa16 fa fa8 fa]

%7
fa do fa do fa do fa do
fa1\fermata
do'8.\soli[re16 do8. re16]\mbreak do8.[re16 do8. mib16]
re4 r r2
re8.[mi16 re8. mi16] re8.[mi16 re8. fa16]

%12
mi4 r r2
mi8.[fa16 mi8. fa16] mi8.[fa16 mi8. sol16]
fa4 r r2

%15
fa8.[sol16 fa8. sol16] fa8. sol16 fa4\mbreak
sol4 r r2
R1*2

%19
mi8[mi16 mi mi8 mi] fa[fa16 fa fa8 fa]
fa[fa16 fa fa8 fa] sol[sol16 sol sol8 sol]
sol[sol16 sol sol8 sol] la[la16 la la8 la]

%22
la[la16 la la8 la] sib4 r\mbreak
mi,16\soli re mi fa mi8 fa sol16 fa sol la sol8 la
sib(la) la(sol) sol(fa) fa(mi)

%25
mi16 re mi fa mi8 fa sol16 fa sol la sol8 la
sib(la) la(sol) sol4 r
R1

%28
sol4 r\mbreak r2
R1
r2 fa8[fa,16 fa fa8 fa]
fa'[fa,16 fa fa8 fa] fa'[fa,16 fa fa8 fa]

%32
fa'[fa,16 fa fa8 fa] fa'[fa,16 fa fa8 fa]
fa'[fa,16 fa fa8 fa] mi'[mi16 mi mi8 mi]
fa4 r r2

%35
R1*16\mbreak
r2 r4 r8 sol
sol[mi16 mi mi8 mi] do4 r8 si

%53
do[do16 do do8 re] mi16 mi sol sol mi mi re re
mi mi sol sol mi mi re re mi mi sol sol mi mi re re\mbreak
mi8[do16 do do8 do] do[sol16 sol sol8 sol]

%56
sol[mi16 mi mi8 mi] mi4 r
do'16\solo sib do re mi8 fa sol do,~do16 re mi fa
sol8 do,~do16 re mi fa sol8 sib,! sib16 la sib do\mbreak

%59
la4 r re16 dod re mi fa8 sol
la re,~re16 mi fa sol la8 re,~re16 mi fad sol
la8 do, do16 si do re si4 r8 fa'\soli

%62
mib(re4) fa8 mib(re4) mib8\mbreak
fa[fa fa mib16 re] mib8[mib mib re16 mib]
fa8[fa fa mi!16 re] mi4 r

%65
do8 sol mi sol do la fa la
do la fa la re la fad la
re la fad la re si sol si\mbreak

%68
re si sol si mi si sold si
mi si sold si mi do la do
mi do la mi' la mi do mi

%71
la mi do mi la mi si mi
la mi si mi sold mi si mi\mbreak
sold mi si sold' la[la,16 la la8 la]

%74
la4 r r2
R1*20
r2 r4 r8 do

%96
do8[la16 la la8 la] fa4 r8 do'
fa[fa16 fa fa8 sol] la16 la do do la la sol sol\mbreak
la la do do la la sol sol la la do do la la sol sol

%99
la4 r r2
R1*9\mbreak
fa8[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]

%110
sol[sol16 sol sol8 sol] sol[sol16 sol sol8 sol]
la[la16 la la8 la] la[la16 la la8 la]
sib4 r mi,16\soli re mi fa mi8 fa\mbreak

%113
sol16 fa sol la sol8 la sib(la) la(sol)
sol16 fa sol la sol8 la sib(la) la(sol)
sol\tu[sol16 sol sol8 sol] la[la16 la la8 la]

%116
sol[sol16 sol sol8 sol] la[la16 la la8 la]
sol[sol16 sol sol8 sol] \mbreak sol[sol16 sol sol8 sol]
fa4 r r2

%119
R1
r4 r8 sol\soli lab(sol4) sib8
lab(sol4) sib8 lab(sol4) sib8

%122
lab(sol4) r8 fa2\tr~\mbreak
fa1~
fa~

%125
fa2 mi
fa8[do16 do do8 do] do[la16 la la8 la]
la[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]

%128
fa do fa do\mbreak fa do fa do
fa4 r8 la' sol4 sol
la1\fermata

}

IobIIn = \relative do'' {

r8
r4 r8 do do[la16 la la8 la]
fa4 r8 do' fa16 fa la la fa fa mi mi
fa fa la la fa fa mi mi fa fa la la fa fa mi mi

%4
fa8[do16 do do8 do] do[la16 la la8 la]\mbreak
la[fa16 fa fa8 fa] fa[do16 do do8 do]
do[fa16 fa fa8 fa] fa[do16 do do8 do]

%7
do fa do fa do fa do fa
do1\fermata
la'8.\soli[sib16 la8. sib16]\mbreak la8.[sib16 la8. do16]

%10
sib4 r r2
si8.[do16 si8. do16] si8.[do16 si8. re16]
do4 r r2

%13
dod8.[re16 dod8. re16] dod8.[re16 dod8. mi16]
re4 r r2
re8.[mi16 re8. mi16] re8. mi16 re4\mbreak

%16
mi r r2
R1*2

%19
do8[do16 do do8 do] do[do16 do do8 do]
re[re16 re re8 re] re[re16 re re8 re]
mi[mi16 mi mi8 mi] mi[mi16 mi mi8 mi]

%22
fa[fa16 fa fa8 fa] fa4 r\mbreak
do16\soli sib do re do8 re mi16 re mi fa mi8 fa
sol(fa) fa(mi) mi(re) re(do)

%25
do16 sib do re do8 re mi16 re mi fa mi8 fa
sol(fa) fa(mi) mi4 r
R1\mbreak

%28
mi4 r r2
R1
r2 la,8[la16 la la8 la]

%31
sib[sib16 sib sib8 sib]\mbreak do[do16 do do8 do]
re[re16 re re8 re] la[la16 la la8 la]
sib[sib16 sib sib8 sib] sol[sol16 sol sol8 sol]

%34
la4 r r2
R1*17
r4 r8 sol' sol[mi16 mi mi8 mi]

%53
do4 r8 sol do16 do mi mi do do si si
do do mi mi do do si si do do mi mi do do si si\mbreak
do4 r mi8[do16 do do8 do]

%56
do[sol16 sol sol8 sol] sol[mi16 mi mi8 mi]
mi4 r r2
R1*3

%61
r2 r4 r8 re'\soli
do(si4) re8 do(si4) do8\mbreak
re[re re do16 si] do8[do do si16 do]

%64
re8[re re do16 si] do4 r
sol8 mi do mi la fa do fa
la fa do fa la fad re fad

%67
la fad re fad si sol re sol\mbreak
si sol re sol si sold mi sold
si sold mi sold do la mi la

%70
do la mi do' mi do la do
mi do la do mi si la si
mi si la si mi si sold si\mbreak

%73
mi si sold si do[do16 do do8 do]
do4 r r2
R1*21

%96
r4 r8 do do[la16 la la8 la]
fa4 r8 do' fa16 fa la la fa fa mi mi
fa fa la la fa fa mi mi\mbreak fa fa la la fa fa mi mi

%99
fa4 r r2
R1*9
do8[do16 do do8 do] re[re16 re re8 re]

%110
re[re16 re re8 re] mi[mi16 mi mi8 mi]
mi[mi16 mi mi8 mi] fa[fa16 fa fa8 fa]\mbreak
fa fa16 fa fa4 do16\soli sib do re do8 re

%113
mi16 re mi fa mi8 fa sol(fa) fa(mi)
mi16 re mi fa mi8 fa sol(fa) fa(mi)
mi[mi16 mi mi8 mi] fa[fa16 fa fa8 fa]

%116
mi[mi16 mi mi8 mi] fa[fa16 fa fa8 fa]\mbreak
fa[fa16 fa fa8 fa] mi[mi16  mi mi8 mi]
fa4 r r2

%119
R1
r4 r8 mi\soli fa(mi4) sol8
fa(mi4) sol8 fa(mi4) sol8

%122
fa(mi4) r8 la,[la16 la la8 la]
sib[sib16 sib sib8 sib] do[do16 do do8 do]\mbreak
re[re16 re re8 re] la[la16 la la8 la]

%125
sib[sib16 sib sib8 sib] sol[sol16 sol sol8 sol]
la[la16 la la8 la] la[fa16 fa fa8 fa]
fa[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]

%128
fa do fa do fa do fa do
fa4 r8 fa' fa4 mi
fa1\fermata

}

IvlIn = \relative do'' {

do8
do[la16 la la8 la] fa4 r8 do'
fa[fa16 fa fa8 sol] la16 la do do la la sol sol
la la do do la la sol sol la la do do la la sol sol\mbreak

%4
la8[fa16 fa fa8 fa] fa[do16 do do8 do]
do[la16 la la8 la] la[fa16 fa fa8 fa]
fa[la16 la la8 la] la[fa16 fa fa8 fa]

%7
fa do fa do fa do fa do
fa1\fermata_\tr
fa'16\solo do la do fa do la do fa do la do fa do la do

%10
re sib fa sib re sib fa sib re sib fa sib re sib fa sib\mbreak
sol' re si re sol re si re sol re si re sol re si re
mi do sol do mi do sol do mi do sol do mi do sol do

%13
la' mi dod mi la mi dod mi la mi dod mi la mi dod mi
fa re la re fa re la re\mbreak fa re la re fa re la fa'
sib fa re fa sib fa re fa sib fa re fa sib fa re fa

%16
sol (do,  sib do) sol' (do, sib do) la' (do, sib do) la' (do, sib do)
sol' (do, sib do) sol' (do, sib do) la' (do, sib do) la' (do, sib do)
sol' (do, sib do) sol' (do, sib do) la' (do, sib do) la' (do, sib do)

%19
sol'8[mi16 mi mi8 mi] fa[fa16 fa fa8 fa]
fa[fa16 fa fa8 fa] sol[sol16 sol sol8 sol]
sol[sol16 sol sol8 sol] la[la16 la la8 la]

%22
la[la16 la la8 la] sib[sib16 sib sib8 sib]
sib4 r sib r
sib4 r sib r\mbreak

%25
sib4 r sib r
sib r sol16_\solo sib sol sib sol sib sol sib
mi, sol mi sol do, mi do mi sol, do sol do mi, sol mi sol

%28
do,4 r8 sol'' lab(sol4) sib8
lab(sol4) sib8 lab(sol4) sib8
lab sol4 r8 fa[fa,16 fa fa8 fa]\mbreak

%31
fa'[fa,16 fa fa8 fa] fa'[fa,16 fa fa8 fa]
fa'[fa,16 fa fa8 fa] fa'[fa,16 fa fa8 fa]
fa'[fa,16 fa fa8 fa] mi'[mi16 mi mi8 mi]

%34
fa4 r r2
R1*6
r16 fa\solo do fa la, fa' do fa la, fa' do fa la, fa' do fa

%42
la, la' fa la do, la' fa la\mbreak do, la' fa la do, la' fa la
do, do' la do fa, do' la do fa, do' la do fa, do' la do
fa, fa' do fa la, fa' do fa la, fa' do fa la, fa' do fa

%45
sol, fa' do fa sol, fa' do fa sol, fa' do fa sol, fa' do fa
sol, mi' do mi sol, mi' do mi\mbreak sol, mi' do mi sol, mi' do mi
fa, mi' do mi fa, mi' do mi fa, mi' do mi fa, mi' do mi

%48
fa, re' si re fa, re' si re fa, re' si re fa, re' si re
mi, do' sol do mi, do' sol do mi, do' sol do mi, do' sol do\mbreak
re, do' sol do re, do' sol do re, do' sol do re, do' sol do

%51
re, si' sol si re, si' sol si re, si' sol si re, si' sol si
do8 [mi,16 mi mi8 mi] do4 r8 sol
do[do16 do do8 re] mi16 mi sol sol mi mi re re

%54
mi mi sol sol mi mi re re\mbreak mi mi sol sol mi mi re re
mi8[do16 do do8 do] do[sol16 sol sol8 sol]
sol[mi16 mi mi8 mi] mi[do16 do do8 do]

%57
do4 r do' do
do do do do
do do re re

%60
re re re re
re re re r
R1*2

%64
r2 do16 do sol sol mi mi sol sol
do do sol sol mi mi sol sol do do la la fa fa la la
do do la la fa fa la la re re la la fad fad la la

%67
re re la la fad fad la la re re si si sol sol si si
re re si si sol sol si si\mbreak mi mi si si sold sold si si
mi mi si si sold sold si si mi mi do do la la do do

%70
mi mi do do la la mi' mi la la mi mi do do mi mi
la la mi mi do do mi  mi la la mi mi si si mi mi\mbreak
la la mi mi si si mi mi sold sold mi mi si si mi mi

%73
sold sold mi mi si si sold' sold la8[la,16 la la8 la]
la[mi16 mi mi8 mi] mi[la,16 la la8 la]
la16 mi''\solo la do la mi la do la mi la do la mi la do\mbreak

%76
si mi, si' re si mi, si' re si mi, si' re si mi, si' re
do mi, do' mi do mi, do' mi do mi, do' mi do mi, do' mi
re mi, re' fa re mi, re' fa re mi, re' fa re mi, re' fa

%79
mi4 r16 mi mi mi la mi mi mi la mi mi mi\mbreak
fa(mi) la(mi) fa(mi) la(mi) fa(mi) la(mi) fa(mi) la(mi)
fa re re re mi(re) sol(re) mi(re) sol(re) mi(re) sol(re)

%82
mi do do do re(do) fa(do) re(do) fa(do) re(do) fa(do)
re si si si do(si) mi(si)\mbreak do(si) mi(si) do(si) mi(si)
do la la la si la re la si la re la si la re la

%85
mi sold sold sold re sold sold sold dod, la' la la dod, sol'? sol sol
re fad fad fad  do fad fad fad sol si, si si mib si si si
re mi mi mi sib! mi mi mi fa la, la la mib' la, la la

%88
sib re re re lab re re re mib sol, sol sol re' sol, sol sol\mbreak
sib dod dod dod la dod dod dod re fad, fad fad do' fad, fad fad
sol si si si fa? si si si do mi, mi mi sib' mi, mi mi


%91
la16 fa' fa fa la, fa' fa fa sib, fa' fa fa do fa fa fa
re fa fa fa la, fa' fa fa sib, fa' fa fa do fa fa fa
re fa, fa fa la, fa' fa fa\mbreak sib, fa' fa fa do fa fa fa

%94
re fa fa fa la, fa' fa fa sib, fa' fa fa do fa fa fa
re fa fa fa la, fa' fa fa sib, fa' fa fa do fa fa fa
fa8[la16 la la8 la] fa4 r8 do'

%97
fa[fa16 fa fa8 sol] la16 la do do la la sol sol\mbreak
la la do do la la sol sol la la do do la la sol sol
la4 r r2

%100
R1*9
fa8[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]
sol[sol16 sol sol8 sol] sol[sol16 sol sol8 sol]

%111
la[la16 la la8 la] la[la16 la la8 la]
sib[sib16 sib sib8 sib] sib4 r\mbreak
sib r sib r

%114
sib r sib r
sol8[sol16 sol sol8 sol] la[la16 la la8 la]
sol[sol16 sol sol8 sol] la[la16 la la8 la]

%117
sol[sol16 sol sol8 sol] sol[sol16 sol sol8 sol]
fa4 r r2
R1

%120
r8 do,16[re mi8 do] fa do4 do8\mbreak
fa do4 do8 fa do4 do8
fa do4 r8 fa'[fa,16 fa fa8 fa]

%123
fa'[fa,16 fa fa8 fa] fa'[fa,16 fa fa8 fa]
fa'[fa,16 fa fa8 fa] fa'[fa,16 fa fa8 fa]
fa'[fa,16 fa fa8 fa] mi'[mi16 mi mi8 mi]

%126
fa[do16 do do8 do] do[la16 la la8 la]
la[fa16 fa fa8 fa]\mbreak fa[fa16 fa fa8 fa]
fa do fa do fa do fa do

%129
fa4 r8 la' sol4 sol
la1\fermata

}

IvlIIn = \relative do'' {

do8
do[la16 la la8 la] fa4 r8 do'
fa[fa16 fa fa8 sol] la16 la do do la la sol sol
la la do do la la sol sol la la do do la la sol sol\mbreak

%4
la8[fa16 fa fa8 fa] fa[do16 do do8 do]
do[la16 la la8 la] la[fa16 fa fa8 fa]
fa[la16 la la8 la] la[fa16 fa fa8 fa]

%7
fa do fa do fa do fa do
fa1\fermata_\tr
r8 fa' do fa r fa do fa

%10
r re fa, re' r re fa, re'
r sol re sol r sol re sol
r mi sol, mi' r mi sol, mi'

%13
r la mi la r la mi la\mbreak
r fa la, fa' r fa la, fa'
r sib fa sib r sib fa sib

%16
r sol mi sol r la fa la
r sol mi sol r la fa la
r sol mi sol r la fa la

%19
sol8[mi16 mi mi8 mi] fa[fa16 fa fa8 fa]
fa[fa16 fa fa8 fa] sol[sol16 sol sol8 sol]
sol[sol16 sol sol8 sol] la[la16 la la8 la]

%22
la[la16 la la8 la] sib[sib16 sib sib8 sib]
sib4 r sib r
sib4 r sib r\mbreak

%25
sib4 r sib r
sib4 r sib r
R1

%28
sol4 r8 sol lab(sol4) sib8
lab(sol4) sib8\mbreak lab(sol4) sib8
lab(sol4) r8 fa[fa,16 fa fa8 fa]

%31
fa'[fa,16 fa fa8 fa] fa'[fa,16 fa fa8 fa]
fa'[fa,16 fa fa8 fa] fa'[fa,16 fa fa8 fa]
fa'[fa,16 fa fa8 fa] mi'[mi16 mi mi8 mi]

%34
fa4 r r2
R1*16
r2 r4 r8 sol\mbreak

%52
sol[mi16 mi mi8 mi] do4 r8 si
do[do16 do do8 re] mi16 mi sol sol mi mi re re
mi mi sol sol mi mi re re mi mi sol sol mi mi re re

%55
mi8[do16 do do8 do] do[sol16 sol sol8 sol]
sol[mi16 mi mi8 mi] mi[do16 do do8 do]
do4 r do' do\mbreak

%58
do do do do
do do re re
re re re re

%61
re re re r
R1*2
r2 do16 do sol sol mi mi sol sol

%65
do do sol sol mi mi sol sol do do la la fa fa la la
do do la la fa fa la la re re la la fad fad la la\mbreak
re re la la fad fad la la re re si si sol sol si si

%68
re re si si sol sol si si mi mi si si sold sold si si
mi mi si si sold sold si si mi mi do do la la do do
mi mi do do la la mi' mi la la mi mi do do mi mi\mbreak

%71
la la mi mi do do mi mi la la mi mi si si mi mi
la la mi mi si si mi mi sold sold mi mi si si mi mi
sold sold mi mi si si sold' sold la8[la,16 la la8 la]

%74
la[mi16 mi mi8 mi] mi[la,16 la la8 la]\mbreak
la4 r r2
R1*19

%95
r2 r4 r8 do'
do[la16 la la8 la] fa4 r8 do'
fa[fa16 fa fa8 sol] la16 la do do la la sol sol

%98
la la do do la la sol sol la la do do la la sol sol\mbreak
la4 r r2
R1*9

%109
fa8[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]
sol[sol16 sol sol8 sol] sol[sol16 sol sol8 sol]
la[la16 la la8 la] la[la16 la la8 la]

%112
sib[sib16 sib sib8 sib] sib4 r
sib r sib r
sib r\mbreak sib r

%115
sol8[sol16 sol sol8 sol] la[la16 la la8 la]
sol8[sol16 sol sol8 sol] la[la16 la la8 la]
sol[sol16 sol sol8 sol] sol[sol16 sol sol8 sol]

%118
fa4 r r2
R1

%120
r8 do,16[re mi8 do] fa do4 do8\mbreak
fa do4 do8 fa do4 do8
fa do4 r8 fa'[fa,16 fa fa8 fa]

%123
fa'[fa,16 fa fa8 fa] fa'[fa,16 fa fa8 fa]
fa'[fa,16 fa fa8 fa] fa'[fa,16 fa fa8 fa]
fa'[fa,16 fa fa8 fa] mi'[mi16 mi mi8 mi]

%126
fa[do16 do do8 do] do[la16 la la8 la]
la[fa16 fa fa8 fa]\mbreak fa[fa16 fa fa8 fa]
fa do fa do fa do fa do

%129
fa4 r8 la' sol4 sol
la1\fermata

}

IvlIIIn = \relative do'' {

r8
r4 r8 do do[la16 la la8 la]
fa4 r8 do' fa16 fa la la fa fa mi mi
fa fa la la fa fa mi mi fa fa la la fa fa mi mi

%4
fa8[do16 do do8 do] do[la16 la la8 la]\mbreak
la[fa16 fa fa8 fa] fa[do16 do do8 do]
do[fa16 fa fa8 fa] fa[do16 do do8 do]

%7
do la do la do la do la
do1\fermata
r4 r8 fa' do fa r fa

%10
fa re r re fa, re' r re
re sol, r sol'\mbreak re sol r sol
sol mi r mi sol, mi' r mi

%13
mi la, r la' mi la r la
la fa r fa la, fa' r fa
fa sib, r sib' fa sib r4

%16
r8 mi, do mi r fa do fa
r mi do mi \mbreak r fa do fa
r mi do mi r fa do fa

%19
mi[do16 do do8 do] do[do16 do do8 do]
re[re16 re re8 re] re[re16 re re8 re]
mi[mi16 mi mi8 mi] mi[mi16 mi mi8 mi]

%22
fa[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]
sol4 r sol r \mbreak
sol r sol r

%25
sol r sol r
sol r sol r
R1

%28
mi4 r8 mi fa(mi4) sol8
fa(mi4) sol8 fa(mi4) sol8
fa(mi4) r8 la,[la16 la la8 la]

%31
sib[sib16 sib sib8 sib]\mbreak do[do16 do do8 do]
re[re16 re re8 re] la[la16 la la8 la]
sib[sib16 sib sib8 sib] sol[sol16 sol sol8 sol]

%34
la4 r r2
R1*17
r4 r8 sol' sol[mi16 mi mi8 mi]

%53
do4 r8 si do16 do mi mi do do si si\mbreak
do do mi mi do do si si do do mi mi do do si si
do4 r mi8[do16 do do8 do]

%56
do[sol16 sol sol8 sol] sol[mi16 mi mi8 mi]
mi4 r sol sol
sol sol sol sol

%59
la la la la
la la\mbreak la la
la la si r

%62
R1*2
r2 sol16 sol mi mi do do mi mi
sol sol mi mi do do mi mi la la fa fa do do fa fa

%66
la la fa fa do do fa fa la la fad fad re re fad fad\mbreak
la la fad fad re re fad fad si si sol sol re re sol sol
si si sol sol re re sol sol si si sold sold mi mi sold sold

%69
si si sold sold mi mi sold sold do do la la mi mi la la\mbreak
do do la la mi mi do' do mi mi do do la la do do
mi mi do do la la do do mi mi si si la la si si

%72
mi mi si si la la si si mi mi si si sold sold si si
mi mi si si sold sold si si\mbreak do8[do16 do do8 do]
do[la16 la la8 la] la[mi16 mi mi8 mi]

%75
mi4 r r2
R1*20

%96
r4 r8 do' do[la16 la la8 la]
fa4 r8 do' fa16 fa la la fa fa mi mi
fa fa la la fa fa mi mi\mbreak fa fa la la fa fa mi mi

%99
fa4 r r2
R1*9
do8[do16 do do8 do] re[re16 re re8 re]

%110
re[re16 re re8 re] mi[mi16 mi mi8 mi]
mi[mi16 mi mi8 mi] fa[fa16 fa fa8 fa]
fa[fa16 fa fa8 fa] sol4 r\mbreak

%113
sol r sol r
sol r sol r
mi8[mi16 mi mi8 mi] fa[fa16 fa fa8 fa]

%116
mi8[mi16 mi mi8 mi] fa[fa16 fa fa8 fa]
fa[fa16 fa fa8 fa] mi[mi16 mi mi8 mi]
fa4 r r2
R1

%120
r8 do,16[re mi8 do] fa do4 do8\mbreak
fa do4 do8 fa do4 do8
fa do4 r8 la'[la16 la la8 la]

%123
sib[sib16 sib sib8 sib] do[do16 do do8 do]
re[re16 re re8 re] la[la16 la la8 la]
sib[sib16 sib sib8 sib] sol[sol16 sol sol8 sol]

%126
la[la16 la la8 la] la[fa16 fa fa8 fa]\mbreak
fa[fa16 fa fa8 fa]\mbreak fa[fa16 fa fa8 fa]
fa do fa do fa do fa do

%129
fa4 r8 fa' fa4 mi
la1\fermata


}


Ivlan = \relative do' {

la8
la[do16 do do8 do] la[do16 do do8 do]
la[la'16 la la8 mi] do[do16 do do8 do]
do[do16 do do8 do] do[do16 do do8 do]

%4
do[la'16 la la8 la] la[fa16 fa fa8 fa]\mbreak
fa[do16 do do8 do] do[la16 la la8 la]
la[do16 do do8 do]do[la16 la la8 la]

%7
la fa la fa la fa la fa
la1\fermata
R1*10

%19
sol'8[sol16 sol sol8 la] la[la16 la la8la]
fa[fa16 fa fa8 fa]\mbreak sib[sib16 sib sib8 sib]
sol[sol16 sol sol8 sol] do[do16 do do8 do]

%22
la[la16 la la8la] re[re16 re re8 re]
mi,4 r mi r
mi r mi r

%25
mi r mi r
mi r mi r
R1

%28
do4 r8 do\mbreak fa do4 do8
fa do4 do8 fa do4 do8
fa do4 r8 do[do16 do do8 do]

%31
sib[sib16 sib sib8 sib] la[la16 la la8 la]
re[re16 re re8 re] do[do16 do do8 do]
sib[sib16 sib sib8 sib] do[do16 do do8 do]\mbreak

%34
\parenthesize do4 r r2
R1*17
mi8[sol16 sol sol8 sol] mi[sol16 sol sol8 sol]

%53
mi[sol16 sol sol8 sol] sol[sol16 sol sol8 sol]
sol[sol16 sol sol8 sol] sol[sol16 sol sol8 sol]
sol[mi16 mi mi8 mi] sol[mi16 mi mi8 mi]\mbreak

%56
mi[do16 do do8 do] do[sol16 sol sol8 sol]
sol4 r mi' mi
mi mi mi mi

%59
fa fa fa fa
fa fa fad fad
fad? fad sol r

%62
R1*2
r2 mi16 mi do do sol sol do do\mbreak
do do do do sol sol do do fa fa do do la la do do

%66
fa fa do do la la do do fad fad re re la la re re
fad fad re re la la re re sol sol re re si si re re\mbreak
sol sol re re si si re re sold sold mi mi si si mi mi

%69
sold sold mi mi si si mi mi la la mi mi do do mi mi
la la mi mi do do la' la do do la la mi mi la la
do do la la mi mi la la\mbreak si si la la mi mi mi mi

%72
si' si la la mi mi mi mi si' si sold sold mi mi sold sold
si si sold sold mi mi mi mi mi8[mi16 mi mi8 mi]
mi[do16 do do8 do] do[do16 do do8 do]

%75
do4 r\mbreak r2
R1*19
r2 r4 r8 la

%96
la[do16 do do8 do] la[do16 do do8 do]
la[la'16 la la8 mi] do[do16 do do8 do]
do[do16 do do8 do] do[do16 do do8 do]

%99
do4 r\mbreak r2
R1*9
la'8[la16 la la8 la] fa[fa16 fa fa8 fa]

%110
sib[sib16 sib sib8 sib] sol[sol16 sol sol8 sol]
do8[do16 do do8 do] la[la16 la la8 la]
re[re16 re re8 re] mi,4 r

%113
mi r mi r\mbreak
mi r  mi r
do8[do16 do do8 do] do[do16 do do8 do]

%116
do[do16 do do8 do] do[do16 do do8 do]
do[do16 do do8 do] do[do16 do do8 do]
do4 r r2

%119
R1*3\mbreak
r2 do8[do16 do do8 do]
sib[sib16 sib sib8 sib] la[la16 la la8 la]

%124
re[re16 re re8 re] do[do16 do do8 do]
sib[sib16 sib sib8 sib] do[do16 do do8 do]
do[fa16 fa fa8 fa] fa[do16 do do8 do]

%127
do[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]
fa do fa do fa do fa do
fa4 r8 do do4 do

%130
do1\fermata

}

Ifgn = \relative do {

fa8
fa[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]
fa[fa16 fa fa8 do'] fa,[fa16 fa fa8 do']
fa,[fa16 fa fa8 do'] fa,[fa16 fa fa8 do']

%4
fa,[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]
fa[fa16 fa fa8 fa] \mbreak fa[fa16 fa fa8 fa]
fa[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]

%7
fa fa fa fa fa fa fa fa
fa1\fermata
R1*10

%19
do8[do16 do sib8 sib] la[la16 la la8 la]
sib[sib16 sib sib8 sib] sib[sib16 sib sib8 sib]
do[do16 do do8 do] do[do16 do do8 do]\mbreak

%22
re[re16 re re8 re] re[re16 re re8 re]
do4 r do r
do4 r do r

%25
do4 r do r
do4 r do r
do4 r do r

%28
do4 r r2
R1
r2 fa8[fa16 fa fa8 fa]\mbreak

%31
sol[sol16 sol sol8 sol] la[la16 la la8 la]
sib[sib16 sib sib8 sib] fa[fa16 fa fa8 fa]
sol[sol16 sol sol8 sol] do,[do16 do do8 do]

%34
fa4 r8 fa fa4 r8 fa
fa sol la sol fa4 r8 fa
fa4 r8 fa fa sol la fa\mbreak

%37
do re mi re do re mi re
do re mi re do re mi re
do re mi re do re mi do

%40
fa4 r8 fa fa4 r8 fa
fa4 r r2
R1*10

%52
do8[do16 do do8 do] do[do16 do do8 do]
do[do16 do do8 sol'] do,[do16 do do8 sol']\mbreak
do,[do16 do do8 sol'] do,[do16 do do8 sol']

%55
do,[do16 do do8 do] do[do16 do do8 do]
do[do16 do do8 do] do[do16 do do8 do]
do4 r r2

%58
R1*3
r2 sol'8 la si sol

%62
do sol4 sol8 do sol4 do,8
sol' sol, si sol do re mib do\mbreak
si la si sol do do do do

%65
mi mi mi mi fa fa fa fa
fa fa fa fa fad fad fad fad
fad? fad fad fad sol sol sol sol

%68
sol sol sol sol sold sold sold sold
sold? sold sold sold la la la la
la la la la\mbreak la la la la

%71
la la la la mi mi mi mi
mi mi mi mi mi mi mi mi
mi mi mi mi la,[la16 la la8 la]

%74
la[la16 la la8 la] la[la16 la la8 la]
la4 r r2
sold'4 r r2

%77
la4 r r2\mbreak
sib4 r r2
la8 la do la do la do la
re do re do re do re do

%81
re si do si do si do si\mbreak
do la si la si la si la
si sold la sold la sold la sold

%84
la fad sol fad sol fad sol fa
mi fad sold mi la si dod la
re, mi fad re sol la si sol

%87
do, re mi do\mbreak fa sol la fa
sib,! do re sib mib fa sol mib
la, si dod la re mi fad re

%90
sol la si sol do, re mi do
fa r fa r sol r la r
sib r fa r sol r la r

%93
sib r fa, r\mbreak sol r la r
sib r fa r sol r la r
sib r fa r sol r do r

%96
fa[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]
fa[fa16 fa fa8 do'] fa,[fa16 fa fa8 do']
fa,[fa16 fa fa8 do']\mbreak fa,[fa16 fa fa8 do']

%99
fa, sol la sol fa4 r8 fa
fa4 r8 fa fa sol la fa
do4 r8 do do4 r8 do

%102
do re mi do fa mi4 do8
fa mi4 do8 fa[fa16 fa] la la la la\mbreak
fa4. fa16 fa fa4. fa16 fa

%105
fa4. fa16 fa fa4. fa16 fa
fa8[fa16 fa fa8 do'] fa,[fa16 fa fa8 do']
fa,[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]

%108
fa[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]\mbreak
fa8[la,16 la la8 la] sib[sib16 sib sib8 sib]
sib[sib16 sib sib8 sib] do[do16 do do8 do]

%111
do[do16 do do8 do] re[re16 re re8 re]
re[re16 re re8 re] do4 r
do r do r

%114
do r\mbreak do r
do'8[do16 do do8 do] fa,[fa16 fa fa8 fa]
do'[do16 do do8 do] fa,[fa16 fa fa8 fa]

%117
do'[do16 do do8 do] do,[do16 do do8 do]
fa la do mi, fa mi4 do8
fa mi4 do8\mbreak fa mi4 do8

%120
fa do4 r8 r2
R1
r2 fa8[fa16 fa fa8 fa]

%123
sol[sol16 sol sol8 sol] la[la16 la la8 la]
sib[sib16 sib sib8 sib] fa[fa16 fa fa8 fa]
sol[sol16 sol sol8 sol]\mbreak do,[do16 do do8 do]

%126
fa[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]
fa8[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]
fa do fa do fa do fa do

%129
fa4 r8 fa do'4 do,
fa1\fermata

}


Ibcn = \relative do {

fa8
fa[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]
fa[fa16 fa fa8 do'] fa,[fa16 fa fa8 do']
fa,[fa16 fa fa8 do'] fa,[fa16 fa fa8 do']

%4
fa,[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]
fa[fa16 fa fa8 fa] \mbreak fa[fa16 fa fa8 fa]
fa[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]

%7
fa fa fa fa fa fa fa fa
fa1\fermata
la,4\p la la la

%10
sib sib sib sib
si si si si
do do do do

%13
dod dod dod dod
re re re re
re re re re

%16
do do do do
do do do do
do do do do

%19
do8[do16 do sib8 sib] la[la16 la la8 la]
sib[sib16 sib sib8 sib] sib[sib16 sib sib8 sib]
do[do16 do do8 do] do[do16 do do8 do]\mbreak

%22
re[re16 re re8 re] re[re16 re re8 re]
do4 r do r
do4 r do r

%25
do4 r do r
do4 r do r
do4 r do r

%28
do4 r r2
R1
r2 fa8[fa16 fa fa8 fa]\mbreak

%31
sol[sol16 sol sol8 sol] la[la16 la la8 la]
sib[sib16 sib sib8 sib] fa[fa16 fa fa8 fa]
sol[sol16 sol sol8 sol] do,[do16 do do8 do]

%34
fa,4  r r2
R1*6
fa'4 r fa r
fa4 r fa r

%43
fa4 r fa r
fa fa fa, fa\mbreak
do' do do do

%46
do do do do
la la la la
si si si si

%49
do do do do
sol' sol sol sol
sol, sol sol sol

%52
do8[do16 do do8 do] do[do16 do do8 do]
do[do16 do do8 sol'] do,[do16 do do8 sol']\mbreak
do,[do16 do do8 sol'] do,[do16 do do8 sol']

%55
do,[do16 do do8 do] do[do16 do do8 do]
do[do16 do do8 do] do[do16 do do8 do]
do4 r r2

%58
R1*6
r2 do8 do do do
mi mi mi mi fa fa fa fa

%66
fa fa fa fa fad fad fad fad
fad? fad fad fad sol sol sol sol
sol sol sol sol\mbreak sold sold sold sold

%69
sold? sold sold sold la la la la
la la la la la la la la
la la la la mi mi mi mi

%72
mi mi mi mi mi mi mi mi
mi mi mi mi la,[la16 la la8la]
la[la16 la la8 la]\mbreak la[la16 la la8 la]

%75
la4 r r2
sold'4 r r2
la4 r r2

%78
sib4 r r2
la8 la do la do la do la
re do re do re do re do

%81
re si do si do si do si\mbreak
do la si la si la si la
si sold la sold la sold la sold

%84
la fad sol fad sol fad sol fa
mi fad sold mi la si dod la
re, mi fad re sol la si sol

%87
do, re mi do\mbreak fa sol la fa
sib,! do re sib mib fa sol mib
la, si dod la re mi fad re

%90
sol la si sol do, re mi do
fa r fa r sol r la r
sib r fa r sol r la r

%93
sib r fa, r\mbreak sol r la r
sib r fa r sol r la r
sib r fa r sol r do r

%96
fa[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]
fa[fa16 fa fa8 do'] fa,[fa16 fa fa8 do']
fa,[fa16 fa fa8 do']\mbreak fa,[fa16 fa fa8 do']

%99
fa, 4 r r2
R1*9
la,8[la16 la la8 la] sib[sib16 sib sib8 sib]
sib[sib16 sib sib8 sib] do[do16 do do8 do]

%111
do[do16 do do8 do] re[re16 re re8 re]
re[re16 re re8 re] do4 r
do r do r

%114
do r\mbreak do r
do'8[do16 do do8 do] fa,[fa16 fa fa8 fa]
do'[do16 do do8 do] fa,[fa16 fa fa8 fa]

%117
do'[do16 do do8 do] do,[do16 do do8 do]
fa,4 r r2
R1*3
r2 fa'8[fa16 fa fa8 fa]

%123
sol[sol16 sol sol8 sol] la[la16 la la8 la]
sib[sib16 sib sib8 sib] fa[fa16 fa fa8 fa]
sol[sol16 sol sol8 sol]\mbreak do,[do16 do do8 do]

%126
fa[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]
fa8[fa16 fa fa8 fa] fa[fa16 fa fa8 fa]
fa do fa do fa do fa do

%129
fa4 r8 fa do'4 do,
fa1\fermata

}

Ibfn = \figures {
	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

s8
s1*15
s2 <6 4>
<5 3> <6 4>
<5 3> <6 4>
s1
s2 <6>
s <6>

s <6>
<7>1
s1*9

<7>1
s1*11
<5 4>1
<5 3>
s
<6 5>
s
<5 4>
<3!>
s1*19

s2 <5! 4>
s <_+>
s1*12

<_+>2 <_+>4 <6 5>
<_+> <6 5> <_!> <6 5>
s1*2
s2 <_+>
<_!>1
s1*4

s2 <7>
s1*14

<6>1
s
<6>2 <7>
s1*4

<5 4>2 <3>
s1*7
<7>1

}


forma = {

\time 4/4
\tempo 2 = 60
\partial 8 s8
s1*130
\bar "|."

}


IcrI = {
	\Iglobal
	<<\IcrIn \forma>>

}



IcrII = {
	\Iglobal
	<<\IcrIIn \forma>>

}


IobI = {
	\Iglobal
	<<\IobIn \forma>>

}

IobII = {
	\Iglobal
	<<\IobIIn \forma>>

}

IvlI = {
	\Iglobal
	<<\IvlIn \forma>>

}

IvlII = {
	\Iglobal
	<<\IvlIIn \forma>>

}

IvlIII = {
	\Iglobal
	<<\IvlIIIn \forma>>

}


Ivla = {
	\Iglobal
	\clef alto
	<<\Ivlan \forma>>

}

Ifg = {
	\Iglobal
	\clef bass
	<<\Ifgn \forma>>

}



Ibc = {
	\Iglobal
	\clef bass
	<<\Ibcn \forma \Ibfn>>

}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con
}


IIcrIn = %\transpose do fa, {
    \relative do'' {

        do1
        re
        mi

        %4
        fa
        mi
        re\fermata

        %7
        R1*6
        mi2~mi~
        mi1~

        %15
        mi
        mi4 r r2\mbreak
        R1*8

        %25
        mi2 fa
        mi re~
        re mi\fermata

    }
%}


IIcrIIn = %\transpose do fa, {
    \relative do'' {

        sol1~
        sol
        do

        %4
        re
        do
        sol\fermata

        %7
        R1*6
        do2~do
        mi,1~

        %15
        mi
        do4 r r2\mbreak
        R1*8

        %25
        do'2 re
        do1
        sol2 mi\fermata

    }
%}

IIobIn = \relative do'' {

    fa8 fa fa fa fa,\p fa fa fa
    sol'\f sol sol sol sol,\p sol sol sol
    la'\f la la la la,\p la la la

    %4
    sib'\f sib sib sib sib,\p sib sib sib\mbreak
    la'\f la la la la,\p la la la
    sol'1\fermata\f

    %7
    r2\mbreak sib,16\solo fa fa sib sib la la sol
    sol2 do16 sol sol do do sib sib la
    la2 re16 la la re re do do sib

    %10
    sib4. mi8 mi4 r8 mi
    fa mi r dod re dod r mi\mbreak
    fa mi r la la[sol16 fa] mi8.\tr re16

    %13
    re8 fa fa fa fa,\p fa fa fa
    mi'\f mi mi mi mi,\p mi mi mi
    mi'8\f mi mi mi mi,\p mi mi mi

    %16
    re'32\solo(la re mi fa) [re(fa sol] la) [fa (la sib!] dod) la si dod re8 dod16 si \tuplet3/2{la(si la sol[fa sol)]}
    fa mi re8 r re\mbreak la'16.[sol32( fad16.)mi32(] re8) mib
    \grace re do16(fad) la(re,) mib(do) re(la) sib la sol8 r re'

    %19
    sol16.[fa32 (mi16.) re32(] do8) sol' do,16(mi) sol(do,) re(sib) do(sol)
    la sol fa8 r do' fa32[(do fa sol)] la(fa la sib) do(sib la sol) fa16[mib]
    mib?8\tr re r re\mbreak sol32[(re sol la)] si (sol si do) re(do si la) sol16[(fa)]

    %22
    fa8\tr(mi) r do lab' lab lab lab
    reb8.[do16(sib) lab(sol) fa] \tuplet3/2{mi16(re do) lab'[(sol fa]} mi8.\tr) fa16
    sib,4~sib32 [reb(do sib)] sol'(sib lab sol) do16.[ sib32(lab16) sol32 (fa)] mi8.\tr fa16\mbreak

    %25
    fa8 la la la sib sib sib sib
    la la la la sol sol sol sol
    sol sol sol sol la2\fermopz

}

IIobIIn = \relative do'' {

    do8 do do do do,\p do do do
    mi'\f mi mi mi mi,\p mi mi mi
    fa'\f fa fa fa fa,\p fa fa fa

    %4
    sol'\f sol sol sol sol,\p sol sol sol
    fa'\f fa fa fa\mbreak fa,\p fa fa fa
    mi'1\fermata\f

    %7
    R1*6
    re8 re re re re,\p re re re
    re'\f re re re re,\p re re re

    %15
    dod'\f dod dod dod dod,\p dod dod dod\mbreak
    re4 r r2
    R1*8

    %25
    fa8 fa fa fa sol sol sol sol\mbreak
    fa fa fa fa fa fa fa fa
    mi mi mi mi fa2\fermata

}

IIvlIn = \relative do'' {

    fa8 fa fa fa fa,\p fa fa fa
    sol'\f sol sol sol sol,\p sol sol sol
    la'\f la la la la,\p la la la

    %4
    sib'\f sib sib sib sib,\p sib sib sib\mbreak
    la'\f la la la la,\p la la la
    sol'1\fermata\f

    %7
    fa16\solo do do fa fa mib mib re re2
    sol16 re re sol sol fa fa mi mi2
    la16 mi mi la la sol sol fa fa2

    %10
    sol16 re re sib' sib re, re dod dod4 r8 dod
    re dod r mi fa mi r dod\mbreak

    %12
    re dod r mi fa mi16 re dod8.\tr re16
    re8 fa fa fa fa,\p fa fa fa
    mi'\f mi mi mi mi,\p mi mi mi

    %15
    mi'8\f mi mi mi mi,\p mi mi mi
    re'4 r r2
    R1*8

    %25
    fa8 la la la sib sib sib sib
    la la la la sol sol sol sol
    sol sol sol sol la2\fermata

}

IIvlIIn = \relative do'' {

    fa8 fa fa fa fa,\p fa fa fa
    sol'\f sol sol sol sol,\p sol sol sol
    la'\f la la la la,\p la la la

    %4
    sib'\f sib sib sib sib,\p sib sib sib\mbreak
    la'\f la la la la,\p la la la
    sol'1\fermata\f

    %7
    R1*6
    fa8 fa fa fa fa,\p fa fa fa
    mi'\f mi mi mi mi,\p mi mi mi
    mi'\f mi mi mi mi,\p mi mi mi\mbreak

    %16
    re'4 r r2
    R1*8

    %25
    la'8 la la la sib sib sib sib\mbreak
    la la la la sol sol sol sol
    sol sol sol sol la2\fermata

}

IIvlIIIn = \relative do'' {

    do8 do do do do,\p do do do
    mi'\f mi mi mi mi,\p mi mi mi
    fa'\f fa fa fa fa,\p fa fa fa

    %4
    sol'\f sol sol sol sol,\p sol sol sol
    fa'\f fa fa fa\mbreak fa,\p fa fa fa
    mi'1\fermata\f

    %7
    R1*6
    re8 re re re re,\p re re re
    re'\f re re re re,\p re re re
    dod'\f dod dod dod dod,\p dod dod dod\mbreak

    %16
    re4 r r2
    R1*8

    %25
    fa'8 fa fa fa sol sol sol sol\mbreak
    fa fa fa fa fa fa fa fa
    mi mi mi mi fa2\fermata

}


IIvlan = \relative do' {

    la'8\f la la la la,\p la la la
    do\f do do do do\p do do do
    do\f do do do do\p do do do

    %4
    mi\f mi mi mi mi\p mi mi mi\mbreak
    do\f do do do do\p do do do
    do1\fermata\f

    %7
    la8 la la la sib sib sib sib
    si2 do
    dod re

    %10
    sib4 sol la r
    R1*2

    %13
    la' 8la la la la,\p la la la
    la\f la la la la\p la la la
    la\f la la la\mbreak la\p la la la

    %16
    la4 r r2
    R1*8

    %25
    do8 do do do\mbreak mi mi mi mi
    do do do do do do do do
    do do do do do2\fermata

}

IIfgn = \relative do {

    fa8\f fa fa fa fa\p fa fa fa
    do\f do do do do\p do do do
    fa\f fa fa fa fa\p fa fa fa

    %4
    do\f do do do do\p do do do\mbreak
    fa\f fa fa fa fa\p fa fa fa
    do1\fermata\f

    %7
    R1*3
    r2 la8 la' dod la
    re, la' dod la re, la' dod la

    %12
    re, la' dod la re sol, la la,
    re8 re re re re\p re re re
    la\f la la la la\p la la la

    %15
    la\f la la la la\p la la la
    re4 r r2
    R1*8

    %25
    fa8 fa fa fa \mbreak do do do do
    fa fa fa fa do' do do do
    do, do do do fa,2\fermata

}

IIbcn = \relative do {

    fa8\f fa fa fa fa\p fa fa fa
    do\f do do do do\p do do do
    fa\f fa fa fa fa\p fa fa fa

    %4
    do\f do do do do\p do do do\mbreak
    fa\f fa fa fa fa\p fa fa fa
    do1\fermata\f

    %7
    R1*6
    re8 re re re re\p re re re
    la\f la la la la\p la la la

    %15
    la\f la la la la\p la la la\mbreak
    re4 r re dod
    re8 mi fa re fad4. fad8\mbreak

    %18
    fad?4. fad8 sol la sib[sol]
    mi4. mi8 mi4. mi8
    fa sol la sol fa4. fa8\mbreak

    %21
    sib, do re do si4. si8
    do re mi do fa sol lab fa
    sib,4. sib8 do fa do'[do,]

    %24
    sol' fa mi do lab sib do4\mbreak
    fa8 fa fa fa do do do do
    fa fa fa fa do' do do do

    %27
    do, do do do fa,2\fermata

}

IIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*3
    <7>1
    s1*9
    <5 4>1
    <_+>
    s1*5
    <5 4>1
    <5 4>2 <_->
    <_-> s8 <_-> s4
    s4 s8 <7> s2
    s2 <7>
    s <5 4>
    <3>

}


forma = {

    \time 4/4
    \tempo 4 = 35
    s1*27
    \bar "|."

}


IIcrI = {
    \IIglobal
    <<\IIcrIn \forma>>

}



IIcrII = {
    \IIglobal
    <<\IIcrIIn \forma>>

}


IIobI = {
    \IIglobal
    <<\IIobIn \forma>>

}

IIobII = {
    \IIglobal
    <<\IIobIIn \forma>>

}

IIvlI = {
    \IIglobal
    <<\IIvlIn \forma>>

}

IIvlII = {
    \IIglobal
    <<\IIvlIIn \forma>>

}

IIvlIII = {
    \IIglobal
    <<\IIvlIIIn \forma>>

}


IIvla = {
    \IIglobal
    \clef alto
    <<\IIvlan \forma>>

}

IIfg = {
    \IIglobal
    \clef bass
    <<\IIfgn \forma>>

}


IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46, 2.19.49, 2.20.0,
2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3, 2.23.4, 2.23.5,
2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11, 2.23.12, 2.23.13,
2.23.14, 2.24.0
%}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \senza
}


IIIcrIn = %\transpose do fa,
\relative do'' {

    sol4\soli mi sol
    do, do'8. re16 mi4
    fa mi fa

    %4
    re2\tr do4
    sol mi sol
    do, do'8. re16 mi4

    %7
    fa mi fa
    re2.\tr
    sol,4. do8 sol4\mbreak

    %10
    sol4. re'8 sol,4
    sol4. mi'8 sol,4
    sol4. fa'8 sol,4

    %13
    sol4. mi'8 sol,4
    sol8[sol,16 sol sol8 sol sol sol]
    sol4 r r

    %16
    R2.*8
    sol''4 mi do
    sol r r

    %26
    mi' do sol
    mi r r\mbreak
    do' sol mi

    %29
    do r r
    R2.*2
    r8 mi'16 [fa sol8 fa fa mi]

    %33
    mi2.
    r8 mi16[fa sol8 fa fa mi]
    mi4 r8 do do do

    %36
    do4 r8 do do do
    re4 r8 re re re
    re4 r8 re re re\mbreak

    %39
    mi4 r8 mi mi mi
    mi4 r8 mi mi mi
    fa4 r8 fa fa fa

    %42
    re4. re8 sol,4
    sol4. mi'8 sol,4
    sol4. fa'8 sol,4

    %45
    sol4. mi'8 sol,4
    sol sol,8 sol sol sol
    sol4 r r

    %48
    sol' sol,8 sol sol sol\mbreak
    sol4 r r
    re'' re2

    %51
    do4 r r
    R2.*17
    mi4 mi,8 mi mi mi

    %70
    mi2.
    mi'4 mi,8 mi mi mi
    mi2.

    %73
    mi'4 mi,8 mi mi mi
    mi4 r r\mbreak
    mi mi,8 mi mi mi

    %76
    mi4 r r
    R2.*39
    mi'8\solo do mi sol do sol

    %117
    mi do mi sol do sol
    mi4 do'8.[re16 do8. re16]
    mi4 mi8.[fa16 mi8. fa16]\mbreak

    %120
    sol4 sol8.[la16 sol8. la16]
    fa4 fa8.[sol16 fa8. sol16]
    mi4 mi8.[fa16 mi8. fa16]

    %123
    re4 r8 sol, re' sol,
    mi' sol, sol sol mi' sol,
    fa' sol, sol sol fa' sol,

    %126
    mi' sol, sol sol mi' sol,
    fa'4 mi r
    re do r

    %129
    fa mi r\mbreak
    re do r
    re re2\parenthesize \tr

    %132
    \footnote #' (-1 . 2) \markup\column\smaller {"  ""Questo assolo dei ”Trombon da caccia” è cancellato nell'autografo, ma è leggibile ed è stato trascritto come nella versione di Pisendel."} do8.\solo[re16 do8. re16 do8. mi16]
    re8.[mi16 re8. mi16 re8. fa16]
    mi8.[fa16 mi8. fa16 mi8. sol16]

    %135
    fa8.[sol16 fa8. sol16 fa8. la16]
    sol2.\tr
    R2.

    %138
    do,4 r r
    R2.
    do8\soli sol mi sol do mi

    %141
    do sol mi sol do mi
    mi2.\tr

    %143
    do8 sol mi sol do mi
    mi4 r8 do do do
    do4 r8 do do do

    %146
    re4 r8 re re re
    re4 r8 re re re\mbreak
    mi4 r8 mi mi mi

    %149
    mi4 r8 mi mi mi
    fa4 r8 fa fa fa
    re4. re8 sol,4

    %152
    sol4. mi'8 sol,4
    sol4. fa'8 sol,4
    sol4. mi'8 sol,4

    %155
    sol4 sol,8 sol sol sol
    sol4 r r\mbreak
    re''4 re2

    %158
    do8 sol sol sol sol sol
    mi do do do do do
    sol' sol, sol sol sol sol

    %161
    do sol do sol do sol
    do4 r mi'
    re re re

    %164
    do2.\fermata

}


IIIcrIIn = %\transpose do fa,
\relative do'' {

    mi,4\soli do mi
    sol2 do4
    re do re

    %4
    sol,2 mi4
    mi do mi
    sol2 do4

    %7
    re do re
    sol,2.
    sol4. do8 sol4\mbreak

    %10
    sol4. re'8 sol,4
    sol4. mi'8 sol,4
    sol4. fa'8 sol,4

    %13
    sol4. mi'8 sol,4
    sol8[sol,16 sol sol8 sol sol sol]
    sol4 r r

    %16
    R2.*9
    sol''4 mi do
    sol r r\mbreak

    %27
    mi' do sol
    mi r r
    do' sol mi

    %30
    do r r
    R2.
    r8 do'16[re mi8 re re do]

    %33
    do2.
    r8 do16[re mi8 re re do]
    do4 r8 sol sol sol\mbreak

    %36
    do4 r8 do do do
    re4 r8 re re re
    re4 r8 re re re

    %39
    mi4 r8 mi mi mi
    mi4 r8 do do do
    do4 r8 do do do

    %42
    sol4. sol8 sol4
    sol4. do8 sol4
    sol4. re'8 sol,4\mbreak

    %45
    sol4. do8 sol4
    sol4 r r
    sol sol,8 sol sol sol

    %48
    sol4 r r
    sol' sol,8 sol sol sol
    r4 sol' sol

    %51
    mi r r
    R2.*18
    mi'4 mi,8 mi mi mi\mbreak

    %71
    mi2.
    mi'4 mi,8 mi mi mi
    mi2.

    %74
    R
    mi4 mi,8 mi mi mi
    mi4 r r

    %77
    R2.*39
    do'8\solo sol do mi sol mi\mbreak
    do sol do mi sol mi

    %118
    do2.
    r4 do'8.[re16 do8. re16]
    mi4 mi8.[fa16 mi8. fa16]

    %121
    re4 re8.[mi16 re8.  mi16]\mbreak
    do4 do8.[re16 do8. re16]
    sol,4 r8 sol si sol\mbreak

    %124
    do sol sol sol do sol
    re' sol, sol sol re' sol,
    do sol sol sol do sol

    %127
    re'4 do r
    fa mi r
    re do r

    %130
    fa mi r
    r sol, sol
    mi r r \mbreak

    %133
    R2.
    do'8.\solo[re16 do8. re16 do8. mi16]
    re8.[mi16 re8. mi16 re8. fa16]

    %136
    mi8.[fa16 mi8. fa16 mi8. sol16]
    fa8.[sol16 fa8. sol16 fa8. la16]
    mi,4 r r

    %139
    R2.
    sol8\soli mi do mi sol do\mbreak
    sol mi do mi sol do

    %142
    do2.\tr
    sol8 mi do mi sol do
    do4 r8 sol sol sol

    %145
    do4 r8 do do do
    re4 r8 re re re
    re4 r8 re re re

    %148
    mi4 r8 mi mi mi
    mi4 r8 do do do
    do4 r8 do do do\mbreak

    %151
    sol4. sol8 sol4
    sol4. do8 sol4
    sol4. re'8 sol,4

    %154
    sol4. do8 sol4
    sol r r
    sol sol,8 sol sol sol

    %157
    sol4 r r
    mi'8 sol sol sol sol sol
    mi do do do do do

    %160
    sol' sol, sol sol sol sol\mbreak
    do sol do sol do sol
    do4 r do'

    %163
    do sol sol
    mi2.\fermata

}


IIIobIn = \relative do'' {

    R2.*8
    la'8.[sib16 la8. sib16] la4
    sol8.[la16 sol8. la16] sol4

    %11
    la8.[sib16 la8. sib16] la4
    sol8.[la16 sol8. la16] sol4
    la8.[sib16 la8. sib16] la4

    %14
    sol8 [do,,16 do do8 do do do]\mbreak
    do4 r r
    R2.*15

    %31
    la''8.[sib16 la8. sib16 la8. sib16]
    la4 r r
    la8.[sib16 la8. sib16 la8. sib16]

    %34
    la4 r r
    fa8 do do do fa do
    fa4 fa fa\mbreak

    %37
    sol8 re re re sol re
    sol4 sol sol
    la8 mi mi mi la mi

    %40
    la4 la la
    sib8 fa fa fa sib fa
    sol do, do do sol' do,

    %43
    la' do, do do la' do,
    sib' do, do do sib' do,\mbreak
    la' do, do do la' do,

    %46
    sib'4 la r
    sol fa r
    sib la r
    sol fa r

    %50
    sol4 mi2\tr
    \tuplet3/2{
        fa8\solo(do mi) fa[(do fa)] sol(fa mi)
        fa8(do mi) fa[(do fa)] sol(fa mi)

        %53
        fa do fa sol[do, sol'] la do, la'
        sib la sib sol[la sol] fa mi fa
        mi re mi
    } do4 r

    %56
    \tuplet3/2{
        do'8(re) do sib[(do) sib] la(sold) la\mbreak
        sold la si mi,[fa mi] re dod re
        dod la' sib la[sib la] sol fad sol

        %59
        fad sol la re,[mi re] do si do
        si sol' la sol[la sol] fa mi fa
        mi fa sol do,[re do] sib la sib

        %62
        la la' sol fa [mi re] mib sol sib
        dod, re mi la,[sib la] sol fa sol
        fa la dod re[la re] fa re fa

        %65
        la sol fa mi[fa re] dod si la
        fa' la re fa,[la re] fa, la re\mbreak
        mi, la re mi,[la re] mi, la re

        %68
        mi, la dod mi,[la dod] mi, la dod
    }

    %69
    re8 la, la la re la
    mi' la, la la mi' la,
    fa' la, la la fa' la,

    %72
    sol' la, la la sol' la,
    fa' la, la la fa' la,
    mi'4\soli mi8.[re16 mi8. fa16]

    %75
    sol2.~\mbreak
    sol8 sib la sol fa mi
    fa2.

    %78
    fa4 fa8.[sol16 fa8. sol16]
    mi4 mi8.[fad?16 mi8. fad?16]
    re4 re8.[mi16 re8.  mi16]

    %81
    dod4 r r
    R2.*6\mbreak
    mi8\solo si si si mi si

    %89
    mi do do do mi do
    mi si si si mi si
    mi do do do mi do

    %92
    mi si si si mi si
    do mi la mi la,4
    R2.*3\mbreak

    %97
    la'8 mi mi mi la mi
    la do, do do la' do,
    la' si, si si la' si,

    %100
    sold' si, si si sold' si,
    do4 r r
    R2.*21

    %123
    sol'8 do, do do sol' do,\mbreak
    la'8 do, do do la' do,
    sib' do, do do sib' do,

    %126
    la' do, do do la' do,
    sib'4 la r
    sol fa r

    %129
    sib la r\mbreak
    sol fa r
    sol4 mi2\tr

    %132
    fa4 r r
    R2.*5
    fa8\soli do la do fa la

    %139
    fa do la do fa la
    la2.\tr~
    la

    %142
    fa8 do la do fa la
    la2.\tr
    fa8 do do do fa do

    %145
    fa4 fa fa\mbreak
    sol8 re re re sol re
    sol4 sol sol

    %148
    la8 mi mi mi la mi
    la4 la la
    sib8 fa fa fa sib fa

    %151
    sol do, do do sol' do,
    la' do, do do la' do,
    sib' do, do do sib' do,\mbreak

    %154
    la' do, do do la' do,
    sib'4 la r
    sol fa r

    %157
    sol mi2\tr
    fa8 do do do do do
    la fa fa fa fa fa

    %160
    do' do, do do do do\mbreak
    fa do fa do fa do
    fa4 r fa'

    %163
    fa mi mi
    fa2.\fermata

}

IIIobIIn = \relative do'' {

    R2.*8
    fa8.[sol16 fa8. sol16] fa4
    mi8.[fa16 mi8. fa16] mi4

    %11
    fa8.[sol16 fa8. sol16] fa4
    mi8.[fa16 mi8. fa16] mi4
    fa8.[sol16 fa8. sol16] fa4\mbreak

    %14
    mi8[do,16 do do8 do do do]
    do4 r r
    R2.*15

    %31
    fa'8.[sol16 fa8. sol16 fa8. sol16]
    fa4 r r
    fa8.[sol16 fa8. sol16 fa8. sol16]

    %34
    fa4 r r
    R2.
    sib,8 fa fa fa sib fa

    %37
    re'4 re re
    do8 sol sol sol do sol
    mi'4 mi mi

    %40
    re8 la la la re la
    fa'4 fa fa
    mi8 do do do mi do\mbreak

    %43
    fa do do do fa do
    sol' do, do do sol' do,
    fa do do do fa do

    %46
    sol'4 fa r
    sib la r
    sol fa r
    sib, la r

    %50
    sib4 sol2\tr
    la4 r r
    R2.*17\mbreak

    %69
    re8 la la la re la
    mi' la, la la mi' la,
    fa' la, la la fa' la,

    %72
    sol' la, la la sol' la,
    fa' la, la la fa' la,
    dod4\soli dod8.[si16 dod8. re16]

    %75
    mi2.~
    mi8 sol fa mi re dod\mbreak
    re2.

    %78
    re4 re8.[mi16 re8. mi16]
    dod4 do8.[re16 do8. re16]
    si4 sib8.[do16 sib8. do16]

    %81
    la4 r r
    R2.*15
    mi'8 do do do mi do\mbreak

    %98
    mi la, la la mi' la,
    si mi mi mi si  mi
    si sold sold sold si sold

    %101
    la4 r r
    R2.*21
    mi'8 do do do mi do

    %124
    fa do do do fa do\mbreak
    sol' do, do do sol' do,
    fa do do do fa do

    %127
    sol'4 fa r
    sib la r
    sol fa r

    %130
    sib la r
    sib,4 sol2\tr
    la4 r r

    %133
    R2.*5
    do8 \soli la fa la do fa\mbreak
    do la fa la do fa

    %140
    fa2.\tr~
    fa
    do8 la fa la do fa

    %143
    fa2.\tr
    R
    sib,8 fa fa fa sib fa

    %146
    re'4 re re
    do8 sol sol sol do sol
    mi'4 mi mi\mbreak

    %149
    re8 la la la re la
    fa'4 fa fa
    mi8 do do do mi do

    %152
    fa do do do fa do
    sol' do, do do sol' do,
    fa do do do fa do

    %155
    sol'4 fa r
    sib la r
    sib, sol2\tr\mbreak

    %158
    la8 do do do do do
    la fa fa fa fa fa
    do' do, do do do do

    %161
    fa do fa do fa do
    fa4 r la
    sol sol sol

    %164
    la2.\fermata

}

IIIvlIn = \relative do'' {

    R2.*8
    fa8 do do do fa do
    sol' do, do do sol' do,

    %11
    la' do, do do la' do,
    sib' do, do do sib' do,
    la' do, do do la' do,

    %14
    sol'8 [do,,16 do do8 do do do]
    do4 r r
    re'16\solo sib re fa re sib re fa re8 r

    %17
    re'16 mi re do si do si la sol la sol fa
    mi16 do mi sol mi do mi sol mi8 r
    mi'16 fa mi re dod re dod si? la si! la sol

    %20
    fa16 re fa la fa re fa la fa8 r
    fa'16 sol fa mi re mi re do sib? do sib la
    sol16 mi sol sib sol mi sol sib sol8 r

    %23
    sol'16 la sol fa mi fa mi re do re do sib\mbreak
    la do fa do la do fa do la do fa do
    la do fa do la do fa do la do fa do

    %26
    fa, la do la fa la do la fa la do la
    fa la do la fa la do la fa la do la
    do, fa la fa do fa la fa do fa la fa

    %29
    la, do fa do la do fa do la do fa do\mbreak
    do, fa la fa do fa la fa do fa la fa
    do fa la fa do fa la fa do fa la fa

    %32
    do fa la fa do fa la fa do fa la fa
    do fa la fa do fa la fa do fa la fa
    do fa la fa do fa la fa do fa la fa

    %35
    fa'8 do do do fa do
    fa4 fa fa
    sol8 re re re sol re

    %38
    sol4 sol sol
    la8 mi mi mi la mi
    la4 la la\mbreak

    %41
    sib8 fa fa fa sib fa
    sol do, do do sol' do,
    la' do, do do la' do,

    %44
    sib' do, do do sib' do,
    la' do, do do la' do,
    sib'4 la r

    %47
    sol fa r
    sib la r
    sol fa r

    %50
    sol mi2\tr\mbreak
    fa4 r r
    R2.*17
    re8 la la la re la
    mi' la, la la mi' la,

    %71
    fa' la, la la fa' la,
    sol' la, la la sol' la,
    fa' la, la la fa' la,\mbreak

    %74
    mi'4 r r
    la, la,8 la la la
    la4 r r

    %77
    re' re,8 re re re
    re4 r r
    R2.*2

    %81
    r8 dod''\solo mi16(re) dod(si) la(sol) fa?(mi)
    fa8 la re16(do) sib(la) sol(fa) mi(re)
    mi8 sol do16(sib) la(sol) fa(mi) re(do)

    %84
    re8 fa sib16(la) sol(fa) mi(re) dod(si)\mbreak
    dod8 mi la16(sol) fad(mi) re(do) sib!(la)
    sib8 re sol16(fa?) mi(re) do(sib) la(sol)

    %87
    la8 do fa16(mi) re(do) si(la) sold(fad)
    sold si mi si sold si mi si sold si mi si
    la do mi do la do mi do la do mi do\mbreak

    %90
    sold si mi si sold si mi si sold si mi si
    la do mi do la do mi do la do mi do
    sold si mi si sold si mi si sold si mi si

    %93
    la do mi do r8 mi la16 mi la mi
    si' mi, si' mi, si' mi, si' mi, do' mi, do' mi,
    re' mi, re' mi, re' mi, re' mi, mi' mi, mi' mi,

    %96
    fad' mi, fad' mi, fad' mi, fad' mi, sold' mi, sold' mi,
    la'8 mi, mi mi la mi
    la do, do do la' do,\mbreak

    %99
    la' si, si si la' si,
    sold' si, si si sold' si,
    do4 r r

    %102
    R2.*4
    r8 la\solo do mi la4~
    la8 la, do mi la4~

    %108
    la8 fad red fad la4
    sol8 sol, si mi sol4~\mbreak
    sol8 mi dod mi sol4

    %111
    fa8 fa, la re fa4~
    fa8 re si re fa4
    mi8 mi, sol do mi4

    %114
    fa8 la, do fa la fa
    do la do fa la fa
    do4 r r

    %117
    R2.*6\mbreak
    \footnote #' (-1 . 2) \markup\column\smaller {"  ""Prima di questo ”tutti” l'arrangiamento di Pisendel include un assolo del violino principale che non esiste"\vspace #-0.2"nell'autografo e che perciò non compare in questa edizione."" "} mi8 do do do sol' do,
    la' do, do do la' do,

    %125
    sib' do, do do sib' do,
    la' do, do do la' do,
    sib'4 la r

    %128
    sol fa r\mbreak
    sib la r
    sol fa r

    %131
    sol mi2\tr
    fa4 r r
    R2.*11

    %144
    fa8 do do do fa do
    fa4 fa fa
    sol8 re re re sol re

    %147
    sol4 sol sol
    la8 mi mi mi la mi\mbreak
    la4 la la

    %150
    sib8 fa fa fa sib fa
    sol do, do do sol' do,
    la' do, do do la' do,

    %153
    sib' do, do do sib' do,
    la' do, do do la' do,
    sib'4 la r

    %156
    sol fa r
    sol mi2\tr\mbreak
    fa8 do do do do do

    %159
    la fa fa fa fa fa
    do' do, do do do do
    fa do fa do fa do

    %162
    fa4 r fa'
    fa mi mi
    fa2.\fermata

}

IIIvlIIn = \relative do'' {

    R2.*8
    fa8 do do do fa do
    sol' do, do do sol' do,

    %11
    la' do, do do la' do,
    sib' do, do do sib' do,
    la' do, do do la' do,

    %14
    sol'[do,,16 do do8 do do do]\mbreak
    do4 r r
    re' re re

    %17
    re r r
    mi mi mi
    mi r r

    %20
    fa fa fa
    fa r r
    sol sol sol

    %23
    sol sol sol\mbreak
    la r r
    R2.*10

    %35
    fa8 do do do fa do
    fa4 fa fa
    sol8 re re re sol re

    %38
    sol4 sol sol
    la8 mi mi mi la mi
    la4 la la\mbreak

    %41
    sib8 fa fa fa sib fa
    sol do, do do sol' do,
    la' do, do do la' do,

    %44
    sib' do, do do sib' do,
    la' do, do do la' do,
    sib'4 la r

    %47
    sol fa r
    sib la r\mbreak
    sol fa r

    %50
    sol mi2\tr
    fa4 r r
    R2.*17

    %69
    re8 la la la re la
    mi' la, la la mi' la,
    fa' la,  la la fa' la,

    %72
    sol' la, la la sol' la,\mbreak
    fa' la, la la fa' la,
    mi'4 r r

    %75
    la, la,8 la la la
    la4 r r
    re' re,8 re re re

    %78
    re4 r r
    R2.*18
    la''8 mi mi mi la mi\mbreak

    %98
    la do, do do la' do,
    la' si, si si la' si,
    sold' si, si si sold' si,

    %101
    do4 r r
    R2.*21
    sol'8 do, do do sol' do,

    %135
    la' do, do do la' do,\mbreak
    sib' do, do do sib' do,
    la' do, do do la' do,

    %138
    sib'4 la r
    sol fa r
    sib la r

    %141
    sol fa r
    sol mi2\tr
    fa4 r r

    %144
    R2.*11
    fa8 do do do fa do

    %156
    fa4 fa fa
    sol8 re re re sol re
    sol4 sol sol

    %159
    la8 mi mi mi la mi\mbreak
    la4 la la
    sib8 fa fa fa sib fa

    %162
    sol do, do do sol' do,
    la' do, do do la' do,
    sib' do, do do sib' do,

    %165
    la' do, do do la' do,
    sib'4 la r
    sol fa r

    %168
    sol mi2\tr\mbreak
    fa8 do do do do do
    la fa fa fa fa fa

    %171
    do' do, do do do do
    fa do fa do fa do
    fa4 r fa'

    %174
    fa mi mi
    fa2.\fermata

}

IIIvlIIIn = \relative do'' {

    R2.*8
    fa8 do do do fa do
    sol' do, do do sol' do,

    %11
    la' do, do do la' do,
    sib' do, do do sib' do,
    la' do, do do la' do,

    %14
    sol'[do,,16 do do8 do do do]
    do4 r r\mbreak
    fa fa fa

    %17
    sol r r
    sol sol sol
    la r r

    %20
    la la la
    sib r r
    sib sib sib

    %23
    do do do
    do r r
    R2.*11\mbreak

    %36
    sib8 fa fa fa sib fa
    re'4 re re
    do8 sol sol sol do sol

    %39
    mi'4 mi mi
    re8 la la la re la
    fa'4 fa fa

    %42
    mi8 do do do mi do
    fa do do do fa do
    sol' do, do do sol' do,\mbreak

    %45
    fa do do do fa do
    sol'4 fa r
    sib la r

    %48
    sol fa r
    sib, la r
    sib sol2\tr

    %51
    la4 r r
    R2.*17
    re8 la la la re la

    %70
    mi' la, la la mi' la,\mbreak
    fa' la, la la fa' la,
    sol' la, la la sol' la,

    %73
    fa' la, la la fa' la,
    dod4 r r
    la la,8 la la la

    %76
    la4 r r
    re' re,8 re re re
    re4 r r

    %79
    R2.*18\mbreak
    mi'8 do do do mi do
    mi la, la la mi' la,

    %99
    si mi mi mi si mi
    si sold sold sold si sold
    la4 r r

    %102
    R2.*21
    mi'8 do do do mi do
    fa do do do fa do

    %136
    sol' do, do do sol' do,
    fa do do do fa do
    sol'4 fa r

    %139
    sib la r
    sol fa r
    sib la r

    %142
    sib, sol2\tr
    la4 r r
    R2.*12

    %156
    sib8 fa fa fa sib fa
    re'4 re re
    do8 sol sol sol do sol

    %159
    mi'4 mi mi\mbreak
    re8 la la la re la
    fa'4 fa fa

    %162
    mi8 do do do mi do
    fa do do do fa do
    sol' do, do do sol' do,

    %165
    fa do do do fa do
    sol'4 fa r
    sib la r

    %168
    sib, sol2\tr
    la8 do do do do do
    la fa fa fa fa fa

    %171
    do' do, do do do do\mbreak
    fa do fa do fa do
    fa4 r la

    %174
    sol sol sol
    la2.\fermata

}


IIIvlan = \relative do' {

    R2.*8
    la'4 la la
    mi mi mi

    %11
    do do do
    mi mi mi
    do do do

    %14
    mi8[do16 do do8 do do do]
    do4 r r
    sib sib sib

    %17
    si r r \mbreak
    do do do
    dod r r

    %20
    re re re
    re r r
    mi mi mi

    %23
    mi mi mi
    fa r r
    R2.*10

    %35
    do4 r8 do do do
    re4 r8 re re re\mbreak
    re4 r8 re re re

    %38
    mi4 r8 mi mi mi
    mi4 r8 mi mi mi
    fa4 r8 fa fa fa

    %41
    fa4 r8 fa fa fa
    do'4 r8 do, do do
    do4 r8 do do do

    %44
    mi4 r8 mi mi mi
    do4 r8 do do do\mbreak
    mi4 do r

    %47
    mi do r
    mi do r
    mi do r

    %50
    re do2
    do4 r r
    R2.*17

    %69
    fa4 r8 fa fa fa
    dod4 r8 dod dod dod
    la4 r8 la la la\mbreak

    %72
    mi'4 r8 mi mi mi
    la,4 r8 la' la la
    la4 r r

    %75
    la la,8 la la la
    la4 r r
    re' re,8 re re re

    %78
    re4 r r
    R2.*18
    do4 do do

    %98
    do mi mi\mbreak
    mi mi mi
    mi mi mi

    %101
    mi r r
    R2.*21
    do4 do do

    %124
    do do do
    mi mi mi
    do do do

    %138
    mi do r
    mi do r\mbreak
    mi do r

    %141
    mi do r
    re do2
    do4 r r

    %144
    R2.*11
    do4 r8 do do do
    re4 r8 re re re

    %157
    re4 r8 re re re
    mi4 r8 mi mi mi
    mi4 r8 mi mi mi

    %160
    fa4 r8 fa fa fa\mbreak
    fa4 r8 fa fa fa
    do'4 r8 do, do do

    %163
    do4 r8 do do do
    mi4 r8 mi mi mi
    do4 r8 do do do

    %166
    mi4 do r
    mi do r
    do do2

    %169
    do8 do' do do do do
    la fa fa fa fa fa\mbreak
    do' do, do do do do

    %172
    fa do fa do fa do
    fa4 r do
    do do do

    %175
    do2.\fermopz

}

IIIfgn = \relative do {

    fa4 fa4. sol8
    la2 fa4
    mi fa sib

    %4
    mi,2 fa4
    fa fa4. sol8
    la2 fa4

    %7
    mi fa sib,
    do2.
    fa4 fa fa
    do do do

    %11
    fa fa fa
    do do do
    fa fa fa

    %14
    do8[do16 do do8 do do do]\mbreak
    do4 r r
    R2.*8

    %24
    fa4 fa fa
    fa fa fa
    fa fa fa

    %27
    fa fa fa
    fa fa fa
    fa fa fa

    %30
    fa fa fa\mbreak
    fa r r
    fa fa fa

    %33
    fa r r
    fa fa fa
    la, r8 la la la

    %36
    re4 r8 re re re
    si4 r8 si si si
    do4 r8 do do do\mbreak

    %39
    dod4 r8 dod dod dod
    re4 r8 re re re
    re4 r8 re re re

    %42
    do4 r8 do do do
    do4 r8 do do do
    do4 r8 do do do

    %45
    do4 r8 do do do\mbreak
    do4 fa r
    do fa r

    %48
    R2.*2
    sib4 do do,
    fa, r r

    %52
    R2.*17
    re'4 r8 re re re

    %70
    la4 r8 la la la
    re4 r8 re re re
    dod4 r8 dod dod dod\mbreak

    %73
    re4 r8 re re re
    la4 r r
    la' la,8 la la la

    %76
    la4 r r
    re' re,8 re re re
    re4 re sol

    %79
    la fad fad
    sol sol sol\mbreak
    la r r

    %82
    R2.*15
    la,4 r8 la la la
    la4 r8 la la la

    %99
    mi'4 r8 mi mi mi\mbreak
    mi4 r8 mi mi mi
    \clef tenor \key fa\major \footnote #' (-1 . 3) \markup\column\smaller {"  ""L'assolo del Violoncello e le parti di accompagnamento sono cancellate nell'autografo,"\vspace #-0.2"ma sono leggibili e trascritte anche nella copia di Dresda.""  "}la16^\markup\italic"Violoncello Solo" mi mi la la mi mi la la mi mi la

    %102
    la mi mi la la mi mi la la si sold la
    si mi, mi si' si mi, mi si' si do la si
    do mi, mi do' do mi, mi do' do re si do

    %105
    re mi, mi re' re mi, mi re' re mi do re
    mi8 la, r mi' mi16 fa re mi
    fa mi fa sol fa mi fa sol fa sol fa mi

    %108
    red si si red red si si red red la la red
    mi red mi fa mi red mi fa mi fa mi re?
    dod la la dod dod la la dod dod la la dod

    %111
    re dod re mi re dod re mi re mi re do?
    si sol sol si si sol sol si si fa fa si
    do si do re do si do re do re do sib?

    %114
    la8 fa la do fa do
    la fa la do fa do
    \clef bass \key fa\major fa,2.^\markup\italic "Fagotto"~

    %117
    fa~
    fa~
    fa~

    %120
    fa2 fa4
    sol mi do
    fa sib,2

    %123
    do4 do do
    do do do
    do do do

    %126
    do do do
    do fa r\mbreak
    do fa r

    %129
    do fa r
    do fa r
    sib do do,

    %132
    fa4 fa fa
    do do4. do8\mbreak
    fa2.~

    %135
    fa~
    fa~
    fa~

    %138
    fa~
    fa~
    fa~

    %141
    fa~
    fa~
    fa


    fa4 r8 la, la la\mbreak
    sib4 r8 sib sib sib

    %157
    si4 r8 si si si
    do4 r8 do do do
    dod4 r8 dod dod dod

    %160
    re4 r8 re re re
    re4 r8 re re re
    do4 r8 do do do\mbreak

    %163
    do4 r8 do do do
    do4 r8 do do do
    do4 r8 do do do

    %166
    do4 fa r
    do fa r
    do' do,2

    %169
    fa8 do' do do do do\mbreak
    la fa fa fa fa fa
    do' do, do do do do

    %172
    fa do fa do fa do
    fa4 r fa
    do do' do,

    %175
    fa,2.\fermata

}

IIIbcn = \relative do {

    R2.*8
    fa4 fa fa
    do do do

    %11
    fa fa fa
    do do do
    fa fa fa

    %14
    do8[do16 do do8 do do do]\mbreak
    do4 r r
    R2.*8

    %24
    fa4 r r
    fa4 r r
    fa4 r r

    %27
    fa4 r r
    fa4 r r
    fa4 r r

    %30
    fa4 r r
    fa fa fa
    fa r r

    %33
    fa fa fa
    fa r r
    la, r8 la la la

    %36
    re4 r8 re re re
    si4 r8 si si si
    do4 r8 do do do\mbreak

    %39
    dod4 r8 dod dod dod
    re4 r8 re re re
    re4 r8 re re re

    %42
    do4 r8 do do do
    do4 r8 do do do
    do4 r8 do do do

    %45
    do4 r8 do do do\mbreak
    do4 fa r
    do fa r

    %48
    do fa r
    do fa r
    sib4 do do,
    fa, r do'

    %52
    fa r do
    fa mi fa
    sol la sib

    %55
    do4. re8 do sib\mbreak
    la4 re,2
    mi4 sold2

    %58
    la4 dod,2
    re4 fad2
    sol4 si,2

    %61
    do4 mi2
    fa4 re sol
    la dod,2

    %64
    re4 fa re\mbreak
    fa sol la
    re, re' re,

    %67
    la la' la,
    la la' la,
    re r8 re re re

    %70
    la4 r8 la la la
    re4 r8 re re re
    dod4 r8 dod dod dod\mbreak

    %73
    re4 r8 re re re
    la4 r r
    la' la,8 la la la

    %76
    la4 r r
    re' re,8 re re re
    re4 re sol

    %79
    la fad fad
    sol sol sol\mbreak
    la dod dod

    %82
    re  sib sib
    do la la
    sib sol sol

    %85
    la fad fad
    sol mi mi
    fa re re

    %88
    mi mi mi
    la, la la\mbreak
    mi' mi mi

    %91
    la, la la
    mi' mi mi
    la, r r

    %94
    R2.*3
    la4 r8 la la la
    la4 r8 la la la

    %99
    mi'4 r8 mi mi mi\mbreak
    mi4 r8 mi mi mi
    la,4 r r
    la2.~
    la4 sold2
    la r4
    si2 r4
    la2 r4
    la la la
    si si si'
    mi, mi mi
    la la la
    re, re re
    sol sol sol
    do, do do
    fa fa fa
    fa fa fa
    fa4 r r
    R2.*6

    %123
    do4 do do
    do do do
    do do do

    %126
    do do do
    do fa r\mbreak
    do fa r

    %129
    do fa r
    do fa r
    sib do do,
    fa,4 r r

    %132
    R2.\mbreak
    fa'2.\tasto~

    %135
    fa~
    fa~
    fa~

    %138
    fa~
    fa~
    fa~

    %141
    fa~
    fa~
    fa


    %144
    fa4 r8 la, la la\mbreak
    sib4 r8 sib sib sib

    %146
    si4 r8 si si si
    do4 r8 do do do
    dod4 r8 dod dod dod

    %149
    re4 r8 re re re
    re4 r8 re re re
    do4 r8 do do do\mbreak

    %152
    do4 r8 do do do
    do4 r8 do do do
    do4 r8 do do do

    %155
    do4 fa r
    do fa r
    do' do,2

    %158
    fa8 do' do do do do\mbreak
    la fa fa fa fa fa
    do' do, do do do do

    %161
    fa do fa do fa do
    fa4 r fa
    do do' do,

    %164
    fa,2.\fermata

}

IIIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*11
    <7>2.
    s2.*28
    <6>2.
    s
    s
    <7>
    s
    <7>
    <7>
    <7>
    <7>
    s2.*7
    <_+>2.
    <_+>
    <_+>
    <_!>
    s
    s
    <_+>
    s
    s2 <_+>4
    s2.
    <5 4>
    <_+>
    s2.*3
    <6 5>2.
    s2.
    <_+>2.
    s2.*4
    <_+>4 <7 5->2
    <_!>4 <_-> s
    <_+>2.
    s2.*3
    <_+>2.
    <_->
    s
    <_+>
    s2.*10
    <5! 4>2.
    <_+>
    s
    s
    <2!>4 <3!>2
    s2.*4
    <7 _+>2.
    s
    <7 _+>
    s
    <7 _!>
    s2.*12
    <7>2.
    s
    <7>
    <7>
    <7>
    <7>
    s2.*19
    <6>2.
    s
    <6 4>
    <7 5>
    <6 4>
    <7>
    <7>

}


forma = {

    \time 3/4
    \tempo 2 = 70
    s2.*164
    \bar "|."

}


IIIcrI = {
    \IIIglobal
    <<\IIIcrIn \forma>>

}



IIIcrII = {
    \IIIglobal
    <<\IIIcrIIn \forma>>

}


IIIobI = {
    \IIIglobal
    <<\IIIobIn \forma>>

}

IIIobII = {
    \IIIglobal
    <<\IIIobIIn \forma>>

}

IIIvlI = {
    \IIIglobal
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma>>

}

IIIvlIII = {
    \IIIglobal
    <<\IIIvlIIIn \forma>>

}


IIIvla = {
    \IIIglobal
    \clef alto
    <<\IIIvlan \forma>>

}

IIIfg = {
    \IIIglobal
    \clef bass
    <<\IIIfgn \forma>>

}


IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

   systems-per-page = #2
   print-first-page-number = ##f
   first-page-number = #2

}

\header {
   subtitle = \markup\center-column{"Concerto con molti strumenti [RV 574]" \smaller "(dalla partitura autografa)" }
   composer = \markup \center-column{"A. Vivaldi (1678 - 1741)"}

}

\markup\huge "[1.] All[egr]o"

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
   }<<

      \new GrandStaff <<
         \new Staff
         <<
            \set Staff.instrumentName = \markup \center-column{"Primo Trombon"\vspace #-0.2"da Caccia"}
            \set Staff.midiInstrument = #"french horn"
            \key fa\major
            \set Staff.shortInstrumentName = "cr1"
            \IcrI
         >>

         \new Staff
         <<
            \set Staff.instrumentName = \markup \center-column{"2.do Trombon"\vspace #-0.2"da Caccia"}
            \set Staff.midiInstrument = #"french horn"
            \key fa\major
            \set Staff.shortInstrumentName = "cr2"
            \IcrII
         >>
      >>

      \new GrandStaff <<
         \new Staff
         <<
            \set Staff.instrumentName = \markup \center-column{"P.mo"\vspace #-0.2"Oboè"}
            \set Staff.midiInstrument = #"oboe"
            \key fa\major
            \set Staff.shortInstrumentName = "ob1"
            \IobI
         >>

         \new Staff
         <<
            \set Staff.instrumentName = \markup \center-column{"2.do"\vspace #-0.2"Oboè"}
            \set Staff.midiInstrument = #"oboe"
            \key fa\major
            \set Staff.shortInstrumentName = "ob2"
            \IobII
         >>
      >>

      \new GrandStaff <<
         \new Staff
         <<
             \set Staff.instrumentName = \markup \center-column{"Viol[in]o"\vspace #-0.2"Principale"}
            \set Staff.midiInstrument = #"violin"
            \key fa\major
            \set Staff.shortInstrumentName = "vlp"
            \IvlI
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Viol[in]o"\vspace #-0.2"P.mo"}
            \key fa\major
            \set Staff.shortInstrumentName = "vl1"
            \IvlII
         >>

         \new Staff
         <<
            \set Staff.instrumentName = \markup \center-column{"Viol[in]o"\vspace #-0.2"2.do"}
            \set Staff.midiInstrument = #"violin"
            \key fa\major
            \set Staff.shortInstrumentName = "vl2"
            \IvlIII
         >>
      >>

      \new Staff
      <<
         \set Staff.instrumentName = \markup \center-column{{Alto}}
         \set Staff.midiInstrument = #"viola"
         \key fa\major
         \set Staff.shortInstrumentName = "vla"
         \Ivla
      >>

      \new Staff
      <<
         \set Staff.instrumentName = \markup \center-column{"Fagotto"}
         \set Staff.midiInstrument = #"bassoon"
         \key fa\major
         \set Staff.shortInstrumentName = "fg"
         \Ifg
      >>

      \new Staff
      <<
         \set Staff.instrumentName = \markup \center-column{"Organo"}
         \set Staff.midiInstrument = #"contrabass"
         \key fa\major
         \set Staff.shortInstrumentName = "bc"
         \Ibc
      >>
   >>

   \layout {

      indent = 1.8\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #2
         \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

\markup\huge "[2.] Grave"

\score {

         \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
         }<<

      \new GrandStaff <<
         \new Staff
         <<
            \set Staff.instrumentName = \markup \center-column{"Primo Trombon"\vspace #-0.2"da Caccia"}
            \set Staff.midiInstrument = #"french horn"
            \key fa\major
            \set Staff.shortInstrumentName = "cr1"
            \IIcrI
         >>

         \new Staff
         <<
            \set Staff.instrumentName = \markup \center-column{"2.do Trombon"\vspace #-0.2"da Caccia"}
            \set Staff.midiInstrument = #"french horn"
            \key fa\major
            \set Staff.shortInstrumentName = "cr2"
            \IIcrII
         >>
      >>

      \new GrandStaff <<
         \new Staff
         <<
            \set Staff.instrumentName = \markup \center-column{"P.mo"\vspace #-0.2"Oboè"}
            \set Staff.midiInstrument = #"oboe"
            \key fa\major
            \set Staff.shortInstrumentName = "ob1"
            \IIobI
         >>

         \new Staff
         <<
            \set Staff.instrumentName = \markup \center-column{"2.do"\vspace #-0.2"Oboè"}
            \set Staff.midiInstrument = #"oboe"
            \key fa\major
            \set Staff.shortInstrumentName = "ob2"
            \IIobII
         >>
      >>

      \new GrandStaff <<
         \new Staff
         <<
             \set Staff.instrumentName = \markup \center-column{"Viol[in]o"\vspace #-0.2"Principale"}
            \set Staff.midiInstrument = #"violin"
            \key fa\major
            \set Staff.shortInstrumentName = "vlp"
            \IIvlI
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Viol[in]o"\vspace #-0.2"P.mo"}
            \key fa\major
            \set Staff.shortInstrumentName = "vl1"
            \IIvlII
         >>

         \new Staff
         <<
            \set Staff.instrumentName = \markup \center-column{"Viol[in]o"\vspace #-0.2"2.do"}
            \set Staff.midiInstrument = #"violin"
            \key fa\major
            \set Staff.shortInstrumentName = "vl2"
            \IIvlIII
         >>
      >>

      \new Staff
      <<
         \set Staff.instrumentName = \markup \center-column{{Alto}}
         \set Staff.midiInstrument = #"viola"
         \key fa\major
         \set Staff.shortInstrumentName = "vla"
         \IIvla
      >>

      \new Staff
      <<
         \set Staff.instrumentName = \markup \center-column{Fagotto}
         \set Staff.midiInstrument = #"bassoon"
         \key fa\major
         \set Staff.shortInstrumentName = "fg"
         \IIfg
      >>

      \new Staff
      <<
         \set Staff.instrumentName = \markup \center-column{"Organo"}
         \set Staff.midiInstrument = #"contrabass"
         \key fa\major
         \set Staff.shortInstrumentName = "bc"
         \IIbc
      >>
   >>

   \layout {

      indent = 1.8\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #1.5
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
         \override BarLine.hair-thickness = #1.2
         \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/2)  %aumenta lo spazio orizzontale
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

\markup\huge "[3.] [Allegro]"

\score {

         \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
         }<<

      \new GrandStaff <<
         \new Staff
         <<
            \set Staff.instrumentName = \markup \center-column{"Primo Trombon"\vspace #-0.2"da Caccia"}
            \set Staff.midiInstrument = #"french horn"
            \key fa\major
            \set Staff.shortInstrumentName = "cr1"
            \IIIcrI
         >>

         \new Staff
         <<
            \set Staff.instrumentName = \markup \center-column{"2.do Trombon"\vspace #-0.2"da Caccia"}
            \set Staff.midiInstrument = #"french horn"
            \key fa\major
            \set Staff.shortInstrumentName = "cr2"
            \IIIcrII
         >>
      >>

      \new GrandStaff <<
         \new Staff
         <<
            \set Staff.instrumentName = \markup \center-column{"P.mo"\vspace #-0.2"Oboè"}
            \set Staff.midiInstrument = #"oboe"
            \key fa\major
            \set Staff.shortInstrumentName = "ob1"
            \IIIobI
         >>

         \new Staff
         <<
            \set Staff.instrumentName = \markup \center-column{"2.do"\vspace #-0.2"Oboè"}
            \set Staff.midiInstrument = #"oboe"
            \key fa\major
            \set Staff.shortInstrumentName = "ob2"
            \IIIobII
         >>
      >>

      \new GrandStaff <<
         \new Staff
         <<
             \set Staff.instrumentName = \markup \center-column{"Viol[in]o"\vspace #-0.2"Principale"}
            \set Staff.midiInstrument = #"violin"
            \key fa\major
            \set Staff.shortInstrumentName = "vlp"
            \IIIvlI
         >>

         \new Staff
         <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Viol[in]o"\vspace #-0.2"P.mo"}
            \key fa\major
            \set Staff.shortInstrumentName = "vl1"
            \IIIvlII
         >>

         \new Staff
         <<
            \set Staff.instrumentName = \markup \center-column{"Viol[in]o"\vspace #-0.2"2.do"}
            \set Staff.midiInstrument = #"violin"
            \key fa\major
            \set Staff.shortInstrumentName = "vl2"
            \IIIvlIII
         >>
      >>

      \new Staff
      <<
         \set Staff.instrumentName = \markup \center-column{{Alto}}
         \set Staff.midiInstrument = #"viola"
         \key fa\major
         \set Staff.shortInstrumentName = "vla"
         \IIIvla
      >>

      \new Staff
      <<
         \set Staff.instrumentName = \markup \center-column{"Fagotto e"\vspace #-0.2"Violoncello"}
         \set Staff.midiInstrument = #"bassoon"
         \key fa\major
         \set Staff.shortInstrumentName = "fg"
         \IIIfg
      >>

      \new Staff
      <<
         \set Staff.instrumentName = \markup \center-column{"Organo"}
         \set Staff.midiInstrument = #"contrabass"
         \key fa\major
         \set Staff.shortInstrumentName = "bc"
         \IIIbc
      >>
   >>

   \layout {

      indent = 1.8\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #1.5
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
         \override BarLine.hair-thickness = #1.2
         \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/2)  %aumenta lo spazio orizzontale
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


