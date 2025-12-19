\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = "up"

giu = \change Staff = "down"

tasto = _\markup\italic"Tasto Solo"

tr = \trill

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

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

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


Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

Iobn = \relative do'' {

    sol'4-! re-!
    si8 la16 si sol4
    r r8 re'

    %4
    si la16 si sol4
    r r8 sol'
    fad[re re sol]

    %7
    fad mi16 fad re8 re
    si la16 sol re'8 re
    si la16 sol re'8 re

    %10
    si la16 sol fa'!8 fa
    mi re16 do do'8 do
    si la16 sol fad8 sol\mbreak

    %13
    la16 sol fad mi re8 re
    si la16 sol sol'8 sol
    fad mi16 re la'8 sol16 fad

    %16
    mi8 re16 mi la,8 dod
    re4 la'-!
    fad8 mi16 fad re8 la

    %19
    fad mi16 fad \once\stemUp re8 la''
    fad mi16 fad re8 la
    fad mi16 fad re8 \once\stemDown fad'

    %22
    mi dod16 re mi8 fad
    sol re16 mi la,8 la'
    fad mi16 re la8 la\mbreak

    %25
    fad mi16 re do'!8 do
    si la16 sol fa'!8 fa
    mi re16 do sib'8 sib

    %28
    sib la16 sold la8 mi
    re do16 re si8 sold'
    la4-! mi-!
    do8 si16 do la4

    %32
    r r8 mi'
    dod si16 la sol'8 sol
    fad mi16 fad re8 la

    %35
    fad mi16 fad \once\stemUp re8 la''
    fad mi16 re sol8 la\mbreak
    si8 la16 si sol8 re

    %38
    si la16 si sol8 re
    sol4~sol16 la si do
    re2\tr~

    %41
    re~
    re~
    re8 do16 re si dod re mi

    %44
    fad2\tr~
    fad~
    fad~

    %47
    fad4 sol
    fad2\tr\mbreak
    mi\tr~

    %50
    mi~
    mi4 fad
    mi2\tr
    re4-! la'-!

    %54
    fad8 mi16 fad re8 la
    fad mi16 fad \once\stemUp re8 la''
    fad mi16 re do'8 do

    %57
    si la16 si sol8 re
    si la16 si sol8 re
    sol4 r8 re'

    %60
    si la16 sol fa'!8 fa\mbreak
    mi re16 do sol'8 sol
    mi re16 do sol'8 sol

    %63
    mi re16 do sib'8 sib
    la sol16 fa mib8 mib
    mib re16 dod re mi? fa sol

    %66
    la8 sol16 fa mi re mi dod
    re8 mi16 fad sol8 la
    si la16 sol fad mi re fad

    %69
    sol4-! re-!
    si8 la16 si sol8 re
    sol4 r8 re'

    %72
    si la16 sol re'8 re\mbreak
    si la16 sol fa'!8 fa
    fa mi16 red mi fad sol la

    %75
    si8 la16 sol fad mi fad red
    mi8 fad16 sold la sold la si
    do8 si16 la sold fad mi sold

    %78
    la4 mi~
    mi2~
    mi16 re do si do re mi fa

    %81
    sol2\tr ~
    sol8 fad16 mi re4~
    re2\mbreak

    %84
    sol\tr
    fad\tr
    mi\tr

    %87
    re~
    re~
    re~

    %90
    re~
    re~
    re16 do si la si8 sol'16 fad

    %93
    mi fad sol la re,8 fad
    sol4 re-!

    %95
    si8 la16 si sol8 re\mbreak
    sol4 r8 re'
    si la16 sol re'8 re

    %98
    si la16 sol sol'8 sol
    fad mi16 re do'8 do
    si16 la si sol la sol la fad
    sol4 r8 re,

    %102
    sol4-! sol-!
    sol sol-!
    sol-! sol-!

    %105
    sol8[mi' re fad]
    sol8. sol16 fad8. fad16
    sol4 r\fermata

}

IvlIn =  \relative do'' {

    sol'4-! re-!
    si8 la16 si sol8 re
    si la16 si sol8 \once\stemDown re''

    %4
    si8 la16 si sol8 re
    si la16 si sol8 \once\stemDown sol''
    fad[re re sol]

    %7
    fad mi16 fad re8 re
    si la16 sol re'8 re
    si la16 sol re'8 re

    %10
    si la16 sol fa'!8 fa
    mi re16 do do'8 do
    si la16 sol fad8 sol\mbreak

    %13
    la16 sol fad mi re8 re
    si la16 sol sol'8 sol
    fad mi16 re la'8 sol16 fad

    %16
    mi8 re16 mi \once\stemUp la,8 do'
    re4 la-!
    fad8 mi16 fad re8 la

    %19
    fad mi16 fad \once\stemUp re8 la''
    fad mi16 fad re8 la
    fad mi16 fad re8 \once\stemDown re''

    %22
    dod[la la re]
    dod si16 dod la8 la
    fad mi16 re la8 la\mbreak

    %25
    fad mi16 re do'!8 do
    si la16 sol fa'!8 fa
    mi re16 do sib'8 sib

    %28
    sib la16 sold la8 mi
    re do16 re sold,?8 sold'
    la4-! mi-!
    do8 si16 do la8 mi

    %32
    do si16 do la8 \once\stemDown mi''
    dod si16 la sol'8 sol
    fad mi16 fad re8 la

    %35
    fad mi16 fad \once\stemUp re8 la''
    fad mi16 re do'8 do\mbreak
    si8 la16 si sol8 re

    %38
    si la16 si sol8 re
    si la16 si sol8 sol'
    la16 sol la si la re do re

    %41
    si re do re si re do re
    la re do re la re do re
    si8 la16 si sol8 si

    %44
    dod16 si dod re dod fad mi fad
    re fad mi fad re fad mi fad
    dod fad mi fad dod fad mi fad

    %47
    red4 mi~
    mi re!~\mbreak
    re16 mi re mi do mi re mi

    %50
    si mi re mi si mi re mi
    dod4 re~
    re dod
    re'-! la-!

    %54
    fad8 mi16 fad re8 la
    fad mi16 fad \once\stemUp re8 la''
    fad mi16 re do'8 do

    %57
    si la16 si sol8 re
    si la16 si sol8 re
    si la16 si sol8\once\stemDown re''

    %60
    si la16 sol fa'!8 fa\mbreak
    mi re16 do sol'8 sol
    mi re16 do sol'8 sol

    %63
    mi re16 do sib'8 sib
    la sol16 fa mib8 mib
    mib re16 dod re mi? fa sol

    %66
    la8 sol16 fa mi re mi dod
    re8 mi16 fad sol la si do
    re8 do16 si la sol la fad

    %69
    sol4-! re-!
    si8 la16 si sol8 re
    si la16 si sol8\once\stemDown re''

    %72
    si la16 sol re'8 re\mbreak
    si la16 sol fa'!8 fa
    fa mi16 red mi fad sol la

    %75
    si8 la16 sol fad mi fad red
    mi8 fad16 sold la si do re
    mi8 re16 do si la si sold

    %78
    la mi re mi do mi re mi
    si mi re mi si mi re mi
    do4 do'~

    %81
    do si
    do16 re do re si do si  do
    la sol la si la si la si\mbreak

    %84
    sol fad sol la sol la sol la
    fad mi fad sol fad sol fad sol
    mi re mi fad mi la sol la

    %87
    fad8 sol16 fad sol fad sol mi
    fad8 sol16 la si la si sol
    la8 si16 la  si la si la

    %90
    si la si la si la si la
    si la si la si la si la
    si la sol fad sol fad mi re

    %93
    mi re do si la8 fad'
    sol4 re-!
    si8 la16 si sol8 re\mbreak

    %96
    si la16 si sol8 \once\stemDown re''
    si la16 sol re'8 re
    si la16 sol sol'8 sol

    %99
    fad mi16 re do'8 do
    si16 la si sol la sol la fad
    sol sol sol sol re re re re

    %102
    si si si si sol sol sol sol
    fa fa fa fa sol sol sol sol
    si si si si re re re re

    %105
    sol8[la re, la']
    si8. si16 la8. la16
    sol4 r\fermata

}

IvlIIn = \relative do'' {

    sol'4-! re-!
    si8 la16 si sol8 re
    si la16 si sol8 \once\stemDown re''

    %4
    si8 la16 si sol8 re
    si la16 si sol8 \once\stemDown sol''
    fad[re re sol]

    %7
    fad mi16 fad re8 re
    si la16 sol re'8 re
    si la16 sol re'8 re

    %10
    si la16 sol fa'!8 fa
    mi re16 do do'8 do
    si la16 sol fad8 sol\mbreak

    %13
    la16 sol fad mi re8 re
    si la16 sol sol'8 sol
    fad mi16 re la'8 sol16 fad

    %16
    mi8 re16 mi \once\stemUp la,8 do'
    re4 la-!
    fad8 mi16 fad re8 la

    %19
    fad mi16 fad \once\stemUp re8 la''
    fad mi16 fad re8 la
    fad mi16 fad re8 \once\stemDown re''

    %22
    dod[la la re]
    dod si16 dod la8 la
    fad mi16 re la8 la\mbreak

    %25
    fad mi16 re do'!8 do
    si la16 sol fa'!8 fa
    mi re16 do sib'8 sib

    %28
    sib la16 sold la8 mi
    re do16 re sold,?8 sold'
    la4-! mi-!
    do8 si16 do la8 mi

    %32
    do si16 do la8 \once\stemDown mi''
    dod si16 la sol'8 sol
    fad mi16 fad re8 la

    %35
    fad mi16 fad \once\stemUp re8 la''
    fad mi16 re do'8 do\mbreak
    si8 la16 si sol8 re

    %38
    si la16 si sol8 re
    sol,4 sol'~
    sol fad

    %41
    sol sol'~
    sol fad
    sol si,~

    %44
    si lad
    si si'~
    si la!~

    %47
    la16 si la si sol si la si
    fad si la si fad si la si\mbreak
    sold4 la~

    %50
    la sol!~
    sol16 la sol la fad la sol la
    mi la sol la mi la sol la
    fad4-! la-!

    %54
    fad8 mi16 fad re8 la
    fad mi16 fad \once\stemUp re8 la''
    fad mi16 re do'8 do

    %57
    si la16 si sol8 re
    si la16 si sol8 re
    si la16 si sol8\once\stemDown re''

    %60
    si la16 sol fa'!8 fa\mbreak
    mi re16 do sol'8 sol
    mi re16 do sol'8 sol

    %63
    mi re16 do sib'8 sib
    la sol16 fa mib8 mib
    mib re16 dod re mi? fa sol

    %66
    la8 sol16 fa mi re mi dod
    re8 mi16 fad sol la si do
    re8 do16 si la sol la fad

    %69
    sol4-! re-!
    si8 la16 si sol8 re
    si la16 si sol8\once\stemDown re''

    %72
    si la16 sol re'8 re\mbreak
    si la16 sol fa'!8 fa
    fa mi16 red mi fad sol la

    %75
    si8 la16 sol fad mi fad red
    mi8 fad16 sold la si do re
    mi8 re16 do si la si sold

    %78
    la4 la,~
    la sold
    la16 si do re mi fa sol la

    %81
    re, sol fa sol re sol fa sol
    mi8 fad sol4~
    sol fad~\mbreak

    %84
    fad mi~
    mi re~
    re do~

    %87
    do8 si16 la si la si do
    re8 mi16 fad sol fad sol mi
    fad8 sol16 fad sol fad sol fad

    %90
    sol fad sol fad sol fad sol fad
    sol fad sol fad sol fad sol fad
    sol8[re si sol]

    %93
    r8 sol' fad16 mi re do
    si4-! re-!
    si8 la16 si sol8 re\mbreak

    %96
    si la16 si sol8 \once\stemDown re''
    si la16 sol re'8 re
    si la16 sol sol'8 sol

    %99
    fad mi16 re do'8 do
    si16 la si sol la sol la fad
    sol re re re si si si si

    %102
    sol sol sol sol re re re re
    si si si si re re re re
    sol sol sol sol si si si si

    %105
    re8 do16 si la8 fad'
    sol8. sol16 fad8. fad16
    sol4 r\fermata

}

Ivlan =  \relative do' {

    sol'4 fad
    sol4 r8 fad
    sol4 r8 fad

    %4
    sol4 r8 fad
    sol4 r8 si
    la[fad re si']

    %7
    la sol16 la re,8 re
    re do16 si la8 re
    re do16 si la8 re

    %10
    re4 r8 re
    sol, sol' la la
    re, fad16 sol la8 sol\mbreak

    %13
    fad4 r8 la
    re,4 dod
    re re

    %16
    r8 si' la16 si la sol
    fad4 dod
    re4 r8 dod

    %19
    re4 r8 dod
    re4 r8 dod
    re4 r8 la'

    %22
    la4 r8 la
    la4 dod
    re r8 mi,\mbreak

    %25
    re[fad sol la]
    re, do16 si do8 re
    mi fa?16 mi fa8 sol

    %28
    do, do'16 si la8 mi
    fa[la sold si]
    la4-! sold-!

    %31
    la4 r8 sold
    la4 r8 sold
    la[dod, re mi]

    %34
    la,4 r8 dod
    re4 r8 dod
    re mi16 fad sol8 la\mbreak

    %37 OOKK
    re,8 do16 re si8 fad'
    sol4 r8 fad
    sol4 si

    %40
    la2
    sol4 re
    re2

    %43
    re4 sol
    dod, dod
    si fad'

    %46
    fad2~
    fad4 mi
    fad2\mbreak

    %49
    si,4 do
    mi2~
    mi4 re

    %52
    mi2
    fad4 dod
    re r8 dod

    %55
    re4 r8 dod
    re mi16 fad sol8 la
    re,4 r8 fad

    %58
    sol4 r8 fad
    sol4 r8 fad
    sol [si, do re]\mbreak

    %61
    sol,4 re'
    mi re
    mi8[mi fa sol]

    %64
    do,[la' sib do]
    fa, fa16 mi re8 re
    re mi16 re dod8 la'16 sol

    %67
    fad8[mi re do]
    si mi la, re
    si4-! fad'-!

    %70
    sol r8 fad
    sol4 r8 fad
    sol4 la\mbreak

    %73
    re,8 do16 si do8 re
    sol, sol'16 fad mi8 mi
    mi fad red si'16 la

    %76
    sold8 la16 si mi,8 re
    do fa! si, mi
    do4 la

    %79
    si2
    do
    re

    %82
    do4 re
    re2\mbreak
    si~

    %85
    si
    sol4 la'~
    la sol

    %88
    la r8 re,
    re4 r8 re
    re[re re re]

    %91
    re[re re re]
    re[sol sol sol]
    sol mi la, re

    %94
    re4-! fad-!
    sol-! r8 fad\mbreak
    sol4 r8 la

    %97
    re,4 re
    re si'8 si
    la sol16 fad sol8 la

    %100
    re, sol fad16 mi re do
    si si' si si sol sol sol sol
    re re re re si si si si

    %103
    sol sol sol sol si si si si
    re re re re sol sol sol sol
    si8[mi, fad re]

    %106
    re8. re16 re8. re16
    si4 r\fermata

}

Ibcn = \relative do {

    sol'4 re
    sol, r8 re'
    sol4 r8 re

    %4
    sol,4 r8 re'
    sol4 r8 sol,
    re'4 r8 sol,

    %7
    re'4 r8 re
    sol4 fad
    sol fad

    %10
    sol r8 si,
    do4 fad,
    sol8[re' re sol,]\mbreak

    %13
    re'4 r8 fad
    sol4 mi
    re fad

    %16
    sol la
    re, la
    re, r8 la''

    %19
    fad mi16 fad re8 la
    re4 r8 la'
    fad mi16 fad re8 re,

    %22
    la'4 r8 re
    la'4 la,
    re r8 dod\mbreak

    %25
    re[re mi fad]
    sol[sol, la si]
    do[do re mi]

    %28
    fa!4 r8 do
    re4 mi
    la mi

    %31
    la, r8 mi'
    do si16 do la8 mi
    la[la si dod]

    %34
    re4 r8 la'
    fad mi16 fad re8 la
    re,[re' mi fad]\mbreak

    %37
    sol4 r8 re
    si la16 si sol8 re
    sol4 sol'

    %40
    re' re,
    sol sol,
    re' re

    %43
    sol, sol'
    fad fad,
    si si'

    %46
    fad fad,
    si mi
    si' si,\mbreak

    %49
    mi la,
    mi' mi,
    la re

    %52
    la' la,
    re' la
    re, r8 la'

    %55
    fad mi16 fad re8 la
    re,[re' mi fad?]
    sol4 r8 re'

    %58
    si la16 si sol8 re
    si la16 si sol8 re
    sol[sol' la si]\mbreak

    %61
    do4 si
    do si
    do8[do, re mi]

    %64
    fa[fa sol la]
    sib sib, sib' la16 sol
    fa!8[sol la la,]

    %67
    re[do si? la]
    sol[do' re re,]
    sol4-! re-!

    %70
    sol, r8 re''
    si la16 si sol8 re
    sol4 fad\mbreak

    %73
    sol8[sol, la si]
    do[do' do si16 la]
    sol8[la si si,]

    %76
    mi[re do si]
    la[re mi mi,]
    la4 la'

    %79
    mi mi,
    la do
    sol' sol,

    %82
    do sol
    re' re,\mbreak
    mi mi'

    %85
    si' si,
    do do'
    re sol,

    %88
    re sol,
    re' r8 re
    sol[re sol re]

    %91
    sol[re sol re]
    sol sol, sol' sol,
    do4 re

    %94
    sol, re'
    sol r8 re\mbreak
    si8 la16 si sol8 fad

    %97
    sol4 fad
    sol sol'
    re'8[re, mi fad]

    %100
    sol4 re
    sol,16 sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %103
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol8[do re re,]

    %106
    sol8. sol16 re8. re16
    sol4 r\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <_+>
    s s8 <_+>
    s4 s8 <_+>
    s2
    s
    <_+>
    <_+>
    s2*3
    s4 <5>
    s8 <_+> s4
    s2
    s4 <6 +>
    s2
    s4 <_+>
    <_+> <_+>
    s s8 <_+>
    <6>2
    <_+>
    s
    <_+>
    <_+>
    <_+>4 s8 <6>
    s8 <_+> s4
    s <6->
    s2
    s4 s8 <6>
    <6>4 <_+>
    s <_+>
    s s8 <_+>
    <6>4 s8 <_+>
    s4 <6>
    s4 s8 <_+>
    s2
    <_+>
    s4 s8 <_+>
    <6>2
    s
    <4>4 <3+>
    s2
    <4>4 <3+>
    s2
    <4>4 <3+>
    <5+>2
    <4>4 <3>
    <_+>2
    <4>4 <3!>  %% bar 48 OOKK
    <7 _+>2
    <4>4 <3>
    <7 _+> <_+>
    <4>4 <3>
    <_+> <_+>
    <_+> s8 <_+>
    s2
    <_+>
    s4 s8 <_+>
    s2*3
    s4 <6>
    s <6>
    s <6->
    s <6->
    <4-> <3>
    s s8 <_+>
    <_+>4 <6>
    s s8 <_+>
    s4 <_+>
    s s8 <_+>
    s2
    s4 <6>
    s <6->
    <4->4 <3>
    <6>4 s8 <_+>
    s4 <6>
    s s8 <_+>
    s2
    <4>4 <3+>
    s2
    <4>4 <3>
    s2
    <4>4 <3+>
    <9+> <8>
    <4> <3>
    <9> <8>
    <7 _+>2
    <_+>
    s4 s8 <_+>
    s8 <_+> s4
    s8 <_+> s4
    s2
    s4 <_+>
    s <_+>
    s s8 <_+>
    <6>4 s8 <6>
    s2*3
    s4 <_+>
    s2*4
    s4 <_+>
    s <_+>

}

forma = {

    \key do\major
    \time 2/4
    \tempo 2 = 57
    s2*107
    \bar"|."

}

Iob = {
    \Iglobal
    <<\Iobn \forma>>

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


IIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIobn = \relative do'' {

    r8 re, (re sol sol si)
    r do(do la la fad)
    r fad'(fad red red si)

    %4
    r mi(mi si si sold)
    r la'(la mi mi dod)
    r re(re la la fad)

    %7
    re'8. do16 do4-! r8 r16 la\mbreak
    sib4. do8 re4
    sol, dod4. mi8

    %10
    la,8.[sol16 fad8. mi16] re4
    re r r\fermata

}

IIvlIn =  \relative do'' {

    re,4-! re-! r8 r16 re
    red8(fad fad la) r8 r16 la
    la8(red red fad) r r16 red

    %4
    mi8(si si re!) r r16 sold
    la8(mi mi sol!) r r16 dod,
    re8(la la do!) r r16 fad

    %7
    sol8. fad16 fad4 r8 r16 fad\mbreak
    sol4 re r8 r16 re
    re4 dod r8 r16 dod

    %10
    re4-! la-! la-!
    la8. sol16 la4 r\fermata

}

IIvlIIn = \relative do'' {

    si,4-! si-! r8 r16 si
    la8(red red fad) r8 r16 fad
    fad8(la la la) r8 r16 la

    %4
    sold8 sold sold si r r16 re
    dod8(dod dod mi) r r16 sol,
    fad8(fad fad la) r r16 la

    %7
    sib8. do16 do4 r8 r16 do\mbreak
    sib4-! sib-! la
    sol sol8.[fad16 sol8. la16]

    %10
    fad4-! fad-! fad-!
    fad8. mi16 fad4 r\fermata

}

IIvlan =  \relative do' {

    sol4 sol r8 r16 sol
    la4 la r8 r16 red
    red4-! red-! r8 r16 fad

    %4
    si,4 mi r8 r16 si'
    mi,4 la r8 r16 mi
    la,4 re r8 r16 re

    %7
    re8. mib16 mib4 r8 r16 re\mbreak
    re4 re re
    sol sol,2

    %10
    la4 re re
    re re r\fermata

}

IIbcn = \relative do {

    sol'4 sol, r8 r16 sol'
    fad4 fad, r8 r16 fad'
    si4 si, r8 r16 si

    %4
    mi4 mi, r8 r16 mi'
    la4 la, r8 r16 la
    re4 do r8 r16 do

    %7
    sib8. la16 la4 r8 r16 re\mbreak
    sol,4 sol' fa
    mib mi2

    %10
    re4 re re
    re re, r\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    <6+>
    <_+>2 s8 s16 <7 _+>
    <7 _+>2 s8 s16 <7 _+>
    <_+>2 s8 s16 <7 _+>
    <_+>4 <4+> s8 s16 <4+>
    <6>4 <6+> s8 s16 <_+>
    <_->2.
    <7>4 <6+>2
    <_+>2.
    <_+>

}

forma = {

    \key do\major
    \time 3/4
    \tempo 4 = 50
    s2.*11
    \bar"|."

}

IIob = {
    \IIglobal
    <<\IIobn \forma>>

}

IIvlI = {
    \IIglobal
    <<\IIvlIn \forma>>

}

IIvlII = {
    \IIglobal
    <<\IIvlIIn \forma>>

}

IIvla = {
    \IIglobal
    \clef alto
    <<\IIvlan \forma>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}


IIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

IIIobn = \relative do'' {

    sol8 sol8. \tuplet 3/2 { la32 (si do) }
    re8 re8.\tuplet 3/2 { re32 (mi fad) }
    sol8 la4\tr

    %4
    si8(do mi,)
    fad(sol si,)
    dod(re fad,)

    %7
    sol(mi' sol)
    la,4\tr sol8
    sol8 sol8. \tuplet 3/2 { la32 (si do) }

    %10
    re8 re8. \tuplet 3/2 { re32 (mi fad) }
    sol8 la4\tr
    si8(do mi,)

    %13
    fad(sol si,)
    dod(re fad,)
    sol mi4\tr

    %16
    re4.
    re8 re8.  \tuplet 3/2 { mi32(fad sol) }
    la8 la8. \tuplet 3/2 { si32(do re) }

    %19
    mi8(sol re)
    do4\tr si8
    la(mi' sol,)

    %22
    fad8 fad8. \tuplet 3/2 { sol32 (la si) }
    do8. re16 si8
    la4.\tr\mbreak

    %25
    re,8 re8.  \tuplet 3/2 { mi32(fad sol) }
    la8 la8. \tuplet 3/2 { si32(do re) }
    mi8 fad4\tr

    %28
    sol8 la4\tr
    si8(do mi,)
    fad(sol si,)

    %31
    do la4\tr
    sol4.\fermata

}

IIIvlIn =  \relative do'' {

    sol8 sol8. \tuplet 3/2 { la32 (si do) }
    re8 re8.\tuplet 3/2 { re32 (mi fad) }
    sol8 la4\tr

    %4
    si8(do mi,)
    fad(sol si,)
    dod(re fad,)

    %7
    sol(mi' sol)
    la,4\tr sol8
    sol8 sol8. \tuplet 3/2 { la32 (si do) }

    %10
    re8 re8. \tuplet 3/2 { re32 (mi fad) }
    sol8 la4\tr
    si8(do mi,)

    %13
    fad(sol si,)
    dod(re fad,)
    sol mi4\tr

    %16
    re4.
    re8 re8.  \tuplet 3/2 { mi32(fad sol) }
    la8 la8. \tuplet 3/2 { si32(do re) }

    %19
    mi8(sol re)
    do4\tr si8
    la(mi' sol,)

    %22
    fad8 fad8. \tuplet 3/2 { sol32 (la si) }
    do8. re16 si8
    la4.\tr\mbreak

    %25
    re,8 re8.  \tuplet 3/2 { mi32(fad sol) }
    la8 la8. \tuplet 3/2 { si32(do re) }
    mi8 fad4\tr

    %28
    sol8 la4\tr
    si8(do mi,)
    fad(sol si,)

    %31
    do la4\tr
    sol4.\fermata

}

IIIvlIIn = \relative do'' {

    sol8 sol8. \tuplet 3/2 { la32 (si do) }
    re8 re8.\tuplet 3/2 { re32 (mi fad) }
    sol8 la4\tr

    %4
    si8(do mi,)
    fad(sol si,)
    dod(re fad,)

    %7
    sol(mi' sol)
    la,4\tr sol8
    sol8 sol8. \tuplet 3/2 { la32 (si do) }

    %10
    re8 re8. \tuplet 3/2 { re32 (mi fad) }
    sol8 la4\tr
    si8(do mi,)

    %13
    fad(sol si,)
    dod(re fad,)
    sol mi4\tr

    %16
    re4.
    re8 re8.  \tuplet 3/2 { mi32(fad sol) }
    la8 la8. \tuplet 3/2 { si32(do re) }

    %19
    mi8(sol re)
    do4\tr si8
    la(mi' sol,)

    %22
    fad8 fad8. \tuplet 3/2 { sol32 (la si) }
    do8. re16 si8
    la4.\tr\mbreak

    %25
    re,8 re8.  \tuplet 3/2 { mi32(fad sol) }
    la8 la8. \tuplet 3/2 { si32(do re) }
    mi8 fad4\tr

    %28
    sol8 la4\tr
    si8(do mi,)
    fad(sol si,)

    %31
    do la4\tr
    sol4.\fermata

}

IIIvlan =  \relative do' {

    si'8 si, si'
    la8. sol16 fad8
    mi(do fad)

    %4
    sol( sol la)
    re,(re mi)
    la,(la re)

    %7
    do(do do)
    fad4 sol8
    si si, si'

    %10
    la8. sol16 fad8
    mi do fad
    sol( sol la)

    %13
    re,(re mi)
    mi la la,
    si dod4\tr

    %16
    re4.
    fad8 fad fad
    fad fad fad

    %19
    mi(mi sol)
    sol8.(fad16 sol8)
    mi4 mi8

    %22
    re re re'
    fad, la sol
    fad4.\mbreak

    %25
    fad8 fad fad
    fad(fad fad)
    mi(do re)

    %28
    si(re fad)
    sol sol la
    la re,8. re16

    %31
    mi8\noBeam fad8.\tr sol16
    sol4.\fermata

}

IIIbcn = \relative do {

    sol'8 sol, sol'
    fad mi re
    do la re

    %4
    sol(mi do)
    re(si sol)
    la'(fad re)

    %7
    mi(do la)
    re4 sol,8
    sol'8 sol, sol'

    %10
    fad mi re
    do la re
    sol mi do

    %13
    re si sol
    la' fad re
    sol la la,

    %16
    re4.
    re'8 re, re'
    re re, re'

    %19
    do do, si
    la re sol,
    do4 dod8

    %22
    re do si
    la fad sol
    re4.\mbreak

    %25
    re''8 re, re'
    re re, re'
    do la re

    %28
    sol, fad re
    sol mi do
    re si sol

    %31
    do re re,
    sol4.\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*2
    s4 <_+>8
    s8 <6>4
    <_+>4.
    <_+>8 <6>4
    <6>4.
    <_+>
    s
    <6>
    s4 <_+>8
    s <6>4
    <_+>8 <6>4
    s4.
    s4 <_+>8
    <_+>4.
    <_+>
    s
    s
    <7>8 <_+>4
    <6>4.
    <_+>
    <6+>
    <_+>
    <_+>
    <_+>
    s
    s
    s8 <6>4
    <_+>8 <6>4
    s <_+>8



}

forma = {

    \key do\major
    \time 3/8
    \tempo 4. = 60
    s4.*16
    \bar ":..:"
    s4.*16
    \bar"|."

}

IIIob = {
    \IIIglobal
    <<\IIIobn \forma>>

}

IIIvlI = {
    \IIIglobal
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma>>

}

IIIvla = {
    \IIIglobal
    \clef alto
    <<\IIIvlan \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}


IVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IVobn = \relative do'' {

    sib'4 r16 sib la sol fa sib la sol fa sib la sol
    fa sib la sol fa mib re do sib do re mib do re mib fa
    sib, do re mib do re mib fa sib, do re mib do re mib fa

    %4
    sib, do re mib fa fa fa fa fa fa fa fa fa fa fa fa
    \repeat unfold 16{fa}
    fa fa sol la sib sib sib sib\mbreak sib sib sib sib sib sib sib sib

    %7
    \repeat unfold 16{sib}
    sib fa sol la sib fa re fa sib, re fa re sib re fa re
    sib re fa re sib re fa re sib do re mib fa fa fa fa

    %10
    \repeat unfold 12{fa} fa mi? fa sol
    \repeat unfold 16{la}
    la re do sib la re do sib la re do sib la sol fa mi

    %13
    \repeat unfold 16{re}
    re8 mi16 fa sol la sib sol do do do do do do do do
    do do do do do do do do do sib la sol fa mib re do\mbreak

    %16
    sib do re mib do re mib fa sib, do re mib do re mib fa
    re sol fa mib re sol fa mib re sol fa mib re do re mib
    \repeat unfold 16{fa}

    %19
    sib fa sol la sib fa re fa sib, re fa re sib re fa re
    sib sol' fa mib re sol fa mib re sol fa mib re do sib lab\mbreak
    sol mib sol sib mib sib mib sol mib sib mib sol mib sib mib sol

    %22
    \repeat unfold 16{sol}
    sol do si la sol fa mib re do re mib fa sol la si sol
    do sib! la sol fa mib re do sib do re mib fa sol la fa\mbreak

    %25
    sib la sol fa mi! re do sib la[sib do re mi fa sol mi]
    la[re do sib la sol fa mi] fa fa mi re la' fa mi re
    la' fa mi re la' sib la sol fa re' do sib la re do sib

    %28
    la re do sib la sol fa mi\mbreak re mi fa sol la si dod la
    re re re re dod si la sol fa sib? la sol fa mib re do
    sib[do re mib fa sol la fa] sib re do sib la sol fa mib

    %31
    re sib' la sol fad mi? re do sib sib la sol re' sib la sol
    re' sib la sol re' mib fa do\mbreak sib[do re mib fa sol la sib]
    \repeat unfold 16{do}

    %34
    do[sib la sol fa mib re do] sib do re mib do re mib fa
    sib, do re mib do re mib fa sib,[do re mib fa sol la fa]
    sib re do sib la sol fa mib re re' do sib la sol fa mib

    %37
    re\p re re re re re re re do do do do do do do do\mbreak
    sib sib sib sib sib sib sib sib lab  lab lab lab lab lab lab lab
    \repeat unfold 8{sol} \repeat unfold 8{fa}

    %40
    \repeat unfold 8{mib} \repeat unfold 8{re}
    mib\f[fa sol la sib do re mib] \repeat unfold 8{fa}
    \repeat unfold 8{fa} fa sib la sol fa sib la sol\mbreak

    %43
    fa sib la sol fa mib re do sib re fa re sib re fa re
    sib [do re mib fa sol la fa] sib\p \repeat unfold 7{sib}
    sib sib sib sib lab lab lab lab sol sol sol sol do do do do

    %46
    do do do do sib sib sib sib la? la la la re re re re
    re re re re dod dod dod dod re la\f la la la la la la
    \repeat unfold 8{la} la re do sib la sol fa mi?

    %49
    \repeat unfold 16{re}
    re8[mi16 fa sol la sib sol] \repeat unfold 8{do}
    \repeat unfold 8{do} do sib la sol fa mib re do

    %52
    sib do re mib do re mib fa  sib, do re mib do re mib fa
    re sol fa mib  re sol fa mib  re sol fa mib  re sol fa mib\mbreak
    re do re mib fa sol la fa sib re do sib la sol fa mib

    %55
    re sib re fa re sib re fa re sib re fa sib fa re sib
    sib' la sib la sib la sib la sib la sib la sib la sib la
    sib la sib la sib la sib la sib la sib la sib la sib la

    %58
    sib4 r r
    R2.*6
    r4\fermata

}

IVvlIn =  \relative do'' {

    sib'4 r16 sib la sol fa sib la sol fa sib la sol
    fa sib la sol fa mib re do sib do re mib do re mib fa
    sib, do re mib do re mib fa sib, do re mib do re mib fa

    %4
    sib, do re mib fa fa fa fa fa fa fa fa fa fa fa fa
    \repeat unfold 16{fa}
    fa fa sol la sib sib sib sib\mbreak sib sib sib sib sib sib sib sib

    %7
    \repeat unfold 16{sib}
    sib fa sol la sib fa re fa sib, re fa re sib re fa re
    sib re fa re sib re fa re sib do re mib fa fa fa fa

    %10
    \repeat unfold 12{fa} fa mi? fa sol
    \repeat unfold 16{la}
    la re do sib la re do sib la re do sib la sol fa mi

    %13
    re re re re  re' \repeat unfold 11{re}
    re do sib la sol fa mi re do' do do do do do do do
    do do do do do do do do do sib la sol fa mib re do\mbreak

    %16
    sib do re mib do re mib fa sib, do re mib do re mib fa
    re sol fa mib re sol fa mib re sol fa mib re do re mib
    \repeat unfold 16{fa}

    %19
    sib fa sol la sib fa re fa sib, re fa re sib re fa re
    sib sol' fa mib re sol fa mib re sol fa mib re do sib lab\mbreak
    sol mib sol sib mib sib mib sol mib sib mib sol mib sib mib sol

    %22
    \repeat unfold 16{sol}
    sol do si la sol fa mib re do re mib fa sol la si sol
    do sib! la sol fa mib re do sib do re mib fa sol la fa\mbreak

    %25
    sib la sol fa mi! re do sib la[sib do re mi fa sol mi]
    la[re do sib la sol fa mi] fa fa mi re la' fa mi re
    la' fa mi re la' sib la sol fa re' do sib la re do sib

    %28
    la re do sib la sol fa mi\mbreak re mi fa sol la si dod la
    re re re re dod si la sol fa sib? la sol fa mib re do
    sib[do re mib fa sol la fa] sib re do sib la sol fa mib

    %31
    re sib' la sol fad mi? re do sib sib la sol re' sib la sol
    re' sib la sol re' mib fa do\mbreak sib[do re mib fa sol la sib]
    \repeat unfold 16{do}

    %34
    do[sib la sol fa mib re do] sib do re mib do re mib fa
    sib, do re mib do re mib fa sib,[do re mib fa sol la fa]
    sib re do sib la sol fa mib re re' do sib la sol fa mib

    %37
    re\p re re re re re re re do do do do do do do do\mbreak
    sib sib sib sib sib sib sib sib lab  lab lab lab lab lab lab lab
    \repeat unfold 8{sol} \repeat unfold 8{fa}

    %40
    \repeat unfold 8{mib} \repeat unfold 8{re}
    mib\f[fa sol la sib do re mib] \repeat unfold 8{fa}
    \repeat unfold 8{fa} fa sib la sol fa sib la sol\mbreak

    %43
    fa sib la sol fa mib re do sib re fa re sib re fa re
    sib [do re mib fa sol la fa] sib\p \repeat unfold 7{sib}
    sib sib sib sib lab lab lab lab sol sol sol sol do do do do

    %46
    do do do do sib sib sib sib la? la la la re re re re
    re re re re dod dod dod dod re la\f la la la la la la
    \repeat unfold 8{la} la re do sib la sol fa mi?

    %49
    re re re re re' re re re \repeat unfold 8{re}
    re do sib la sol fa mi re do' \repeat unfold 7{do}
    \repeat unfold 8{do} do sib la sol fa mib re do

    %52
    sib do re mib do re mib fa  sib, do re mib do re mib fa
    re sol fa mib  re sol fa mib  re sol fa mib  re sol fa mib\mbreak
    re do re mib fa sol la fa sib re do sib la sol fa mib

    %55
    re sib re fa re sib re fa re sib re fa sib fa re sib
    sib' la sib la sib la sib la sib la sib la sib la sib la
    sib la sib la sib la sib la sib la sib la sib la sib la

    %58
    sib4 fa, fa
    fa8. fa16 fad4 r\mbreak
    fa!8 fa fa fa fa fa

    %61
    mi8. mi16 la8. la16 sib4
    r la8. la16 la8. la16
    lab8. lab16 sol8. sol16 fa8. fa16

    %64
    fa8. fa16 mi8. mi16 mib8. mib16
    mib4\fermata

}

IVvlIIn = \relative do'' {

    re4 r16 sib' la sol fa sib la sol fa sib la sol
    fa sib la sol fa mib re do sib do re mib do re mib fa
    sib, do re mib do re mib fa sib, do re mib do re mib fa

    %4
    re4 r8 re[do sib la re]
    do sib la re do sib la la
    sib mib re sib\mbreak sib do re sib

    %7
    sib do re sib sib do re sib
    sib mib re16 fa re sib re fa re sib re fa re sib
    re fa re sib re fa re sib re do re mib fa fa fa fa

    %10
    fa re do sib la re do sib la re do sib la sib la sol
    fa fa' mi re la' fa mi re\mbreak la' fa mi re la' sib la sol
    fa sib la sol fa sib la sol fa sib la sol fa mi fa sol

    %13
    la sib la sol la sib la sol la sib la sol la fad sol la
    sib la sol fa? mi re do sib la la' sol fa mi la sol fa
    mi la sol fa mi re do sib la fa' fa fa fa fa fa fa\mbreak

    %16
    \repeat unfold 16 {fa}
    fa sib la sol fa sib la sol fa sib la sol fa mib? re do
    sib re do sib la re do sib la re do sib la sol fa mib

    %19
    re8 sib' re16 fa re sib re fa re sib re fa re sib
    sib' \repeat unfold 15 {sib}\mbreak
    sib sol sib sol mib sol mib sib mib sol mib sib mib sol mib sib

    %22
    mib mib re do sol' mib re do sol' mib re do sol' si, do re
    mib re mib fa sol la si sol do do do do si la sol fa
    mib mib fa sol la la sib? do re re do sib la sol fa mib\mbreak

    %25
    re sib do re mi! mi fa sol la la sol fa mi re do sib
    la fa' mi re dod sib'! la sol la la la la la la la la
    la la la la la la la la la sib la sol fa sib la sol

    %28
    fa sib la sol fa8 re\mbreak re'16 re re re dod si la sol
    fa mi fa sol la si dod la re re do? sib? la sol fa mib
    re re do sib la sol fa mib re8[re'16 mib fa sol la fa]

    %31
    sib re do sib la sol fad mi re re' re re re re re re
    re re re re re re re re\mbreak re[do sib la sol fa mi? re]
    do la' sol fa mi la sol fa mi la sol fa mi re do sib

    %24
    <<{la' la la la}\\la,4>> fa'16 fa fa fa fa fa fa fa fa fa fa fa
    fa fa fa fa fa fa fa fa fa re' do sib la sol fa mib
    re do re mib fa sol la fa sib sib, re sib fa' fa la fa

    %37
    sib\p sib sib sib sib sib sib sib sib sib sib sib la la la la\mbreak
    la la la la sol sol sol sol sol sol sol sol fa fa fa fa
    fa fa fa fa mib mib mib mib mib mib mib mib re re re re

    %40
    re re re re do do do do do do do do si si si si
    do\f[re mib fa sol la sib? do] re re do sib la re do sib
    la re do sib la sol fa mib re re' do sib la re do sib

    %43
    la re do sib la sol fa mib re sib re fa re sib re fa
    re[re' do sib la sol fa mib] re\p re re re re re re re
    mi! mi mi mi fa fa fa fa fa fa fa fa mib mib mib mib

    %46
    re re re re sol sol sol sol sol sol sol sol fa fa fa fa
    mi !mi mi mi mi mi mi mi fa fa mi re la' fa mi re
    la' fa mi re la' sib la sol\mbreak fa sib la sol fa mi fa sol

    %49
    la sib la sol la sib la sol la sib la sol la fad sol la
    sib[la sol fa mi re do sib] la la' sol fa mi la sol fa
    mi la sol fa mi re do sib la fa' fa fa fa fa fa fa

    %52
    \repeat unfold 16 {fa}
    \repeat unfold 4 {fa sib la sol}\mbreak
    fa[re' do sib la sol fa  mib] re[do re mib fa sol la fa]

    %55
    sib fa re sib re fa re sib re fa re sib re fa sib fa
    \repeat unfold 8 {re do re do}
    re4 re, re

    %59
    re8. re16 mib4 r\mbreak
    re8 re re re re re
    la'8. la16 fa8. fa16 mi4

    %62
    r fa8. fa16 fad8. fad16
    fa!8. fa16 mi8. mi16 mib8. mib16
    re8. re16 sol8. sol16 do,8. do16

    %65
    la'!4\fermata

}

IVvlan =  \relative do' {

    fa4 r r2
    R1*2
    fa4 r8 fa[fa sol la fa]

    %5
    fa sol la fa fa sol do, do
    re mib fa sol\mbreak fa mib re sol
    fa mib re sol fa mib re sol

    %8
    fa mib fa fa sib fa re sib
    sib' fa re sib sib'4 r8 fa
    fa8 fa fa fa fa fa fa fa

    %11
    la la la la\mbreak la la la la
    la la la la la la la la
    la re, re re re re re re

    %14
    re re re mi fa do' do do
    do do do do do do, do la'\mbreak
    re, fa do do re fa do do

    %17
    re fa sib fa sib fa sib fa
    re fa fa fa fa fa fa fa
    fa re fa [fa] sib fa re sib

    %20
    sib' sib sib sib sib sib, sib' sib\mbreak
    sib mib, sol sib sol mib sol sib
    mib, sol sol sol sol sol sol sol

    %23
    sol do, mib sol do do, re sol
    fa do' do fa, fa sib do fa,\mbreak
    fa sol sol do do do, sol' do,

    %26
    do sol' mi la  la la la la
    la la la la la re, fa la
    re, re fa la\mbreak la re, mi la

    %29
    la re, mi la la do, do fa
    fa fa fa fa fa fa fa fa
    fa mib re fad sol re re re

    %32
    re re re re\mbreak re re re sol
    do, do' do do do do do do
    do fa, do fa re re fa fa

    %35
    re re fa fa re re fa fa
    fa fa fa fa fa fa fa fa
    fa16\p fa fa fa fa fa fa fa sol sol sol sol la la la la\mbreak

    %38
    re, re re re re re re re mib mib mib mib fa fa fa fa
    sib, sib sib sib sib sib sib sib do do do do re re re re
    sol, sol sol sol sol sol sol sol lab lab lab lab sol sol sol sol

    %41
    sol4  r r8 fa'\f fa fa
    fa fa fa fa fa re do re\mbreak
    do re fa fa fa fa fa fa

    %44
    sib sib, fa' fa fa16\p fa fa fa fa fa fa fa
    sol sol sol sol do, do do do re re re re sol sol sol sol
    fad fad fad fad re re re re mi! mi mi mi la la la la

    %47
    sib sib sib sib la la la la la8\f la la la
    la la la la\mbreak la la la la
    la re, re re re re re re

    %50
    re re re mi fa do' do do
    do do do do do do, do la'
    re, fa do do re fa do do

    %53
    re fa sib fa sib fa sib fa\mbreak
    sib fa fa fa fa fa fa fa
    fa fa fa fa fa fa fa fa

    %56
    \repeat unfold 32 {fa16}
    fa4 sib, sib
    sib8. sib16 do4 r\mbreak

    %60
    si8 si si si si si
    dod8. dod16 re8. re16 sol4
    r re8. re16 re8. re16

    %63
    re8. re16 do8. do16 do8. do16
    sib8. sib16 sib8. sib16 sib8. sib16
    do4\fermata

}

IVbcn = \relative do {

    sib4 r r2
    R1*2
    sib4 r8 sib'[la sol fa sib]

    %5
    la sol fa sib la sol fa mib
    re do sib mib\mbreak re do sib mib
    re do sib mib re do sib mib

    %8
    re do sib sib sib sib sib sib
    sib sib sib sib sib4 r16 sib' la sol
    fa sib la sol fa sib la sol fa sib la sol fa sol fa mi?

    %11
    re re' dod si la re dod si\mbreak la re dod sib? la sol fa mi
    re8 re re re  re re re re
    re16 sol fad mi re sol fad mi re sol fad mi re do sib la

    %14
    sol8 sol' sib sol r16 fa mi re do fa mi re
    do fa mi re do sib la sol fa8 fa' la fa\mbreak
    sib, sib' la fa re sib' la fa

    %17
    sib sib, sib sib sib sib sib sib
    r16 sib' la sol fa sib la sol fa sib la sol fa mib re do
    sib8 sib sib sib sib sib sib sib

    %20
    r16 mib' re do sib mib re do sib mib re do sib lab sol fa\mbreak
    mib8 mib mib mib mib mib mib mib
    r16 do' sib lab sol do sib lab sol do sib lab sol fa mib re

    %23
    do8 do do do do16[do' sib lab sol fa mib re]
    do8 mib fa fa, sib16[sib' la sol fa mib re do]\mbreak
    sib8 sib' do do, fa,16[fa' mi? re do sib la sol]

    %26
    fa8 sol la la re16 re ' do sib la re do sib
    la re do sib la sol fa mi re8 re re re\mbreak
    re re re re\mbreak re16[re' do sib la sol fa mi]

    %29
    re re' do si? la sol fa mi re8 mib fa fa,
    sib16[sib' la sol fa mib re do] sib[sib' la sol fa mib re do]
    sib8 do re re, sol16 sol' fad mi? re sol fad mi

    %32
    re sol fad mi re do sib la\mbreak sol8 sol' sib sol
    r16 fa[mi re do fa mi re] do[fa mi re do sib la sol]
    fa8 fa' la fa sib, sib' la fa

    %35
    sib, sib' la fa sib,16[sib' la sol fa mib re do]
    sib[sib' la sol fa mib re do]  sib[sib' la sol fa mib re do]
    sib\p sib sib sib re re re re mi! mi mi mi fad fad fad fad\mbreak

    %38
    sol sol sol sol sib, sib sib sib do do do do re re re re
    mib mib mib mib sol sol sol sol la la la la si si si si
    do do do do mib, mib mib mib fa fa fa fa sol sol sol sol

    %41
    do,4 r r16 sib'?\f  la sol fa sib la sol
    fa sib la sol fa mib re do sib8 sib fa' sib,\mbreak
    fa'8 sib, re fa  sib sib, sib' sib,

    %44
    r16 sib'[la sol fa mib re do] sib\p sib sib sib sib sib sib sib
    do do do do fa fa fa fa si, si si si do do do do
    re re re re sol sol sol sol dod, dod dod dod re re re re

    %47
    sol sol sol sol la la la la re, re'\f dod sib la re dod si
    fa re' dod sib? la sol fa mi\mbreak re8 re re re
    re16 sol fad mi re sol fad mi re sol fad mi re do sib la

    %50
    sol8 sol' sib sol r16 fa mi re do fa mi re
    do fa mi re do sib la sol fa8 fa' la fa
    sib, sib' la  fa re sib' la [fa]

    %53
    sib sib, sib' [sib,] sib' sib, sib' [sib,]\mbreak
    r16 sib'[la sol fa mib re do] sib sib' la sol fa mib re do
    sib8 sib sib sib sib sib sib sib

    %56
    sib'16 fa sib  fa sib fa sib fa sib fa sib fa sib fa sib fa
    sib fa sib fa sib fa sib fa sib fa sib fa sib fa sib fa
    sib4 sib sib

    %59
    sib8. sib16 la4 r\mbreak
    sold8 sold sold sold sold sold
    sol!8. sol16 fa8. fa16 dod4

    %62
    r re8. re16 do8. do16
    si8. si16 sib8. sib16 la8. la16
    lab8. lab16 sol8. sol16 solb8. solb16

    %65
    fa4\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*3
    s2 <6>
    <6> <6>
    <6> <6>
    <6> <6>
    <6> s
    s1
    s
    s4 <_+> <_+> <_+>
    s1
    <_+>
    s1
    s
    s4 <6> <6> <6>
    s1*4
    <5>1
    s2 <_!>
    <_->1
    <4 _->2 <3>
    s4 <4> <3>2
    s4 <_+> s <_+>
    s1
    s2 s4 <_+>
    <4> <_+> <3>2
    s1
    s4  <_+> s2
    s1*5
    s4 <6> <6 5> <6 5>
    <9> <6> <6- 5> <5->
    <9> <6> <6 5> <6>
    <9> <6> <6 _-> <_!>
    <_->1
    s1*7
    <_+>1
    s
    s2 s4 <6>
    s <6> <6> <6>
    s1*5
    s2.
    s8. <5>16 <6+>4 s
    <7 5>2.
    <4+>4 <6> <7 5>
    s <5> <4+>
    <7- 5> <6> <6>
    <4 2> <6> <6>
    <7->

}

forma = {

    \key re\minor
    \time 4/4
    \tempo 2 = 57
    s1*57\break
    \mark\markup "[II.2] Grave"
    \time 3/4
    \tempo 4 = 50
    s2.*7
    s4
    \bar"|."

}

IVob = {
    \IVglobal
    <<\IVobn \forma>>

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


Vglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

Vobn = \relative do'' {

    sib16 re do sib fa' la sold fa sib8 sib, r16 sib' la sib
    sol la fa sol mib fa re mib do fa mib fa re mib do re
    sib mib re mib do re sib do\mbreak la do sib la re fa mib re

    %4
    sol mib fa re mib do re sib sol' mib fa re mib do re sib
    do la sib sol la fa sib sol do la re sib mi! do fa re
    sol mi  la fa sol mi la fa sol mi la fa sol mi re do

    %7
    fa do la fa' sol, fa' do mi fa  la fa do la fa' do la
    fa do la' fa do' la fa' do fa,4 r\mbreak
    do'16 mib re do sol' sib lab sol do8 do, r16 do' sib do

    %10
    lab sib \parenthesize sol \parenthesize lab fa sol mib fa re sol fa sol mib fa re mib
    do fa mib fa re mib do re si do la si sol sol' fa sol
    mib fa re mib do re sib do la sib sol la fa fa'mib fa

    %13
    re sib' la sib sol la fa sol mib fa re mib do re sib do
    la sib sol la fa sol mib fa\mbreak re fa mib re fa la sol fa
    sib re do sib sol' mib fa re sol mib fa re sol mib fa re

    %16
    sol la fa sol mib fa re mib do re sib do la sib sol la
    fa fa' mib fa do la' sol la sib fa re sib fa' do la fa
    sib4 r

}

VvlIn =  \relative do'' {

    sib16 re do sib fa' la sold fa sib8 sib, r16 sib' la sib
    sol la fa sol mib fa re mib do fa mib fa re mib do re
    sib mib re mib do re sib do\mbreak la do sib la re fa mib re

    %4
    sol mib fa re mib do re sib sol' mib fa re mib do re sib
    do la sib sol la fa sib sol do la re sib mi! do fa re
    sol mi  la fa sol mi la fa sol mi la fa sol mi re do

    %7
    fa do la fa' sol, fa' do mi fa  la fa do la fa' do la
    fa do la' fa do' la fa' do fa,4 r\mbreak
    do'16 mib re do sol' sib lab sol do8 do, r16 do' sib do

    %10
    lab sib \parenthesize sol \parenthesize lab fa sol mib fa re sol fa sol mib fa re mib
    do fa mib fa re mib do re si do la si sol sol' fa sol
    mib fa re mib do re sib do la sib sol la fa fa'mib fa

    %13
    re sib' la sib sol la fa sol mib fa re mib do re sib do
    la sib sol la fa sol mib fa\mbreak re fa mib re fa la sol fa
    sib re do sib sol' mib fa re sol mib fa re sol mib fa re

    %16
    sol la fa sol mib fa re mib do re sib do la sib sol la
    fa fa' mib fa do la' sol la sib fa re sib fa' do la fa
    sib4 r

}

VvlIIn = \relative do'' {

    r2 sol16 sib la sol re' fa mib re
    sol la fa sol mib fa re mib do fa mib fa re mib do re
    sib mib re mib do re sib do\mbreak la do sib la re fa mib re

    %4
    sol mib fa re mib do re sib sol' mib fa re mib do re sib
    do la sib sol la fa sib sol do la re sib mi! do fa re
    sol mi  la fa sol mi la fa sol mi la fa sol mi re do

    %7
    fa do la fa' sol, fa' do mi fa  la fa do la fa la do
    fa la fa do la fa' do la fa4 r\mbreak
    do'16 mib re do sol' sib lab sol do8 do, r16 do' sib do

    %10
    lab sib \parenthesize sol \parenthesize lab fa sol mib fa re sol fa sol mib fa re mib
    do fa mib fa re mib do re si do la si sol sol' fa sol
    mib fa re mib do re sib do la sib sol la fa fa'mib fa

    %13
    re sib' la sib sol la fa sol mib fa re mib do re sib do
    la sib sol la fa sol mib fa\mbreak re fa mib re fa la sol fa
    sib re do sib sol' mib fa re sol mib fa re sol mib fa re

    %16
    sol la fa sol mib fa re mib do re sib do la sib sol la
    fa fa' mib fa do la' sol la sib fa re sib fa' do la fa
    sib4 r

}

Vvlan =  \relative do' {

    re4 do re sib
    sib8 sib sol' sol fa la fa fa
    sib la sol la\mbreak do, fa fa[sib]

    %4
    sib sib mib, sib' sib sib mib, sib'
    fa sol do, sol' fa sib sol fa
    do do do do do do mi sol

    %7
    do, la' sib sol la do, fa do
    fa la la la la4 r\mbreak
    sol re fa8 sol lab do,

    %10
    do do re sol sol sol sol sol
    do, do lab' lab re,4 r8 sol
    sol sol la sib do do, re mib

    %13
    fa sib sib sib do do, fa sol
    do, do re mib\mbreak fa4 re
    sib sib'8 sib sib sib sib sib

    %16
    sib sib mib, fa fa sol la la
    sib do fa, mib re4 fa
    re r

}

Vbcn = \relative do {

    sib'4 la sol fa
    mib8 re do sib la fa sib la
    sol fa mib mib'\mbreak fa4 sib,

    %4
    mib8 re do sib mib re do sib
    la sol fa sol la sib do re
    mi? fa mi fa mi fa do sib

    %7
    la fa sib do fa fa, fa' fa,
    fa' fa fa fa fa4 r\mbreak
    do'4 sib lab8 sol fa mib

    %10
    fa mib re do si sol do sib
    lab sol fa fa' sol4 r8 sol
    do sib la sol fa mib re do

    %13
    sib sib' mib re do sib la sol
    fa mib re do\mbreak sib4 sib
    sib mib8 re mib re mib re

    %16
    mib? re \parenthesize do sib la sol fa mib'
    re mib fa fa, sib4 fa
    sib r

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown


    s4 <6> s2
    s <6>
    <6->4 <6>8 <5> s2
    s1
    <6>2 <6>
    <6> <6>
    <6>4 <6 5> s2
    s1
    s4 <6> s2
    <_->4 <6-> <6>2
    <6>4 <_-> <_!>2
    s1
    s2 <_->
    s1
    s4 <5> <5> s
    <5>2 <6>
    <6>4 <4>8 <3> s4 <4>8 <3>

}

forma = {

    \key fa\major
    \time 4/4
    \tempo 2 = 65
    s1*8
    \bar ":..:"
    s1*9
    s2
    \bar":|."

}

Vob = {
    \Vglobal
    <<\Vobn \forma>>

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

\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

#(set-global-staff-size 16)

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller {"Sinfonia n. 12"}
        composer = \markup \center-column{"D. Scarlatti (1685-1757)"}
    }

    \markup \huge {[I.1] Allegro}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
        } <<

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column  {"Oboè"}
                \set Staff.midiInstrument = #"oboe"
                \set Staff.shortInstrumentName = "ob"
                \Iob
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column {"VV. [I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column {"VV. [II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column  {"Violett[a]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.instrumentName =  \markup \center-column  {"[Basso]"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1 8)
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

    %\pageBreak

    \markup \huge {[I.2] Grave}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
        } <<

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column  {"Oboè"}
                \set Staff.midiInstrument = #"oboe"
                \set Staff.shortInstrumentName = "ob"
                \IIob
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column {"VV. [I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column {"VV. [II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column  {"Violett[a]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.instrumentName =  \markup \center-column  {"[Basso]"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1 4)
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

    \markup \huge {[I.3] Minuet allegro}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
        } <<

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column  {"Oboè"}
                \set Staff.midiInstrument = #"oboe"
                \set Staff.shortInstrumentName = "ob"
                \IIIob
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column {"VV. [I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column {"VV. [II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column  {"Violet[ta]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.instrumentName =  \markup \center-column  {"[Basso]"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1 4)
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

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller {"Sinfonia n. 13"}
        composer = \markup \center-column{"D. Scarlatti (1685-1757)"}
    }

    \markup \huge {[II.1] Presto}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
        } <<

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column  {"Oboè"}
                \set Staff.midiInstrument = #"oboe"
                \set Staff.shortInstrumentName = "ob"
                \IVob
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column {"VV. [I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column {"VV. [II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column  {"Violett[a]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff
            <<
                \set Staff.instrumentName =  \markup \center-column  {"[Basso]"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1 8)
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

    \markup \huge {[II.3] Prestis.\super mo}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
        } <<

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column  {"Oboè"}
                \set Staff.midiInstrument = #"oboe"
                \set Staff.shortInstrumentName = "ob"
                \Vob
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column {"VV. [I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VvlI
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column {"VV. [II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \VvlII
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column  {"Violett[a]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new Staff
            <<
                \set Staff.instrumentName =  \markup \center-column  {"[Basso]"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {

            indent = 1.4\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1 8)
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
