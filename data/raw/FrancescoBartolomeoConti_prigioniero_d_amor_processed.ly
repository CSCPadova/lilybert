\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

MyCadenza = \relative do'' {

\cadenzaOn

s1^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza I]"}\bar "|"

\cadenzaOff

}

MyCadenzabis = \relative do'' {

\cadenzaOn

s2.^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza III]"}\bar "|"

\cadenzaOff

}

salta = #(skip-of-length MyCadenza)

saltabis = #(skip-of-length MyCadenzabis)

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

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto solo"

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

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


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

Ivocen = \relative do'' {

    \autoBeamOff
    R4.*9
    sol8 la4
    si8 do16[si] la[sol]

    %12
    re4.
    r16 re' mi re do si
    do4.\mbreak

    %15
    r16 do do[la] si[do]
    fad,4.
    do'4 si8

    %18
    re16[mi] dod8. re16
    re4 r8
    r re re

    %21
    mi fa16[mi] re[do]\mbreak
    re4 r8
    r16 sol sol mi mi do

    %24
    do4 r8
    r16 fad fad[re] re[si]
    si4.

    %27
    r16 mi mi do do la\mbreak %%% fine prima pagina
    la4.
    r16 re re[si] si[sol]

    %30
    sol4.
    do
    la

    %33
    re,4 si'8
    la16[sol] fad8. sol16
    sol4.\mbreak

    %36
    r16 re' re si do re
    mi4 fad8
    sol16 sol, fad?8. sol16

    %39
    sol4.
    R4.*9
    re'8 mi8. re16

    %50
    do[si] do8 r\mbreak
    do re8. do16
    si[la] si8 r

    %53
    si do8. si16
    la[sol] la8 r
    la si8. la16

    %56
    sol si la8. si16\mbreak
    si4.
    re8 mi8. re16

    %59
    do[si] do8 r
    fa!16[mi] re[do] si[la]
    sold[fad] mi8 r\mbreak

    %62
    mi'8 mi mi
    mi16[dod] re8 r
    do! do do

    %65
    do16[la si8] r
    sol sol sol
    fad si16[lad si8]~

    %68
    si16 dod lad8. si16\mbreak
    si dod re8 do16[si]
    do4.

    %71
    la8 la la
    red8[mi16 red] mi8~
    mi16 sol, fad8. mi16

    %74
    mi4.

}

Itesto = \lyricmode {

    Prigio - nie -- ro d'a -- mor del mio più lie -- to cor non v' è

    no no no non v'è no no prigio - nie -- ro d'a -- mor del mio più lie -- to cor non v'è

     no no del mio più lie -- to cor non v'è no no no no no no non v'è no no

     del mio più lie -- to cor no no non v'è no no.

     Se m'in -- ca -- tena _  tuo bel crin d'o -- ra più non im -- ploro _

     la liber - tà la liber - tà, baci - ar vogl' io ca -- ro_I -- dol mio _

     quel -- la ca -- tena _ che mi le -- gò quel -- la cate - na che mi le -- gò che mi le -- gò

     quel -- la cate - na che mi le -- gò.

}



Ibcn = \relative do {

    sol'8 la4
    si8 do16 si la sol
    re(re') re(do) do(si)

    %4
    si(sol) sol(fad) fad(mi)
    mi do' do la si do
    fad, do' do la si do

    %7
    re,8. fad16 sol8
    do, re re,\mbreak
    sol'8 sol, r

    %10
    sol' fad4
    sol sol,8
    re'16 re're do do si

    %13
    si4 sol8
    la16 do do la si do\mbreak
    fad,4.

    %16
    r16 do' do la si do
    re,8 fad sol
    fad16 sol la8[la,]

    %19
    re16 re' re si do re
    sol,8 sol,4
    do8 do,4\mbreak

    %22
    \once\stemUp sol'16 re'' re si do re
    sol,4 r8
    r16 do do la si do

    %25
    re,4 r8
    r16 si' si sol la si
    do,4 r8\mbreak

    %28
    r16 la' la fad sol la
    si,4 r8
    r16 sol' sol mi fad sol

    %31
    do, do' do la si do
    fad, do' do la si do
    re,8. fad16 sol8

    %34
    do, re re,
    \once\stemUp sol16 re'' re si do re
    sol,4 r8

    %37
    r16 do, si do re re,
    mi' do re8[re,]
    sol4.

    %40
    sol'8 la4
    si8 do16 si la sol
    re(re') re(do) do(si)\mbreak

    %43
    si(sol) sol(fad) fad(mi)
    mi do' do la si do
    fad, do' do la si do

    %46
    re,8. fad16 sol8
    do, re re,
    \once\stemDown sol' sol,\fermata r

    %49
    sol'4.
    la16 do do la si do\mbreak
    fad,4.

    %52
    sol16 si si sol la si
    do,4.
    fad16 la la fad sol la

    %55
    si,4 dod8
    mi16 re do?4\mbreak
    si16 si' si la la sold

    %58
    sold?4.
    la16 do do la si do
    re,4.

    %61
    mi16 mi' mi do re mi\mbreak
    la,4 lad8
    r16 si lad si si, si'

    %64
    mi,8 fad mi
    red si dod16 red
    mi fad sol mi fad sol

    %67
    lad,8 fad re'16[dod]
    re mi fad8[fad,]\mbreak
    si sold' mi

    %70
    la,16 la' la fa sol la
    red, fad fad red mi fad
    si,4 do!8

    %73
    la si4
    mi4.

}


Ibfn = \figuremode {

        \bassFigureExtendersOff
        \bassFigureStaffAlignmentDown

        s4.*16
        <7>8 <6 5> s
        s4.*15
        s8. <6>16 s8
        <6> <6 5> <_+>

}

forma = {

    \time 3/8
    \key do\major
    \tempo 4 = 60
    s4.*74
    \bar "||"
    \mark\markup\smaller\center-column{"Da""Capo"}

}

Ivoce = {
    \new Voice = "prigioniero"
    \Iglobal
    %\notypeset
    <<\Ivocen \forma >>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}

IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIvocen = \relative do'' {

    \autoBeamOff

    r4 r8 re la la la si
    sol4 sol r8 dod re mi
    sol,4 r sol8 sol16 sol sol8 fad
    fad? fad r4 do'8 do16 do si8 la
    si si r si16 do re4. do16 si
    do4 r r8 do la sol
    mi mi r4 r2

}

IItesto = \lyricmode {

    Co -- sì degl' au -- rei sta -- mi qual rosi - gnol cin -- to di più ri -- sorte _

    can -- to fra quei le -- gami _ di si ca -- ra pri -- gion la dol -- ce sor -- te.

}



IIbcn = \relative do {

    re1
    re~
    re~
    re2 re
    sol sold
    la1
    si2 mi,

}


IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 40
    s1*7
    \bar "||"

}

IIvoce = {
    \new Voice = "stami"
    \IIglobal
    %\notypeset
    <<\IIvocen \forma >>

}

IIbc= {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset

}

IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

IIIvocen = \relative do'' {

    \autoBeamOff

    R2.*16
    sol4 si8[la] sol4
    la re, re'

    %19
    do re8 [do] si [la]
    si[la] sol4 si
    do8[si] la[sol] fad[mi]\mbreak

    %22
    fad[mi] re4 r
    R2.*5
    sol4 si8[la] sol4

    %29
    la re, re'
    do re8 [do] si [la]
    si[la] sol4 si

    %32
    do8[si] la[sol] fad[mi]
    fad[mi] re4 r
    r re' mi

    %35
    dod8[si] la4 re\mbreak
    re4. mi8 re[dod]
    re2 la4

    %38
    sol2 la8 sol
    fad4 r r
    r re'4 re

    %41
    \tuplet 3/2 { mi8 [re mi] do[si do] } la4
    \tuplet 3/2 { re8 [do re] si[la si] } sol4\mbreak
    do8[si] do[si] do4

    %44
    do8[si] do[si] do4
    do8[la] si4 re
    \tuplet 3/2 { mi8 [re mi] do[si do] la [re do]

    %47
    re [do re] si[la si] sol [do si]
    do [si do] la[sol la] fad [si la]}
    si[la] sol4 re'

    %50
    \tuplet 3/2 { mi8[re mi] do[si do] la[sol la] }
    re,4 re' do
    \tuplet 3/2 { si8[la sol] } fad4. sol8

    %53
    sol2 la4
    si do8[si la sol]
    re'2.~

    %56
    re\parentSlur (
    re)~
    re~

    %59
    \tuplet 3/2 { re8[mi fad] sol[fad mi] re[mi do]}
    si4. la8[sol fad]
    sol[la] fad4. sol8

    %62
    sol4 r r
    R2.*15
    r4\fermata re' re\mbreak

    %79
    mi mi do8[si]
    re4 re si8 sol
    do4 la8[si]  do4

    %82
    do re8[do] si[la]
    si[la] sol4 r
    r mi'4. re8\mbreak

    %85
    do8[si] la4 r
    r fad'4. mi8
    re[dod] si4 r

    %88
    r \tuplet 3/2 { si8[re dod] re[fad mi] }
    fad4. mi8 re[dod]
    re[si] lad4. si8\mbreak

    %91
    si4 r r
    r fad'8[mi] fad4
    sol, mi'8[re] mi4

    %94
    fad, re'8[dod] re4
    mi, dod'8[re] mi4~
    mi8[fad] sol4 fad8[mi]

    %97
    red4 mi4. si8
    do!4 si4. mi8
    mi4. fad?8 mi red\mbreak

    %100
    mi2 do4
    si4. la8 sol fad
    mi[red] mi[sol] \tuplet 3/2 { fad[sol mi] }

    %103
    fad[mi] fad[la] \tuplet 3/2 { sol[la fad] }
    sol[fad sol si] \tuplet 3/2 { la[si sol] }
    la[sol la do] \tuplet 3/2 { si[do la]}

    %106
    si[la sol si] \tuplet 3/2 { la[si sol] }
    la[sol fad la] \tuplet 3/2 { sol[la fad]}
    sol2 fad4

    %109
    mi8 fad red4. mi8
    mi4 r r

}

IIItesto = \lyricmode {

    Torto - - rel -- la che stret -- to si ve -- de il tene - ro pie -- de

    Torto - - rel -- la che stret -- to si ve -- de il tene - ro pie -- de

    col suo spo -- so che gio -- ia non ha che gio -- ia non ha

    Torto - re - lla che stretto si ve -- de il tene - ro pie -- de

    che gio - - - - - - - - ia che gio - - - ia che gio -- ia non ha che gio -- ia non ha  - che gio - - ia non ha.

    Sem -- bra è ver ai Pas -- tor che sia pian -- to quel flebi - le can -- to

    ma si ri -- de ma si ri -- de ma si ri -- de di sua libertà - -

    ma si ri -- de di sua libertà - - - - - - - ma si ri -- de di sua libertà - - di sua libertà - - - - - - - - - - - - - - - - - -  di sua _

    liber - tà.

}

IIItrbn = \relative do {

    sol'4 si8 la sol4
    la re, re'
    do re8 do si la

    %4
    si la sol4 re'
    \clef tenor <<{\senza\tuplet 3/2 { mi8 re mi }}\\do,4>> \tuplet 3/2 { do'8 re mi } la,[mi']
    <<{\senza \tuplet 3/2 { re do re }}\\si,4>> \tuplet 3/2 { si'8 do re } sol,[re']

    %7
    <<{\senza \tuplet 3/2 { do si do }}\\la,4>> \tuplet 3/2 { la'8 si do } fad,[do']\mbreak
    <<si4\\sol,>> sol'8 re' re re
    <<
        {
            \senza \override TupletBracket.bracket-visibility = ##f \tuplet 3/2 {
                mi do mi mi[do mi] mi do mi

                %10
                fad re fad fad[re fad] fad re fad
                sol re sol sol[re sol] sol re sol
                sol mi sol sol]mi sol] sol mi sol

                %13
                sol re sol sol[re sol] sol re sol
                mi sol sol re[sol sol] re sol fad\mbreak
                sol re do
            }
        }\\{
            do,4 r do
            re r re
            si r si
            do r do
            si r si
            do re2
            sol,4
        }
    >> \tuplet 3/2 {
        si'8 do re si[do re]

        %16
        \clef bass sol, re do si[do re] si do re
    }
    sol,2 sol'4
    fad2 re4

    %19
    mi2 fad4
    sol2 sol,4
    la2 do4\mbreak %%% fine pagina 4

    %22
    re2 re'4
    \tuplet 3/2 { mi8 re mi do[re mi] } la, do
    \tuplet 3/2 { re do re si [do re] } sol, re'

    %25
    \tuplet 3/2 { do si do la[si do] } fad, do'
    si sol \tuplet 3/2 {
        re' do si la[si sol]
        fad re sol la,[sol' sol] <re la> sol fad
    }

    %28
    sol,2 sol'4\mbreak
    fad2 re4
    mi2 fad4

    %31
    sol2 sol,4
    la2 do4
    \tuplet 3/2 { re8 re' re la[re re] fad, re' re }

    %34
    re,4 fad sol
    la2 fad4\mbreak
    sol2 la4

    %37
    re,2 fad4
    mi2 la,4
    \tuplet 3/2 { re8 re' re re, [re' re] re, re' re}

    %40
    re,2 si4
    do r r
    si r r\mbreak  %% fine pagina 5

    %43
    la2 sol4
    fad2 re4
    sol2 si'4

    %46
    \tuplet 3/2 {
        do8 si do la[sol la] fad si la
        si la si sol[fad sol] mi la sol
        la sol la fad [mi fad] re sol fad\mbreak
    }

    %49
    sol4 sol, si'
    \tuplet 3/2 { do8 si do la[sol la] fad mi fad }
    re4 si' la

    %52
    sol re re,
    sol sol' fad
    sol r r

    %55
    \tuplet 3/2 {
        re8 re' re la[re re] la re re
        si re re si[re re] si re re\mbreak
        la re re la[re re] la re re

        %58
        si re re si[re re] si re re
    }
    sol,4 r r
    \clef tenor \tuplet 3/2 { re'8 mi fad sol[fad mi] re mi do}

    %61
    \clef bass si do re4 re,
    sol si8 la sol4
    la re, re'\mbreak %%% fine pagina 6

    %64
    do4 re8 do si la
    si la sol4 re'
    \clef tenor <<{\senza\tuplet 3/2 { mi8 re mi }}\\do,4>> \tuplet 3/2 { do'8 re mi } la,[mi']

    %67
    <<{\senza \tuplet 3/2 { re do re }}\\si,4>> \tuplet 3/2 { si'8 do re } sol,[re']
    <<{\senza \tuplet 3/2 { do si do }}\\la,4>> \tuplet 3/2 { la'8 si do } fad,[do']\mbreak
    <<si4\\sol,>> sol'8 re' re re

    %70
    \tuplet 3/2 {
        mi do mi mi[do mi] mi do mi
        fad re fad fad[re fad] fad re fad
    }
    <<
        {
            \senza \override TupletBracket.bracket-visibility = ##f \tuplet 3/2 {
                sol re sol sol[re sol] sol re sol

                %73
                sol mi sol sol]mi sol] sol mi sol
                sol re sol sol[re sol] sol re sol
                mi sol sol re[sol sol] re sol fad\mbreak

                %76
                sol re do
            }
        }\\{
            si,4 r si
            do r do
            si r si
            do re2
            sol,4
        }
    >> \tuplet 3/2 {
        si'8 do re si[do re]
        \clef bass sol, re do si[do re] si do re
    }
    sol,2_\fermata sol'4

    %79
    do, r r
    si r r
    la la' sol

    %82
    fad2 re4
    \clef tenor \tuplet 3/2 { sol8 la si si[do re] re mi fa }
    fa la, sold4 sold\mbreak %%% fine pagina 7

    %85
    \tuplet 3/2 {la8 si do do[re mi] mi fad sol}
    sol si, lad2
    \tuplet 3/2 {fad8 si lad si[re dod] re fad mi}

    %88
    fad4 re dod
    \clef bass \tuplet 3/2 {si,8 re dod re[fad mi] fad si lad}
    si mi, fad4 fad,\mbreak

    %91
    \tuplet 3/2 {si8 re dod re[fad mi] fad si lad}
    si4 si,8 dod re4
    mi2 dod4

    %94
    re2 si4
    dod2 si4
    lad r r

    %97
    si sol4. sol'8
    la4 sol4. la8
    si2 si,4\mbreak

    %100
    mi2 la,4
    si2.
    do4 r r

    %103
    si r r
    \clef tenor mi'8 red mi sol \tuplet 3/2 {fad sol mi]}
    fad mi fad la\tuplet 3/2 {sol[la fad]}

    %106
    sol fad mi sol \tuplet 3/2 {fad sol mi]}
    fad mi red fad \tuplet 3/2 {mi[fad red]}
    mi2 si4

    %109
    \clef bass mi,8 la si4 si,
    mi r r

}


IIIbcn = \relative do {

    sol'2.
    fad2 re4
    mi2 fad4

    %4
    sol2 si4
    do r r
    si r r

    %7
    la r r\mbreak
    sol2 do,8 si
    do4 r do

    %10
    re r re
    si r r
    do r r

    %13
    do r r
    do re2\mbreak
    sol,4 r r

    %16
    sol r r
    sol2 sol'4
    fad2 re4

    %19
    mi2 fad4
    sol2 sol,4
    la2 do4\mbreak %%% fine pagina 4

    %22
    re2 si4
    do r r
    si r r

    %25
    la r r
    sol2 do4
    re2 re,4

    %28
    sol2 sol'4\mbreak
    fad2 re4
    mi2 fad4

    %31
    sol2 sol,4
    la2 do4
    re r r

    %34
    r fad sol
    la2 fad4\mbreak
    sol2 la4

    %37
    re,2 fad4
    mi2 la,4
    re r r

    %40
    re2 si4
    do r r
    si r r\mbreak  %% fine pagina 5

    %43
    la2 sol4
    fad2 re4
    sol2 si4

    %46
    do r r
    si r r
    la r r\mbreak

    %49
    sol2 si4
    do r r
    re r r

    %52
    sol re re,
    sol sol' fad
    sol r r

    %55
    re2 fad4
    sol2 sol4\mbreak
    fad2 re4

    %58
    sol r r
    sol2 fad4
    sol2 sol,4

    %61
    si8 do re4 re,
    sol2 sol'4
    fad2 re4\mbreak

    %64
    mi2 fad4
    sol2 si4
    do r r

    %67
    si r r
    la r r
    sol2 do,8 si

    %70
    do4 r r
    re r re\mbreak
    si r r

    %73
    do r r
    do r r
    do re2

    %76
    sol,4 r r
    sol r r
    sol2_\fermata sol'4\mbreak

    %79
    do, r r
    si r r
    la la' sol

    %82
    fad2 re4
    sol r r
    sold mi2\mbreak

    %85
    la4 r r
    lad fad2
    si, dod4

    %88
    re2 dod4
    si2 fad'4
    si8 mi, fad4 fad,\mbreak

    %91
    si r r
    si4. dod8 re4
    mi2 dod4

    %94
    re2 si4
    dod2 si4
    lad r r

    %97
    si sol4. sol'8
    la4 sol4. la8
    si2 si,4\mbreak

    %100
    mi2 la,4
    si2.
    do4 r r

    %103
    si r r
    mi r r
    fad r r

    %106
    sol r r
    fad2 si,4
    mi2 si'4

    %109
    mi,8 la, si2
    mi,4 r r

}


IIIbfn =  \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \key do\major
    \tempo 2 = 50
    s2.*110
    \bar "||"
    \mark\markup\smaller\center-column{"Da""Capo"}

}

IIIvoce = {
    \new Voice = "tortorella"
    \IIIglobal
    %\notypeset
    <<\IIIvocen \forma >>

}

IIItrb = {
    \IIIglobal
    \clef bass
    <<\IIItrbn \forma \IIIbfn>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}

\pointAndClickOff

    #(set-global-staff-size 18)

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #7

    }

    \header {
        subtitle = "Cantata con Tiorba ”Prigioniero d'amor”"
        composer = \markup \center-column{"   ""F. B. Conti (1681c-1732)"}
    }

    \markup \huge {[1.] Aria}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major\time 3/8  r4.^\markup \right-align"[Contralto]" }
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \Ivoce
                \new Lyrics \lyricsto "prigioniero" \Itesto
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"harpsichord"
                \set Staff.instrumentName = \markup  \center-column{"Tiorba e""Cembalo"}
                \Ibc
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #12
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner
                #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \markup \huge {[2.] Recit[ativo]}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major\time 4/4  r4 r8 }
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IIvoce
                \new Lyrics \lyricsto "stami" \IItesto
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"harpsichord"
                \IIbc
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #12
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner
                #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

        systems-per-page = #5

    }

    \markup \huge {[3.] Air}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major\time 3/4  \numericTimeSignature r2.^\markup \right-align"" }
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IIIvoce
                \new Lyrics \lyricsto "tortorella" \IIItesto
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"acoustic guitar (nylon)"
                \set Staff.instrumentName = \markup {"Tiorba"}
                \IIItrb
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"harpsichord"
                \set Staff.instrumentName = \markup {"Cembalo"}
                \IIIbc
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override BarLine.hair-thickness = #1.2
                %\override SpacingSpanner.uniform-stretching = ##t
                \override SpacingSpanner
                #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80, 2.20.0
%}
