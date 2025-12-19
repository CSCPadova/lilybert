\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

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

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-0
    \center-column {
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}
mbreak = { }


Iglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IvlIn =  \relative do'' {

  la'4 r r
  R2.*7\mbreak
  r8 la\soli la la sib! la

  %10
  sold si sol sol la sol
  fad la fa fa sol fa
  mi sol mib mib mib re

  %13
  dod4 r r
  R2.
  r8 mi mi mi fa fa

  %16
  mi4 r r
  r8 re' re re do do %%% inizio ripresa
  si2.

  %19
  r8 do do do sib! sib
  la2.
  r8 sib sib sib la la
  sold2.

  %23
  r8 la la la sol? sol
  fa4 r r
  R2.

  %26
  r8 la,\p la la sib sib
  la la la la sib sib
  la fa' fa fa la fa\mbreak

  %29
  mi mi mi mi la mi
  mi mi mi mi la mi
  re\solo la' re re, la' re,

  %32
  sib' la re re, la' re,
  sib' la re re, la' re,
  sib' re sib re sol, sib

  %35
  mi,4 r r
  R2.
  r4 r16 re[mi fa sol la sib do]\mbreak

  %38
  re do sib la re do sib la re do sib la
  sib8 sol sib re sib sol
  r sol sib re sib sol

  %41
  r4 r16 do,[re mi fa sol la sib]
  do sib la sol do sib la sol do sib la sol
  la8 fa la do la fa

  %44
  r fa la do la fa\mbreak
  r4 r16 sib,[do re mi fa sol la]
  sib la sol fa sib la sol fa sib la sol fa

  %47
  mi8 sol sol sol do sol
  lab sol sol sol do16(sol) do(sol)
  lab8 sol sol sol do16(sol) do(sol)

  %50
  la!8 sol16 fa mi fa mi re do re do sib
  la8 la' la la sib sol
  fa la la la la sib\mbreak

  %53
  do2.~
  do8 mib re do sib la
  sib sol sol sol sol la
  sib2.~

  %57
  sib8 re do sib la sol
  la la la la la si
  sold2.

  %60
  r8 la la la sol! sol
  fad2.
  r8 sol sol sol fa? fa\mbreak

  %63
  mi2.
  r8 fa fa fa mi mi
  re2.

  %66
  r8 mi mi mi re re
  do4 r r
  R2.*3

  %71
  r8 la' la la do la
  la la la la do la
  sold sold sold sold si sold\mbreak

  %74
  la16\solo mi do la la' mi do la la' mi do la
  la'4 r r
  do16 si do re do si do re do si do re

  %77
  si la si do si la si do si la si do
  la sold la si la sold la si la sold la si
  sold4 r r\mbreak

  %80
  do,16 si do re do si do re do si do re
  si la si do si la si do si la si do
  la sold la si la sold la si la sold la si

  %83
  sold4 r r
  R2.
  r8 sold' si16[la sold fad mi re do si]\mbreak

  %86
  do si do la mi' re mi do la' sold la mi
  do'8 mi, do la' si, sold'
  la4 r r

  %89
  R2.
  r8 mi mi mi mi fad
  sol2.~

  %92
  sol8 sol fad mi re dod
  si fad' fad fad fad sol\mbreak
  la2.~

  %95
  la8 do si la sol fad
  sol sol sol sol sol la
  sib!2.~

  %98
  sib8 sib la sol fad mi
  fad fad fad fad fad sol
  la la la la la sib

  %101
  do do do do sib la
  sib sib sib sib sib la
  sold? sold sold sold sold fad?\mbreak

  %104
  mi4 r r
  R2.
  r8 mi\soli mi mi fa? fa

  %107
  mi^\tu la la la sol? sol
  fa fa mi mi mi mi
  re8 \solo la' sol16 la sol la fa sol fa sol

  %110
  mi[la,  mi' la, fa' la, fa' la, sol' la, sol' la,]
  la' [la, la' la,] sol' la, sol' la, fa' la, fa' la,
  mi' la, mi' la, fa' la, fa' la, sol' la, sol' la,\mbreak

  %113
  la'[la, la' la, sol' la, sol' la, fa' la, fa' la,]
  mi'8 la la la sol sol
  r8 re' re re do do %%% inizio ripresa

  %116
  si2.
  r8 do do do sib! sib
  la2.

  %119
  r8 sib sib sib la la
  sold2.
  r8 la la la sol? sol

  %122
  fa4 r r
  R2.
  r8 la,\p la la sib sib

  %125
  la la la la sib sib
  la fa' fa fa la fa\mbreak
  mi mi mi mi la mi

  %128
  mi mi mi mi la mi
  re4 r r

}

IvlIIn = \relative do'' {

  fa4 r r
  R2.*7\mbreak
  r8 fa\soli fa fa fa fa

  %10
  mi mi mi mi mi mi
  re re re re re re
  sol mi sib sib sib sib

  %13
  mi,4 r r
  R2.
  r8 dod' dod dod re re

  %16
  dod la' la la sol sol
  fad2. %%%%%%ripresa
  r8 sol sol sol fa! fa

  %19
  mi2.
  r8 fa fa fa mi mi
  re2.

  %22
  r8 mi mi mi re re
  dod2.
  re4 r r

  %25
  R2.
  r8 fa,\p fa fa  sol sol
  fa fa fa fa sol sol

  %28
  fa re' re re fa re\mbreak
  re re re re mi re
  dod dod dod dod mi dod

  %31
  re\solo fa la la, fa' la,
  sol' fa la la, fa' la,
  sol' fa la la, fa' la,

  %34
  sol' sib sol sib mi, sol
  dod,4 r16 la[si dod re mi fa sol]
  la sol fa mi la sol fa mi la sol fa mi

  %37
  fa8 re fa la fa re\mbreak  %%%% fine p.5
  r re fa la fa re
  r4 r16 sol,[la sib do re mi fa]

  %40
  sol fa mi re sol fa mi re sol fa mi re
  mi8 do mi sol  mi do
  r do mi sol mi do

  %43
  r4 r16 fa,[sol la sib do re mi]
  fa mi re do fa mi re do fa mi re do\mbreak
  re8 sib re fa re sib

  %46
  r sib re fa re sib
  do mi mi mi sol mi
  fa re re re sol16(mi) sol(mi)

  %49
  fa8 mi mi mi sol16(mi) sol(mi)
  fa8 mi16 re do re do sib la sib la sol
  fa8 fa' fa fa sol mi

  %52
  fa4 r r\mbreak
  r8 la la la la la
  la do sib la sol fad

  %55
  sol4 r r
  r8 sol sol sol sol sol
  sol sib la sol fa? mi

  %58
  fa4 r r
  r8 mi mi mi re re
  dod2.

  %61
  re8 re re re do? do
  si2.\mbreak
  r8 do do do sib! sib

  %64
  la2.
  r8 sib sib sib  la la
  sold2.

  %67
  la4 r r
  R2.*3
  r8 do do do mi do

  %72
  do do do do mi do
  si si si si mi si\mbreak
  do4 r r

  %75
  la'16 \solo mi do la la' mi do la la' mi do la
  la' sold la si la sold la si la sold la si
  sold fad sold la sold fad sold la sol fad sol la

  %78
  fad mi fad sol fad mi fad sol fa mi fa sol
  mi4 r r\mbreak
  la,16 sold la si? la sold la si la sold la si

  %81
  sold fad sold la sold fad sold la sol fad sol la
  fad mi fad sold? fad mi fad sold fa mi fa sold
  mi4 r r

  %84
  R2.*6
  r8 do' do do do re
  mi2.~

  %92
  mi8 mi fad sol fad mi
  re re re re re mi\mbreak
  fad2.~

  %95
  fad8 la sol fad mi red
  mi mi mi mi mi fa!
  sol2.~

  %98
  sol8 sol fad mi re dod
  re re re re re mi
  fad fad fad fad fad sol

  %101
  la la la la sol fad
  sol sol sol sol sol fad?
  mi mi mi mi mi re\mbreak

  %104
  dod4 r r
  R2.
  r8 dod\soli dod dod re re

  %107
  dod^\tu mi mi mi mi mi
  re re re re dod dod
  re fa\solo mi16 fa mi fa re mi re mi

  %110
  dod[la dod la re la re la mi' la, mi' la,]
  fa' [la, fa' la, mi' la, mi' la, re la re la]
  dod[la dod la re la re la mi' la, mi' la,]\mbreak

  %113
  fa'[la, fa' la, mi' la, mi' la, re la re la]
  dod4 r r
  fad2. %%%%%%ripresa

  %116
  r8 sol sol sol fa! fa
  mi2.
  r8 fa fa fa mi mi

  %119
  re2.
  r8 mi mi mi re re
  dod2.

  %122
  re4 r r
  R2.
  r8 fa,\p fa fa  sol sol

  %125
  fa fa fa fa sol sol
  fa re' re re fa re\mbreak
  re re re re mi re

  %128
  dod dod dod dod mi dod
  re4 r r

}


IvlIripn =  \relative do'' {

  la'4 r r
  R2.*7\mbreak
  r8 re,, re re re re

  %10
  re re dod dod dod dod
  do! do sib sib sib sib
  sib sib sol[sol sol sol]

  %13
  la4 r r
  R2.
  r8 la la la re re

  %16
  la4 r r
  r8 re'' re re do do %%% inizio ripresa
  si2.

  %19
  r8 do do do sib! sib
  la2.
  r8 sib sib sib la la
  sold2.

  %23
  r8 la la la sol? sol
  fa4 r r
  R2.

  %26
  r8 la,\p la la sib sib
  la la la la sib sib
  la fa' fa fa la fa\mbreak

  %29
  mi mi mi mi la mi
  mi mi mi mi la mi
  fa4 r r

  %32
  R2.*20
  r8 la la la la sib\mbreak

  %53
  do2.~
  do8 mib re do sib la
  sib sol sol sol sol la
  sib2.~

  %57
  sib8 re do sib la sol
  la la la la la si
  sold2.

  %60
  r8 la la la sol! sol
  fad2.
  r8 sol sol sol fa? fa\mbreak

  %63
  mi2.
  r8 fa fa fa mi mi
  re2.

  %66
  r8 mi mi mi re re
  do4 r r
  R2.*3

  %71
  r8 la' la la do la
  la la la la do la
  sold sold sold sold si sold\mbreak

  %74
  la4 r r
  R2.*15
  r8 mi mi mi mi fad
  sol2.~

  %92
  sol8 sol fad mi re dod
  si fad' fad fad fad sol\mbreak
  la2.~

  %95
  la8 do si la sol fad
  sol sol sol sol sol la
  sib!2.~

  %98
  sib8 sib la sol fad mi
  fad fad fad fad fad sol
  la la la la la sib

  %101
  do do do do sib la
  sib sib sib sib sib la
  sold? sold sold sold sold fad?\mbreak

  %104
  mi4 r r
  R2.*2

  %107
  r8 la la la sol? sol
  fa fa mi mi mi mi
  re4 r r

  %110
  R2.*4
  r8 la' la la sol sol
  r8 re' re re do do %%% inizio ripresa

  %116
  si2.
  r8 do do do sib! sib
  la2.

  %119
  r8 sib sib sib la la
  sold2.
  r8 la la la sol? sol

  %122
  fa4 r r
  R2.
  r8 la,\p la la sib sib

  %125
  la la la la sib sib
  la fa' fa fa la fa\mbreak
  mi mi mi mi la mi

  %128
  mi mi mi mi la mi
  re4 r r

}

IvlIIripn = \relative do'' {

  fa4 r r
  R2.*7\mbreak
  r8 re, re re re re

  %10
  re re dod dod dod dod
  do! do sib sib sib sib
  sib sib sol[sol sol sol]

  %13
  la4 r r
  R2.
  r8 la la la re re

  %16
  la la'' la la sol sol
  fad2. %%%%%%ripresa
  r8 sol sol sol fa! fa

  %19
  mi2.
  r8 fa fa fa mi mi
  re2.

  %22
  r8 mi mi mi re re
  dod2.
  re4 r r

  %25
  R2.
  r8 fa,\p fa fa  sol sol
  fa fa fa fa sol sol

  %28
  fa re' re re fa re\mbreak
  re re re re mi re
  dod dod dod dod mi dod

  %31
  re4 r r
  R2.*21\mbreak
  r8 la' la la la la
  la do sib la sol fad

  %55
  sol4 r r
  r8 sol sol sol sol sol
  sol sib la sol fa? mi

  %58
  fa4 r r
  r8 mi mi mi re re
  dod2.

  %61
  re8 re re re do? do
  si2.\mbreak
  r8 do do do sib! sib

  %64
  la2.
  r8 sib sib sib  la la
  sold2.

  %67
  la4 r r
  R2.*3
  r8 do do do mi do

  %72
  do do do do mi do
  si si si si mi si\mbreak
  do4 r r

  %75
  R2.*15
  r8 do do do do re
  mi2.~

  %92
  mi8 mi fad sol fad mi
  re re re re re mi\mbreak
  fad2.~

  %95
  fad8 la sol fad mi red
  mi mi mi mi mi fa!
  sol2.~

  %98
  sol8 sol fad mi re dod
  re re re re re mi
  fad fad fad fad fad sol

  %101
  la la la la sol fad
  sol sol sol sol sol fad?
  mi mi mi mi mi re\mbreak

  %104
  dod4 r r
  R2.*2

  %107
  r8 mi mi mi mi mi
  re re re re dod dod
  re4 r r

  %110
  R2.*5
  fad2. %%%%%%ripresa

  %116
  r8 sol sol sol fa! fa
  mi2.
  r8 fa fa fa mi mi

  %119
  re2.
  r8 mi mi mi re re
  dod2.

  %122
  re4 r r
  R2.
  r8 fa,\p fa fa  sol sol

  %125
  fa fa fa fa sol sol
  fa re' re re fa re\mbreak
  re re re re mi re

  %128
  dod dod dod dod mi dod
  re4 r r

}


IobIn =  \relative do'' {

  la'4 r r
  R2.*3
  r8 mi mi mi la mi

  %6
  fa mi mi mi la mi
  fa mi mi mi la mi
  fa sol sol fa fa mi\mbreak

  %9
  mi4 r r
  R2.*4
  r8 mi mi mi fa fa

  %15
  mi4 r r
  R2.
  r8 re' re re do do %%% inizio ripresa

  %18
  si2.
  r8 do do do sib! sib
  la2.

  %21
  r8 sib sib sib la la
  sold2.
  r8 la la la sol? sol

  %24
  fa4 r r
  R2.*3

  %28
  r8 fa fa fa la fa\mbreak
  mi mi mi mi la mi
  mi mi mi mi la mi

  %31
  fa4 r r
  R2.*20
  r8 la la la la sib\mbreak

  %53
  do2.~
  do8 mib re do sib la
  sib sol sol sol sol la

  %56
  sib2.~
  sib8 re do sib la sol
  la la la la la si
  sold2.

  %60
  r8 la la la sol! sol
  fad2.
  r8 sol sol sol fa? fa\mbreak

  %63
  mi2.
  r8 fa fa fa mi mi
  re2.

  %66
  r8 mi mi mi re re
  do8 mi mi mi fa fa
  mi mi mi mi fa fa

  %69
  mi4 r r
  R2.
  r8 la la la do la

  %72
  la la la la do la
  sold sold sold sold si sold\mbreak
  la4 r r

  %75
  R2.*15
  r8 mi mi mi mi fad\mbreak
  sol2.~

  %92
  sol8 sol fad mi re dod
  si fad' fad fad fad sol\mbreak
  la2.~

  %95
  la8 do si la sol fad
  sol sol sol sol sol la
  sib!2.~

  %98
  sib8 sib la sol fad mi
  fad fad fad fad fad sol
  la la la la la sib

  %101
  do do do do sib la
  sib sib sib sib sib la
  sold? sold sold sold sold fad?\mbreak

  %104
  mi4 r r
  r8 mi mi mi fa? fa
  mi4 r r

  %107
  r8 la la la sol? sol
  fa fa mi mi mi mi
  re4 r r

  %110
  R2.*4
  r8 la' la la sol sol
  r8 re' re re do do %%% inizio ripresa

  %116
  si2.
  r8 do do do sib! sib
  la2.

  %119
  r8 sib sib sib la la
  sold2.
  r8 la la la sol? sol

  %122
  fa4 r r
  R2.*3

  %126
  r8 fa fa fa la fa\mbreak
  mi mi mi mi la mi
  mi mi mi mi la mi

  %129
  fa4 r r

}

IobIIn = \relative do'' {

  fa4 r r
  R2.*3
  r8 dod dod dod mi dod

  %6
  re dod dod dod mi dod
  re dod dod dod mi dod
  re mi mi re re dod\mbreak

  %9
  dod?4 r r
  R2.*4
  r8 dod dod dod re re

  %15
  dod4 r r
  r8 la' la la sol sol
  fad2.

  %18
  r8 sol sol sol fa! fa
  mi2.
  r8 fa fa fa mi mi
  re2.

  %22
  r8 mi mi mi re re
  dod2.
  re4 r r

  %25
  R2.*3

  %28
  r8 re re re fa re\mbreak
  re re re re mi re
  dod dod dod dod mi dod

  %31
  re4 r r
  R2.*21
  r8 la' la la la la
  la do sib la sol fad

  %55
  sol4 r r
  r8 sol sol sol sol sol
  sol sib la sol fa? mi

  %58
  fa4 r r
  r8 mi mi mi re re
  dod2.

  %61
  re8 re re re do? do
  si2.\mbreak
  r8 do do do sib! sib

  %64
  la2.
  r8 sib sib sib  la la
  sold2.

  %67
  la8 do do do re re
  do do do do re re
  do4 r r

  %70
  R2.
  r8 do do do mi do
  do do do do mi do
  si si si si mi si\mbreak
  do4 r r

  %75
  R2.*15
  r8 do do do do re
  mi2.~

  %92
  mi8 mi fad sol fad mi
  re re re re re mi\mbreak
  fad2.~

  %95
  fad8 la sol fad mi red
  mi mi mi mi mi fa!
  sol2.~

  %98
  sol8 sol fad mi re dod
  re re re re re mi
  fad fad fad fad fad sol

  %101
  la la la la sol fad
  sol sol sol sol sol fad?
  mi mi mi mi mi re\mbreak

  %104
  dod4 r r
  r8 dod dod dod re re
  dod4 r r

  %107
  r8 mi mi mi re re
  re re re re dod dod
  re4 r r

  %110
  R2.*5
  fad2.
  r8 sol sol sol fa! fa

  %117
  mi2.
  r8 fa fa fa mi mi
  re2.

  %120
  r8 mi mi mi re re
  dod2.
  re4 r r

  %123
  R2.*3

  %126
  r8 re re re fa re\mbreak
  re re re re mi re
  dod dod dod dod mi dod

  %129
  re4 r r

}


IflIn =  \relative do'' {

  la'8 la la la re la
  sib la la la re la
  sib la la la re la

  %4
  sib la la sol sol fa
  mi4 r r
  R2.*7

  %13
  r8 mi mi mi fa fa
  mi4 r r
  R2.*2

  %17
  r8 re' re re do do %%% inizio ripresa
  si2.
  r8 do do do sib! sib

  %20
  la2.
  r8 sib sib sib la la
  sold2.

  %23
  r8 la la la sol? sol
  fa la la la sib sib
  la la la la sib sib

  %26
  la4 r r
  R2.
  r8 fa fa fa la fa\mbreak

  %29
  mi mi mi mi la mi
  mi mi mi mi la mi
  fa4 r r

  %32
  R2.*20
  r8 la la la la sib\mbreak
  do2.~

  %54
  do8 mib re do sib la
  sib sol sol sol sol la
  sib2.~

  %57
  sib8 re do sib la sol
  la la la la la si
  sold2.

  %60
  r8 la la la sol! sol
  fad2.
  r8 sol sol sol fa? fa\mbreak

  %63
  mi2.
  r8 fa fa fa mi mi
  re2.

  %66
  r8 mi mi mi re re
  do4 r r
  R2.

  %69
  r8 mi mi mi fa fa
  mi mi mi mi fa fa
  mi la la la do la

  %72
  la la la la do la
  sold sold sold sold si sold\mbreak
  la4 r r

  %75
  R2.*8
  r8 si si si do do
  do si si si do do

  %85
  do si r4 r\mbreak %% fine p. 11
  R2.*2
  r8 mi, mi mi la mi

  %89
  fa mi mi mi la mi
  fa mi mi mi mi fad
  sol2.~

  %92
  sol8 sol fad mi re dod
  si fad' fad fad fad sol\mbreak
  la2.~

  %95
  la8 do si la sol fad
  sol sol sol sol sol la
  sib!2.~

  %98
  sib8 sib la sol fad mi
  fad fad fad fad fad sol
  la la la la la sib

  %101
  do do do do sib la
  sib sib sib sib sib la
  sold? sold sold sold sold fad?\mbreak

  %104
  mi mi mi mi fa fa
  mi4 r r
  R2.

  %107
  r8 la la la sol? sol
  fa fa mi mi mi mi
  re4 r r

  %110
  R2.*4
  r8 la' la la sol sol
  r8 re' re re do do %%% inizio ripresa
  si2.

  %117
  r8 do do do sib! sib
  la2.
  r8 sib sib sib la la

  %120
  sold2.
  r8 la la la sol? sol
  fa la la la sib sib

  %123
  la la la la sib sib
  la4 r r
  R2.

  %126
  r8 fa fa fa la fa\mbreak
  mi mi mi mi la mi
  mi mi mi mi la mi

  %129
  fa4 r r

}

IflIIn = \relative do'' {

  fa8 fa fa fa la fa
  sol fa fa fa la fa
  sol fa fa fa la fa

  %4
  sol fa fa mi mi re
  dod4 r r
  R2.*7

  %13
  r8 dod dod dod re re
  dod4 r r
  R2.

  %16
  r8 la' la la sol sol
  fad2.\mbreak % ripresa
  r8 sol sol sol fa! fa

  %19
  mi2.
  r8 fa fa fa mi mi
  re2.

  %22
  r8 mi mi mi re re
  dod2.
  re8 fa fa fa sol sol

  %25
  fa fa fa fa sol sol
  fa4 r r
  R2.

  %28
  r8 re re re fa re\mbreak
  re re re re mi re
  dod dod dod dod mi dod
  re4 r r

  %32
  R2.*21\mbreak
  r8 la' la la la la
  la do sib la sol fad

  %55
  sol4 r r
  r8 sol sol sol sol sol
  sol sib la sol fa? mi

  %58
  fa4 r r
  r8 mi mi mi re re
  dod2.

  %61
  re8 re re re do? do
  si2.\mbreak
  r8 do do do sib! sib

  %64
  la2.
  r8 sib sib sib  la la
  sold2.

  %67
  la4 r r
  R2.
  r8 do do do re re

  %70
  do do do do re re
  do do do do mi do
  do do do do mi do

  %73
  si si si si mi si\mbreak
  do4 r r
  R2.*8

  %83
  r8 sold' sold sold la la
  la sold sold sold la la
  la sold r4 r\mbreak

  %86
  R2.*2
  r8 do, do do mi do
  mi do do do mi do

  %90
  re do do do do re
  mi2.~

  %92
  mi8 mi fad sol fad mi
  re re re re re mi\mbreak
  fad2.~

  %95
  fad8 la sol fad mi red
  mi mi mi mi mi fa!
  sol2.~

  %98
  sol8 sol fad mi re dod
  re re re re re mi
  fad fad fad fad fad sol

  %101
  la la la la sol fad
  sol sol sol sol sol fad?
  mi mi mi mi mi re\mbreak

  %104
  dod dod dod dod re re
  dod4 r r
  R2.

  %107
  r8 mi mi mi mi mi
  re re re re dod dod
  re4 r r

  %110
  R2.*5
  fad2.\mbreak % ripresa
  r8 sol sol sol fa! fa

  %117
  mi2.
  r8 fa fa fa mi mi
  re2.

  %120
  r8 mi mi mi re re
  dod2.
  re8 fa fa fa sol sol

  %123
  fa fa fa fa sol sol
  fa4 r r
  R2.

  %126
  r8 re re re fa re\mbreak
  re re re re mi re
  dod dod dod dod mi dod

  %129
  re4 r r

}

Ivlan = \relative do'{

  re'4 r r
  R2.*3
  r8 la, la la la la

  %6
  re la la la la la
  re la la la la la
  re sol, sol sol' sol sold

  %9
  la4 r r
  R2.*4
  r8 la, la la re re

  %15
  la4 r r
  r8 dod' dod dod dod dod
  la la la la fad fad \mbreak  % ripresa

  %18
  re re re re si' si
  sol sol sol sol mi mi
  do do do do la' la

  %21
  fa fa fa fa re re
  si si si si sold' sold
  mi mi mi mi dod dod

  %24
  la4 r r
  R2.
  r8 re, re re sol sol

  %27
  re re re re sol sol
  re la'' la la la la\mbreak
  la la la la la la

  %30
  la la la la la la
  fa4 r r
  R2.*21

  %53
  r8 fad fad fad fad fad
  fad? fad fad fad fad fad
  re4 r r

  %56
  r8 mi mi mi mi mi
  mi mi mi mi mi mi
  do4 r r

  %59
  r8 si' si si sold sold
  mi mi mi mi dod dod
  la la' la la fad fad

  %62
  re re re re si si\mbreak %fine p. 8 OK
  sol sol' sol sol mi mi
  do do do do la la

  %65
  fa fa' fa fa re re
  si si si si sold sold
  mi4 r r

  %68
  R2.*3
  r8 mi' mi mi mi mi
  mi mi mi mi mi mi

  %73
  mi mi mi mi mi mi\mbreak
  mi4 r r
  R2.*15

  %90
  r8 mi mi mi mi mi
  dod dod dod dod dod dod
  dod? dod dod dod dod dod

  %93
  fad fad fad fad fad fad\mbreak
  red red red red red red
  red? red red red red red

  %96
  sib sib sib sib sib sib
  mi mi mi mi mi mi
  mi mi mi mi mi mi

  %99
  la la la la la la
  la la la la la la
  fad fad fad fad fad fad

  %102
  re re re re re re
  si' si si si si si\mbreak
  mi,4 r r


  %105
  R2.*2
  r8 la la la la la
  la la la la la la

  %109
  fa4 r r
  R2.*4
  r8 dod' dod dod dod dod

  %115
  la la la la fad fad \mbreak  % ripresa
  re re re re si' si
  sol sol sol sol mi mi

  %118
  do do do do la' la
  fa fa fa fa re re
  si si si si sold' sold

  %121
  mi mi mi mi dod dod
  la4 r r
  R2.

  %124
  r8 re, re re sol sol
  re re re re sol sol
  re la'' la la la la\mbreak

  %127
  la la la la la la
  la la la la la la
  fa4 r r

}

Ifgn = \relative do{

  re8\solo re re re re re
  sol re re re re re
  sol re re re re re

  %4
  sol sol, sol sol' sol sold
  la4 r r
  R2.*7

  %13
  r8 la,\solo la la re re
  la4 r r
  R2.

  %16
  r8 la^\tu la la la la
  re re re re re re\mbreak %%% ripresa
  sol sol sol sol sol sol

  %19
  do, do do do do do
  fa fa fa fa fa fa
  sib sib sib sib sib sib

  %22
  mi, mi mi mi mi mi
  la la la la la la
  re,\solo re re re sol sol

  %25
  re re re re sol sol
  re4 r r
  R2.

  %28
  r8 re^\markup\italic"[Tutti]" re re re re\mbreak
  la la' la la la la
  la, la' la la la la

  %31
  re, re re re re re
  sol re re re re re
  sol re re re re re

  %34
  sol sol, sol sol sol sol
  la la la la la la
  dod dod dod dod dod dod

  %37
  re re re re re re\mbreak
  fa fa fa fa fa fa
  sol sol sol sol sol sol

  %40
  sib sib sib sib sib sib
  do do do do do do
  mi, mi mi mi mi mi

  %43
  fa fa fa fa fa fa
  la la la la la la\mbreak
  sib sib sib sib sib sib

  %46
  re, re re re re re
  do do do do do do
  do do do do do do

  %49
  do do do do do do
  fa fa do' do do, do
  fa fa fa fa sib, do

  %52
  fa4 r r
  r8 re re re re re
  re re re re re re

  %55
  sol4 r r
  r8 do, do do do do
  do do do do do do

  %58
  fa4 r r
  r8 mi mi mi mi mi
  la la la la la la

  %61
  re, re re re re re
  sol sol sol sol sol sol\mbreak
  do, do do do do do

  %64
  fa fa fa fa fa fa
  sib, sib sib sib sib sib
  mi mi mi mi mi mi

  %67
  la,\solo la la la re re
  la la la la re re
  la la la la re re

  %70
  la la la la re re
  la^\tu la la la la' la
  mi mi mi mi mi mi

  %73
  mi, mi mi mi mi mi\mbreak
  la4 la la
  la la la

  %76
  la la' la
  mi do do
  re re re

  %79
  mi8 mi mi mi mi mi\mbreak
  la, la la la la la
  mi' mi mi mi do do

  %82
  re re re re re re
  mi mi mi mi mi mi
  mi mi mi mi mi mi

  %85
  mi mi mi mi mi mi\mbreak
  la, la la la la la
  la la mi'[mi] mi, mi

  %88
  la\solo la la la la la
  la la la la la la
  la^\tu la la la la la

  %91
  lad lad lad lad lad lad
  lad? lad lad lad lad lad
  sib sib sib sib sib sib\mbreak

  %94
  sib sib sib sib sib sib
  sib sib sib sib sib sib
  mi mi mi mi mi mi

  %97
  dod dod dod dod dod dod
  dod? dod dod dod dod dod
  do! do do do do do

  %100
  do do do do do sib
  la re re re re re
  sol, sol sol sol sol sol

  %103
  sold sold sold sold sold sold\mbreak
  la la la la la la
  la la la la la la

  %106
  la la la la la la
  la la la la la la
  re re la' la la, la

  %109
  re4 r r
  la8 la la la la la
  la la la la la la

  %112
  la la la la la la\mbreak
  la la la la la la
  la la la la la la

  %115
  re re re re re re\mbreak %%% ripresa
  sol sol sol sol sol sol
  do, do do do do do

  %118
  fa fa fa fa fa fa
  sib sib sib sib sib sib
  mi, mi mi mi mi mi

  %121
  la la la la la la
  re,\solo re re re sol sol
  re re re re sol sol

  %124
  re4 r r
  R2.
  r8 re^\markup\italic"[Tutti]" re re re re\mbreak

  %127
  la la' la la la la
  la, la' la la la la
  re,4 r r

}

Ibcn = \relative do {

  R2.*15
  r8 la^\tu la la la la
  re re re re re re\mbreak %%% ripresa
  sol sol sol sol sol sol

  %19
  do, do do do do do
  fa fa fa fa fa fa
  sib sib sib sib sib sib

  %22
  mi, mi mi mi mi mi
  la la la la la la
  re,4 r r
  R2.*3

  %28
  r8 re^\markup\italic"[Tutti]" re re re re\mbreak
  la la' la la la la
  la, la' la la la la

  %31
  re, re re re re re
  sol re re re re re
  sol re re re re re

  %34
  sol sol, sol sol sol sol
  la la la la la la
  dod dod dod dod dod dod

  %37
  re re re re re re\mbreak
  fa fa fa fa fa fa
  sol sol sol sol sol sol

  %40
  sib sib sib sib sib sib
  do do do do do do
  mi, mi mi mi mi mi

  %43
  fa fa fa fa fa fa
  la la la la la la\mbreak
  sib sib sib sib sib sib

  %46
  re, re re re re re
  do do do do do do
  do do do do do do

  %49
  do do do do do do
  fa fa do' do do, do
  fa fa fa fa sib, do

  %52
  fa4 r r
  r8 re re re re re
  re re re re re re

  %55
  sol4 r r
  r8 do, do do do do
  do do do do do do

  %58
  fa4 r r
  r8 mi mi mi mi mi
  la la la la la la

  %61
  re, re re re re re
  sol sol sol sol sol sol\mbreak
  do, do do do do do

  %64
  fa fa fa fa fa fa
  sib, sib sib sib sib sib
  mi mi mi mi mi mi

  %67
  la,4 r r
  R2.*3
  la8^\tu la la la la' la
  mi mi mi mi mi mi

  %73
  mi, mi mi mi mi mi\mbreak
  la4 la la
  la la la

  %76
  la la' la
  mi do do
  re re re

  %79
  mi8 mi mi mi mi mi\mbreak
  la, la la la la la
  mi' mi mi mi do do

  %82
  re re re re re re
  mi mi mi mi mi mi
  mi mi mi mi mi mi

  %85
  mi mi mi mi mi mi\mbreak
  la, la la la la la
  la la mi'[mi] mi, mi

  %88
  la4 r r
  R2.
  la8^\tu la la la la la

  %91
  lad lad lad lad lad lad
  lad? lad lad lad lad lad
  sib sib sib sib sib sib\mbreak

  %94
  sib sib sib sib sib sib
  sib sib sib sib sib sib
  mi mi mi mi mi mi

  %97
  dod dod dod dod dod dod
  dod? dod dod dod dod dod
  do! do do do do do

  %100
  do do do do do sib
  la re re re re re
  sol, sol sol sol sol sol

  %103
  sold sold sold sold sold sold\mbreak
  la la la la la la
  la la la la la la

  %106
  la la la la la la
  la la la la la la
  re re la' la la, la

  %109
  re4 r r
  la8 la la la la la
  la la la la la la

  %112
  la la la la la la\mbreak
  la la la la la la
  la la la la la la

  %115
  re re re re re re\mbreak %%% ripresa
  sol sol sol sol sol sol
  do, do do do do do

  %118
  fa fa fa fa fa fa
  sib sib sib sib sib sib
  mi, mi mi mi mi mi

  %121
  la la la la la la
  re,4 r r
  R2.*3
  r8 re^\markup\italic"[Tutti]" re re re re\mbreak

  %127
  la la' la la la la
  la, la' la la la la
  re,4 r r

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key re\minor
  \time 3/4
  \tempo 2. = 50
  s2.*129
  \bar"|."


}

IvlI = {
  \Iglobal
  \notypeset
  <<\IvlIn \forma>>

}

IvlII = {
  \Iglobal
  <<\IvlIIn \forma>>

}

IvlIrip = {
  \Iglobal
  <<\IvlIripn \forma>>

}

IvlIIrip = {
  \Iglobal
  <<\IvlIIripn \forma>>

}

IobI = {
  \Iglobal
  <<\IobIn \forma>>

}

IobII = {
  \Iglobal
  <<\IobIIn \forma>>

}

IflI = {
  \Iglobal
  <<\IflIn \forma>>

}

IflII = {
  \Iglobal
  <<\IflIIn \forma>>

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
  \typeset

}


IIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IIflIn =  \relative do'' {

  la'16 sib la8 sol
  sib la r
  sol16 la sol8 mi

  %4
  re4 r8
  do'16 re do8 la
  re do r

  %7
  re16 do sib8 la
  la\tr sol r
  sib16 do sib8 sol

  %10
  la16 sib la8 fa\mbreak
  sol16 la sol8 mi
  fa4.

  %13
  do'16 re do8 la
  sib16 do sib8 sol
  mib'(re) do

  %16
  do(sib la)
  la(sol fad)
  sol16 la sol8 re

  %19
  re'(do sib)
  re(do sib)
  do la4\tr

  %22
  sol4.\mbreak
  la16 sib la8 fa
  sib la r

  %25
  sol16 la sol8 mi
  fa16 sol fa8 re
  la'16 sib la8 fa

  %28
  re16 mi re8 sib
  sib'16 do sib8 sol
  mi16 fa mi8 dod

  %31
  sol'16 la sol8 r
  fa16 sol fa8 r
  la fa mi

  %34
  re4.\fermata

}

IIflIIn = \relative do'' {

  fa16 sol fa8 re
  sol fa r
  mi16 fa mi8 dod

  %4
  re4 r8
  la'16 sib la8 fa
  sib la r

  %7
  sib16 la sol8 fa
  fa\tr mi r
  sol16 la sol8 mi

  %10
  fa16 sol fa8 do\mbreak
  mi16 fa mi8 do
  la4.

  %13
  la'16 sib la8 fad
  sol16 la sol8 re
  R4.

  %16
  mib'8 re do
  do sib la
  sib16 do sib8 sol

  %19
  sib(la sol)
  sib(la sol)
  la fad4\tr

  %22
  sol4.\mbreak
  fa16 sol fa8 re
  sol fa r

  %25
  mi16 fa mi8 dod
  re16 mi re8 la
  fa'16 sol fa8 re

  %28
  sib16 do sib8 sol
  sol'16 la sol8 mi
  dod16 re dod8 la

  %31
  mi'16 fa mi8 r
  re16 mi re8 r
  fa re dod

  %34
  re4.\fermata

}

IIfgn = \relative do{

  r8 re' re,
  r re' re,
  sol la la,

  %4
  re re' re,
  r fa fa,
  r fa' fa,

  %7
  sib re si'
  do, do' do,
  r do' do,

  %10
  r do' do,\mbreak
  r do' do,
  fa4.

  %13
  r8 re' re,
  r sol sol,
  r do' do,

  %16
  r do' do,
  r re' re,
  r sol sol,

  %19
  r sol' sol,
  r sol' sol,
  do' re re,

  %22
  sol16 fad sol8 sol,\mbreak
  r re'' re,
  r re' re,

  %25
  sol la la,
  r re' re,
  r re' re,

  %28
  r sol sol,
  r sol' sol,
  r la' la,

  %31
  r la' la,
  r re' re,
  r la' la,

  %34
  re4.\fermata

}

forma = {

  \key re\minor
  \time 3/8
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 4 = 45
  s4.*12
  \bar":..:"
  s4.*22
  \bar":|."

}

IIflI = {
  \IIglobal
  \notypeset
  <<\IIflIn \forma>>

}

IIflII = {
  \IIglobal
  <<\IIflIIn \forma>>

}

IIfg = {
  \IIglobal
  \clef bass
  <<\IIfgn \forma>>
  \typeset

}


IIIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IIIvlIn =  \relative do'' {

  la'8
  re la sol la re la sol la
  sib r la r sol r fa r
  fa mi r la re la sol la

  %4
  re la sol la sib r la r
  sol r fa r mi4 mi8 mi
  fa fa fad fad\mbreak sol sol sold sold

  %7
  la1~
  la4 sol? fa8 sol la sol
  fa4 mi re mi8 mi

  %10
  fa fa fad fad sol sol sold sold
  la1~
  la4 sol? fa8 sol la sol

  %13
  fa4 mi re r8 fa\solo %%%% fine ripresa
  la(fa mi fa) la(fa mi fa)
  sib8.[(la16) la8.(sol16)] sol8.[(fa16) fa8.(mi16)]

  %16
  mi re dod si la8 fa'\mbreak la(fa  mi fa)
  la(fa mi fa) sib8.[(la16) la8.(sol16)]
  sol8.[(fa16) fa8.(mi16)] mi4 r8 mi

  %19
  la,16 si dod re mi8 la fa\tr mi r mi
  la,16 si? dod re mi8 la fa mi r mi\mbreak
  fa(re dod re) fa(re dod re)

  %22
  si'(sold fad sold) si(sold fad sold)
  la16(sold) la8 r do la16 sold la8 r la
  si4 sold\tr \mbreak la r8 mi^\tu

  %25
  la mi re mi la mi re mi
  fa r mi r re r do r
  do si r mi la mi re mi

  %28
  la mi re mi fa r mi r
  re r do r si4 si'8 si
  do do dod dod\mbreak re re red red

  %31
  mi1~
  mi4 re do8 si do la
  si4 sold la si8 si

  %34
  do do dod dod re re red red
  mi1~
  mi4 re do8 si do la

  %37
  si4 sold\mbreak la r
  R1*2
  la16 mi mi la la do do la si mi, mi si' si re re si

  %41
  do mi, mi do' do mi mi do re mi, mi re' re fa fa re
  mi4 r r2\mbreak
  mi,16 la la la do, la' la la la, la' la la do, la' la la

  %44
  fa re re re fa, re' re re re, re' re re fa, re' re re
  si sol' sol sol re sol sol sol si, sol' sol sol re sol sol sol
  mi do do do sol do do do mi, do' do do sol do do do

  %47
  la fa' fa fa do fa fa fa la, fa' fa fa do fa fa fa\mbreak
  re sol sol sol re sol sol sol si, sol' sol sol re sol sol sol
  mi sol sol sol mi sol sol sol do, sol' sol sol mi sib' sib sib

  %50
  la fa fa fa la, fa' fa fa sib, fa' fa fa do fa fa fa
  re fa fa fa la, fa' fa fa sib, fa' fa fa do fa fa fa
  re fa fa fa la, fa' fa fa\mbreak sib, fa' fa fa do mi mi mi

  %53
  fa do la do fa,8 fa' do' fa, mi fa
  do' fa, mi fa sib r la r
  sol r fa r mi4 r8 fa

  %56
  do' fa, mi fa do' fa, mi fa
  sib r la r sol r fa r
  mi4 sol8 sol lab lab la la\mbreak
  sib sib si si do2~

  %60
  do~do4 sib
  la8 sib do sib la4 sol
  fa r r2

  %63
  R1*2
  r8 fa\soli mi fa r fa mi fa\mbreak
  r mi16 [fa sol8 fa] mi4 mi8^\markup\italic"[Tutti]" mi

  %67
  fa fa fad fad sol sol sold sold
  la1~
  la4 sol fa16[la fa la fa la fa la]

  %70
  mi[la mi la mi la mi la] fa[la fa la fa la fa la]
  mi[la mi la mi la mi la]\mbreak fa[re mi fa sol la si dod]
  re4 r r8 re, mi dod

  %73
  re4 r r16 re[mi fa sol la si dod]
  re8 fa, sol mi re4 r8 la'
  re la sol la re la sol la

  %76
  sib r la r sol r fa r
  fa mi r la re la sol la
  re la sol la sib r la r

  %79
  sol r fa r mi4 mi8 mi
  fa fa fad fad\mbreak sol sol sold sold
  la1~

  %82
  la4 sol? fa8 sol la sol
  fa4 mi re mi8 mi
  fa fa fad fad sol sol sold sold

  %85
  la1~
  la4 sol? fa8 sol la sol
  fa4 mi re r

}

IIIvlIIn = \relative do'' {

  fa8
  la fa mi fa la fa mi fa
  sol r fa r mi r re r
  re dod r fa la fa mi fa

  %4
  la fa mi fa sol8 r fa r
  mi r re r dod4 r
  R1

  %7
  r4 la8 la sib[sib] si si
  do do dod dod re mi fa mi
  re4 dod re r

  %10
  R1
  r4 la8 la\mbreak sib sib si si
  do do dod dod re mi fa mi

  %13
  re4 dod re r8 re\solo
  fa(re dod re) fa(re dod re)
  sol8.[(fa16) fa8.(mi16)] mi8.[(re16) re8.(dod16)]

  %16
  dod?4 r8 re\mbreak fa(re dod re)
  fa(re dod re) sol8.[(fa16) fa8.(mi16)]
  mi8.[(re16) re8.(dod16)] dod4 r

  %19
  r r8 mi la,16 si dod re mi8 la
  fa\tr mi r mi la,16 si? dod re mi8 la\mbreak
  la(fa mi fa) la(fa mi fa)

  %22
  re(si la si) re(si la si)
  do16 si do8 r mi do16 si do8 r do
  re4 si\tr \mbreak la r8 do^\tu
  mi do si do mi do si do

  %26
  re r do r si r la r
  la sold r do mi do si do
  mi do si do re r do r

  %29
  si r la r sold4 r
  R1
  r4 mi'8 mi fa [fa] fad fad

  %32
  sol sol sold sold la4 r8 mi
  re4 si la r
  R1

  %35
  r4 mi'8 mi fa[fa] fad fad
  sol sol sold sold la4 r8 do,
  re4 si\mbreak la r

  %38
  R1*3
  la'16 mi mi la la do do la si mi, mi si'si re re si
  do mi, mi do' do mi mi do re mi, mi re' re fa fa re\mbreak

  %43
  mi4 r r2
  R1*9
  r4 r8 fa, do' fa, mi fa

  %54
  do' fa, mi fa sib r la r
  sol r fa r mi4 r8 fa
  do' fa, mi fa do' fa, mi fa

  %57
  sib r la r sol r fa r
  mi4 sol8 sol lab lab la la\mbreak
  sib sib si si do2~

  %60
  do~do4 sib
  la8 sib do sib la4 sol
  fa r r2

  %63
  R1*2
  r8 re\soli do re r re dod re
  r8 dod16[re mi8 re] dod4 r

  %67
  R1
  r4 la8 la sib sib si si
  do do dod dod re16[fa re fa re fa re fa]

  %70
  dod[mi dod mi dod mi dod mi] re[fa re fa re fa re fa]
  dod[mi dod mi dod mi dod mi]\mbreak re4 r
  r16 re [mi fa sol la si dod] re8 fa, sol mi

  %73
  re16 [re mi fa sol la si dod] re4 r
  r8 re, mi dod re4 r8 fa
  la fa mi fa la fa mi fa

  %76
  sol r fa r mi r re r
  re dod r fa la fa mi fa
  la fa mi fa sol8 r fa r

  %79
  mi r re r dod4 r
  R1
  r4 la8 la sib[sib] si si

  %82
  do do dod dod re mi fa mi
  re4 dod re r
  R1

  %85
  r4 la8 la\mbreak sib sib si si
  do do dod dod re mi fa mi
  re4 dod re r

}


IIIvlIripn =  \relative do'' {

  la'8
  re la sol la re la sol la
  sib r la r sol r fa r
  fa mi r la re la sol la

  %4
  re la sol la sib r la r
  sol r fa r mi4 mi8 mi
  fa fa fad fad\mbreak sol sol sold sold

  %7
  la1~
  la4 sol? fa8 sol la sol
  fa4 mi re mi8 mi

  %10
  fa fa fad fad sol sol sold sold
  la1~
  la4 sol? fa8 sol la sol

  %13
  fa4 mi re r
  R1*10
  r2 r4 r8 mi

  %25
  la mi re mi la mi re mi
  fa r mi r re r do r
  do si r mi la mi re mi

  %28
  la mi re mi fa r mi r
  re r do r si4 si'8 si
  do do dod dod\mbreak re re red red

  %31
  mi1~
  mi4 re do8 si do la
  si4 sold la si8 si

  %34
  do do dod dod re re red red
  mi1~
  mi4 re do8 si do la

  %37
  si4 sold\mbreak la r
  R1*15
  r2 r8 la sol la

  %54
  r la sol la sol r fa r
  mi r re r do4 r
  r8 la' sol la r la sol la

  %57
  sol r fa r mi r re r
  do4 r r2\mbreak
  r2 r4 do8 do

  %60
  reb reb re re mib mib mi mi
  fa sol la sol fa4 mi
  fa4 r r2

  %63
  R1*3
  r2 r4 mi8 mi
  fa fa fad  fad sol sol sold sold

  %68
  la1~
  la4 sol fa r
  R1*4

  %74
  r2 r4 r8 la
  re la sol la re la sol la
  sib r la r sol r fa r

  %77
  fa mi r la re la sol la
  re la sol la sib r la r
  sol r fa r mi4 mi8 mi

  %80
  fa fa fad fad\mbreak sol sol sold sold
  la1~
  la4 sol? fa8 sol la sol

  %83
  fa4 mi re mi8 mi
  fa fa fad fad sol sol sold sold
  la1~

  %86
  la4 sol? fa8 sol la sol
  fa4 mi re r

}

IIIvlIIripn = \relative do'' {

  fa8
  la fa mi fa la fa mi fa
  sol r fa r mi r re r
  re dod r fa la fa mi fa

  %4
  la fa mi fa sol8 r fa r
  mi r re r dod4 r
  R1

  %7
  r4 la8 la sib[sib] si si
  do do dod dod re mi fa mi
  re4 dod re r

  %10
  R1
  r4 la8 la\mbreak sib sib si si
  do do dod dod re mi fa mi

  %13
  re4 dod re r
  R1*10
  r2 r4 r8 do
  mi do si do mi do si do

  %26
  re r do r si r la r
  la sold r do mi do si do
  mi do si do re r do r

  %29
  si r la r sold4 r
  R1
  r4 mi'8 mi fa [fa] fad fad

  %32
  sol sol sold sold la4 r8 mi
  re4 si la r
  R1

  %35
  r4 mi'8 mi fa[fa] fad fad
  sol sol sold sold la4 r8 do,
  re4 si\mbreak la r

  %38
  R1*15
  r4 r8 fa' do' fa, mi fa

  %54
  do' fa, mi fa sib r la r
  sol r fa r mi4 r8 fa
  do' fa, mi fa do' fa, mi fa

  %57
  sib r la r sol r fa r
  mi4 sol8 sol lab lab la la\mbreak
  sib sib si si do2~

  %60
  do~do4 sib
  la8 sib do sib la4 sol
  fa r r2

  %63
  R1*5
  r4 la,8 la sib sib si si
  do do dod dod re4 r

  %70
  R1*4
  r2 r4 r8 fa
  la fa mi fa la fa mi fa

  %76
  sol r fa r mi r re r
  re dod r fa la fa mi fa
  la fa mi fa sol8 r fa r

  %79
  mi r re r dod4 r
  R1
  r4 la8 la sib[sib] si si

  %82
  do do dod dod re mi fa mi
  re4 dod re r
  R1

  %85
  r4 la8 la\mbreak sib sib si si
  do do dod dod re mi fa mi
  re4 dod re r

}


IIIobIn =  \relative do'' {

  la'8
  re la sol la re la sol la
  sib r la r sol r fa r
  fa mi r la re la sol la

  %4
  re la sol la sib r la r
  sol r fa r mi4 mi8 mi
  fa fa fad fad\mbreak sol sol sold sold

  %7
  la1~
  la4 sol? fa8 sol la sol
  fa4 mi re mi8 mi

  %10
  fa fa fad fad sol sol sold sold
  la1~
  la4 sol? fa8 sol la sol

  %13
  fa4 mi re r
  R1*10
  r2 r4 r8 mi

  %25
  la mi re mi la mi re mi
  fa r mi r re r do r
  do si r mi la mi re mi

  %28
  la mi re mi fa r mi r
  re r do r si4 si'8 si
  do do dod dod\mbreak re re red red

  %31
  mi1~
  mi4 re do8 si do la
  si4 sold la si8 si

  %34
  do do dod dod re re red red
  mi1~
  mi4 re do8 si do la

  %37
  si4 sold\mbreak la8 la4 do,8
  si si'4 re,8 do la'4 do,8
  si16 la si do re do re mi fa mi fa re mi re do si

  %40
  do4 r r2
  R1*12
  r2 r8 la' sol la

  %54
  r la sol la sol r fa r
  mi r re r do4 r
  r8 la' sol la r la sol la

  %57
  sol r fa r mi r re r
  do4 r r2\mbreak
  r2 r4 do8 do

  %60
  reb reb re re mib mib mi mi
  fa sol la sol fa4 mi
  fa4 r r2

  %63
  r2 r8 mi re mi
  r mi re mi r re16[mi fa8 mi]
  re4 r r2\mbreak

  %66
  r2 r4 mi8 mi
  fa fa fad fad sol sol sold sold
  la1~

  %69
  la4 sol fa r
  R1*4
  r2 r4 r8 la8

  %75
  re la sol la re la sol la
  sib r la r sol r fa r
  fa mi r la re la sol la

  %78
  re la sol la sib r la r
  sol r fa r mi4 mi8 mi
  fa fa fad fad\mbreak sol sol sold sold

  %81
  la1~
  la4 sol? fa8 sol la sol
  fa4 mi re mi8 mi

  %84
  fa fa fad fad sol sol sold sold
  la1~
  la4 sol? fa8 sol la sol

  %87
  fa4 mi re r

}

IIIobIIn = \relative do'' {

  fa8
  la fa mi fa la fa mi fa
  sol r fa r mi r re r
  re dod r fa la fa mi fa

  %4
  la fa mi fa sol8 r fa r
  mi r re r dod4 r
  R1

  %7
  r4 la8 la sib[sib] si si
  do do dod dod re mi fa mi
  re4 dod re r

  %10
  R1
  r4 la8 la\mbreak sib sib si si
  do do dod dod re mi fa mi

  %13
  re4 dod re r4
  R1*10
  r2 r4 r8 do
  mi do si do mi do si do

  %26
  re r do r si r la r
  la sold r do mi do si do
  mi do si do re r do r

  %29
  si r la r sold4 r
  R1
  r4 mi'8 mi fa [fa] fad fad

  %32
  sol sol sold sold la4 r8 mi
  re4 si la r
  R1

  %35
  r4 mi'8 mi fa[fa] fad fad
  sol sol sold sold la4 r8 do,
  re4 si\mbreak la8 mi'4 la,8

  %38
  sold sold'4 si,8 la mi'4 la,8
  sold?16 fa sold la si? la si do re do re si! si8 la16 sold!
  la4 r r2

  %41
  R1*12
  r4 r8 fa' do' fa, mi fa

  %54
  do' fa, mi fa sib r la r
  sol r fa r mi4 r8 fa
  do' fa, mi fa do' fa, mi fa

  %57
  sib r la r sol r fa r
  mi4 sol8 sol lab lab la la\mbreak
  sib sib si si do2~

  %60
  do~do4 sib
  la8 sib do sib la4 sol
  fa r r2

  %63
  r2 r8 do si do
  r do si do r si16[do re8 do]
  si4 r r2

  %66
  R1*2
  r4 la8 la sib sib si si
  do do dod dod re4 r

  %70
  R1*4
  r2 r4 r8 fa
  la fa mi fa la fa mi fa

  %76
  sol r fa r mi r re r
  re dod r fa la fa mi fa
  la fa mi fa sol8 r fa r

  %79
  mi r re r dod4 r
  R1
  r4 la8 la sib[sib] si si

  %82
  do do dod dod re mi fa mi
  re4 dod re r
  R1

  %85
  r4 la8 la\mbreak sib sib si si
  do do dod dod re mi fa mi
  re4 dod re r

}


IIIflIn =  \relative do'' {

  la'8
  re la sol la re la sol la
  sib r la r sol r fa r
  fa mi r la re la sol la

  %4
  re la sol la sib r la r
  sol r fa r mi4 mi8 mi
  fa fa fad fad\mbreak sol sol sold sold

  %7
  la1~
  la4 sol? fa8 sol la sol
  fa4 mi re mi8 mi

  %10
  fa fa fad fad sol sol sold sold
  la1~
  la4 sol? fa8 sol la sol

  %13
  fa4 mi re r
  R1*10
  r2 r4 r8 mi

  %25
  la mi re mi la mi re mi
  fa r mi r re r do r
  do si r mi la mi re mi

  %28
  la mi re mi fa r mi r
  re r do r si4 si'8 si
  do do dod dod\mbreak re re red red

  %31
  mi1~
  mi4 re do8 si do la
  si4 sold la si8 si

  %34
  do do dod dod re re red red
  mi1~
  mi4 re do8 si do la

  %37
  si4 sold\mbreak la r
  R1*15
  r2 r8 la sol la

  %54
  r la sol la sol r fa r
  mi r re r do4 r
  r8 la' sol la r la sol la

  %57
  sol r fa r mi r re r
  do4 r r2\mbreak
  r2 r4 do8 do

  %60
  reb reb re re mib mib mi mi
  fa sol la sol fa4 mi
  fa8 la sol la r la sol la

  %63
  r sol16[la sib8 la] sol4 r
  R1*2
  r2 r4 mi8 mi

  %67
  fa fa fad fad sol sol sold sold
  la1~
  la4 sol fa r

  %70
  R1*4
  r2 r4 r8 la8
  re la sol la re la sol la

  %76
  sib r la r sol r fa r
  fa mi r la re la sol la
  re la sol la sib r la r

  %79
  sol r fa r mi4 mi8 mi
  fa fa fad fad\mbreak sol sol sold sold
  la1~

  %82
  la4 sol? fa8 sol la sol
  fa4 mi re mi8 mi
  fa fa fad fad sol sol sold sold

  %85
  la1~
  la4 sol? fa8 sol la sol
  fa4 mi re r

}

IIIflIIn = \relative do'' {

  fa8
  la fa mi fa la fa mi fa
  sol r fa r mi r re r
  re dod r fa la fa mi fa

  %4
  la fa mi fa sol8 r fa r
  mi r re r dod4 r
  R1

  %7
  r4 la8 la sib[sib] si si
  do do dod dod re mi fa mi
  re4 dod re r

  %10
  R1
  r4 la8 la\mbreak sib sib si si
  do do dod dod re mi fa mi

  %13
  re4 dod re r4
  R1*10
  r2 r4 r8 do
  mi do si do mi do si do

  %26
  re r do r si r la r
  la sold r do mi do si do
  mi do si do re r do r

  %29
  si r la r sold4 r
  R1
  r4 mi'8 mi fa [fa] fad fad

  %32
  sol sol sold sold la4 r8 mi
  re4 si la r
  R1

  %35
  r4 mi'8 mi fa[fa] fad fad
  sol sol sold sold la4 r8 do,
  re4 si\mbreak la r

  %38
  R1*15
  r4 r8 fa' do' fa, mi fa

  %54
  do' fa, mi fa sib r la r
  sol r fa r mi4 r8 fa
  do' fa, mi fa do' fa, mi fa

  %57
  sib r la r sol r fa r
  mi4 sol8 sol lab lab la la\mbreak
  sib sib si si do2~

  %60
  do~do4 sib
  la8 sib do sib la4 sol
  fa8 fa mi fa r fa mi fa

  %63
  r mi16[fa sol8 fa] mi4 r
  R1*4
  r4 la,8 la sib sib si si
  do do dod dod re4 r

  %70
  R1*4
  r2 r4 r8 fa
  la fa mi fa la fa mi fa

  %76
  sol r fa r mi r re r
  re dod r fa la fa mi fa
  la fa mi fa sol8 r fa r

  %79
  mi r re r dod4 r
  R1
  r4 la8 la sib[sib] si si

  %82
  do do dod dod re mi fa mi
  re4 dod re r
  R1

  %85
  r4 la8 la\mbreak sib sib si si
  do do dod dod re mi fa mi
  re4 dod re r

}

IIIvlan = \relative do'{

  r8
  r la' la la r la la la
  sol r la r sib r si r
  mi,4 r r8 la la la

  %4
  r la la la sol r la r
  sib r si r la4 r
  la,1~

  %7
  la~
  la2 la'8 la la la
  la4 la fa la,~

  %10
  la1~
  la~
  la2 la'8 la la la

  %13
  la4 la fa r
  R1*11
  r8 mi mi mi r mi mi mi

  %26
  fa r la r fa r fad r
  si,4 r r8 mi mi mi
  r mi mi mi fa r la r

  %29
  fa r fad r sib,4 mi~
  mi1~
  mi~

  %32
  mi2 mi8 mi mi mi
  fa4 mi do mi
  mi1~

  %35
  mi~
  mi2 mi8 mi mi mi
  fa4 mi\mbreak do r

  %38
  R1*15
  r2 r8 do' do do
  r do do do sol r la r

  %55
  sib r sol r sol4 r
  r8 do do do r do do do
  sol r la r sib r sol r

  %58
  sol4 do,~do2~\mbreak
  do1~
  do

  %61
  do'8 do do do do4 do
  la r r2
  R1*3

  %66
  r2 la,~
  la1~
  la~

  %69
  la2 la4 r
  R1*5
  r8 la' la la r la la la

  %76
  sol r la r sib r si r
  mi,4 r r8 la la la
  r la la la sol r la r

  %79
  sib r si r la4 r
  la,1~
  la~

  %82
  la2 la'8 la la la
  la4 la fa la,~
  la1~

  %85
  la~
  la2 la'8 la la la
  la4 la fa r

}

IIIfgn = \relative do{

  r8
  r re la' re, r re la' re,
  sol r re r sol r sold r
  la sol?  fa mi re re la' re,

  %4
  r re la' re, sol r re r
  sol r sold r la mi dod si
  la1~

  %7
  la~
  la2 re8 la re la
  re4 la re la~

  %10
  la1~
  la~
  la2 re8 la re la

  %13
  re4 la re r
  R1*10
  r2 r4 r8 si

  %25
  la la mi' la, r la mi' la,
  re r la r re r red r
  mi re? do si la la mi' la,

  %28
  r la mi' la, re r la r
  re r red r mi2~
  mi1~

  %31
  mi~
  mi2 la8 sold la la,
  re4 mi la, mi'

  %34
  mi1~
  mi~
  mi2 la8 sold la la,

  %37
  re4 mi\mbreak la, r
  R1*15
  r2 r8 fa' do' fa,
  r fa do' fa, mi r fa r

  %55
  sol r si r do4 r
  r8 fa, do' fa, r fa do' fa,
  mi r fa r sol r si  r

  %58
  do,1~
  do~
  do

  %61
  fa8 do fa do fa4 do
  fa r r2
  R1*3
  r2 la,~

  %67
  la1~
  la~
  la2 re4 r

  %70
  R1*5
  r8 re la' re, r re la' re,

  %76
  sol r re r sol r sold r
  la sol?  fa mi re re la' re,
  r re la' re, sol r re r

  %79
  sol r sold r la mi dod si
  la1~
  la~

  %82
  la2 re8 la re la
  re4 la re la~
  la1~

  %85
  la~
  la2 re8 la re la
  re4 la re r

}

IIIbcn = \relative do {

  r8
  r re la' re, r re la' re,
  sol r re r sol r sold r
  la sol?  fa mi re re la' re,

  %4
  r re la' re, sol r re r
  sol r sold r la mi dod si
  la1~

  %7
  la~
  la2 re8 la re la
  re4 la re la~

  %10
  la1~
  la~
  la2 re8 la re la

  %13
  re4 la re r8 re
  re4 r re r
  sol re sol sold

  %16
  la r8 re,\mbreak re4 r
  re r sol re
  sol sold la16 si dod re mi re dod si

  %19
  la4 la, la la
  la la la la\mbreak
  re r re r

  %22
  mi r mi r
  la,8 si do si la si do la
  mi'4 mi\mbreak la,8 si do si

  %25
  la la mi' la, r la mi' la,
  re r la r re r red r
  mi re? do si la la mi' la,

  %28
  r la mi' la, re r la r
  re r red r mi2~
  mi1~

  %31
  mi~
  mi2 la8 sold la la,
  re4 mi la, mi'

  %34
  mi1~
  mi~
  mi2 la8 sold la la,

  %37
  re4 mi\mbreak la,8 si do la
  mi' fad sold mi la, si do la
  mi'4 mi mi mi

  %40
  la, r mi' r
  la, r mi' r
  la, r mi' r\mbreak

  %43
  la, la' la, la'
  re, fa re fa
  sol si sol si

  %46
  do mi, re mi
  fa la fa la\mbreak
  sib si sol si

  %49
  do do do, do'
  fa, fa sol la
  sib fa sol la

  %52
  sib fa\mbreak sol do,
  fa r r8 fa do' fa,
  r fa do' fa, mi r fa r

  %55
  sol r si r do4 r
  r8 fa, do' fa, r fa do' fa,
  mi r fa r sol r si  r

  %58
  do,1~
  do~
  do

  %61
  fa8 do fa do fa4 do
  fa r fa r
  do4. fa8 do4 r

  %64
  do r sol'4. do,8
  sol'4 r sold r\mbreak
  la,4. re8 la2~

  %67
  la1~
  la~
  la2 re4 r

  %70
  la' r re, r
  la' r\mbreak re, r
  re r r8 re la' la,

  %73
  re4 r re r
  r8 re sol, la re,4 r
  r8 re' la' re, r re la' re,

  %76
  sol r re r sol r sold r
  la sol?  fa mi re re la' re,
  r re la' re, sol r re r

  %79
  sol r sold r la mi dod si
  la1~
  la~

  %82
  la2 re8 la re la
  re4 la re la~
  la1~

  %85
  la~
  la2 re8 la re la
  re4 la re r

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key re\minor
  \time 4/4
  \tempo 2 = 62
  \partial 8 s8
  s1*87
  \bar"|."


}

IIIvlI = {
  \IIIglobal
  %\notypeset
  <<\IIIvlIn \forma>>

}

IIIvlII = {
  \IIIglobal
  <<\IIIvlIIn \forma>>

}

IIIvlIrip = {
  \IIIglobal
  <<\IIIvlIripn \forma>>

}

IIIvlIIrip = {
  \IIIglobal
  <<\IIIvlIIripn \forma>>

}

IIIobI = {
  \IIIglobal
  <<\IIIobIn \forma>>

}

IIIobII = {
  \IIIglobal
  <<\IIIobIIn \forma>>

}

IIIflI = {
  \IIIglobal
  <<\IIIflIn \forma>>

}

IIIflII = {
  \IIIglobal
  <<\IIIflIIn \forma>>

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
  \typeset

}
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

  print-first-page-number = ##t
  first-page-number = #2

}

\bookpart {

  \paper  {

    systems-per-page = #2

  }

  \markup\huge "[1.] All[egr]o assai"

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino di""Con[certin]o [I]"}
            \IvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino di""Con[certin]o [II]"}
            \IvlII
          >>
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violino  I""ripieno]" }
            \IvlIrip
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violino II""ripieno]"}
            \IvlIIrip
          >>
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"Hautbois [I]" }
            \IobI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"Hautbois [II]"}
            \IobII
          >>
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"Flauto [I]" }
            \IflI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"Flauto [II]"}
            \IflII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup \center-column{"[Viola]"}
          \Ivla
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"bassoon"
          \set Staff.instrumentName = \markup \center-column{"Fagotto"}
          \Ifg
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"contrabass"
          \set Staff.instrumentName = \markup \center-column{"[Basso]"}
          \Ibc

        >>
      >>
    }

    \layout {

      indent = 2.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #1
        \override StaffGrouper.staff-staff-spacing.basic-distance = #7
        \override BarLine.hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
        skipBars = ##t
      }

    }

    \midi {
      \context {
        \Voice
        \remove "Dynamic_performer"
      }
    }

  }

}

\bookpart {

  \paper  {

    systems-per-page = #6

  }

  \markup\huge "[2.] Largo"

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"Flauto [I]" }
            \IIflI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup \center-column{"Flauto [II]"}
            \IIflII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"bassoon"
          \set Staff.instrumentName = \markup \center-column{"Fagotto"}
          \IIfg
        >>
      >>
    }

    \layout {

      indent = 2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine.hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
        skipBars = ##t
      }

    }

    \midi {
      \context {
        \Voice
        \remove "Dynamic_performer"
      }
    }

  }

}

\bookpart {

  \paper  {

    systems-per-page = #2

  }

  \markup\huge "[3.] All[egr]o"

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlII
          >>
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlIrip
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlIIrip
          >>
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \IIIobI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \IIIobII
          >>
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \IIIflI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"recorder"
            \IIIflII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIIvla
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"bassoon"
          \IIIfg
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"contrabass"
          \IIIbc

        >>
      >>
    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #1
        \override StaffGrouper.staff-staff-spacing.basic-distance = #7
        \override BarLine.hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
        skipBars = ##t
      }

    }

    \midi {
      \context {
        \Voice
        \remove "Dynamic_performer"
      }
    }

  }

}





%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}
