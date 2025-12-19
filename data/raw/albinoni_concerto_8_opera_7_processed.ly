\language "italiano"
	%********************************** VARIABILI
	
su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

gambd = \set stemRightBeamCount = #1

gambs = \set stemLeftBeamCount = #1

gambss = \set stemLeftBeamCount = #2

gambdd = \set stemRightBeamCount = #2

pipeSymbol = \bar "||"

tr = ^\markup \italic "tr"

p = _\markup \italic "p"

fo = _\markup \italic "f"

cres = _\markup \italic "cres"

vite = ^\markup \large \center-align"Vite"

lent = ^\markup \large \center-align"Lent"

sord = _\markup \italic {sord.\super o}

piano = _\markup \italic "piano"

dolce = _\markup \italic "dolce"

forte = _\markup \italic "forte"

fss = _\markup \italic {fortiss\super mo}

sf = _\markup \italic \bold "sf"

pp = _\markup \italic "più piano"

ff = _\markup \italic "ff"

mf = _\markup \italic "mf"

pizz = _\markup \italic "pizzic"

for = _\markup \italic "for."

pofo = _\markup \italic "pf"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

trio = ^\markup \italic {trio}

tu = _\markup \italic "Tutti"

ts = ^\markup \italic \bold "T. S."

pia = _\markup \italic "pia."

fi = _\markup \italic "Fine."

fin = ^\markup "Fin"

pad = \once \override TextScript #'padding = #2.5

padall = \override TextScript #'padding = #1.6 

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \set tupletSpannerDuration = #(ly:make-moment 1 8)

sedicine = \set tupletSpannerDuration = #(ly:make-moment 1 16)

terzinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

sestine = \set tupletSpannerDuration = #(ly:make-moment 1 2)

ds = _\markup \italic \right-align {"Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

terzinesenza = \override TupletNumber #'transparent = ##t

terzinecon = \override TupletNumber #'transparent = ##f

volti = _\markup \italic \bold \column {"Volti"}

tasto = _\markup \italic "Tasto solo"

mbreak = { }

Iglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.4
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzine \terzinecon

}

IhbIn = \relative do'' {

    r8
    R1*7
    r2 r4 r8 la'
    fad sol la si la fad16 sol la8[si]

    %10
    la sol16 fad sol8[mi] fad4 r
    R1*3
    r4 r8 la fad sol la si

    %15
    la fad16 sol la8[si]\mbreak la sol16 fad sol8[mi]
    fad fad16 mi fad sold la si mi,8 la sold4
    la r r2

    %18
    R1*2
    r2 r4 r8 mi
    dod re mi fad mi dod16 re mi8[fad]

    %22
    mi16 re dod re mi8[fad] mi4 r8 la
    fad sol la si la fad16 sol la8[si]\mbreak
    la16 sol fad sol la8 si la4 r8 la

    %25
    si la sol16 la fad sol mi8 la4 sol16 fad
    mi8 la4 sol16 fad mi8 fad16 sol la8[la]
    la sol16 fad mi4 re r

    %28
    R1*3
    r8 la' la4 r2
    r8 la16 sol la si la sol fad4 r

    %33
    r8 fad16 mi fad sol fad mi\mbreak re4 r
    r8 fad fad4 r8 mi mi4
    r8 mi mi4 r8 re re4

    %36
    r8 re re4 r8 dod dod4
    r8 dod dod[dod] re fad si fad
    re16 si re fad si8 re,16 mi fad8 [si, si8. lad16]

    %39
    si4 r r2
    R1
    r2 la'8 mi fad[mi16 re]

    %42
    mi4 r\mbreak la8 mi fad[mi16 re]
    mi8[fad16 sol] la8 si la4 r
    r8 fad16 sol la8[si] la re, re16 fad mi re

    %45
    dod mi fad sol la4 r8 sol sol4
    r8 sol sol4 r8 fad fad4
    r8 fad fad4 r8 mi mi4

    %48
    r8 mi mi[dod] re4 r
    r r8 mi\mbreak mi[dod16 re] mi8 fad
    mi4 r8 la la fad16 sol la8[si]

    %51
    la4 r8 la si la sol16 la fad sol
    mi4 r8 fad mi16 re mi fad mi8 fad
    mi4 r8 fad mi16 re mi fad mi8 fad

    %54
    sol si la sol fad4 mi
    re r la'8 fad16 sol la8[si]
    la4 r\mbreak la8[fad16 sol] la8 si

    %57
    la fad16 sol la8[si] la sol16 fad mi4
    re2. r8

}

IhbIIn = \relative do'' {

    r8
    R1*7
    r2 r4 r8 fad
    re mi fad sol fad re16 mi fad8[sol]

    %10
    fad mi16 re mi8[dod] re4 r
    R1*3
    r4 r8 fad re mi fad sol

    %15
    fad re16 mi fad8[sol]\mbreak fad mi16 re mi8[dod]
    re re16 dod re mi fad sold la mi re dod si4
    la r r2

    %18
    R1*2
    r2 r4 r8 dod
    la si dod re dod la16 si dod8[re]

    %22
    dod16 si la si dod8[re] dod4 r8 dod
    re mi fad sol fad re16 mi fad8 sol\mbreak
    fad16 mi re mi fad8 sol fad4 r8 re

    %25
    re re mi16 fad re mi dod8 re16 mi fad8 mi16 re
    dod8 re16 mi fad8 mi16 re dod8 re16 mi fad sol fad mi
    re fad mi re dod4 re r

    %28
    R1*3
    r8 dod dod4 r2
    r8 mi fad16 sol fad mi re4 r\mbreak

    %33
    r8 re16 dod re mi re dod si4 r
    r8 re re4 r8 sol sol4
    r8 dod, dod4 r8 fad fad4

    %36
    r8 si, si4 r8 mi mi4
    r8 lad, lad[lad] si re fad re
    si4 r8 fad'16 mi re fad mi re dod4

    %39
    si r r2
    R1
    r2 dod8 dod re dod16 si\mbreak

    %42
    dod4 r dod8 dod re dod16 si
    dod8 re16 mi fad8 sol fad4 r
    r8 re16 mi fad8 sol fad fad si,16 re sol fad

    %45
    mi dod re mi fad4 r8 si si4
    r8 mi, mi4 r8 la la4
    r8 re, re4 r8 sol sol4

    %48
    r8 dod, dod[mi] fad4 r
    r r8 dod\mbreak dod la16 si dod8 re
    dod4 r8 fad fad re16 mi fad8 sol

    %51
    fad4 r8 re re re si16 dod re mi
    dod4 r8 re dod16 si dod re dod8 re
    dod4 r8 re dod16 si dod re dod8 re

    %54
    si sol' fad re re4 dod
    re r fad8 re16 mi fad8 sol\mbreak
    fad4 r fad8 re16 mi fad8 sol

    %57
    fad re16 mi fad8 sol fad mi16 re dod4
    re2. r8

}


IvlIn = \relative do'' {

    la8
    re,16 mi fad sol la sol fad mi re si' dod re re, si' dod re
    mi, dod' re mi la, fad' sol la fad8 re r16 re mi fad\mbreak
    sol fad sol la si la si dod re dod si la si la re la

    %4
    si la re la si la sol fad mi8 la, r16 la' sol la
    fad re dod re si' la sol fad mi dod si dod la' sol fad mi
    re si la si sol' fad mi re\mbreak dod la si dod re mi fad sol

    %7
    \repeat unfold 4{la[la la la]}
    la si sol fad mi4 re r
    R1

    %10
    r4 r8 la re,16 mi fad sol la sol fad mi
    re si' dod re re, si' dod re\mbreak mi, dod' re mi la, fad' sol la
    fad re mi fad sol la si dod re dod si la si la re la

    %13
    si la re la si la re fad, sol8 fad16 mi mi4
    re r r2
    R1

    %16
    r2 r4 r8 mi
    la,16 si dod re mi re dod si\mbreak la fad' sold la la, fad' sold la
    si, sold' la si mi, si' dod re dod8 la r16 la sold la

    %19
    fad re si re si' re, dod re sold mi mi mi la mi mi mi
    la mi re dod si4\mbreak la r
    R1

    %22
    r2 r8 la' la4
    r8 sol fad [sol] re re' re4
    r8 re re4 r8 re re [fad,]

    %25
    sol fad si,16 dod re si dod8 la16 sol fad re' mi re
    dod si la sol fad re' mi re\mbreak dod8 la'16 sol fad sol fad mi
    re fad mi re dod4 re16 la fad sol la sol fad mi

    %28
    re si' dod re re, si' dod re mi, dod' re mi la, fad' sol la
    fad8 re r16 re mi fad sol fad sol la si la si dod\mbreak
    re dod si la si la re la si la re la si la sol fad

    %31
    mi8 la, r la16 si dod la dod re mi fad sold mi
    la8 la, r re16 mi fad re fad sol la si dod la
    re8 si, r si16 dod\mbreak re si re mi fad sold lad fad

    %34
    si8 si, r fad' sol16 si, sol' si, sol' si, sol' si,
    sol' dod, sol' dod, sol' dod, sol' dod, fad dod fad dod fad dod fad dod
    fad si, fad' si, fad' si, fad' si, mi si mi si mi si mi si\mbreak

    %37
    mi lad, mi' lad, mi' lad, mi' lad, re fad re si re fad re si
    si' fad re si re fad re si si' fad mi re dod4
    si16 dod re mi fad si, si' la sol4 r

    %40
    la,16 si dod re mi la, la' sol fad4 r8 fad\mbreak
    sol16 fad sol la fad mi fad sol mi4 r
    r8 dod16 re mi8 fad mi4 r

    %43
    r2 re'8 la si la16 sol
    la4 r re8 la si16 la sol fad
    mi8 fad16 sol la fad sol la si re, si' re, si' re, si' re,

    %46
    si' mi, si' mi, si' mi, si' mi,\mbreak la mi la mi la mi la mi
    la re, la' re, la' re, la' re, sol re sol re sol re sol re
    sol dod, sol' dod, sol' dod, sol' dod, fad mi re dod re mi fad sol

    %49
    \repeat unfold 16{la}
    la la si dod \repeat unfold 12 {re}
    re re re re re dod si la sol la fad sol mi fad re mi

    %52
    dod8 la' la,4 r8 la' la,4
    r8 la' la,4  r8 la' la,[fad']
    mi sol fad re re4 dod8 la'

    %55
    la fad16 sol la8 si\mbreak la4 r
    la8 fad16 sol la8 si la4 r8 sol
    fad4 r8 re re16 fad mi re dod4

    %58
    re2. r8

}

IvlIIn = \relative do'' {

    la8
    re,16 mi fad sol la sol fad mi re si' dod re re, si' dod re
    mi, dod' re mi la, fad' sol la fad8 re r16 re mi fad\mbreak
    sol fad sol la si la si dod re dod si la si la re la

    %4
    si la re la si la sol fad mi8 la, r16 la' sol la
    fad re dod re si' la sol fad mi dod si dod la' sol fad mi
    re si la si sol' fad mi re\mbreak dod la si dod re mi fad sol

    %7
    \repeat unfold 4{la[la la la]}
    la fad mi re dod4 re r
    R1

    %10
    r4 r8 la re,16 mi fad sol la sol fad mi
    re si' dod re re, si' dod re\mbreak mi, dod' re mi la, fad' sol la
    fad re dod re si dod re mi la,8 re re re

    %13
    re re re re dod re re dod\mbreak
    re4 r r2
    R1

    %16
    r2 r4 r8 mi
    la,16 si dod re mi re dod si\mbreak la fad' sold la la, fad' sold la
    si, sold' la si mi, si' dod re dod8 la  mi dod

    %19
    re fad re fad si, si dod sold
    la la la sold la4 r
    R1

    %22
    r2 r8 dod dod[mi]\mbreak
    fad mi re re16 mi fad4 r8 re
    re,4 r8 re' re, fad' la re,

    %25
    si fad sol si mi, fad16 sol la8 si
    mi, fad16 sol la8 si mi,16 mi' fad mi re8 la16 sol
    fad8 si mi, la la fad16 sol la sol fad mi

    %28
    re si' dod re re, si' dod re mi, dod' re mi la, fad' sol la\mbreak
    fad8 re r16 re mi fad sol fad sol la si la si dod
    re dod si la si la re la si la re la si la sol fad

    %31
    mi8 la, r4 r8 la16 si dod8 si
    dod4 r r8 re16 mi fad8 mi
    fad4 r r8 si,16 dod re8 dod

    %34
    re4 r8 si' si4 r8 si
    la4 r8 la la4 r8 la\mbreak
    sol4 r8 sol sol4 r8 sol

    %37
    fad4 r8 fad fad4 r
    re r8 re re si si8. lad16
    si4 r mi,16 fad sol la si mi, mi' re

    %40
    dod4 r re,16 mi fad sol la re, re' dod
    si la si dod re dod re mi dod4 r
    r8 la16 si dod8 re dod4 r

    %43
    r2 fad8 fad sol fad16 mi\mbreak
    fad4 r fad8 fad sol16 fad mi re
    dod8 re16 mi fad re mi fad si,4 re

    %46
    dod4 r8 dod dod4 r8 dod
    si4 r8 si si4 r8 si
    la4 r8 la la4 r8 re

    %49
    dod16 la' \repeat unfold 14 {la}
    la la si dod \repeat unfold 12 {re}
    re re re re re dod si la sol la fad sol mi fad re mi

    %52
    dod4 r8 la' la,4 r8 la'
    la,4 r8 la' la,4 r8 la'
    sol si,16 dod re8 re la si mi, mi'

    %55
    fad re16 mi fad8 sol fad4 r
    fad8 re16 mi fad8 sol fad4 r8 re\mbreak
    re4 r8 si la si mi, la

    %58
    fad2. r8

}

Ivlan = \relative do' {

    fad8
    fad4 mi8 la si4 la
    sol8 si, dod mi re16 mi fad sol la8 sol16 fad
    mi8 re sol mi re re re re

    %4
    re re re re dod dod re mi
    fad4 r8 re\mbreak mi4 r8 dod
    re4 r8 si' mi,4 re8 mi

    %7
    fad dod re fad mi re mi dod
    fad si mi, la fad4 r
    R1

    %10
    r2 fad4 mi8 la
    si4 la sol8 si, dod mi
    re la' sol sol fad fad sol la

    %13
    sol re sol la mi fad la la
    fad4 r r2
    R1*2

    %17
    dod4 si8 mi fad4 mi\mbreak
    re8 fad sold si la dod, la mi' fad la fad re mi mi dod si
    la fad' si, mi dod4 r

    %20
    R1
    r2 r8 mi mi4
    re r r2

    %23
    r r8 la' la[la]
    re, re si' si la4 fad8 sol
    dod, la' re, si do la' re,16 mi fad sol
    la8 si la la\mbreak fad4 mi8 la
    si4 la sol8 si, dod mi

    %28
    re16 mi fad sol
    la8 sol16 fad mi8 re sol mi
    re re re re re re re re

    %31
    dod4 r mi mi8 mi
    mi4 r la la8 la
    la4 r fad fad8 fad

    %34
    fad4 r8 re sol4 r8 sol
    mi4 r8 mi fad4 r8 fad\mbreak
    re4 r8 re mi4 r8 mi

    %37
    dod4 r8 dod si4 r
    fad' r8 fad fad sol dod, fad
    re si' si si si si16 la sol8 sol16 fad

    %40
    mi8 la la la la la16 sol fad8 fad16 mi
    re4 re8 si' mi,4 r
    mi la8 la la4 r

    %43
    r2 re,4 sol\mbreak
    re r fad re
    mi re re si'

    %46
    mi,8 sol mi sol la4 r8 la
    re,8 fad re fad sol4 r8 sol
    dod, mi la mi re4 r8 re

    %49
    mi4 r8 mi dod4 r8 re
    mi4 fad8 la fad4 r8 sol
    la4 fad si r

    %52
    la r r2
    mi4 r r r8 fad\mbreak
    mi sol la si fad re la' la

    %55
    la4 re,8 re re4 r8 re
    re la'16 sol fad8 re re4 r8 re
    re la'16 sol fad8 re re si' la4

    %58
    la2. r8

}

Ivcn = \relative do {

    re'8
    re4 dod si fad
    sol la re,8 mi fad re
    mi fad sol la si fad sol fad

    %4
    sol fad sol re la' la16 sol fad8[mi]
    re4 r8 si'\mbreak dod4 r8 la
    si4 r8 sol la sol fad mi

    %7
    re mi fad re la' si dod la
    re sol, la la, re4 r
    R1

    %10
    r2 re4 dod
    si fad' sol la
    re, mi fad8 re sol fad

    %13
    sol fad sol fad\mbreak mi re la' la,
    re4 r re r8 sol
    re'4 re,8 sol re4 sol,8 la
    re4 si dod8 re mi mi,

    %17
    la'4 sold fad dod
    re mi la8 la dod la
    re4 r8 re, mi8 sold la si

    %20
    dod re mi mi, la4 r
    R1
    r2 r8 la dod[la]

    %23
    re4 r r2
    r r8 re, fad[re]\mbreak
    sol re sol,[sol'] la16 sol fad mi re8 sol

    %26
    la16 sol fad mi re8 sol la16 sol fad mi re dod re mi
    fad8 sol la la, re re' dod4
    si fad sol la

    %29
    re,8 mi fad re mi fad sol la
    si fad sol fad\mbreak sol fad sol re
    la'4 r la, la8 mi'
    la,4 r re re8 la'
    re,4 r si' si8 fad

    %34
    si,4 r8 re mi mi sol mi
    la la dod la re re, fad re
    sol sol si sol\mbreak dod, dod mi dod

    %37
    fad fad lad fad si, si' si si,
    si4 r8 si re mi fad fad,
    si4 re\mbreak mi sol

    %40
    la dod, re fad8 re
    sol4 re8 sol, la4 r
    la' la8 re, la'4 r

    %43
    la re,8 sol re4 r
    re re8 sol re4 sol
    la fad8 re sol4 r8 sol  %%%OOKK

    %46
    dod, dod mi dod fad4 r8 fad
    si, si re si mi  mi sol mi
    la la dod la re, mi fad re

    %49
    la'4 r8 la, la4 r8 re
    la' sol fad mi re4 r8 sol
    re re fad re sol4 r

    %52
    la r r2
    la4 r r r8 re,
    mi mi fad sol la sol la la,

    %55
    re4 r8 sol re4 r8 sol\mbreak
    re fad16 mi re8 sol re4 r8 sol
    re fad16 mi re8 sol re sol la la,

    %58
    re2. r8

}


Ibcn = \relative do {

    re8
    re4 dod si fad
    sol la re8 mi fad re
    mi fad sol la si fad sol fad

    %4
    sol fad sol re la' la16 sol fad8[mi]
    re4 r8 si\mbreak dod4 r8 la
    si4 r8 sol' la sol fad mi

    %7
    re mi fad re dod si dod la
    re sol la la, re4 r
    R1

    %10
    r2 re4 dod
    si fad sol la
    re mi fad8 re sol fad

    %13
    sol fad sol fad\mbreak mi re la' la,
    re4 r r2
    R1*2

    %17
    la'4 sold fad dod
    re mi la8 la, dod la
    re4 re mi8 sold, la si

    %20
    dod re mi mi, la4 r
    R1
    r2 r8 la dod[la]

    %23
    re4 r r2
    r r8 re fad[re]\mbreak
    sol re sol,[sol'] la16 sol fad mi re8 sol

    %26
    la16 sol fad mi re8 sol la16 sol fad mi re dod re mi
    fad8 sol la la, re4 dod
    si fad sol la

    %29
    re8 mi fad re mi fad sol la
    si fad sol fad\mbreak sol fad sol re
    la'4 r la, la8 mi'
    la,4 r re re8 la'
    re,4 r si si8 fad'

    %34
    si,4 r8 re mi4 r
    la r re, r
    sol r dod, r

    %37
    fad r si, r
    si r8 si re mi fad fad,
    si4 re\mbreak mi sol

    %40
    la dod, re fad8 re
    sol4 re8 sol, la4 r
    la la8 re la4 r

    %43
    la re8 sol re4 r
    re re8 sol re4 sol,
    la fad'8 re sol4 r

    %46
    dod, r fad r
    si, r mi r
    la, r\mbreak re r8 si

    %49
    la4 r8 la la4 r8 re
    la' sol fad mi re4 r8 sol
    re re fad re sol4 r

    %52
    la r r2
    la,4 r r r8 re
    mi mi fad sol la sol la la,

    %55
    re4 r8 sol re4 r8 sol\mbreak
    re fad16 mi re8 sol re4 r8 sol
    re fad16 mi re8 sol re sol la la,

    %58
    re2. r8

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s4 <6> s <6>
    <6>2. <6>4
    s2 s8 <6> s4
    s2. <6>4
    s4. <6>8

    s4. <6>8
    s4. <6>8 s4 <6>
    s2 <6>
    s1*2
    s2. <6>4
    s <6> <6>2
    s <6>4. <6>8
    s <6> s <6>

    <6>4 <5 4>8 <3>
    s1*3
    s4 <6>2 <6>4
    s <_+> s <6>
    s <6> s8 <6> s4
    <6> <5 4>8 <_+> s2
    s1
    s2. <6>4
    s1
    s2. <6>4

    s <6> s s8 <6>
    s4 s8 <6> s2
    <6> s4 <6>
    s <6> <6>2
    s4 <6> s2
    s8 <6>4.

    s2
    s1*4
    <7>2 <7>
    <7> <7>
    <7 _+>1
    s2 s4 <5 4>8 <_+>
    s4 <6>

    s <6>
    s <6> s <6>
    s1*4
    s4 <6> <7>2
    <7> <7>
    <7> <7>
    <7>

    s4. <6>8
    s1
    s4 <6> s2
    s4 <6> s2
    s1
    s
    s4 <6> <6 4> <5 3>
    s1

    s8 <6>
}



forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 50
    \partial 8 s8
    s1*57
    s2. s8
    \bar "|."

}


IhbI = {
    \Iglobal
    %\notypeset
    <<\IhbIn \forma>>
}

IhbII = {
    \Iglobal
    <<\IhbIIn \forma>>
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


Ivc = {
    \Iglobal
    \clef bass
    <<\Ivcn \forma>>

}


Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}

IIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    %\padall
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.4
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzine \terzinecon

}


IIvlIn = \relative do'' {

    fad4 re mi
    fad sol8 fad sol fad
    mi2 r4

    %4
    mi4 dod re
    mi fad8 mi fad mi
    re2 r4

    %7
    re si dod
    re mi8 re mi re\mbreak
    dod8. [re16 re8. mi16 mi8. fad16]

    %10
    fad8. [mi16 mi8. re16 re8. dod16]
    dod8. [re16 re8. mi16 mi8. fad16]
    fad8. [mi16 mi8. re16 re8. dod16]

    %13
    dod8. [re16 dod8. re16 dod8. re16]
    mi4. fad8 re [dod]
    re mi dod2

    %16
    si r4
    mi2.
    fad4. sol8 la4~\mbreak

    %19
    la sol8.[fad16 mi8. re16]
    dod4 la re~
    re dod8. si16 dod4~

    %22
    dod fad, si~
    si la8. sold16 la4~
    la8. si16 sold2

    %25
    fad8.[fad'16 fad8. sol!16 sol8. la16]
    la4. la8 si8. la16
    sol8.[mi16 mi8. fad16 fad8. sol16]

    %28
    sol4. sol8 la8. sol16\mbreak
    fad8.[re16 re8. mi16 mi8. fad16]
    fad4. fad8 sol8. fad16

    %31
    mi8.[dod16 dod8. re16 re8. mi16]
    mi4. mi8 fad8. mi16
    re4. mi8 fad4~

    %34
    fad si mi,
    mi4. fad8 re [dod]
    re mi dod2

    %37
    si8.[dod16 re8. mi16] fad4~
    fad8. sol16 mi4. fad8
    fad2.

}

IIvlIIn = \relative do'' {

    re4 si dod
    re mi8 re mi re
    dod2 r4

    %4
    dod lad si
    dod re8 dod re dod
    si2 r4

    %7
    si re dod
    si dod8 si dod si
    lad8.[si16 si8. dod16 dod8. re16]

    %10
    re8.[dod16 dod8. si16 si8. lad16]
    lad8.[si16 si8. dod16 dod8. re16]
    re8.[dod16 dod8. si16 si8. lad16]

    %13
    lad8.[si16 lad8. si16 lad8. si16]
    dod4. lad8 si4
    si si4. lad8

    %16
    si4 re2~
    re4 dod8. re16 mi4~
    mi re8. mi16 fad4

    %19
    si,2 sol'4~
    sol2 fad4\mbreak
    mi2.

    %22
    re
    dod4. mid,8 fad4~
    fad fad4. mid8

    %25
    fad8.[dod'16 red8. mi16 mi8. fad16]
    fad4 mi fad
    si,8.[dod16 dod8. re16 re8. mi16]

    %28
    mi4 re mi
    la,8.[si16 si8. dod16 dod8. re16]
    re4 si8. dod16 re4

    %31
    sold,8.[lad16 lad8. si16 si8. dod16]\mbreak
    dod4 si dod
    fad, fad'8.[mi16 re8. dod16]

    %34
    si4 mi8.[re16 dod8. si16]
    lad2 si4~
    si si4. lad8

    %37
    si4 si8.[dod16 re8. dod16]
    si4 si2
    lad2.

}

IIvlan = \relative do' {

    fad4 fad mi
    re si'2
    mi,4 mi8 re mi re

    %4
    dod4 mi re
    dod fad2
    fad4 fad8 mi fad mi\mbreak

    %7
    re4 fad lad
    si sol2
    fad4 re dod

    %10
    si dod re
    fad re dod
    si dod re

    %13
    fad dod4. si8
    lad4 fad' si
    sol dod, fad

    %16
    re fad la
    si mi,8 re dod4
    fad4. mi8 re4

    %19
    re si' si
    mi,2 re4
    si' sol mi

    %22
    la fad re\mbreak
    sold, dod8 si la4
    re dod dod

    %25
    la la' sol!
    fad8. sol16 la4 fad
    sol sol fad

    %28
    mi8. fad16 sol4 mi
    fad fad mi
    re8. mi16 fad4 re

    %31
    mi mi re
    dod8. re16 mi4 dod
    re re8 dod si4

    %34
    sol' sol sol
    dod,2 si4\mbreak
    sol'4 fad fad

    %37
    re fad fad
    si sol2
    dod,2.

}


IIvcn = \relative do {

    si'4 re dod
    si2 r4
    dod4 dod8 si dod si

    %4
    lad4 dod si
    lad fad2
    si4 re8 dod re dod

    %7
    si2 fad4
    si, mi2
    fad4 fad fad

    %10
    fad8.[lad16 lad8. si16 si8. fad16]
    fad4 fad fad
    fad8.[lad16 lad8. si16 si8. fad16]

    %13
    fad4 mi4. re8
    dod4 fad sol

    %15
    mi fad fad,
    si si' fad
    sol mi la

    %18
    re,2 re4
    sol2 sol4
    la2 si8. la16

    %21
    sol4 mi la8. sol16
    fad4 si8.[la16 sold8. fad16]
    mid4 dod fad

    %24
    si dod dod,
    fad fad mi
    red8.[si16 dod8. dod16 red8. red16]

    %27
    mi8.[mi'16 mi8. re?16 re8. dod16]
    dod8.[la16 si8. si16 dod8. dod16]
    re8.[re16 re8. dod16 dod8. si16]

    %30
    si8.[dod16 re8. dod16 si8. re16]
    dod8.[dod16 dod8. si16 si8. lad16]
    lad8.[fad16 sold8. sold16 lad8. lad16]

    %33
    si4 si,8. dod16 re4
    sol sol mi\mbreak
    fad2 sol4

    %36
    mi fad fad,
    si si' la
    sol2.

    %39
    fad

}


IIbcn = \relative do {

    si4 re dod
    si2 r4
    dod2 r4

    %4
    dod dod si
    lad fad'2
    si, r4

    %7
    si2 fad'4\mbreak
    si mi,2
    fad4 fad fad

    %10
    \repeat unfold 3 {fad fad fad}
    fad mi4. re8
    dod4 fad sol

    %15
    mi fad fad,
    si2 fad'4
    sol mi la

    %18
    re,2 re4\mbreak
    sol,2 sol4
    la la' si8. la16

    %21
    sol4 mi la8. sol16
    fad4 si8.[la16 sold8. fad16]
    mid4 dod fad

    %24
    si, dod dod
    fad fad mi
    red8.[si16dod8. dod16 red8. red16]\mbreak

    %27
    mi4 mi re!
    dod8.[la16 si8. si16 dod8. dod16]
    re4 re dod

    %30
    si8.[dod16 re8. dod16 si8. re16]
    dod4 dod si
    lad8.[fad16 sold8. sold16 lad8. lad16]

    %33
    si4 si8. dod16 re4
    sol2 mi4\mbreak
    fad2 sol4

    %36
    mi fad fad,
    si si' la
    sol2.

    %39
    fad

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6> s
    s2.*2
    <6\\>2.
    <5>
    s2.*2

    s4 <6>2
    <5 _+>4 <6 4> <7 5 _+>
    <6 4> <7 5 _+> <6 4>
    <5 _+> <6 4> <7 5 _+>
    <6 4> <7 5 _+> <6 4>
    <5 _+> <6 4\+>4. <6>8
    <6\\>2.
    s4 <5 4> <_+>
    s2 <6>4
    <6 5> <6>2
    <9>4 <8> s

    <9>4 <8> <6>
    <7>2.
    <6 5>4 <6>2
    <5>2.
    <6 5>4 <6 5 _+>2
    <7 5>4 <4>4 <3>
    s <6\\>2
    <5>4 <6> <6>

    s <6>2
    <5>4 <6> <6>
    s <6> s
    s <6> s
    s <6\\> s
    <5> <6> <6>
    s2 <6>4
    <7>2 <6>4

    <7 _+>2.
    s4 <5 4> <_+>
    s2 <6>4
    <7>4 <6>2
    <_+>

}



forma = {

    \time 3/4
    \key si\minor
    \tempo 4 = 65
    s2.*39
    \bar "|."

}


IIvlI = {
    \IIglobal
    \notypeset
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


IIvc = {
    \IIglobal
    \clef bass
    <<\IIvcn \forma>>
}


IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}

IIIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    %\padall
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.4
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzine \terzinecon

}

IIIhbIn = \relative do'' {

    R1.*5
    r2. r4 r8 r r la'
    si4 la8 si la sol la4. r8 r re,

    %8
    mi4 fad8 sol4. fad r8 r re\mbreak
    mi4 fad8 sol4. fad8 la sol fad mi re
    mi fad sold la4.~la8 si la sold4.

    %11
    R1.*3
    r2. r4 r8 r r mi
    mi dod re mi4 fad8 mi4. r8 r la

    %16
    la fad sol la4 si8 la4. r8 r la
    sol4 fad8 mi4 re8\mbreak dod4. r8 r dod
    re4 dod8 re mi re dod4.~dod8 re dod

    %19
    re4.~re8 mi re dod re mi fad4.~
    fad8 mi re dod4. si r4 r8
    R1.*2

    %23
    r2. r4 r8 r r fad'
    re4 dod8 re dod si sol'4. r8 r mi
    dod4 si8 dod si la\mbreak fad'4. r8 r la

    %26
    sol la sol fad sol fad mi4. r8 r fad
    mi fad mi re mi re dod re mi fad mi re
    la'2.~la~

    %29
    la~la~
    la4.~la8 sol fad mi fad mi fad sol fad
    sol la sol fad sol fad\mbreak mi4.~mi8 fad mi

    %32
    fad4.~fad8 sol fad mi fad sol la4.~
    la8 sol fad mi4. re r4 r8
    R1.*4

    %38
    r4 r8 r r fad sol4 fad8 mi4 la8
    fad4 sol8 la4.~la8 sol fad mi4.
    re r4 r8 r2.

}

IIIhbIIn = \relative do'' {

    R1.*5
    r2. r4 r8 r r fad
    sol4 fad8 sol fad mi fad4. r8 r fad

    %8
    si, dod re re4 dod8 re4. r8 r fad\mbreak
    si, dod re re4 dod8 re4.~re8 dod si
    dod4.~dod8 re mi fad re dod si4.

    %11
    R1.*3
    r2. r4 r8 r r dod
    dod la si dod4 re8 dod4. r8 r fad

    %16
    fad re mi fad4 sol8 fad4. r8 r fad
    mi4 re8 dod4 si8 lad4. r8 r lad\mbreak
    si4 lad8 si dod si lad4.~lad8 si lad

    %19
    si4.~si8 dod si lad si dod re4.~
    re8 dod si lad4. si r4 r8
    R1.*3

    %24
    si4 fad'8 si, dod re mi4. r8 r sol,
    la4 mi'8 la, si dod re4. r8 r fad
    mi fad mi re mi re\mbreak dod4. r8 r la'

    %27
    sol la sol fad sol fad mi4. re
    dod fad mi8 re mi fad mi re
    mi4. re dod8 re mi fad mi re

    %30
    mi re mi fad4. la re,8 mi re
    mi fad mi re mi re dod4.~dod8 re dod\mbreak
    re4.~re8 mi re dod re mi fad4.~

    %33
    fad8 mi re dod4. re r4 r8
    R1.*4
    r4 r8 r r re si4 la8 si4 dod8

    %39
    re4 mi8 fad4 mi8 re4 re8 dod4.
    re r4 r8 r2.

}


IIIvlIn = \relative do'' {

    re16 mi fad sol la8 la,4 dod8 re4 re,8 r r la'
    dod16 re mi fad sol8 la,4 sol'8 sol4 fad8 r r fad
    mi4 la8 re,16 mi fad sol la8 dod,4 la'8 si,16 dod re mi fad8

    %4
    la,4 fad'8 sol,16 la si dod re8\mbreak fad,4 re'8 mi,16 fad sol la si8
    re,4 re'8 re4 dod8 dod4 si8 si4 la8
    sol16 la si dod re8 mi,4 dod'8 re4 la8 re,4.

    %7
    r2. re'16 mi fad sol la8 re,4.
    r2. re16 mi fad sol la8 re,4.
    R1.*2

    %11
    la16 si dod re mi8 mi,4 sold8\mbreak la4 la,8 r r mi'
    sold16 la si dod re8 re,4 re'8 re4 dod8 r r dod
    si4 mi8 la,16 si dod re mi8 sold,4 mi'8 fad,16 sold la si dod re

    %14
    mi,4 la8 si,4 sold'8 la4 mi8 la,4.
    r2. la'16 si dod re mi8 la,4.\mbreak
    r2. re16 mi fad sol la8 re,4.

    %17
    r2. fad,16 sold lad si dod8 fad,4.
    si16 dod re mi fad8 si,4. fad16 sold lad si dod8 fad,4.
    si16 dod re mi fad8 si,4. fad'~fad8 sold lad\mbreak

    %20
    si4 si,8 dod4 fad8 re mi fad fad,4 fad'8
    si4 si,8 r r fad lad16 si dod re mi8 fad,4 mi'8
    mi4 re8 r r si red16 mi fad sol la8 si,4 la'8

    %23
    la4 sol8~sol fad mi re dod si fad4 lad8
    si4. r4 r8 mi16 fad sol la si8 mi,4.
    r2. re16 mi fad sol la8 re,4.

    %26
    r2. re16 mi fad sol la8 la,4.
    R1.
    r4 r8 re16 mi fad sol la8 mi4 la8 re,4 la'8

    %29
    dod,4 la'8 re,16 mi fad sol la8\mbreak mi4 la8 re,4 la'8
    dod,4 la'8 re,16 mi fad sol la8 la,4. r4 r8
    r2. la16 si dod re mi8 la,4.

    %32
    re16 mi fad sol la8 re,4. la'~la8 si dod
    re4 re,8 la4 la'8 fad sol la la,4 dod8\mbreak
    re4 re,8 r r la' dod16 re mi fad sol8 la,4 sol'8

    %35
    sol4 fad8 r r fad mi4 la8 re,16 mi fad sol la8
    dod,4 la'8 si,16 dod re mi fad8 la,4 fad'8 sol,16 la si dod re8
    fad,4 re'8 mi,16 fad sol la si8\mbreak re,4 re'8 re4 dod8

    %38
    dod4 si8 si4 la8 sol16 la si dod re8 mi,4 dod'8
    re4. re16 mi fad sol la8 la,4 re8 mi,4 dod'8
    re,4. r4 r8 r2.

}

IIIvlIIn = \relative do'' {

    re16 mi fad sol la8 la,4 dod8 re4 re,8 r r la'
    dod16 re mi fad sol8 la,4 sol'8 sol4 fad8 r r fad
    mi4 la8 re,16 mi fad sol la8 dod,4 la'8 si,16 dod re mi fad8

    %4
    la,4 fad'8 sol,16 la si dod re8\mbreak fad,4 re'8 mi,16 fad sol la si8
    re,4 re'8 re4 dod8 dod4 si8 si4 la8
    sol16 la si dod re8 mi,4 dod'8 re4 la8 re,4.

    %7
    r2. re'16 mi fad sol la8 re,4.
    r2. re16 mi fad sol la8 re,4.
    R1.*2

    %11
    la16 si dod re mi8 mi,4 sold8\mbreak la4 la,8 r r mi'
    sold16 la si dod re8 re,4 re'8 re4 dod8 r r dod
    si4 mi8 la,16 si dod re mi8 sold,4 mi'8 fad,16 sold la si dod re

    %14
    mi,4 la8 si,4 sold'8 la4 mi8 la,4.
    r2. la'16 si dod re mi8 la,4.\mbreak
    r2. re16 mi fad sol la8 re,4.

    %17
    r2. fad,16 sold lad si dod8 fad,4.
    si16 dod re mi fad8 si,4. fad16 sold lad si dod8 fad,4.
    si16 dod re mi fad8 si,4. fad'~fad8 sold lad\mbreak

    %20
    si4 si,8 dod4 fad8 re mi fad fad,4 fad'8
    si4 si,8 r r fad lad16 si dod re mi8 fad,4 mi'8
    mi4 re8 r r si red16 mi fad sol la8 si,4 la'8

    %23
    la4 sol8~sol fad mi re dod si fad4 lad8
    si4. r4 r8 mi16 fad sol la si8 mi,4.
    r2. re16 mi fad sol la8 re,4.

    %26
    r2. re16 mi fad sol la8 la,4.
    R1.
    r4 r8 re16 mi fad sol la8 mi4 la8 re,4 la'8

    %29
    dod,4 la'8 re,16 mi fad sol la8\mbreak mi4 la8 re,4 la'8
    dod,4 la'8 re,16 mi fad sol la8 la,4. r4 r8
    r2. la16 si dod re mi8 la,4.

    %32
    re16 mi fad sol la8 re,4. la'~la8 si dod
    re4 re,8 la4 la'8 fad sol la la,4 dod8\mbreak
    re4 re,8 r r la' dod16 re mi fad sol8 la,4 sol'8

    %35
    sol4 fad8 r r fad mi4 la8 re,16 mi fad sol la8
    dod,4 la'8 si,16 dod re mi fad8 la,4 fad'8 sol,16 la si dod re8
    fad,4 re'8 mi,16 fad sol la si8\mbreak re,4 re'8 re4 dod8

    %38
    dod4 si8 si4 la8 sol16 la si dod re8 mi,4 dod'8
    re4. re16 mi fad sol la8 la,4 re8 mi,4 dod'8
    re,4. r4 r8 r2.

}

IIIvlan = \relative do' {

    fad4 fad8 mi4 mi8 re4 fad8 mi4 re8
    mi4 mi8 mi4 dod8 la4 re8 fad4 re8
    dod4 dod8 re4 fad8 mi4 mi8 re4 re8

    %4
    dod4 dod8 si4 si8 la4 la8 sol4 sol'8
    fad4 fad8 sol4 la8\mbreak fad4 re8 mi4 fad8
    re4 re8 sol4 mi8 fad4. r4 r8

    %7
    R1.*4
    dod'4 dod8 si4 si8 la4 dod,8 fad4 la8
    si4. si4 sold8 mi4 la8 la,4 la'8

    %13
    sold4 mi8 mi4 dod8 si4 si8 la4 la'8
    si,4 dod8 re4 si8 dod4. r4 r8
    R1.*5

    %20
    r2. re4 re8 dod4 dod8\mbreak
    si4 re8 sol4 fad8 mi4 mi8 dod4 lad8
    si4 fad'8 fad4 sol8 la4 fad8 fad4 red8

    %23
    si4 mi8 dod4 dod8 si4 sol'8 fad4 fad8
    R1.*9
    r2. fad4 fad8 mi4 mi8

    %34
    re4 fad8 mi4 re8 mi4 mi8 mi4 dod8
    la4 re8 fad4 re8\mbreak dod4 dod8 re4 fad8
    mi4 mi8 re4 re8 dod4 dod8 si4 si'8

    %37
    la4 la8 sol4 sol8 fad4 fad8 sol4 la8
    fad4 re8 mi4 fad8 re4 re8 sol4 mi8
    fad4. fad4 dod8 re4 la'8 la4 la8

    %40
    fad4. r4 r8 r2.

}


IIIvcn = \relative do {

    re4 re'8 dod4 dod8 si4 la8 sol4 fad8
    mi4 mi8 dod4la8 re4 re'8 re4 si8
    dod4 la8 fad4 re8 mi4 dod8 re4 si8\mbreak

    %4
    dod4 la'8 si4 sol8 la4 fad8 sol4 mi8
    fad sol16 la si8 mi,4 la8 re, mi16 fad sol8 dod,4 fad8
    si,4 fad'8 sol4 la8 re,4. r8 r re

    %7
    sol4 re8 sol,4 sol'8 re4 re8 fad4 re8
    sol4 fad8 mi4 la8\mbreak re4 dod8 si la si
    sol4 fad8 mi4 la8 re4. si8 dod re

    %10
    dod4. la8 si dod re4. mi
    la,4 la8 sold4 sold8 fad4 mi8 re4 dod8
    si4 si'8 sold4 mi8 la4 la,8 dod4 la8\mbreak

    %13
    mi'4 dod'8 dod4 la8 si4 sold8 la4 fad8
    sold4 la8 re,4 mi8 la,4. r4 r8
    la4. r8 r re la4. r8 r la'

    %16
    re,4. r8 r sol re4. r8 r re
    mi4 fad8 sol4 mi8 fad4. r4 r8\mbreak
    r2. fad4. r4 r8

    %19
    r2. fad4 mi8 re4 dod8
    si4 mi8 fad4 fad,8 si'4 si8 la4 la8
    sol4 fad8 mi4 re8 dod4 dod'8 lad4 fad8

    %22
    si4 si8 la4 sol8 fad4 fad8 red4 si8\mbreak
    mi4 mi8 lad,4 lad8 si4 mi8 fad4 fad,8
    si4. r8 r si mi4. r8 r mi

    %25
    la4. r8 r la re,4. r8 r re
    sol4. re la' r8 r re,
    sol4. re la'4 dod,8 re dod si\mbreak

    %28
    la4. re dod re
    la fad' dod re
    la fad'8 mi re dod4. re

    %31
    dod re la r4 r8
    r2. la'4 sol8 fad4 mi8
    re4 sol8 la4 la,8 re4 re'8 dod4 dod8

    %34
    si4 la8 sol4 fad8 mi4 mi8 dod4 la8
    re4 re'8 re4 si8 dod4 la8 fad4 re8
    mi4 dod8 re4 si8 dod4 la'8 si4 sol8

    %37
    la4 fad8 sol4 mi8 fad sol16 la si8 mi,4 la8
    re, mi16 fad sol8 dod,4 fad8\mbreak si,16[dod re  mi fad8] sol4 la8
    re,4. re4 mi8 fad4 re8 la'4 la,8

    %40
    re4. r4 r8 r2.

}


IIIbcn = \relative do {

    re4 re8 dod4 dod8 si4 la8 sol4 fad8
    mi4 mi'8 dod4la8 re4 re'8 re4 si8
    dod4 la8 fad4 re8 mi4 dod8 re4 si8\mbreak

    %4
    dod4 la8 si4 sol8 la4 fad'8 sol4 mi8
    fad sol16 la si8 mi,4 la8 re, mi16 fad sol8 dod,4 fad8
    si,4 fad8 sol4 la8 re4. r8 r re

    %7
    sol4 re8 sol,4 sol'8 re4 re8 fad4 re8
    sol4 fad8 mi4 la8\mbreak re,4 dod8 si la si
    sol4 fad8 mi4 la8 re4. si8 dod re

    %10
    dod4. la8 si dod re4. mi
    la4 la8 sold4 sold8 fad4 mi8 re4 dod8
    si4 si'8 sold4 mi8 la4 la,8 dod4 la8\mbreak

    %13
    mi'4 dod'8 dod4 la8 si4 sold8 la4 fad8
    sold4 la8 re,4 mi8 la,4. r4 r8
    la4. r8 r re la4. r8 r la'

    %16
    re,4. r8 r sol re4. r8 r re
    mi4 fad8 sol4 mi8 fad4. r4 r8\mbreak
    r2. fad4. r4 r8

    %19
    r2. fad4 mi8 re4 dod8
    si4 mi8 fad4 fad,8 si'4 si8 la4 la8
    sol4 fad8 mi4 re8 dod4 dod8 lad4 fad8

    %22
    si4 si'8 la4 sol8 fad4 fad8 red4 si8\mbreak
    mi4 mi8 lad,4 lad8 si4 mi8 fad4 fad,8
    si4. r8 r si mi4. r8 r mi

    %25
    la4. r8 r la re,4. r8 r re
    sol4. re la' r8 r re,
    sol4. re la'4 dod,8 re dod si\mbreak

    %28
    la4. re dod re
    la fad' dod re
    la fad'8 mi re dod4. re

    %31
    dod re la r4 r8
    r2. la'4 sol8 fad4 mi8
    re4 sol8 la4 la,8 re4 re8 dod4 dod8

    %34
    si4 la8 sol4 fad8 mi4 mi'8 dod4 la8
    re4 re'8 re4 si8 dod4 la8 fad4 re8
    mi4 dod8 re4 si8 dod4 la'8 si4 sol8

    %37
    la4 fad8 sol4 mi8 fad sol16 la si8 mi,4 la8
    re, mi16 fad sol8 dod,4 fad8\mbreak si,4 fad8 sol4 la8
    re4. re4 mi8 fad4 re8 la'4 la,8

    %40
    re4. r4 r8 r2.

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4. <6> s2.
    <6>4. <6>4 <7>8 <4>4 <3>8 s4.
    s <6> <6>4 <6>8 <6>4.

    <6>4 <6>8 <6>4. <6>4 <6>8 <6>4.
    <6> <7> <7> <7>
    <6>4 <6>8 <7 5>4. s2.
    s s4. <6>
    <6>4 <6>8 <7>4 <7>8

    s4 <6>8 s4.
    <6>4 <6>8 <7>4 <7>8 s2.
    <6>1.
    s4. <6> s4 <6>8 s4 <6>8
    <6\\>4. <6>4 <7>8 <4>4 <3>8 <6>4.

    <_+>4 <6>8 s4. <6>4 <6>8 <6>4.
    <6> <6 5>4 <_+>8 s2.
    s1.
    s
    s4 <6>8 <6 4>4 <7>8 <_+>2.

    s <_+>
    s s4 <6>8 <6>4 <6\\>8
    s2. s4. <6>
    s4 <6>8 s4 <6>8 <6\\>4. <6>4 <7>8
    <4>4 <3>8 <6>4 <6>8 <6\\>4. <6>4 <7>8

    <4>4 <3>8 <7>4 <6>8 s4. <_+>
    s1.
    s
    <6>
    <6>2. s4 <6>8 s4.

    s2. <6>
    s4. <6> <6> s
    s <6> <6>2.
    <5>1.
    s2. s4 <6>8 <6>4 <6>8
    s2. s4. <6>

    s4 <6>8 <6>4 <6>8 <6>4. <6>4 <7>8
    <4>4 <3>8 s4. <6> <6>
    <6>4 <6>8 <6>4. <6>4 <6>8 <6>4.
    <6>4 <6>8 <6>4. <6> <7>
    <7> <7>

    s4 <6>8 <6>4

}



forma = {

    \time 12/8
    \key re\major
    \tempo 2. = 60
    s1.*40
    \bar "|."

}


IIIhbI = {
    \IIIglobal
    %\notypeset
    <<\IIIhbIn \forma>>
}

IIIhbII = {
    \IIIglobal
    <<\IIIhbIIn \forma>>
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


IIIvc = {
    \IIIglobal
    \clef bass
    <<\IIIvcn \forma >>

}


IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset
}
#(set-global-staff-size 15.7)

\version "2.20.0"

\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {

        systems-per-page = 3

    }

\header {
    title = \markup \smaller "Concerto VIII Op. 7"
    composer = \markup \center-column{"T. Albinoni (1671-1751)"}
		}

    \markup \huge {[1.] Allegro}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
        } <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{"Hau[t]bois""Primo"}
                    \set Staff.midiInstrument = #"oboe"
                    \IhbI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{"Hau[t]bois""Secondo"}
                    \set Staff.midiInstrument = #"oboe"
                    \IhbII
                >>
            >>

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlII
                >>
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"Alto""Viola"}
                \set Staff.midiInstrument = #"viola"
                \Ivla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.midiInstrument = #"cello"
                \Ivc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Basso""Continuo"}
                \set Staff.midiInstrument = #"cello"
                \Ibc
            >>
        >>

        \layout {

            indent = 2\cm


            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper {

        systems-per-page = 4

    }

    \markup \huge {[2.] Largo}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
        } <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII
                >>
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"Alto""Viola"}
                \set Staff.midiInstrument = #"viola"
                \IIvla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.midiInstrument = #"cello"
                \IIvc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Basso""Continuo"}
                \set Staff.midiInstrument = #"contrabass"
                \IIbc
            >>
        >>

        \layout {

            indent = 2\cm


            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper {

        systems-per-page = 3

    }


    \markup \huge {[3.] Allegro}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
        } <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{"Hau[t]bois""Primo"}
                    \set Staff.midiInstrument = #"oboe"
                    \IIIhbI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{"Hau[t]bois""Secondo"}
                    \set Staff.midiInstrument = #"oboe"
                    \IIIhbII
                >>
            >>

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                >>
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"Alto""Viola"}
                \set Staff.midiInstrument = #"viola"
                \IIIvla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.midiInstrument = #"cello"
                \IIIvc
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup  \center-column{"Basso""Continuo"}
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc
            >>
        >>

        \layout {

            indent = 2\cm


            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

}




%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80, 2.20.0
%}
