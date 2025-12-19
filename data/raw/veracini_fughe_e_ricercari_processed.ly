\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

acc = \once \override Stem.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tr = \trill

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tous"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

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




mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}

IvlIn = \relative do'' {

    do1_\markup\italic "(1)" fa,
    mib'1 re
    mi,!2 fa mib'1

    %4
    re mi,!2 fa
    do mi fa fa'
    mi do' r sol~

    %7
    sol fa1 mi4(do)
    sol2 sol'1 fa2~
    fa mi4(do) sol'2 sol,

    %10
    r sol' la fa,
    mi do' r sol' ^\markup\italic "(5)"
    sol\tr fa fa\tr mi

    %13
    r sol sol\tr fa
    fa\tr mi re sol,\mbreak
    mi do' mi do,

    %16
    r fa'4(la,) sib2 do
    fa, fa' do, fa'4(la,)
    sib2 do fa, fa'

    %19
    do, do' do\tr sib
    sib la r do
    la fa' r sol,

    %22
    mi' re4(do) do'2 do,
    re sol, mi' re4 \parenthesize (do)
    do'2 do, re sol,

    %25
    r fa' mi do'4(mi,)
    fa2 sol do, do'
    sol, do'4(mi,) fa2 sol\mbreak

    %28 OOKK
    do, do' sol, sib'
    sib\tr la la\tr sol
    la si do do,

    %31
    r sol' la si
    do do, r re4(sol)
    fad2 re, r dod''

    %34
    dod re r dod
    dod re si, sol,
    sol'1 do,?

    %37
    sib' la
    si,2 do sib'!1
    la si,2 do

    %40
    sol fa'' mi do'
    fa,1 do\mbreak
    sib' la

    %43
    si,2 do sib'!1
    la si,2 do
    sol si do do'

    %46
    do\tr sib? sib\tr la
    sol do4(la) fa2 sib
    sib\tr la r do4(mi,)

    %49
    fa2 sol sol\prall fa
    fa\prall mi4(sol) do,2 do,
    r do''4(la) sol2 do

    %52
    r do, la fa'
    r do1 sib2~\mbreak
    sib la4(fa) do2 do'~

    %55
    do sib1 la4(fa)
    do'2 do, r la'
    la(sol) r mi'

    %58
    mi(re) r sol
    sol fa r sib
    dod, re la sol'4(mi)

    %61
    fa1. mi2
    la1. sol2
    fa fa4 re mi1\prall

    %64
    re r2 dod'
    dod re r dod
    dod re r sol,\mbreak

    %67
    fa do'! do re
    re do4 \parenthesize (sib) do2 la
    la sib sib\tr la

    %70
    la\tr sol sol\tr fa4(sol)
    la2 do do\prall sib
    sib\prall la sol do4(mi,)

    %73
    fa2 do re, do
    r sib'4(la) sol2 do
    re, do r sib'4 \parenthesize (la)

    %76
    sol2 do re mi
    fa fa, r do'
    re mi fa fa,

    %79
    r do''4(mi,) fa2 fa,\mbreak
    r sib sib\tr la
    fa'1 do

    %82
    sib' la
    si,2 do sib'!1
    la si,2 do

    %85
    sol si do1
    r2 fa fa(mi)
    r do' do(si)

    %88
    r mi, fa, re'
    re do4(la) si1~
    si2 la re1~

    %91
    re2 do4(la) fa2 fa'
    sold, la la sold
    la1 r2 sold'\mbreak

    %94
    sold(la) r sold
    sold(la) r do,
    do sol'! sol la

    %97
    la sol4(fa) sol2 mi
    mi fa fa\tr mi
    mi\prall re re\prall do4(re)

    %100
    mi2 sol sol\tr fa
    fad?\prall mi re sol,
    r sol'4(fa) mi2 do,

    %103
    r si'' si(do) r
    si si do
    do,1 fa,

    %106
    mib' re
    mi,?2 fa mib'1
    re mi,!2 fa

    %109
    do mi fa'1\mbreak
    do r2 fa
    mi do' fa,, la

    %112
    sol do la fa'
    do, mi' fa do'~
    do sib la do,4(re)

    %115
    sib1\prall  la2 re'~
    re do4 \parenthesize (sib) la2 la,4 (sib)
    sol1\tr fa2 do''~(do sib la) do,4(re)

    %118
    sib1\tr la2 re'~\parenthesize (
    re do4 sib) la2 la,4 \parenthesize (sib)
    sol1\tr fa2 fa'

    %121
    mi do' la la,
    sol mi' <fa la, fa> r\fermata

}


IvlIIn = \relative do'' {

    R1*8
    r2 do_\markup\italic "(2)" la fa'
    r do1 sib2~
    sib la4(fa) do2 do'~
    do sib1 la4(fa)
    do'2 do, r re'
    mi do, fa'1
    do sib'
    la si,2 do
    sib'!1 la
    si,2 do sol si\mbreak
    do1 r2 sol'
    la fa, r do'
    do\tr sib? sib\tr la
    r do do\tr sib
    sib\tr la sol sol'
    sol fa\tr fa mi\tr
    r fa mi do'
    r sol1 fa2~
    fa mi4 \parenthesize (do) sol2 sol'~
    sol fa1 mi4(do)
    sol'2 sol, r do
    re mi fa fa,
    r do' re mi\mbreak

    %28
    fa fa, fa mi
    fa fa' fa\tr mi
    mi re r sol4(do,)
    si2 mi~(mi re)
    r sol4 \parenthesize (do,) si2 sol'
    r2 la,4(do) si2 sol,
    r fad''~( fad sol)
    r fad fad sol
    sol,1 do,
    sib' la
    si,2 do sib'!1
    la si,2 do
    sol si do do'
    la fa' r do'4(mi,)\mbreak
    fa2 sol do, do'
    sol, do'4(mi,) fa2 sol
    do, do' sol, sol'
    sol\tr fa fa\tr mi
    re sol4(mi) do2 fa
    fa mi r sol
    sol\tr fa fa\tr mi4(sol)
    do,2 do, r do''4(la)
    sol2 do4(mi,) fa2 sol
    sol\tr fa fa\tr mi4 sol
    do,1 fa,
    mib' re\mbreak
    mi,!2 fa mib'1
    re mi,!2 fa
    do mi fa1
    r2 sib sib(la)
    r fa' fa(mi)
    r la sib, sol'
    sol fa4(re) mi1~
    mi2 re sol1~
    sol2 fa4(re) sib2 sib'
    dod ,re re dod
    re sold sold(la)
    r sold sold(la)
    r fa fa do'!\mbreak
    do la la sib
    sib la4(sol) la2 do
    do re re do
    do\tr sib sib\tr la4(sib)
    do2 la la\tr sol
    sol fa mi do,
    r fa'4(la,) sib2 do
    fa, fa' do, fa'4(la,)
    sib2 do fa, fa'
    do, la'' la(sol)
    r2 re'4(fa,) mi2 la
    la(sol) r fa
    fa mi r fa4(si,)\mbreak
    do2 do, do'1
    fa,2 fa' mi do'
    r sol1 fa2~
    fa mi4(do) sol2 sol'~
    sol fa1 mi4(do)
    sol'2 sol, r mi'
    mi(re) r si' si(la) r re
    re(do) r fa,
    sold, la mi re'4(si)
    do1.  si2
    mi1. re2
    re do4(la) si1\tr
    la2 red red (mi)\mbreak
    r red red(mi)
    r do do sol'!
    sol mi mi fa
    fa mi4(re) mi2 sol
    sol la\tr la sol
    sol\prall fa fa\prall mi4(fa)
    sol2 mi mi\tr re
    re\prall do si re4(do)
    si2 sol, r fad''
    fad(sol) r fad
    fad sol do,,1
    do' fa,
    mib' re
    mi,!2 fa mib'1
    re mi,!2 fa
    do mi fa1\mbreak
    do'' fa,
    r2 do la fa'
    do, mi' fa la,
    sol do la la'~
    la sol fa la,4(sib)
    sol1\tr fa2 sib'~
    sib la4(sol) fa2
    fa,4(sol)
    mi1\prall fa2 la'~(
    la sol fa) la,4(sib)
    sol1 fa2 sib'~(
    sib la4 sol) fa2 fa,4(sol)
    mi1\tr fa2\upl la\upl
    sol\upl mi'\upl fa\upl fa,\upl
    mi\upl do'\upl la r\fermata

}


Ivlan = \relative do' {

    R1*20
    r2 do'4_\markup\italic "(4)" (mi,) fa2 sol
    do, do' sol, do'4(mi,)

    %13
    fa2 sol do, do'
    sol,1 r\mbreak
    r do'

    %16
    fa, mib'
    re mi,!2 fa
    mib'1 re

    %19
    mi,!2 fa do mi
    fa1 do
    r2 la' sol mi'

    %22
    r sol, do, la'
    sol do r sol
    do, la' sol do

    %25
    si re sol, mi4(sol)
    la2 sol fa la,4(sib?)
    do2 mi4(sol) la2 sol\mbreak

    %28
    fa la sib, do
    do1 r2 sol'
    sol\tr fa fa\tr mi

    %31
    r sol sol\tr fa
    fa\tr mi re si4(sol)
    re'1 sol,

    %34
    R1*2
    re'1 sol,
    sol' do,

    %37
    sib' la
    si,2 do sib'!1
    la si,2 \parenthesize do

    %40
    sol si do mi4(do)
    fa2 la sol mi'4\parenthesize (do)\mbreak
    re2 sol,4(fa) mi2 fa4(mi)

    %43
    re2 sol, r sol'4(fa)
    mi2 fa4(mi) re2 sol,
    si re do sol'4(mi)

    %46
    fa2 do r la'4(fa)
    do'2 do, r do
    la fa' r do'~

    %49
    do sib1 la4(fa)
    do2 do' sib1~
    ( sib2 la4 fa) do'2 sol

    %52
    mi do' r la
    sib\prall la la\tr  sol\mbreak
    sol fa r la

    %55
    la\tr sol sol\tr fa
    sol1 r2 fa
    fa(mi) r sol

    %58
    sol(fa) r dod
    dod(re) r mi
    mi(re) r la'

    %61
    la1 r2 dod,
    dod(re) r mi
    mi(re) r la'

    %64
    fa sib la la,
    r sib' la la,
    re sib' sib la4(sol)\mbreak

    %67
    la2 fa r fa
    sol la4(sib) la2 fa
    r fa sol la4 \parenthesize (sib)

    %70
    do2 do, do1
    r2 fa re sib'
    r re re do

    %73
    r fa, sol la
    sib sib, r fa'
    sol la sib sib,

    %76
    r do' do sib
    sib\tr la r do
    do sib sib la

    %79
    sol do, la fa'\mbreak
    r sol4 mi fa2 fa,
    do'1 r2 mi

    %82
    fa mi mi\tr re
    re do r mi
    mi\tr re re\tr do

    %85
    re1 r2 do'
    do(si) r re
    re \parenthesize (do) r sold

    %88
    sold(la) r si,
    si?\tr la r mi'
    fa1 r2 sold

    %91
    sold(la) r si
    si(la) r mi
    do fa mi mi,\mbreak

    %94
    r fa' mi mi,
    la fa' fa mi4(re)
    mi2 do r do

    %97
    re mi4 (fa) mi2 do
    r do re mi4(fa)
    sol2 sol, sol1

    %100
    r2 do la fa'
    r la la si4 la
    sol1 do,

    %103
    R1*2
    sol'1 do,
    do' fa,

    %106
    mib' re
    mi,!2 fa mib'1
    re mi,!2 fa

    %109
    do'1 fa,\mbreak
    r2 do la fa'
    r sol do do,

    %112
    r sol' do do,
    r sol' do fa,
    mi do' r fa,~

    %115
    fa mib1 re4(do)
    sib2 do do(re)
    r do la fa'

    %118
    mi do' r la,
    sib do1 sib4(do)
    re2 mi fa1

    %121
    r2 do\upl la\upl do\upl
    do\upl sol'\upl fa\upl do\upl
    do\upl sol'\upl fa r\fermata

}

Ibcn = \relative do {

    R1*20
    r2 do_\markup\italic "(3)" re mi
    fa fa, r do'

    %13
    re mi fa fa,
    r do' si sol'\mbreak
    R1*2

    %16
    r2 fa sol la
    sib sib, r fa'
    sol la sib sib,

    %19
    r fa' mi do'
    R1*2
    fa,1 do

    %22
    sib' la
    si,2 do sib'!1
    la si,2 do

    %25
    sol si do do'
    do sib? sib la
    r do do sib\mbreak

    %28
    sib la sol do,
    fa1 r2 do'4(mi,)
    fa2 sol do, do'

    %31
    sol, do'4(mi,) fa2 sol
    do, do' sol,1
    R1*2

    %34
    re'1 sol,
    R1*2
    sol'1 do,

    %37
    sib' la
    si,2 do sib'!1
    la si,2 do

    %40
    sol si do1
    r2 fa mi do'\mbreak
    r2 sol1 fa2~

    %43
    fa mi4(do) sol2 sol'~
    sol fa1 mi4(do)
    sol'2 sol, r do

    %46
    re mi fa fa,
    r do' re mi
    fa fa, r do'

    %49
    re mi fa  fa,
    r do' re mi
    fa fa, r do''

    %52
    mi do, r fa
    sol la sib sib\mbreak
    do re la sol4 fa

    %55
    sib,2 sib' do re
    mi, do' la sol4 fa
    do1 dod

    %58
    re mi
    fa sol
    la2 re, la' la,

    %61
    re1 mi
    fa sol
    la2 re, la' la,

    %64
    re1 r
    R1*2
    sib'1 fa\mbreak

    %67
    mib' re
    mi,!2 fa mib'1
    re mi,!2 fa

    %70
    do mi fa1
    r2 la, sib1
    si^\markup\center-align "NB" do

    %73
    r2 fa fa mib
    mib re r fa
    fa mib mib re

    %76
    r re4(la) sib2 do
    fa, fa' do, fa'4(la,)
    sib2 do fa, fa'

    %79
    do,1 r2 fa'\mbreak
    mi? do' r fa,
    la fa, r do'

    %82
    re mi fa fa
    sol la mi re4(do)
    fa,2 fa' sol la

    %85
    si, sol' mi re4(do)
    sol1 sold
    la si

    %88
    do re
    mi2 la, mi' mi,
    la1 si

    %91
    do re
    mi2 la, mi' mi,
    la1 r\mbreak

    %94
    R1*2
    fa'1 do
    sib' la

    %97
    si,2 do sib'!1
    la si,2 do
    sol si do1

    %100
    r2 mi fa1
    fad^\markup\center-align "NB" sol
    R1*2

    %103
    sol1 do,
    R1*2
    do'1 fa,?

    %106
    mib' re
    mi,!2 fa mib'1
    re mi,!2 fa

    %109
    do do, fa1\mbreak
    r fa'
    do r2 fa

    %112
    mi do' fa,, fa'
    mi do' fa,1
    do r2 la

    %115
    sib do1 sib4(do)
    re2 mi fa sib
    do do, fa1

    %118
    do r2 fa~
    fa mib1 re4 \parenthesize (do)
    sib2 do re re'4 \parenthesize (sib)

    %121
    do2 do,\upl fa\upl fa\upl
    do'\upl do,\upl fa\upl fa\upl
    do'\upl do,\upl fa r\fermata

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown


}

forma = {

    \key fa\major
    \time 2/2
    \tempo 1 = 60
    \set Score.measureLength = #(ly:make-moment 2 1)
    s\breve*123
    \bar"|."

}


IvlI = {
    \Iglobal
    <<\IvlIn \forma>>
}


IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>
}


Ivla = {
    \Iglobal
    \clef alto
    <<\Ivlan \forma>>
}


Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}


%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


IIsopranon = \relative do'' {

    \autoBeamOff
    R1*4
    dod1
    re

    %7
    mi,
    re
    R1*3

    %12
    r2 la'^\markup "(3)"
    si2. si4
    do1

    %15
    re
    mi
    la,

    %18
    R\mbreak
    r2 la^\markup "(5)"~
    la4 la sol2~

    %21
    sol fa
    mi2. mi4
    re1

    %24
    sol^\markup "(4)"
    fa
    sib

    %27
    la2 fa'~
    fa4 fa mi re
    do si la2~

    %30
    la sold
    la do~
    do4 do si la

    %33
    sold1
    la
    R\mbreak

    %36
    r2 la
    si2. si4
    do1

    %39
    re
    mi
    la,

    %42
    r2 fa'~
    fa4 fa mi re
    do si la2~

    %45
    la sold
    la do
    fa, sol?

    %48
    la1
    sold2 la~
    la sold

    %51
    la1
    re,
    mi2 mi'~\mbreak

    %54
    mi4 mi re2~
    re do
    si2. si4

    %57
    la1
    do
    la

    %60
    sol^\markup "(4)"
    fa
    sib

    %63
    la2 sib~
    sib4 sib? la sol
    fa re la'2~

    %66
    la4 la sol fa
    mi1
    re

    %69
    sib'
    la2 re,\mbreak
    re4 sol(la sib)


    %72
    do1
    sib
    R

    %75
    dod
    re
    mi,

    %78
    re
    sol
    fad2 sol~

    %81
    sol fa!
    mi2. mi4
    fa2 re'2~

    %84
    re4 re do2~
    do do
    sib1

    %87
    sib?2 la
    la2. la4
    la\breve\fermata

}

IItestoI = \lyricmode {

    Cru -- ci -- fi -- xus  sub Pon -- ti -- o  Pi -- la -- to, pas -- sus et se -- pul -- tus  est,

    pas -- sus, pas -- sus,  e -- tiam _  pro no - - - bis, e -- tiam _  pro no -- bis

    sub Pon -- ti -- o  Pi -- la -- to,  e -- tiam _  pro no - - - bis,  pas -- sus et se -- pul - tus  est,

    pas -- sus, pas -- sus, et se -- pul -- tus  est,

    pas -- sus, pas -- sus,  pas -- sus, e -- tiam _  pro no -- bis, e -- tiam _  pro no -- bis,

    pas -- sus et se - pul -- tus.

    Cru -- ci -- fi -- xus pas -- sus et se -- pul -- tus  est, pas -- sus et se -- pul -- tus, se -- pul -- tus est.

}

IIalton = \relative do' {

    \autoBeamOff

    R1*8
    sold'1
    la

    %11
    si,
    la
    R1*2

    %15
    r2 sib'~
    sib4 sib la sol?
    fa mi re2~

    %18
    re dod\mbreak
    re1
    re2. re4

    %21
    do?1
    sib
    la2 re~

    %24
    re dod
    re1
    re^\markup "(4)"

    %27
    do!
    fa
    mi2 fa~

    %30
    fa4 fa mi re
    do la mi'2~
    mi4 mi re do

    %33
    re1
    mi
    re\mbreak

    %36
    do
    fa
    mi2 la,~

    %39
    la4 re(mi fa)
    sol1
    fa

    %42
    R
    sold
    la

    %45
    si,
    la
    re

    %48
    dod2 re~
    re do!
    si2. si4

    %51
    la2 la'~
    la4 la sol2~
    sol sol\mbreak

    %54
    fa fad
    sold la
    la2. sol!4

    %57
    fa1
    sol
    fa

    %60
    sib
    la2 sib~^\markup "(2)"
    sib4 sib? la sol

    %63
    fa mi re2~
    re dod
    re fa~

    %66
    fa4 fa mi re
    dod1
    re2 re

    %69
    mi2. mi4
    fa1\mbreak
    sol

    %72
    la
    re,
    r2 sib'~

    %75
    sib4 sib? la sol
    fa mi re2~
    re dod

    %78
    re fa
    sib, do?
    re1

    %81
    dod2 re~
    re do!
    sib1

    %84
    sib'
    la2 la~
    la4 la sol2~

    %87
    sol fa
    mi2. mi4
    re\breve\fermata

}

IItestoII = \lyricmode {

    Cru -- ci -- fi -- xus  e -- tiam _  pro no - - - bis, pas -- sus et se -- pul - tus  est,

    pas -- sus, pas -- sus,  e -- tiam _  pro no -- bis e -- tiam _  pro no -- bis,

    pas -- sus, pas -- sus et se -- pul -- tus.

    Cru -- ci -- fi -- xus pas -- sus et se -- pul -- tus  est, pas -- sus et se -- pul -- tus est,

    se -- pul -- tus est,  pas -- sus, pas -- sus,  e -- tiam _  pro no - - - bis, e -- tiam _  pro no -- bis,

    sub Pon -- ti -- o  Pi -- la -- to,  e -- tiam _  pro no - - - bis, pas -- sus et se -- pul - tus est,

    pas -- sus pas -- sus et se -- pul -- tus  est.

}

IItenoren = \relative do' {

    \autoBeamOff
    R1*7
    r2 fa~
    fa4 fa mi re

    %10
    do si la2~
    la sold
    la1

    %13
    R1*3
    dod1
    re

    %18
    mi,\mbreak
    re
    R

    %21
    r2 la'^\markup "(5)"~
    la4 la sol2~
    sol fa

    %24
    mi2. mi4
    re1
    R

    %27
    r2 la'
    si!2. si4
    do1

    %30
    re
    mi
    la,

    %33
    si
    do
    si~\mbreak

    %36
    si2 la
    re1
    do

    %39
    fa
    mi2 mi~
    mi4 mi re2~

    %42
    re do
    si2. si4
    la2 fa'~

    %45
    fa4 fa mi re
    do(si) la2
    sib1

    %48
    la2 la
    si! la
    mi1

    %51
    la
    si
    do2 dod\mbreak

    %54
    re1
    mi~
    mi2 mi

    %57
    la, fa'~
    fa4 fa mi2~
    mi re

    %60
    dod2. dod4
    re2 re,^\markup "(3)"
    mi2. mi4

    %63
    fa1
    sol
    la

    %66
    re,
    R1*2
    sol1

    %70
    fa\mbreak
    si!
    la2 la'~

    %73
    la4 la sol2~
    sol fa
    mi2. mi4

    %76
    re2 sib~
    sib4 sib? la sol!
    fa (mi) re2

    %79
    mib1
    re
    mib2 la

    %82
    la1~
    la2 la
    sol1

    %85
    la2 re~
    re mi4(re)
    dod2 re~

    %88
    re dod
    re\breve\fermata

}

IItestoIII = \lyricmode {

    e -- tiam _  pro no - - - bis Cru -- ci -- fi -- xus pas -- sus et se -- pul -- tus  est,

    sub Pon -- ti -- o  Pi -- la -- to, pas - - sus pas -- sus pas -- sus  pas -- sus  et se -- pul -- tus est

    e -- tiam _  pro no -- bis, pas -- sus et se -- pul -- tus, pas -- sus et se -- pul - tus est,

    pas -- sus et se -- pul -- tus est sub Pon -- ti -- o  Pi -- la -- to,

    pas -- sus pas -- sus, pas -- sus  et se -- pul -- tus est e -- tiam _  pro no -- bis,

    pas -- sus,  et se -- pul -- tus, pas -- sus  et se -- pul - tus est.

}

IIbasson = \relative do{

    \autoBeamOff

    dod'1^\markup "(1)"
    re
    mi,

    %4
    re2 sib'^\markup "(2)"~
    sib4 sib? la sol
    fa mi re2~

    %7
    re dod
    re1
    R

    %10
    r2 re^\markup "(3)"
    mi2. mi4
    fa1

    %13
    sol
    la
    re,

    %16
    R1*2
    sol1^\markup "(4)"\mbreak
    fa

    %20
    sib
    fa
    R1*6

    %28
    sold1
    la
    si,

    %31
    la
    r2 fa'~
    fa4  fa mi re

    %34
    do si la2~
    la sold\mbreak
    la1

    %37
    R1*2
    re1
    do

    %41
    fa
    mi2 la,
    si2. si4

    %44
    do2 re
    mi1
    la,2 la'~

    %47
    la4 la sol2~
    sol fa
    mi1~

    %50
    mi2 mi
    la,1
    R1*5

    %57
    re1^\markup "(4)"
    do
    fa

    %60
    mi
    R
    dod'^\markup "(1)"

    %63
    re
    mi,
    re

    %66
    r2 sib'~
    sib4 sib? la sol
    fa mi re2~

    %69
    re dod
    re1\mbreak
    sol

    %72
    fa
    sib
    la2 re,

    %75
    mi2. mi4
    fa2 sol
    la1

    %78
    re,2 re~
    re4 re do2~
    do sib

    %81
    la1~
    la2 la
    re1

    %84
    mi
    fa2 fad
    sol1

    %87
    la
    la,
    re\breve\fermata

}

IItestoIV = \lyricmode {

    Cru -- ci -- fi -- xus e -- tiam _  pro no - - - bis sub Pon -- ti -- o  Pi -- la -- to:

    pas -- sus, pas -- sus.

    Cru -- ci -- fi -- xus e -- tiam _  pro no - - - bis pas -- sus, pas -- sus, sub Pon -- ti -- o  Pi -- la -- to,

    pas -- sus et se -- pul -- tus  est, pas -- sus, pas -- sus.

    Cru -- ci -- fi -- xus e -- tiam _  pro no - - - bis pas -- sus, pas -- sus, sub Pon -- ti -- o Pi -- la -- to,

    pas -- sus et se -- pul -- tus, pas -- sus et se -- pul - tus  est.

}

forma = {

    \key do\major
    \time 2/2
    \tempo 1 = 60
    s1*88
    s\breve
    \bar"||"

}

IIsoprano = {
    \new Voice = "cruci1"
    <<\IIsopranon \forma>>
}

IIalto = {
    \new Voice = "cruci2"
    <<\IIalton \forma>>
}

IItenore = {
    \new Voice = "cruci3"
    <<\IItenoren \forma>>
}

IIbasso = {
    \new Voice = "cruci4"
    <<\IIbasson \forma>>
}



IIIsopranon = \relative do'' {

    \autoBeamOff

    r1 sib~
    sib2 si dod re~
    re dod re1

    %4
    sol, la
    mi' la,2 re~
    re re do1

    %7
    dod2. dod4 re2 la
    si1 do
    re dod

    %10
    mi1. re4 (dod)\mbreak
    re1. do!2
    si1 la

    %13
    dod2. dod4 re2 re~
    re re do! si4(la)
    la1 si2 do4 la

    %16
    mi'2. re4 do2 sib~
    sib sib? la re~
    re do sib2. sib4

    %19
    la2 sib4(la) sold mi la2~
    la sold la1\mbreak
    R1*2

    %22
    r1 sib ~
    sib2 si dod re~
    re dod re mib~

    %25
    mib mib? re sol,~
    sol4 sol sol1 lab4(sol)
    fad re sol1 fa2

    %28
    mi1 re
    R1*6\mbreak
    r2 do'1 re2~

    %33
    re mi la,2. la4
    sol2. sol4 la si do re
    si sol do1 si2

    %36
    do1 r
    R1*4
    sol1 la

    %40
    si do~\mbreak
    do2 si do1
    fa, r2 sol~

    %43
    sol la1 si2
    mi,2. mi4 re2. re4
    mi fad sol la fad re sol2~

    %46
    sol fad sol1
    r r2 re'~
    re re sol,2. sol4

    %49
    dod1 re2 re~\mbreak
    re do! sib1
    la sold4 mi la2~

    %52
    la sold la1
    r r2 sol~
    sol la si1

    %55
    re mib~
    mib re2 sol,~
    sol sol do,2. do4\mbreak

    %58
    fad4 re sol1 fa2
    mi2. mi4 re2 fad~
    fad sol la la~

    %61
    la sol fad fad~
    fad fad? fa1~
    fa2 fa mi1~

    %64
    mi r\fermata
    fa\breve\mbreak
    mi

    %67
    mi
    re~
    re

}

IIItestoI = \lyricmode {

    Cru -- ci -- fi - - xus  Cru -- ci -- fi -- xus e -- tiam _  e -- tiam _  pro no - - bis.

    Cru -- ci -- fi - - xus e -- tiam _  e -- tiam _  pro no - - - - - bis, e -- tiam _ e - - tiam _ pro no - - - bis.

    Cru -- ci -- fi - - xus   e -- tiam _  e -- tiam _  pro no - - - - bis,

    sub Pon -- ti -- o  Pi -- la -- to, pas - - - - - - - sus, sub Pon -- ti -- o  Pi -- la -- to, sub Pon -- ti -- o  Pi -- la -- to,

    pas - - - - - - - sus, pas -- sus et se -- pul -- tus  pas -- sus et se -- pul - - tus est,

    pas - sus, pas - sus,  pas -- sus et se -- pul - - - - tus est, pas - sus, pas - sus,

    et se -- pul -- tus est,  se -- pul -- tus est.

}

IIIalton = \relative do' {

    \autoBeamOff
    la'1. sol4(fad)
    sol1. fa!2
    mi1 re2 re~

    %4
    re re mi fa
    sol1 fa
    sold2. sold4 la2 la~

    %7
    la sol! fa2. fa4
    mi1. la2~
    la sol la1

    %10
    r fa~\mbreak
    fa2 fad sold la~
    la sold la la~

    %13
    la sol! fa1
    sold2. sold4 la1~
    la2 la mi1~

    %16
    mi mi2 mi~
    mi mi fa la~
    la4 la la1 sol4(fa)

    %19
    mi2 re mi1~
    mi mi\mbreak
    R1*2

    %22
    la1. sol4(fad)
    sol1. fa!2
    mi1 re2 fad~

    %25
    fad fad sol sol~
    sol fa! mib2. mib4
    re2 mib4(re) dod la re2~

    %28
    re dod re1
    R1*4
    r2 fa1 sol2~\mbreak

    %32
    sol la re,2. re4
    do2. do4 re mi fa2~
    fa mi~mi4 re mi fa

    %35
    re2 mi4 do sol'1
    sol do,
    re mi

    %38
    fa!2 fa mi1
    re2 mi1 fad2~
    fad sol sol fad\mbreak

    %41
    sol1 do,2 do~
    do re1 mi2
    la,2. la4 sol2. sol4

    %44
    la si do1 si2~
    si4 la si do la2 si4 sol
    re'1 re2 sol~

    %47
    sol sol re2. re4
    fad1 sol2 sib~
    sib la4 sol fad2 la~\mbreak

    %50
    la la1 sol4 (fa
    mi2) la, si! do4 re
    mi2. mi4 mi2 do~

    %53
    do re mi mi~
    mi fad sol sol~
    sol sol do,2. do4

    %56
    fad1 sol2 sol~
    sol fa! mib1\mbreak
    re dod4 la re2~

    %59
    re dod re re~
    re mi fad fad~
    fad mi re re~

    %62
    re re re1~
    re2 re sol,1~
    sol r\fermata

    %65
    re'\breve\mbreak
    re
    dod

    %68
    re~
    re

}

IIItestoII = \lyricmode {

    Cru -- ci -- fi - - xus  Cru -- ci -- fi - - xus e -- tiam _  e -- tiam _  pro no - - bis.

    Cru -- ci -- fi - - xus e -- tiam _  e -- tiam _  pro no -- bis, e -- tiam _ e -- tiam _ pro no - - bis.

    Cru -- ci -- fi - - xus   e -- tiam _  e - - tiam _  pro no - - - bis,

    sub Pon -- ti -- o  Pi -- la -- to,

    pas - - - - - - - - - - sus, sub Pon -- ti -- o  Pi -- la -- to, sub Pon -- ti -- o  Pi -- la -- to, sub Pon -- ti -- o  Pi -- la -- to,

    pas - - - - - - - - - - sus, pas -- sus et se -- pul -- tus  pas - - sus pas -- sus et se -- pul - - - tus est,

    pas - sus, pas - sus,  pas -- sus et se -- pul -- tus pas -- sus et se -- pul - - tus

    est,  pas - sus, pas - sus, et se -- pul -- tus est, se -- pul -- tus est.

}

IIItenoren = \relative do' {

    \autoBeamOff
    R1*4
    r1 sib~
    sib2 si dod re~

    %5
    re dod re1
    R1*4
    sold,2. sold4 la2. la4

    %9
    re1 mi2 la,~
    la sol fa la~\mbreak
    la4 la si!1 do4(la)

    %12
    mi'2. re4 do1
    R1*2
    mi1. re4(dod)

    %15
    re1. do!2
    si1 la2 dod~
    dod dod? re re~

    %18
    re4 re re1 mib4(re)
    dod la re1 do2
    si1 la\mbreak

    %21
    dod2. dod4 re2 re~
    re do! sib re~
    re4 re mi1 re2

    %24
    la1 la2 la~
    la la sib re~
    re4 re re1 do4(sib)

    %27
    la2 sol la1~
    la la
    r r2 do~

    %30
    do re1 mi2
    la,2. la4 sol2. sol4\mbreak
    la si do1 si2

    %33
    do do1 re2~
    re mi la,2. la4
    sol2. sol4 re'1

    %36
    mi la,
    si do
    do2 si do1

    %39
    sol r
    r2 sol1 la2~\mbreak
    la2 si mi,2. mi4

    %42
    re2. re4 mi fad sol2~
    sol fad sol sol~
    sol la1 si2

    %45
    mi,2. mi4 re2. re4
    la'1 si
    R1*4

    %49
    r1 r2 re~\mbreak
    re re sol,2. sol4
    dod la re1 do2

    %52
    si2. si4 la1
    r r2 do~
    do do sol2. sol4

    %55
    si1 do2 mib~
    mib re4 do si!2 re~
    re re1 do4(sib\mbreak

    %58
    la2) re, mi fa4 sol
    la2. la4 la1
    r r2 fad~

    %61
    fad sol la fad~
    fad mi re1~
    re2 re mi1~

    %64
    mi r\fermata
    la\breve\mbreak
    la

    %67
    la
    la~
    la

}

IIItestoIII = \lyricmode {

    Cru -- ci -- fi - - xus e -- tiam _  pro no -- bis e -- tiam _  e -- tiam _ pro no - bis.

    Cru -- ci -- fi - - xus e -- tiam _  e -- tiam _  pro no - - - - bis, e -- tiam _ e -- tiam _ e -- tiam _ pro no -- bis,

    e -- tiam _  e -- tiam _ pro no - - bis, sub Pon -- ti -- o  Pi -- la -- to,

    pas - - -  sus sub Pon -- ti -- o  Pi -- la -- to, pas -- sus sub Pon -- ti -- o  Pi -- la -- to, sub Pon -- ti -- o  Pi -- la -- to,

    pas - -  - sus sub Pon -- ti -- o  Pi -- la -- to, pas -- sus pas -- sus et se -- pul - - - - tus est, pas -- sus et se -- pul -- tus,

    pas - - sus pas -- sus et se -- pul - - - tus est, pas - sus  et se -- pul -- tus est, se -- pul -- tus est.

}

IIIbasson = \relative do{

    \autoBeamOff
    R1*4
    la'1. sol4(fad)
    sol1. fa!2

    %5
    mi1 re
    R1*2
    r1 r2 re~

    %8
    re re do2. do4
    sib1 la
    dod2. dod4 re1~\mbreak

    %11
    re2 re mi1~
    mi la,
    R1*2

    %14
    r1 fa'~
    fa2 fad sold la~
    la sold la sol~

    %17
    sol sol fa? fad~
    fad fad? sol1~
    sol2 sol4 (fa!) mi1~

    %20
    mi la,2 la'~\mbreak
    la sol! fa1
    fad2. fad4 sol1~

    %23
    sol2 sol la1~
    la re,2 do!~
    do do sib si~

    %26
    si si do1~
    do2 do4(sib) la1~
    la re2 fa~

    %29
    fa sol1 la2
    re,2. re4 do2. do4
    re mi fa1 mi2\mbreak

    %32
    fa1 sol
    la4 si do1 si2
    do1 fa,

    %35
    sol\breve
    do,2 mi1 fad2~
    fad sol sol fad

    %38
    sol1 do,
    r2 do1 re2~
    re mi la,2. la4\mbreak

    %41
    sol2. sol4 la si do2~
    do si do1
    re2. re4 mi fad sol2~

    %44
    sol fad sol1
    do, re~
    re sol,

    %47
    R1*2
    r1 r2 sol'~
    sol sol re2. re4\mbreak

    %50
    fad1 sol2 sol~
    sol fa! mi1~
    mi2 mi la, la'~

    %53
    la si do1
    do, sol'
    r1 r2 do~

    %56
    do do sol2. sol4
    si!1 do2 do,~\mbreak
    do sib la1~

    %59
    la2 la re1
    r1 r2 re~
    re mi fad re~

    %62
    re do si!1~
    si2 si do1~
    do r\fermata

    %65
    re\breve\mbreak
    la'
    la,

    %68
    re~
    re

}

IIItestoIV = \lyricmode {

    Cru -- ci -- fi - - xus e -- tiam _  pro no -- bis e -- tiam _  pro no -- bis.

    Cru -- ci -- fi - - xus e -- tiam _  e -- tiam _  pro no -- bis, e -- tiam _ e -- tiam _  pro no -- bis,

    e -- tiam _  e -- tiam _ pro no -- bis, sub Pon -- ti -- o  Pi -- la -- to, pas - - -  sus pas - - - - - - - sus

    sub Pon -- ti -- o  Pi -- la -- to, sub Pon -- ti -- o  Pi -- la -- to, pas - - sus sub Pon -- ti -- o  Pi -- la - - to,

    pas -- sus  pas -- sus et se -- pul -- tus et se -- pul -- tus est, pas - - - sus pas -- sus et se -- pul -- tus,

    et se -- pul -- tus est, pas - sus  et se -- pul -- tus est, se -- pul -- tus est.

}

forma = {

    \key do\major
    \time 2/2
    \tempo 1 = 60
    \set Score.measureLength = #(ly:make-moment 2 1)
    s1*128
    s\breve*5
    \bar"|."

}

IIIsoprano = {
    \new Voice = "cruci1"
    <<\IIIsopranon \forma>>
}

IIIalto = {
    \new Voice = "cruci2"
    <<\IIIalton \forma>>
}

IIItenore = {
    \new Voice = "cruci3"
    <<\IIItenoren \forma>>
}

IIIbasso = {
    \new Voice = "cruci4"
    <<\IIIbasson \forma>>
}



IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}

IVvlIn = \relative do'' {

    re1 mi2 fad
    sol4 sol, sol'1 fad2

    %3
    mi1 re4 fad fad mi8( re)
    la'4 la, la'2. sol4 sol la8 (sol)
    fad2. si4 sold mi la2~

    %6
    la sold la4 la, la'2
    r4 fad fad mi8 (re)  sol4 fad8 (mi) la2
    la4 si sol mi la2. re,4

    %9
    sol1 fad4 la la sol8 (fad)\mbreak
    mi2. la4 si,1\prallup
    la4 la' fad re si mi mi,2

    %12
    r4 re'' si sold mi la la,2
    r4 fad' fad mi8 (re) la'4 la, la'2~
    la fad1 si2~

    %15
    si sold1 dod2~
    dod la1 re2~
    re dod si1\prallup

    %18
    la4 la, mi'2. la,4 re2~
    re dod4(re) si1\prallup\mbreak
    la4 mi' la2. re,4 sol!2~

    %21
    sol4 fad fad mi8 (re) sol4 fad8 mi la4 la,
    re si sol mi la2. fad'4
    sol,1\prallup fad4 re' re,2

    %24
    r4 si' si la8(sol) re'4 re, re'2~
    re si1 mi2~
    mi dod1 fad2~

    %27
    fad re1 sol2~
    sol fad mi1\prallup\mbreak
    re4 re, la'2. re,4 sol2~

    %30
    sol fad4(sol) mi1\prallup
    re re'
    mi2 fad sol4 sol, sol'2~

    %33
    sol fad mi1\prallup
    re4 sol mi2. fad8(mi) re4 fad
    sold mi la2 r4 re, re dod8 (si)

    %36
    dod2. la'4 la, fad' fad mi8(re)
    sol4 fad8(mi) la4 la, re si' si la8 sol\mbreak
    la4 la re1 dod2~

    %39
    dod si1 lad2
    si4 si, fad'2. si,4 mi2~
    mi re dod1\prallup

    %42
    si r4 dod dod si8(la)
    mi'4 mi, mi'1 re2
    la1 si2 dod

    %45
    re4 re, re'1 dod2\mbreak
    si1\prallup la
    sold\prallup fad2 r4 fad

    %48
    re'2. re4 mid, dod fad2~
    fad mid fad4 la re2~
    re do2. si4 si la8(sol)

    %51
    do4 si8 la re4 re, sol1
    la' si2 dod
    re4 re, re'2~\mbreak re dod

    %54
    si1 la2. la4
    sold mi la1 sol!2~
    sol fad mi1

    %57
    re4 la' la sol8(fad) mi4 la la,2
    r4 fad' fad mi8(re) la'4 la, la'2~
    la fad1 re2~\mbreak

    %60
    re si1 sol2~
    sol fad mi1\prallup
    re\breve\fermata

}


IVvlIIn = \relative do'' {

    R1*6
    la1 si2 dod
    re4 re, re'1 dod2

    %6
    si1\prallup la4 dod dod si8(la)
    re4 re, re'2. do4 do re8(do)
    si2. mi4 dod? la re2~

    %9
    re dod re4 re, re'2~\mbreak
    re4 dod dod si8 la re4 dod8(si) mi2~
    mi4 fad re si mi2. la,4

    %12
    re1 dod2 r4 la'
    la,2. la4 dod mi mi re8(dod)
    fad2. re,4 re'1

    %15
    si mi
    dod fad2. si4
    sold mi la1 sold2

    %18
    la r4 la, fad'2. fad4
    sold,2 la la2. sold4\mbreak
    la dod dod si8 la re4 dod8(si) mi4 mi,

    %21
    la la re2. sol,4 do2~
    do4 re si sol mi mi' la,2
    r4 sol' mi dod la2 r4 re

    %24
    re,2. re'4 re, la' la sol8 fad
    si2. sol,4 sol'1
    mi la

    %27
    fad1 si2. mi4
    dod la re1 dod2\mbreak
    re r4 re, si'2. si4

    %30
    dod,2 re re2. dod4
    re1 r
    la' si2 dod

    %33
    re4 re, re'1 dod2
    si1\prallup la4 re si2~
    si4 dod8 si la4 dod re fad fad mi8(re)

    %36
    mi4 la la,2 re1
    mi2 fad sol4 sol, sol'2~\mbreak
    sol fad mi1

    %39
    re dod\prallup
    si2 r4 si sol'2. sol4
    lad, fad si1 lad2

    %42
    si4 fad' fad mi8(re) la'?4 la, la'2~
    la sol fad1
    mi4 dod dod si8(la) re4 dod8 si mi4 mi,

    %45
    la  fad' fad mi8 re mi4 mi la2~\mbreak
    la sold1 fad2~
    fad mid fad4 fad, dod'2~

    %48
    dod4 fad, si1 la2
    sold1 fad4 fad' fad mi8(re)
    sol4 fad8(mi) la4 la, re1

    %51
    mi2 fad sol4 sol, sol'2~
    sol fad mi1\prallup
    re4 fad fad mi8 re\mbreak la'4 la, fad'2~

    %54
    fad mi la,1
    si2 dod re4 re, re'2
    dod4 la re1 dod2

    %57
    re r4 la' la, dod dod si8(la)
    re4 re, re'2 r4 mi mi re8(dod)
    fad2 r4 re, re'1\mbreak

    %60
    si1 sol2 si
    dod, re1 dod2
    re\breve\fermata

}


IVvlan = \relative do' {

    R1*12
    re1 mi2 fad
    sol4 sol, sol'1 fad2

    %9
    mi1 re4 fad fad mi8 re\mbreak
    la'4 la, la'2. sol!4 sol  la8 sol
    fad2. si4 sold mi la2~

    %12
    la sold la4 la, la'2
    r4 re re,2 r4 la' la,2~
    la4 la re1 si2~

    %15
    si mi1 dod2~
    dod fad1 si,2~
    si la fad' mi4(re)

    %18
    dod2 la1 fad'2
    si, la si mi\mbreak
    dod r4 la' si2 r4 dod,

    %21
    re la' la sol8(fad) mi1
    re2. mi4 dod la re2~
    re dod re r4 fad

    %24
    si, sol' sol fad8(mi) fad4 re' re,2~
    re4 re sol1 mi2~
    mi la1 fad2~

    %27
    fad si1 mi,2~
    mi re si' la4 sol\mbreak
    fad2 re1 si'2

    %30
    mi, re la2. sol4
    fad1 r
    R1*2

    %33
    re'1 mi2 fad
    sol4 sol, sol'1 fad2
    mi1 re4 re' re,2

    %36
    r4 mi mi re8(dod) fad4 la la sol8(fad)
    si2 la r4 re re dod8 si\mbreak
    mi2 r4 re si sol la2~

    %39
    la4 fad sol2. sol4 fad mi
    re2. re4 si2. si'4
    dod,2 si sol' fad4 mi

    %42
    re re re'2 r4 la la,2
    r4 dod dod si8 la la'4 la, la'2
    r4 mi mi re8(dod) fad2 mi

    %45
    re4 la' la sold8(fad) si2 r4 la\mbreak
    fad4 re mi2. dod4 re2~
    re4 re dod si la la' la sold8 fad

    %48
    si,4 re re dod8(si) dod2 re
    si dod la4 la' la sol8 fad
    si,2 la r4 re re dod8(si)

    %51
    la4 mi' re1 dod2
    re1 r
    re\mbreak mi2 fad

    %54
    sol4 sol, sol'1 fad2
    mi1 re2. si4
    mi2 re4(dod) si si' si la8(sol)

    %57
    re'4 re, re'2 dod r4 mi
    fad, re re dod8(si) la4 la' la,2
    r4 re re'1 si2~\mbreak

    %60
    si sol1 mi2~
    mi re mi la,
    fad\breve\fermata

}

IVbcn = \relative do {

    R1*18\mbreak
    la'1 si2 dod
    re4 re, re'1 dod2

    %12
    si1 la4 dod dod si8(la)
    re4 re, re'2 r4 dod, dod si8 la
    re1 si

    %15
    mi dod
    fad re
    mi2 fad re mi

    %18
    la,4 dod dod si8 la re4 fad fad mi8 re
    mi2 la, mi' mi,\mbreak
    la1 r

    %21
    re mi2 fad
    sol4 sol, sol'1 fad2
    mi1 re4 fad fad mi8(re)

    %24
    sol4 sol, sol'2 r4 fad fad mi8(re)
    sol1 mi

    %26
    la fad
    si sol
    la2 si sol la\mbreak

    %29
    mi4 fad fad mi8(re) sol4 si si la8(sol)
    la2 re, la' la,
    re1 r

    %32
    R1*2
    r1 la'
    si2 dod re4 re, re'2~

    %35
    re dod si1
    la4 dod dod si8 la re4 re, re'2~
    re4 do do re8 do si2. mi4\mbreak

    %38
    dod4 la r si sol mi la sol
    fad re r sol mi dod fad fad,
    si re re dod8(si) mi4 sol sol fad8(mi)

    %41
    fad2 sol mi fad
    si,4 re re dod8(si) la2 r4 la'
    la,2 r4 la' re, fad fad mi8(re)

    %44
    la'4 la, la'2. sol4 sol la8(sol)
    fad2. si4 sold mi r fad\mbreak
    re si mi re dod la r re

    %47
    si sold dod dod, fad1
    R1*2
    r1 re'

    %50
    mi2 fad sol4 sol, sol'2~
    sol fad mi1
    re4 re fad mi8(re) sol4 fad8(mi) la4 la,

    %53
    re1\mbreak la
    si2 dod re4 re, re'2~
    re dod si1

    %56
    la2 si sol la
    re4 fad fad mi8(re) la'4 la, la'2
    r4 re re,2 r4 dod' dod si8(la)

    %59
    re1 si\mbreak
    sol mi
    la2 re, la1

    %62
    re\breve\fermata

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown


}

forma = {

    \key re\major
    \time 2/2
    \tempo 1 = 60
    \set Score.measureLength = #(ly:make-moment 2 1)
    s\breve*60
    \once \override Score.RehearsalMark.extra-offset = #'(+5 . 0)\mark\markup\italic "Adagio"
    s\breve*2
    \bar"|."

}


IVvlI = {
    \IVglobal
    <<\IVvlIn \forma>>
}


IVvlII = {
    \IVglobal
    <<\IVvlIIn \forma>>
}


IVvla = {
    \IVglobal
    \clef alto
    <<\IVvlan \forma>>
}


IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}


%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


Vglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}

VvlIn = \relative do'' {

    la'1
    re,
    mi\prallup

    %4
    fad2 re
    sol mi
    la fad

    %7
    sol4 re sol2~
    sol4 fad sol mi
    fad mi fad re

    %10
    mi1\prallup
    re
    r4 mi dod si

    %13
    la fad' re dod
    si2 mi~
    mi re~

    %16
    re dod
    si1
    dod2 re\mbreak

    %19
    si re~
    re dod
    re4 la si do

    %22
    do?(si) dod(re)
    dod mi fad sol
    fad mi fad re

    %25
    sol fad sol mi
    la2 sol4(fad)
    mi2 la~

    %28
    la sold
    la4 mi re dod
    si dod re si

    %31
    la1
    r2 mi'~
    mi4 mi re dod

    %34
    re1~
    re4 dod re si
    dod1\prallup

    %37
    re2 fad
    mi mi,
    r4 la si do

    %40
    do(si) dod(re)
    dod2 la'
    si4(la) sol(fad)

    %43
    sol2 sol\prallup
    la4(sol)fad(mi)
    fad la, fad sol

    %46
    la2 la,
    R1*2
    la''1

    %50
    re,
    mi\prallup\mbreak
    fad2 fad

    %53
    sol sold
    la lad
    si1

    %56
    dod2 dod,
    fad4(mi) re(dod)
    re2 red

    %59
    mi4(re?) dod(si)
    dod la si dod
    re2 dod4 si

    %62
    la2 re
    si si'~
    si sol

    %65
    la, la' ~
    la re,
    sol, sol'~

    %68
    sol4 mi fad re
    mi2 la~
    la4 fad sol mi\mbreak

    %71
    fad2 si~
    si4 sold la fad
    sold2 dod

    %74
    fad,1
    sold\prallup
    la

    %77
    si\prallup
    dod4 mi, fad sol
    sol(fad) sold(la)

    %80
    sold2 mi
    fad4(mi) re(dod)
    re2 re\prallup

    %83
    mi4(re) dod(si)
    dod2 dod\prallup
    re1

    %86
    mi~
    mi\prallup
    re

    %89
    r4 mi fad sol
    sol fad sold la
    sold?2 la~\mbreak

    %92
    la sold
    la1
    r2 la

    %95
    si4(la) sol?(fad)
    sol2 sol\prallup
    la4(sol) fad(mi)

    %98
    fad mi fad re
    mi re mi dod
    re si dod re

    %101
    mi2 la~
    la re,~
    re mi~

    %104
    mi fad
    sol4 mi la sol
    fad(re) sol(fad)

    %107
    mi1\prallup
    re
    r4 re mi fad

    %110
    sol(fad) sold la
    sold2 la~\mbreak
    la sol!~

    %113
    sol4 fad sol mi
    fad2 re~
    re dod\prallup

    %116
    re4(la) sol(fad)
    mi2 dod
    re4 la' si do

    %119
    do?(si) dod(re)
    dod re si dod
    re2 fad

    %122
    sol(sold)
    la fad\prallup
    sol4 re sol2~

    %125
    sol4 mi fad re
    si' la si sol
    la sol la fad

    %128
    sol fad sol la
    fad si si, dod
    red mi fad sol

    %131
    fad si si, dod\mbreak
    red mi fad sol
    fad2 si~

    %134
    si4 la sold fad
    mi(re) dod(si)
    dod(si) la(sol)

    %137
    fad(mi) fad (mi)
    re2 re'
    la si

    %140
    dod4 (si) la(sol)
    fad2 re'~
    re4 si mi re

    %143
    dod2 mi
    la, la'
    si4(la) sol(fad)

    %146
    mi re dod si
    la'(sol) fad(mi)
    re dod si la

    %149
    sol'(fad) mi(re)
    dod2 mi\mbreak
    la, la'~

    %152
    la4 sol la fad
    sol1~
    sol4 fad sol mi

    %155
    fad mi fad re
    mi re mi dod
    re dod re si

    %158
    dod2 la'
    la, si
    dod4 la re si

    %161
    mi2 re
    dod si
    la dod

    %164
    re la~
    la la'
    re,1

    %167
    mi2 fad
    sol mi
    la4 fad sol la

    %170
    si2 sol~
    sol fad
    mi fad

    %173
    re1\mbreak
    do\prallup
    si2 si

    %176
    dod re
    mi fad\prallup
    sol4 mi fad sol

    %179
    mi la la, si
    dod(re) mi(fad)
    mi la la, si

    %182
    dod(re) mi(fad)
    sol2 fad
    mi1\prallup

    %185
    re2 fad
    sol1\prallup
    la\prallup

    %188
    si
    fad\prallup
    sol\prallup

    %191
    la\prallup
    si2 si
    mi, fad\mbreak

    %194
    mi1
    re4 la fad la
    re2 mi

    %197
    <fad la, re,> r\fermata

}


VvlIIn = \relative do'' {

    R1*3
    r4 re si la
    sol mi' dod si

    %6
    la2 re
    sol, si
    la la~

    %9
    la re~
    re dod
    si1

    %12
    la2 mi'
    fad1
    sold

    %15
    la\prallup
    si2 mi,
    R1

    %18
    la\mbreak
    re,
    mi

    %21
    fad2 re
    sol(sold)
    la4 dod, re mi

    %24
    re la re2~
    re dod4(si)
    la2 si

    %27
    dod red
    mi1
    r2 la~

    %30
    la sold
    la4 la sol! fad
    mi fad sol mi

    %33
    fad2 fad~
    fad4 mi fad re
    mi2 mi,\mbreak

    %36
    r4 mi' fad sol
    sol(fad) sold(la)
    sold mi fad sold

    %39
    la2 re,
    si' sold
    dod la

    %42
    R1*2
    mi1
    la,2 re

    %46
    fad4(mi) re(dod)
    re2 re
    mi4(re) dod(si)

    %49
    dod(si) la(sol)
    fad2 re'~
    re dod\prallup

    %52
    re4 la si do
    do?(si) dod(re)
    re(dod) re(mi)

    %55
    re si fad' si
    lad2 fad,
    r fad'

    %58
    si4(la?) sol (fad)
    sol2 sold
    la4(sol!) fad(mi)

    %61
    fad2 sol
    la4 fad sol la
    si(la) sol(fad)

    %64
    mi re dod si
    la' sol fad mi
    re dod si la

    %67
    sol'(fad) mi(re)
    dod2 re~
    re4 si dod la

    %70
    si2 mi~\mbreak
    mi4 dod re si
    dod2 fad

    %73
    mid fad
    re4 si fad'2~
    fad mid

    %76
    r4 fad re dod
    si si' mi,? re
    dod mi re dod

    %79
    re2 fad
    mi sold,
    la1\prallup

    %82
    si\prallup
    si\prallup
    la2 la'

    %85
    si4 la sol fad
    sol2 sol\prallup
    la4 sol fad mi

    %88
    fad la, re fad
    mi la, mi'2~
    mi re~

    %91  OOKK
    re dod\mbreak
    si mi
    fad4(mi) re(dod)

    %94
    re2 re
    si la
    sol mi'~

    %97
    mi4 la, si dod
    re dod re si
    dod si la sol

    %100
    fad2 si
    la dod
    re la

    %103
    si1\prallup
    la
    R

    %106
    re
    la
    si\prallup

    %109
    dod2 la
    re si
    mi4 mi re dod\mbreak

    %112
    si(dod) re(si)
    dod la si dod
    re la sol fad

    %115
    mi1\prallup
    re
    R

    %118
    la''
    re,
    mi\prallup

    %121
    fad2 re~
    re mi~
    mi re~

    %124
    re dod4 si
    la2 la'~
    la4 fad sol2~

    %127
    sol4 mi fad2~
    fad4 red mi fad
    red2. si'4

    %130
    si, dod red mi
    red2. si'4\mbreak
    si, dod red mi

    %133
    red si dod red
    mi fad sold la
    si mi, fad sold

    %136
    la2 dod
    re4 dod re dod
    re la sol fad

    %139
    mi(fad) mi(re)
    mi2 la
    re, mi4(fad)

    %142
    mi2 mi,
    mi' dod
    la' re,

    %145
    si si'~
    si mi,
    la, la'~

    %148
    la re,
    sol, sol'~
    sol4 fad sol mi\mbreak

    %151
    fad2 re
    si'1~
    si4 la si sol

    %154
    la1~
    la4 sol la fad
    sol fad sol mi

    %157
    fad mi fad re
    mi2 la,
    r la'

    %160
    la, si
    dod4 la re si
    mi2 re

    %163
    dod4 re mi la
    sol fad mi re
    dod si la sol

    %166
    fad2 re'
    la1
    si2 dod

    %169
    re1~
    re2 si'
    mi, re~

    %172
    re dod~
    dod si\parenthesize ~\mbreak
    si la~

    %175
    la sol~
    sol4 mi fad re'
    dod2 re\prallup

    %178
    mi4 dod re mi
    dod2. la'4
    la,(si) dod(re)

    %181
    dod(re) mi la
    la,(si)dod(re)
    mi2 re~

    %184
    re dod
    re4(do) si la
    si(do si) sol'

    %187
    fad mi fad re
    sol(re si) sol'
    re(do si la)

    %190
    si(dod si) sol'
    fad mi fad re
    sol(fad) mi(re)

    %193
    dod2 re~\mbreak
    re dod
    re r

    %196
    r dod
    re r\fermata

}


Vvlan = \relative do' {

    r2 la'
    si4(la) sol(fad)
    sol2 la

    %4
    re,1
    mi
    fad4 la si do

    %7
    do si dod re
    dod re si dod
    re2 la

    %10
    la, la'~
    la sold
    la dod,

    %13
    re1
    r4 mi dod si
    la fad' re dod

    %16
    si2 la
    re mi~
    mi la\mbreak

    %19
    sol la
    sol1
    fad

    %22
    re2 mi~
    mi dod
    la la'

    %25
    R1
    re,
    la

    %28
    si
    dod2 la
    re si

    %31
    mi re
    sol la
    la,1~

    %34
    la~
    la2 la'~\mbreak
    la la,~

    %37
    la si~
    si dod~
    dod re~

    %40
    re mi~
    mi re
    r re

    %43
    mi4(re) dod(si)
    dod2 dod
    re1

    %46
    dod
    si
    si\prallup

    %49
    la2 dod
    re la
    r la'~\mbreak

    %52
    la re,~
    re mi~
    mi fad~

    %55
    fad re
    fad1
    lad

    %58
    si,
    mi
    la,2 la'~

    %61
    la sol
    fad re~
    re si'

    %64
    mi,1
    dod2 la'
    re,1

    %67
    si2 sol'
    mi re
    la1

    %70
    mi'\mbreak
    si
    fad'

    %73
    dod2 dod
    re dod
    re dod~

    %76
    dod la
    mi' mi~
    mi4 dod re mi

    %79
    re2 dod
    si1\prallup
    dod2 mi

    %82
    fad1
    mi
    mi\prallup

    %85
    fad2 la
    si1
    la~

    %88
    la~
    la2 la~
    la fad

    %91
    mi1
    mi1
    dod2 la'

    %94
    si4(la) sol(fad)
    sol2 re
    mi4(re) dod(si)

    %97
    dod2 la'~
    la la~
    la la

    %10
    re, sol~
    sol4 fad sol mi
    fad la, si do

    %103
    do?(si) dod(re)
    dod2 re~
    re dod

    %106
    re1
    r2 la'~
    la sold

    %109
    la1
    R1*3
    la1

    %114
    re,
    mi
    fad2 re

    %117
    sol mi
    la1
    sol2 la

    %120
    sol sol,
    la4 la' si do
    do?(si) dod(re)

    %123
    dod2 la
    sol1
    mi2\prallup re~

    %126
    re re~
    re fad
    si, si~

    %129
    si si~
    si si
    si1~\mbreak

    %132
    si~
    si2 fad'
    sold4 la si la

    %135
    sold2 mi~
    mi4 re dod si
    la2 r

    %138
    la'1~
    la2 re,
    la dod

    %141
    re la
    si1\prallup
    la2~la

    %144
    la'1
    re,2 si'
    mi,1

    %147
    dod2 la'
    re,1
    si2 sol'

    %150
    mi la,\mbreak
    R1
    re~

    %153
    re~
    re~
    re

    %156
    dod2 la'
    la,1~
    la4 si dod si

    %159
    dod(re) mi(re)
    mi2 la
    la, si

    %162
    dod4 la re si
    mi2 la,~
    la4 la' sol fad

    %165
    mi(re) dod(mi)
    re2 sol
    mi la

    %168
    re, mi
    fad4 la, si do
    do?(si) dod(re)

    %171
    dod2 la'~
    la fad
    fad1\mbreak

    %174
    r2 la
    re, mi~
    mi la,~

    %177
    la la'~
    la la,~
    la4 si dod re

    %180
    mi(re) dod(re)
    mi(re) dod(re)
    mi2 la

    %183
    dod, re
    la la'
    fad la

    %186
    re,4 (mi re) si
    re mi re fad
    dod sol' re si'

    %189
    la2 re,~
    re4 mi re mi
    re(mi re) fad

    %192
    re2 sol~
    sol fad4 sol\mbreak
    la2 la,

    %195
    la r
    r la'
    la r\fermata

}

Vbcn = \relative do {

    R1*8
    re1
    la

    %11
    si
    dod2 la
    re si

    %14
    mi1
    fad
    sold2 la~

    %17
    la sol!~
    sol fad\mbreak
    sol fad

    %20
    mi1
    re4 re' si la
    sol mi' dod si

    %23
    la2 la
    re,1
    mi

    %26
    fad2 sol~
    sol fad
    mi1

    %29
    la,
    si
    dod2 re~

    %32
    re dod
    re1
    re,

    %35
    la'\mbreak
    la'
    re,

    %38
    mi
    fad2 re
    sol mi

    %41
    la fad
    sol r
    R1*3

    %46
    la1~
    la
    sold

    %49
    r2 la
    si4 la sol? fad
    sol2 la\mbreak

    %52
    re, re'
    sol, mi
    la fad

    %55
    si si,
    fad'1~
    fad

    %58
    R1*2
    r2 la
    re, mi

    %62
    fad4 re mi fad
    sol fad mi re
    dod re mi dod

    %65
    fad mi re dod
    si dod re si
    mi re dod si

    %68
    la2 re
    la'1
    mi\mbreak

    %71
    si'
    fad
    dod'2 la

    %74
    si la
    si dod
    fad,1

    %77
    sold
    la
    re,

    %80
    mi
    la~
    la

    %83
    sold
    la
    re~

    %86
    re
    dod
    re2 re,

    %89
    dod la
    re1
    mi2 la,\mbreak

    %92
    mi' mi,
    la \clef tenor \key re\major la''2
    si4(la) sol(fad)

    %95
    sol2 re
    mi4(re) dod(si)
    dod2 la'

    %98
    \clef bass \key re\major re,1
    la
    si

    %101
    dod2 la
    re fad,
    sol sol~

    %104
    sol fad
    mi1
    re2 re

    %107
    dod1
    si
    la

    %110
    R1*3
    \clef tenor \key re\major la''1
    re,

    %115
    \clef bass \key re\major la
    re,
    mi

    %118
    fad2 fad
    sol fad
    mi1

    %121
    re2 re
    sol, mi'
    la,4 la' si do

    %124
    do?(si) dod(re)
    dod2 re
    sol, sol,

    %127
    re' red
    mi mi,
    si'1~

    %130
    si~
    si~\mbreak
    si

    %133
    si'
    mi,~
    mi

    %136
    la
    re,2 mi
    fad re

    %139
    dod si
    la la'
    si4 la sol fad

    %142
    sol mi fad sol
    la sol fad mi
    fad re mi fad

    %145
    sol fad mi re
    dod re mi dod
    fad mi re dod

    %148
    si dod re si
    mi re dod si
    la2 dod\mbreak

    %151
    re fad
    sol1
    sol,

    %154
    re'~
    re
    \repeat unfold 7 {la1~}

    %163
    la2 la'
    re, re'
    la1

    %166
    si
    dod2 re
    sol,1

    %169
    fad
    sol
    fad2 re'

    %172
    la (lad)
    si1\mbreak
    fad

    %175
    sol
    la
    la,~

    %178
    \repeat unfold 4 {la1~}
    la
    la'2 re,

    %184
    la'1
    re,~
    \repeat unfold 6 {re~}

    %192
    re2 re
    la re\mbreak
    la1

    %195
    re2 r
    r la
    re r\fermata

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown


}

forma = {

    \key re\major
    \time 2/2
    \tempo 1 = 60
    s1*197
    \bar"|."

}


VvlI = {
    \Vglobal
    <<\VvlIn \forma>>
}


VvlII = {
    \Vglobal
    <<\VvlIIn \forma>>
}


Vvla = {
    \Vglobal
    \clef alto
    <<\Vvlan \forma>>
}


Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma \Vbfn>>
}


%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}
#(set-global-staff-size 17)


global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}

\pointAndClickOff

\paper  {

    systems-per-page = 5
    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = 5

    }

    \header {
        title = \markup\smaller{Fuga con Cinque Soggetti }
        composer = \markup \center-column{"F. M. Veracini (1690 - 1768)""  "}

    }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino""Primo]"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino""Secondo]"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc "
                \Ibc
            >>
        >>

        \layout {

            indent = 1.6\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

        systems-per-page = 4

    }

    \header {
        title = \markup\smaller {Ricercare con Cinque Soggetti }
        composer = \markup \center-column{"F. M. Veracini (1690 - 1768)"}

    }

    \markup\huge \bold\column { "Sistema Primo""  "}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 2/2 r1 r r r dod'^\markup\center-align "[Soprano]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \IIsoprano \global
                \new Lyrics \lyricsto "cruci1" \IItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 2/2 r1 r r r r r r r sold'^\markup\center-align "[Alto]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIalto \global
                \new Lyrics \lyricsto "cruci2" \IItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key do\major \time 2/2 r1 r r r r r r r2 fa' ^\markup\center-align "[Tenore]"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \IItenore \global
                \new Lyrics \lyricsto "cruci3" \IItestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef bass \key do\major \time 2/2 dod'1 ^\markup\center-align "[Basso]"}
                \clef bass
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "bas"
                \IIbasso \global
                \new Lyrics \lyricsto "cruci4" \IItestoIV
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

    \pageBreak

    \markup\huge \bold\column { "Un altro esempio del Ricercare - Sistema Secondo""  "}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 2/2 r1 sib'~sib'2^\markup\center-align "[Soprano]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \IIIsoprano \global
                \new Lyrics \lyricsto "cruci1" \IIItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 2/2 la'1~la'2^\markup\center-align "[Alto]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIIalto \global
                \new Lyrics \lyricsto "cruci2" \IIItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key do\major \time 2/2 r1 r r r r2 sib ^\markup\center-align "[Tenore]"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \IIItenore \global
                \new Lyrics \lyricsto "cruci3" \IIItestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef bass \key do\major \time 2/2 r1 r r r la ^\markup\center-align "[Basso]"}
                \clef bass
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "bas"
                \IIIbasso \global
                \new Lyrics \lyricsto "cruci4" \IIItestoIV
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

        systems-per-page = 5

    }

    \header {
        title = \markup\smaller{Fuga con un Soggetto Solo }
        composer = \markup \center-column{"A. Corelli (1653 - 1713)""  "}

    }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino""Primo]"}
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino""Secondo]"}
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc "
                \IVbc
            >>
        >>

        \layout {

            indent = 1.6\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

        systems-per-page = 5

    }

    \header {
        title = \markup\smaller{[Fuga in Re maggiore] }
        composer = \markup \center-column{"F. Geminiani (1687 - 1762)""  "}

    }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino""Primo]"}
                \set Staff.shortInstrumentName = "vl1"
                \VvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino""Secondo]"}
                \set Staff.shortInstrumentName = "vl2"
                \VvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc "
                \Vbc
            >>
        >>

        \layout {

            indent = 1.6\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

