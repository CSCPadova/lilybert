\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

acc = \once \override Stem.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tr = \trill

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { solo }

tu = ^\markup \italic "tutti"

dolce = _\markup \italic { dolce }

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

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-0
    \center-column {
        \musicglyph "scripts.turn"
        \musicglyph "scripts.prall"
    }
}

%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \tupletSpan 2 \con
}

ItpIn =\relative do'' {
    ~~~
    r4
    la' r fad r
    la r fad r
    la r la sold

    %4
    mi r la r
    mi r la r
    mi r\mbreak r2

    %7
    R1
    re16[mi re mi re mi re mi] fad[sol fad sol fad sol fad sol]
    la8 la la la la2\tr ~

    %10
    la r
    R1
    r2 fad16[sol fad sol fad sol fad mi]\mbreak

    %13
    re4 r fad16[sol fad sol fad sol fad sol]
    la4 fad r mi
    r fad red r

    %16
    R1*6
    R4.*15
    r2

    %38
    R1
    la'2 r
    R1

    %41
    la2 r
    R1*3
    r2 mi

    %46
    r fad
    r mi
    r mi

    %49
    r mi
    r la
    r mi

    %52
    R1*2
    \tuplet 3/4 { mi8 fad mi } mi4. mi8
    mi2 r

    %56
    R1*4
    la2 r
    r4 r8 la, la4. la8

    %62
    la2 re
    mi la,
    la r

    %65
    R1*2
    sol'2 r\mbreak
    la r

    %69
    la la
    la r
    R1

    %72
    la2 la4. la8
    la2

}

ItpIIn =\relative do'' {

    r4
    fad r la r
    fad r la r
    fad r fad re

    %4
    la' r mi r
    la r mi r
    la r\mbreak r2

    %7
    R1
    r2 re,16[mi re mi re mi re mi]
    fad8 fad fad fad fad2\tr~

    %10
    fad r
    R1*2
    fad16[sol fad sol fad sol fad mi] re[mi re mi re mi re mi]

    %14
    fad4 la mi r
    fad r fad r
    R1*6

    %22
    R4.*15
    r2
    R1

    %39
    re2 r
    R1
    fad2 r

    %42
    R1*4
    la2 r
    sold r

    %48
    mi r
    mi r
    la r

    %51
    mi r
    R1*2
    la,2 la

    %55
    la\mbreak r
    R1*4
    r4 r8 la la4. la8

    %61
    la2 r
    r4 r8 la' sol4. sol8
    sol2 fad

    %64
    mi r
    R1*2
    mi2 r\mbreak

    %68
    re r
    la mi'
    re r

    %71
    R1
    fad2 fad4. fad8
    fad2

}


IobIn =\relative do'' {

    r4
    fad r re r
    fad r re r
    fad r fad sold

    %4
    dod, r mi r
    mi r mi r
    mi r\mbreak fad sol

    %7
    fad r re fad
    re r r2
    re16[mi re mi re mi re mi] fad[sol fad sol fad sol fad sol]

    %10
    la8 la la la la re, mi4
    re8. re16 dod8. dod16 fad8 mi re la'
    sol16 fad mi re mi re dod si fad'2\tr~\mbreak

    %13
    fad~fad
    fad16[sol fad sol fad sol mi fad] sol[la sol la sol la fad sol]
    la[si la si la si la si] la4 red,8 fad

    %16
    si, mi si[mi] mi4 r
    do8 do do do sol'4 r
    si8 si si si la4 sold

    %19
    sold?8 mid mid mid \mbreak dod? dod dod dod
    sid sid sid sid mid mid mid mid
    mid4 r r2\fermata

    %22
    R4.*2
    la8 sol fad
    mi16(fad sol fad mi re)

    %26
    do8 r r
    fad16(sol la sol fad mi)
    red[fad] mi si' la sol

    %29
    la sol fad la sol fad
    sol8 sol4~\mbreak
    sol16 fad mi fad sol8\noBeam

    %32
    fad fad4~
    fad16 mi mi si' mi, re
    dod32 re dod re mi16[fad sol fad32 mi]

    %35
    fad16 mi fad[sol32 la] sol16 fad
    mi re mi8\noBeam r
    r2

    %38
    R1
    r4 fad8 sol la2
    R1
    r4 fad8 sol \tuplet 3/4 {
        la si la
        la sol fad
    } sol2~\mbreak
    \tuplet 3/4 { sol8 fad mi } fad2~
    \tuplet 3/4 { fad8 mi re mi fad mi }
    la2 \tuplet 3/4 { dod,8 mi dod}
    re2 si
    r4 mi8 re \tuplet 3/4 { dod re dod }
    si4. mi8 mi2~
    \tuplet 3/4 { mi8 mi re dod re mi }
    la,2~la4. re8
    \tuplet 3/4 { la si dod } re2
    la\p la'~
    \tuplet 3/4 { la8 sold fad } mi2~
    \tuplet 3/4 { mi8\f dod mi dod mi dod }
    mi2\mbreak r
    R1
    r2 r4 r8 sold
    sold?2 r4 r8 la
    sold2 sold
    la r
    re,4. fad8 \tuplet 3/4 { fad8 mi re }
    mi2 si
    mi la,
    r4 mi'8 fad \tuplet 3/4 {
        sol mi sol
        fad re fad sol mi sol
        fad re fad sol mi sol
    }
    sol2 r\mbreak
    re re~
    re dod
    re r
    R1
    \tuplet 3/4 { la'8 fad re re fad re }
    fad2

}


IobIIn =\relative do'' {

    r4
    re r fad r
    re r fad r
    re r la' si

    %4
    mi, r dod r
    dod r dod r
    dod r\mbreak re mi

    %7
    la, r si do
    si r r2
    r re16[mi re mi re mi re mi]

    %10
    fad8 fad fad fad fad4 sol
    si,8. si16 mi8. mi16 si'8 lad si[red,]
    si'16 la sol fad mi re? dod  si fad'2\tr~\mbreak

    %13
    fad~fad
    red16[mi red mi red mi dod red] mi[fad mi fad mi fad red mi]
    fad[sol fad sol fad sol fad sol] fad4 fad8 la

    %16
    mi sol mi sol sol4 r
    la,8 la la la mi'4 r
    sold8 sold sold sold fad4 fad

    %19
    dod8 dod dod dod\mbreak la la la la
    red red red red dod dod dod dod
    re!4 r r2\fermata

    %22
    R4.*2
    fad8 mi red
    si8. la16 sol fad

    %26
    mi8 r r
    la16(si do si la sol)
    fad[la] si sol' fad mi

    %29
    mi8 red16 fad mi red
    mi8 mi4~\mbreak
    mi16 re dod re mi[re32 dod]

    %32
    re8 re4~
    re16 dod si re dod[si]
    si[la32 si] dod16 re mi re32 dod

    %35
    re16[dod] re mi32 fad mi16[re]
    dod si dod8\noBeam r
    r2

    %38
    R1
    r4 re8 mi fad2
    R1

    %41
    r4 la,8 si \tuplet 3/4 {
        dod re dod
        re mi re re dod si
    }
    dod2~\tuplet 3/4 {
        dod8 si la

        %44
        si dod si
    } si2
    dod \tuplet 3/4 { la8 dod la }
    fad'2~\tuplet 3/4 { fad8 red fad }

    %47
    R1
    r4 mi8 re?\tuplet 3/4 { dod re dod }
    si4. mi8 mi2~

    %50
    \tuplet 3/4 { mi8 re dod } fad4. la8
    la4. mi8 si2
    mi\p re4. fad8

    %53
    dod2 sold4. si8
    dod4.\f dod8 \tuplet 3/4 { la dod la }
    dod2 r

    %56
    R1
    r2 r4 r8 mid
    mid?2 r4 r8 fad

    %59
    re2 dod
    dod r
    fad4. la8 la,4. la8

    %62
    dod4. la8 sol'2
    dod, fad
    r4  dod8 re\tuplet 3/4 {
        mi dod mi

        %65
        re fad re mi dod mi
        re fad re mi dod mi
    }
    mi2 r\mbreak

    %68
    fad4. mi8 re4. si8
    fad'2 mi
    fad r

    %71
    R1
    \tuplet 3/4 { fad8 la fad } fad4. fad8
    re2

}

IvlIn =\relative do'' {

    r8 r16 re
    re re re re fad fad la[la] re8 la fad re
    la' fad re la re16 re re re fad fad la[la]
    re la, si dod re re, re re re'[la si dod re mi fad sold]

    %4
    la8 mi dod[la] mi' dod la[mi]
    la16 la la la dod dod mi[mi] \once\stemDown la mi, fad sold la la, la la
    la' mi fad sol dod dod mi[mi]\mbreak re la la la mi' dod re mi

    %7
    fad la, si dod re re mi fad sol re re re la' la sol la
    si4 r re,, r
    re re re8 re re re

    %10
    re4 re la''16 la la la lad lad lad lad
    si si si si dod dod dod dod re re dod[dod] si si la[la]
    sol fad mi re mi re dod si fad'4 lad,\mbreak

    %13
    si8 si, si si fad'4 fad
    fad fad mi mi
    la la la'16 fad fad fad la fad fad fad

    %16
    sol mi mi mi sol mi mi mi dod' mi, mi mi dod' mi, mi mi
    do' red, red red do' red, red red si' si, si si mi mi sol[sol]
    si si, si si sold' mid mid mid dod'? dod, dod dod sold' sold sold sold

    %19
    sold dod, dod dod mid mid sold[sold]\mbreak la fad fad fad la fad fad fad
    sid fad fad fad sid fad fad fad dod' sold sold sold dod sold sold sold
    re'4 r r2\fermata

    %22
    si,8 sold' mid
    fad16(sold la sold fad mi)
    red8 r r

    %25
    mi, r r
    do'16(re mi re do si)
    la(sol fad sol) la8\noBeam

    %28
    si16 do si sol la si
    la8. do16 si8
    si16 sol' sol fad mi re\mbreak

    %31
    dod?8 dod dod
    fad,16 fad' fad mi re dod
    si8 sold sold

    %34
    mi mi'16 re dod mi
    la,8 la la
    la la, r

    %37
    r4 r8 la''
    \tuplet 3/4 { la fad sol la mi la }
    re2~\tuplet 3/4 {
        re8 re, fad

        %40
        sol la sol sol fad mi
    }
    fad4. re,8 dod2
    si \tuplet 3/4 { si'8 la sol }

    %43
    la2~\tuplet 3/4 { la8 sol fad }
    sol2 sold
    \tuplet 3/4 {
        la8 mi' mi la mi sol

        %46
        fad fad fad si fad la
    }
    sold4. mi8 mi2~
    mi4 mi, mi'2~

    %49
    mi4 mi, la4. la'8
    la2~\tuplet 3/4 {
        la8 sold fad
        mi re dod
    } si4. mi8\p

    %52
    la2~\tuplet 3/4 {
        la8 sold fad
        mi re dod re dod si
        la\f dod dod mi dod mi
    }

    %55
    la2 r4 dod,8 red
    \tuplet 3/4 {
        mid fad mid fad sold la
        sold la si
    } si2~

    %58
    \tuplet 3/4 {
        si8 la sold la sold fad
        sold fad sold
    } dod,4. mid8
    \tuplet 3/4 { fad dod fad } la2~

    %61
    \tuplet 3/4 { la8 la, fad' } la2~
    \tuplet 3/4 { la8 la, mi'} sol2~
    \tuplet 3/4 { sol8 mi sol fad re fad }

    %64
    mi2 la,
    la la
    la la

    %67
    dod' r4 la8 dod\mbreak
    \tuplet 3/4 {
        re dod si la si sol
        fad mi re mi re dod
    }

    %70
    re2\p~\tuplet 3/4 {
        re8 dod si
        la sol fad sol fad mi
        fad re' fad la\f fad la
    }

    %73
    re2

}


IvlIIn =\relative do'' {

    r4
    la r la'16 fad fad fad re re la[la]
    fad' re re re la la fad[fad] la4 r
    fad' r16 fad, fad fad fad'8. fad,16 si8. si16

    %4
    mi dod dod dod la la mi[mi] dod' la la la mi mi dod[dod]
    mi4 r dod' r16 mi, mi mi
    dod' la la si dod dod re mi\mbreak la, fad fad fad dod' mi, fad sol

    %7
    la fad sol mi fad fad sol la si si si si fad' fad mi fad
    sol4 r re, r
    re re re8 re re re

    %10
    re4 re fad'16 fad fad fad mi mi mi mi
    fad fad fad fad sol sol sol sol fad fad lad[lad] fad fad fad fad
    mi8 lad, si[mi] lad,4 lad\mbreak

    %13
    si8 si, si si  re4 re
    red red si si
    red fad fad'16 red red red fad red red red

    %16
    si' sol sol sol si sol sol sol mi dod dod dod mi dod dod dod
    red fad fad fad red fad fad fad mi mi, mi mi sol sol si[si]
    re re, re re re' si si si fad' fad fad fad fad fad fad fad

    %19
    mid sold, sold sold dod dod mid[mid]\mbreak fad la, la la fad' la, la la
    fad' red red red fad red red red mid mid mid mid sold mid mid mid
    sold4 r r2\fermata

    %22
    re8 dod si
    dod8. si16 la sol!
    fad8 r r

    %25
    si, r r
    la'16(si do si la sol)
    fad(mi red mi) fad8\noBeam

    %28
    la, sol sol'
    fad si, si
    mi16 mi mi re dod si\mbreak

    %31
    lad8 lad lad
    si16 re re dod si la?
    sold8 sold sold

    %34
    la la la
    la la la
    la la r

    %37
    r2
    re'2 mi
    la, r4 r8 la

    %40
    \tuplet 3/4 { re dod  si } la2
    la4. re,8 dod2
    si\tuplet 3/4 {si'8 la sol}\mbreak

    %43
    la2~\tuplet 3/4 {la8 sol fad}
    sol2 sold
    \tuplet 3/4 {
        la8 dod dod mi dod mi

        %46
        re re, re' fad la, fad'
    }
    si,4. sold8 \tuplet 3/4 { dod si la }
    mi'2. mi,4

    %49
    mi'2~\tuplet 3/4 {mi8 re dod}
    fad2. la,4
    \tuplet 3/4 {dod8 si la} sold2

    %52
    \tuplet 3/4 {
        mi'8\p la, mi' fad mi re
        dod si la si la sold
        dod\f la la dod la dod
    }

    %55
    dod2 r
    si2 dod
    dod4. sold'8 sold4. mid8

    %58
    \tuplet 3/4 {sold fad mid} fad4. dod8
    re4. si8 \tuplet 3/4 {
        mid fad sold
        dod, fad dod dod re mi
    }

    %61
    fad4. re8 \tuplet 3/4 {re mi fad}
    mi4. la8 \tuplet 3/4 {
        re,8 mi re
        mi dod mi re fad re
    }

    %64
    dod2 la
    la la
    la la

    %67
    mi' r4 dod8 mi\mbreak
    la4. sol8 \tuplet 3/4 {
        fad sol re
        re dod si dod si la

        %70
        la\p re dod si la sol
        fad mi re mi re dod
        re fad la fad'\f re fad
    }

    %73
    fad2

}


Ivlan =\relative do' {

    r4
    fad r fad16 la la la la8 fad
    re16 la' la la fad8 re fad4 r
    la r16 la la la la fad sol la re,8. re16

    %4
    dod8 la' mi[dod] la'16 mi mi mi dod8 la
    dod4 r mi r16 dod dod dod
    dod4 r8 mi\mbreak fad16 re re re sol sol la sol

    %7
    fad la sol la re,8. re16 re sol sol sol do, do do do
    re4 r re r
    re re re8 re re re

    %10
    re4 re re16 re re re sol sol  sol sol
    re re re re mi mi mi mi re8 mi fad[fad]
    si, fad' si,8. si16 dod4 lad'\mbreak

    %13
    si8 si, si si si4 si
    si si si si
    la la red8 la' red,[la']

    %16
    sol si sol[si] sol sol sol sol
    fad la fad la si mi, si' mi,
    mid mid si'[re,?] dod dod re16 re re re

    %19
    dod mid mid mid sold sold dod,[dod]\mbreak dod8 dod dod dod
    la' la la la sold sold sold sold
    mid4 r r2\fermata

    %22
    mid8 r r
    dod r r
    do r r

    %25
    sol r r
    mi' r r
    la, la la

    %28
    la sol sol'
    fad si, si
    mi,16 mi' mi re dod si\mbreak

    %31
    lad8 lad lad
    si16 re re dod si la
    sold8 sold sold

    %34
    la la la
    la la la
    la la r

    %37
    r2
    fad' \tuplet 3/4 { mi8 dod mi }
    re2 r

    %40
    re mi
    re dod
    si~\tuplet 3/4 { si8 la sol }

    %43
    la2~\tuplet 3/4 { la8 sol fad }
    sol2 sold
    la dod

    %46
    la' fad
    mi mi
    si' dod

    %49
    mi, mi~
    mi4. la,8 re4. fad8
    dod2 mi

    %52
    mi\p la,4. la'8
    mi2 mi
    mi4.\f mi8 \tuplet 3/4 { la mi la }

    %55
    mi2 r
    sold la4. dod,8
    sold'2 mid4. sold8

    %58
    sold?4. si8 la4. la8
    si2 sold4. dod,8
    dod2 fad4. mi8

    %61
    la,2 la4. fad'8
    la4. dod,8 re4. re8
    \tuplet 3/4 { dod8 mi dod } la'2

    %64
    la la
    la la
    la la

    %67
    sol r\mbreak
    la~la4. si8
    la4. fad8 mi4. mi8

    %70
    fad4.\p mi8 re2~
    re4. la8 la2
    la4. fad'8 \tuplet 3/4 { fad\f la fad }

    %73
    la2

}

Ibcn =\relative do {

    r4
    re r re re
    re re re r
    re r re8. re16 si8. si16

    %4
    la4 la la la
    la r la' r
    la r8 sol\mbreak fad8. fad16 mi8. mi16

    %7
    re4 r8 do si8. si16 la8. la16
    sol4 r r2
    R1

    %10
    r2 re'8. re16 dod!8. dod16
    si8. si16 lad8. lad16 si8 dod re[red]
    mi fad sol8. sol16 fad4 r\mbreak

    %13
    r2 si4 si
    la la sol sol
    fad red si8 si si si

    %16
    si si si si lad lad lad lad
    la! la la la sol sol sol sol
    sold sold sold sold la la si[si]

    %19
    dod dod dod dod\mbreak dod dod dod dod
    dod dod dod dod dod dod dod dod
    si4 r r2\fermata

    %22
    si8 r r
    la r r
    la r r

    %25
    sol r r
    la r r
    \clef tenor \key re\major la'\solo la la

    %28
    la sol sol'
    fad si, si
    mi,16 mi' mi re dod si\mbreak

    %31
    lad8 lad lad
    si16 re re dod si la?
    sold8 sold sold

    %34
    la la la
    la la la
    la la, r

    %37
    \clef bass r2
    re\tu dod
    fad r

    %40
    si, dod
    re r
    \clef tenor \key re\major si'2\solo~\tuplet 3/4 { si8 la sol }

    %43
    la2~\tuplet 3/4 { la8 sol fad}
    sol2 sold
    la\clef bass \key re\major  la,\tu

    %46
    re red
    mi la
    sold la

    %49
    sold la
    fad~\tuplet 3/4 { fad8 mi re}
    mi2 mi,

    %52
    dod'\p re4. re8
    mi2 mi,
    la\f la'4. la8

    %55
    la2 r
    sold fad
    mid~mid4. dod8

    %58
    dod2 fad
    si, si
    la fad4. dod'8

    %61
    re2 fad4. re8
    dod2 si4. si8
    la2 la

    %64
    la r
    R1*2
    la'2 r\mbreak

    %68
    fad~fad4. sol8
    la2 la,
    fad'\p sol4. sol8

    %71
    la2 la,
    re re'4.\f re,8
    re2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s4
    s1*2
    s2 s4 <6+>
    s1*2
    s4 s8 <6 4> <6>4 <6>
    s4 s8 <6 4> <6>4 <_->8 <6>
    s1*2
    s2 s4 <6+>
    s <7 5> s8 <6+> <6> <5>
    s <_+> <6>4 <_+>2
    s1
    <6 4+>2 <6>
    <6+>4 <5> <_+ 7>2
    s8 <6 4> s4 s8  <7 5> s4
    <_- >8 <6 4+> s4 s8 <6> s4
    <6+>2 <6>4 <6 5+>
    <_+>2 s8 <6 4> s4
    <7+ 2+>8 <6 4> s4 s8 <_+> s4
    <6+ 4+ 3->1

    <6+ 4+ 3!>4.
    <6>
    <6 4+ _!>
    <6>
    <_->
    s4.
    <4+>8 <6>4
    <7>8 <_+>4
    s4.*7

    s2
    s <6>
    <6> s
    <6> <6 5>
    s1*6
    <_+>1
    s
    s
    <7>2 <6>
    <6 4> <3+>
    <6>1
    <6 4>2 <3+>
    s1*2
    <6+>1
    s2 s4 s8 <_+ 7>
    s1
    <6+>2 <4+ 2>
    <6>2 s4 s8 <6>
    s2 <6>
    <6> <6>
    <7> <6 4>
    s1*3
    <7>1
    <6>
    <6 4>2 <3>
    s1
    <6 4>2 <3>

}

forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 60
    \partial 4 s4
    s1*21
    \bar "||"\break
    \mark\markup "Adagio"
    \time 3/8
    \key re\major
    \tempo 4 = 47
    s4.*15
    \bar ".|:"\break
    \mark\markup "Presto"\time 4/4
    \key re\major
    \tempo 1 = 65
    \repeat volta 2{
        \partial 2 s2
        s1*17
        s2
    }\break
    \bar ":..:"
    s2
    s1*17
    s2
    \bar ":|."

}


ItpI = {
    \Iglobal
    <<\ItpIn \forma>>
}


ItpII = {
    \Iglobal
    <<\ItpIIn \forma>>
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



IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \tupletSpan 8\con
}

IIcrIn = \relative do'' {

    r16 fa
    fa8 do la
    fa la do
    fa8. fa16 sol8

    %4
    la16[sol] la8 sib
    do fa, sol
    la16[sol] la8 sol

    %7
    fa16 do fa la sol sib
    la8 fa do
    fa r r

    %10
    R4.
    r8 sol la
    sol16 la sib8 la

    %13
    sol sol16 sol sol sol
    fa8 r r \mbreak
    R4.*3

    %18
    sol8\noBeam sol16 sol sol sol
    sol8 r r16 fa sol8 r r
    R4.*4

    %24
    do,16.[do32] sol'16. la32 sib16. sol32
    la8 do,8. do16
    fa16.[fa32] sol16. la32 sib16. sol32\mbreak

    %27
    la8 r r
    R4.*2
    la8\noBeam sol do,

    %31
    do fa sol
    fa la sib
    la\noBeam la,16 la la la

    %34
    la8 r r la r r

}

IIcrIIn =\relative do'' {

    r8
    r r r16 fa
    fa8 do la
    fa la do

    %4
    fa8. fa16 sol8
    la16[sol] la8 sib
    do fa, do

    %7
    la fa do'
    fa16 do fa la sol sib
    la8 r r

    %10
    R4.
    r8 do, fa
    do sol' fa

    %13
    do do16 do do do
    do8 r r\mbreak
    R4.*3

    %18
    do8\noBeam do16 do do do
    do8 r r do r r
    R4.*4

    %24
    r8 do8. do16
    fa16. [fa32] sol16. la32 sib16. sol32
    la8 do,8. do16\mbreak

    %27
    fa8 r r
    R4.*2
    fa8\noBeam sib8. sib16

    %31
    la8 la sib
    la fa sol
    fa\noBeam fa,16 fa fa fa

    %34
    fa8 r r fa r r

}


IIobIn =\relative do'' {

    r8
    R4.*6
    do8 r r
    do r r

    %9
    fa8. la16 fa8
    sol fa8. fa16
    sol8 r r

    %12
    mi r r
    mi r mi
    fa16.[do32] fa8 sol\mbreak

    %15
    do,\noBeam fa8. sol16
    do,16. sol'32 fa8 [re]
    do16. sol'32 fa8 [re]

    %18
    mi do16.[sol'32] mi8
    mi r r mi r16 sol sol16. la32
    sib16[la32 sol] fa16. mi32 fa16. sol32

    %21
    la16. fa32 la8[sib]
    la16. fa32 la8[sib]
    la16[sol32 la] sib16. la32 sib16. la32

    %24
    sol8 r r
    do,16.[re32] mi8 r
    fa do8. do16\mbreak

    %27
    do8 r r
    r8 r16 sol' sol16.[mi32]
    la16.[la32] sol8 sol

    %30
    fa16. do32 sol'8[sol]
    fa8 \tuplet 3/4 {
        la32 [sib la]  sib la sol
        la sol fa
    } fa8[mi]

    %33
    do16. la32 do16.[fa32] fa16. do32
    do8 r16 sol'16 sol16. la32 do,8 r r

}


IIobIIn =\relative do'' {

    r8
    R4.*6
    la8 r r
    la r r

    %9
    la8. fa'16 la,8
    do la re
    mi r r

    %12
    sol, r r
    sol r sol
    la16. do32 sib8[sib]\mbreak

    %15
    fa'8 re8. re16
    sol8 la sol
    sol re si

    %18
    sol' r16 sol, do8\noBeam
    do r r do r16 mi mi16. fa32
    sol16[fa32 mi] re16. do32 re16. mi32

    %21
    fa16.[la,32] do8 fa
    do16.[la32] do8 re
    do16. do32 sol'16.[fa32 sol16. fa32]

    %24
    mi8 r r
    la, do r
    la mi'8. mi16\mbreak

    %27
    la,8 r r
    r8 r16 mi'\noBeam mi16. do32
    do8\noBeam sib mi

    %30
    fa16.[la32] re,8 mi
    la, do[mi]
    fa do8. do16

    %33
    la16. do32 fa16.[do32] do16. la32
    la8 r16 mi' mi16. fa32 la,8 r r

}

IIvlIn =\relative do'' {

    r8
    R4.*6
    do8 r r
    do r r

    %9
    \tuplet 3/4 { la'32 sol fa } do'8 [la]
    \tuplet 3/4 { sol32 fa mi } la16. [la32] si16. si32
    do8 r r

    %12
    sol, r r
    sol r sol'
    \tuplet 3/4 { do32[sib? la] } sib8 sol\mbreak

    %15
    \tuplet 3/4 { la32[sol fa] si32 la sol } re'16.[fa,32]
    mi16. do'32 re8[si]
    do16. mi,32 re8[fa]

    %18
    \tuplet 3/4 { mi32 re do } sol'16.[mi32] do16. sol32
    sol8 r r sol r r
    sol sib8. sib16

    %21
    fa8. mi16 re16. mi32
    fa8. mi16 re16. mi32
    la8 sib,8. sib16

    %24
    do8 do' r
    do do' r
    do,16. re32 mi16. fa32 sol16. mi32\mbreak

    %27
    \tuplet 3/4 { do32 sib la} fa'16.[sol32] la16. fa32
    \tuplet 3/4 { fa32 mi re mi[fa sol] sol la sib }
    do16.[fa,32] sol8 mi

    %30
    \tuplet 3/4 { do'32 sib la } sol16.[fa32] mi16. fa32
    fa8. fa16 sol8
    fa8.[la16] \tuplet 3/4 {  sib32 la sol }

    %33
    la16. fa32 do16.[la32] do16. fa32
    la8 r r la r r

}


IIvlIIn =\relative do'' {

    r8
    R4.*6
    la8 r r
    la r r

    %9
    \tuplet 3/4 { do32 sib la } la'8[do,]
    \tuplet 3/4 { mi32 re do } do16.[do32] fa16. fa32
    mi8 r r

    %12
    mi, r r
    mi r mi'
    \tuplet 3/4 { la32 sol fa } fa8[do]\mbreak

    %15
    do16. la32 re16.[si32] fa'16. re32
    do16. mi32 la8[re,]
    sol16.[do,32] la8 si

    %18
    do16. sol32 mi'16.[do32] sol16. mi32
    mi8 r r mi r r
    sol sib8. sib16

    %21
    fa8. mi16 re16. mi32
    fa8. mi16 re16. mi32
    la8 sib,8. sib16

    %24
    do8 sol' r
    la' sol r
    la, sol8. do16\mbreak

    %27
    la16. la32 sib16. [sib32] do16. do32
    \tuplet 3/4 { re32 do sib do [re mi] mi fa sol }
    fa16.[do32] re8 sol

    %30
    \tuplet 3/4 { la32 sol fa } re8[sol]
    la8. la,16 mi'8\noBeam
    la,8.[fa'16] \tuplet 3/4 { sol32 fa mi }

    %33
    fa16. do32 la16.[fa32] la16. do32
    fa8 r r fa r r

}


IIvlan =\relative do' {

    r8
    R4.*6
    fa8 r r
    fa r r

    %9
    fa8. do16 fa8
    re fa si,
    sol' r r

    %12
    do, r r
    do r do
    do re sol\mbreak

    %15
    fa r re16. si32
    sol16.[mi'32] fa8 si,
    sol'16.[sol32] la8 sol

    %18
    sol do,16.[mi32] mi8
    do r r do r r
    sol' sib?8. sib16

    %21
    fa8. mi16 re16. mi32
    fa8. mi16 re16. mi32
    fa8 sib,8. sib16

    %24
    do8 mi r
    do mi r
    la, do8. sol'16\mbreak

    %27
    fa16.[do32] fa8 fa
    sib,16.[fa'32] sol8 r16 mi
    la16.[fa32] re8 do

    %30
    do re do
    do8. do16 do8
    do8. do16 do8

    %33
    do\noBeam ~do16.[do32] fa16. la32
    do,8 r r do r r

}

IIbcn =\relative do {

    r8
    R4.*6
    fa8 r r
    fa r r

    %9
    fa8. fa16 fa8
    mi fa re
    do r r

    %12
    do r r
    do r do
    la re mi\mbreak

    %15
    fa r si,
    do fa sol
    mi fa sol

    %18
    do,8. do16 do8
    do r r do r r
    R4.*4

    %24
    r8 mi8. mi16
    fa8 mi8. mi16
    fa8 mi8. mi16\mbreak

    %27
    fa16.[fa32] re8 la
    sib16. sib'32 sib8\noBeam r16 sib
    la16.[la,32] sib8 do

    %30
    la sib do
    fa8. fa16 do8
    fa8. fa16 do8

    %33
    fa8. fa16 fa,8
    fa r r fa r r

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s4.*9
    <6>8 s <6!>
    s4.*3
    <6>8 <6> <6>
    s4.
    s8 <6> <_!>
    <6> <6> <7 _!>
    s4.*7
    s8 <6>4
    s8 <6>4
    s8 <6>4
    s8 <6> <6>
    s8 <6 4> s16 <6 4>
    <6>8 <6> s
    <6> <6> s

}

forma = {

    \time 3/8
    \key fa\major
    \tempo 4 = 70
    \partial 8 s8
    \repeat volta 2 {
        s4.*18
    }
    \alternative {{s4.}{s}}\break
    \set Score.currentBarNumber = #20
    \repeat volta 2 {
        s4.*14
    }
    \alternative {{s4.}{s}}
    \bar ":|."

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



IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIIcrIn =\relative do'' {

    r4
    do2 r
    sol' r
    la r
    R1
    sol2 sol
    sol sol
    sol r
    R1*5
    do,2 do
    do r
    R1*10
    sol'2 la
    sol la
    sol r
    R1
    sol2 sib
    la do
    sol r
    sol sol
    sol r\mbreak
    R1
    do,2 do
    do4 do do do
    do2 r
    R1*7
    la'4 la la la
    sib2 r
    R1*17
    do,4 do do do
    do2 r
    sol' la
    sib sib\mbreak
    la r4 sib
    la2 r
    R1*2
    la,4 la la la
    la1
    la
    R
    la'4 la la la
    la2 r\mbreak
    R1*23

}

IIIcrIIn =\relative do'' {

    r4
    la2 r
    do r
    fa r

    %4
    R1
    do2 do
    do do

    %7
    do r
    R1*5
    la2 la

    %14
    la r
    R1*10
    do2 fa,

    %26
    do' fa,
    do' r
    R1

    %29
    do2 sol'
    fa la
    sol r

    %32
    do, sol'
    do, r\mbreak
    R1

    %35
    la2 la
    la4 la la la
    la2 r

    %38
    R1*7\mbreak
    do4 do do do
    fa2 r

    %47
    R1*18
    fa4 fa fa fa
    do2 do

    %67
    sol' sol\mbreak
    fa r4 sol
    fa2 r

    %70
    R1*3
    la,4 la la la
    la1

    %75
    R
    fa'4 fa fa fa
    fa2 r\mbreak

    %78
    R1*23

}


IIIobIn =\relative do'' {

    r4
    fa2 fa
    sol sol
    la fa

    %4
    re do4 la'
    sol2 sol
    sol8 fa mi fa sol fa sol fa

    %7
    sol2 r
    R1*4\mbreak
    fa4 mi8 re do4 sib

    %13
    la2 do
    la r
    R1

    %16
    r4 la do2
    r4 la do2
    r4 la re2

    %19
    r4 si re2
    r4 re fa2
    r4 re fa2

    %22
    R1*3
    do2 la
    do la

    %27
    do r
    R1
    mi2 sol

    %30
    la la
    si2 r4 sol
    mi2 fa

    %33
    mi r\mbreak
    R1*2
    do2 do

    %37
    do r
    R1*7\mbreak
    do4 re8 mi fa4 fa

    %46
    re2 r
    R1*16
    do4 do do do

    %64
    do mi4. sol8 fa mi
    la2 fa
    mi la

    %67
    re, sol\mbreak
    fa r4 mi
    la,2 r

    %70
    R1*2
    la4 la la la
    la2 dod

    %74
    dod la
    R1
    fa'4 fa fa fa

    %77
    fa2 r\mbreak
    R1*6
    la8 mi do la do2

    %85
    mi r
    R1*15

}


IIIobIIn =\relative do'' {

    r4
    la2 la
    do mi
    do do

    %4
    fa sol4 fa
    mi2 mi
    mi8 re do re mi re mi re

    %7
    mi2 r
    R1*4\mbreak
    fa4 mi8 re do4 sib

    %13
    la2 la
    fa r
    R1

    %16
    r4 fa la2
    r4 fa la2
    r4 fa la2

    %19
    r4 sol si2
    r4 si re2
    r4 si re2

    %22
    R1*3
    sol,2 fa
    sol fa

    %27
    sol r
    R1
    sol'2 mi

    %30
    fa re
    re r4 re
    do2 si

    %33
    sol' r\mbreak
    R1*2
    la,2 la

    %37
    la r
    R1*7
    la4 sib8 do la4 la

    %46
    sib2 r
    R1*16
    la4 la la la

    %64
    mi' sol4. sib8 la sol
    fa2 do
    do do

    %67
    sol' mi\mbreak
    la,2 r4 do
    do2 r

    %70
    R1*3
    la4 la la la
    la2 fa

    %75
    R1
    re'4 re re re
    re2 r\mbreak

    %78
    R1*6
    do2 la'8 mi do la
    do2 r

    %86
    R1*15

}

IIIvlIn =\relative do'' {

    r8 fa
    fa do la fa la'2-!
    sol8 mi do sol sib'2-!
    la8 fa do la do'4. do8-!

    %4
    re sib do la sib sol la fa
    sol mi fa re mi do re si
    do2 do

    %7
    do r
    do, r
    do r

    %10
    fa4 mi8 re do4 sib
    do2 r\mbreak
    do r

    %13
    la' la
    do r
    sol r

    %16
    do, r
    fa4 mi8 re do4 sib
    do2 la'

    %19
    si re,
    re2. re'4
    re,2. re'4

    %22
    re,2 re'\mbreak
    do4 sol do2~
    do si

    %25
    do8 sol mi[do] fa4 do'
    do8 sol mi[do] fa4 do'
    mi,2 do'~

    %28
    do si
    sol'8\f mi do sol sib'!2-!
    la8 fa do la do'4. do8

    %31
    si sol la fa sol mi fa re
    mi2 re
    do r\mbreak

    %34
    fa,\p sol
    la r
    do,4 do do do

    %37
    do2 la'
    re, re'\p~
    re4 do8 sib do2~

    %40
    do4 sib8 la sib2~
    sib4 la8 sol la2~
    la4 sol8 fa sol2

    %43
    fa4 fa' fa,2~
    fa mi\mbreak
    fa4 fa fa fa

    %46
    sib2 r
    la4\p la la do
    sib2 r

    %49
    la4 la la la
    fa re sol2
    la fa

    %52
    re mi
    fa sib,
    do sib

    %55
    fa'1~\mbreak
    fa~
    fa

    %58
    fa2 fa
    do' r
    R1

    %61
    fa,~
    fa2 mi
    fa'8\f[do] la fa la'2

    %64
    sol8 mi do sol sib'2
    la8 fa do la do'4. do8
    sib la sib sol la sol la fa

    %67
    sol mi fa re mi4. fa8\mbreak
    fa la, sib sol la4 sol
    la2 r

    %70
    R1*2
    mi'8\p dod la mi mi'2
    mi8 dod la[mi] dod2

    %74
    la' la
    sib la
    la'8\f fa re la fa'2

    %77
    la, r\mbreak
    re8\p si sol[re] si'2
    do sol

    %80
    do8 sol mi[do] sol'2
    do8 la fa[do]  la'2
    sold la~

    %83
    la sold
    la4 mi' do la
    do1\p~

    %86
    do
    si~
    si

    %89
    la~\mbreak
    la
    sold2 si

    %92
    la mi
    mi re
    sold sold

    %95
    sold sold
    sold r
    R1

    %98
    r2 la~
    la sold
    la r4 r8 fa'

}


IIIvlIIn =\relative do'' {

    r4
    do8 la fa[do] do'2-!
    mi8 do sol[mi] mi'2-!
    fa8 do la[fa] fa'2

    %4
    fa sol4 do,
    mi8 do re si do mi, fa re
    mi2 mi

    %7
    mi r
    la, r
    la r

    %10
    fa'4 mi8 re do4 sib
    la2 r\mbreak
    la r

    %13
    la' la
    do r
    sol r

    %16
    la r
    fa4 mi8 re do4 sib
    fa'2 fa

    %19
    re sol,
    sol' sol
    sol sol

    %22
    sol sol\mbreak
    sol fa
    sol1

    %25
    do8 sol mi[do] fa4 la
    do8 sol mi[do] fa4 la
    sol2 r4 fa

    %28
    sol1
    mi'8 \f do sol[mi] mi'2-!
    fa8 do la[fa] la'2

    %31
    sol8 mi fa re mi do re si
    sol2 si
    do r\mbreak

    %34
    sib?2\p do
    do r
    la,4 la la la

    %37
    la2 do
    sib r
    sol'1\p

    %40
    fa
    mi
    re

    %43
    do2 r
    do do\mbreak
    fa4 fa' do la

    %46
    fa2 r
    fa4\p fa' do la
    fa2 r

    %49
    fa4 do' do fa,
    sib,2 sol'
    la fa

    %52
    re mi
    fa re
    mi mi

    %55
    la, la\mbreak
    la la
    la la

    %58
    la la
    la r
    R1

    %61
    sib2 r
    do1
    do'8\f la fa[do] do'2

    %64
    mi8 do sol[mi] mi'2
    fa8 do la[fa] fa'2
    sol8 fa sol mi fa mi fa la,

    %67
    re do re sib sol2\mbreak
    la8 fa sol mi fa4 mi
    fa2 r

    %70
    R1*2
    dod'2 dod,
    mi mi

    %74
    dod re4 fa
    mi2 mi
    fa la'8\f fa re la

    %77
    re,2 r\mbreak
    R1
    sol'8\p mi do[sol] re2

    %80
    sol do8 sol mi[do]
    do'2 do8 la fa[do]
    re2 la'

    %83
    mi mi
    mi'8 do la[mi] do' la mi[do]
    la'4\p la la la

    %86
    fa fa fa2~
    fa re
    mi4 mi mi'2~

    %89
    mi\p do\mbreak
    re4 re re2~
    re sold,

    %92
    la la,
    la fa'
    mi mi

    %95
    mi mi
    si' r
    R1

    %98
    r4 mi, fa2
    mi1
    la,2 r

}


IIIvlan =\relative do' {

    r4
    la'2 fa
    sol sol
    fa fa

    %4
    re do
    do sol
    sol sol

    %7
    sol r
    fa r
    fa r

    %10
    fa'4 mi8 re do4 sib
    fa2 r\mbreak
    fa r

    %13
    sol sol
    sib r
    do r

    %16
    fa r
    fa, fa
    fa fa

    %19
    sol sol
    si si
    si si

    %22
    si si\mbreak
    do la
    sol1

    %25
    do8 sol mi do fa2
    do'8 sol mi do fa2
    mi r4 fa

    %28
    sol2 sol
    do sol'
    la re,

    %31
    re r4 sol
    sol2 sol
    sol r\mbreak

    %34
    re\p sol,
    fa r
    fa4 fa fa fa

    %37
    fa2 fa'
    fa r
    mi! la,

    %40
    re sol,
    do fa,
    sib sib

    %43
    la r
    do do,\mbreak
    fa4 fa fa fa

    %46
    fa2 r
    fa4 fa fa fa
    fa2 r

    %49
    fa4 fa fa fa
    sib2 sol
    la fa

    %52
    re' mi
    fa sib,
    do sib

    %55
    la la\mbreak
    la la
    la la

    %58
    la la
    la r
    R1

    %61
    sib2 r
    do1
    la'2\f fa

    %64
    sol sol
    fa fa
    mi do

    %67
    re do\mbreak
    do r4 do
    do2 r

    %70
    R1*2
    la2 la
    la la

    %74
    la la'
    sol mi
    re re

    %77
    fa r\mbreak
    re re
    mi\p sol

    %80
    mi mi,
    la fa
    re' do~

    %83
    do mi
    do do
    la4\p la la la

    %86
    re, re re2
    sol sol
    do,4 do do2

    %89
    fa fa\mbreak
    si4 si si2
    mi, mi

    %92
    la la
    la fa
    mi mi

    %95
    mi mi
    mi r
    R1

    %98
    r4 mi fa2
    mi1
    la2 r

}

IIIsopranon = \relative do'' {

    \autoBeamOff

    r4
    R1*7
    do2 fa
    fa4 mi8 [re] (do4) sib

    %10
    la(sib) do2
    fa4 mi8 [re] do4 sib\mbreak
    la(sib) do re

    %13
    mib2 mib4 mib
    mib(do) la mib'
    re1

    %16
    do2 la4. sib8
    do2 la4. sib8
    do4(fa) fa re

    %19
    si2. la8 [sol]
    re'2. do8 [si]
    fa'2. mi?8 [re]

    %22
    sol4 re fa mi8 [re]\mbreak
    mi4 si do fa
    mi2 re8 [do] re4

    %25
    do1~
    do~
    do4 mi sol fa

    %28
    mi2 re8 [do] re4
    do2 r
    R1*3

    %33
    r2 do4 do\mbreak
    fa mi8 [re] do4 sib
    la(sol) fa8[sol] la [sib]

    %36
    do4(sib) la8[sib] do [re]
    mib1
    re2 re4 re

    %39
    sol(mi!) do re8 [mi]
    fa4(re) sib do8 [re]
    mi4 do la sib8 [do]

    %42
    re4 sib sol la8 [sib]
    do2 r4 fa
    la,2 sib4 sol\mbreak

    %45
    fa2 r4 do'
    re re8 [mi] fa4 re
    do do8 [re] mib4 do

    %48
    re8 [do re mib] fa4 re
    do fa4. mib8 [re do]
    re4 sol4. fa8 [mi! re]

    %51
    do4 fa4. mi8 [re do]
    sib4 do8 [re] do [sib la sol]
    la4 sib8 [do] re4 sib

    %54
    sol sol2 la8 [sib]
    do4 do2 re8 [mi]\mbreak
    fa4 mi8[re do sib la sol]

    %57
    fa'4 mi8[re do sib la sol]
    fa4 la2 do4
    mib1~

    %60
    mib2 r4 mib
    re(fa) re do8 [sib]
    la2 sol4 la

    %63
    fa2 r
    R1*5
    r2 fa'4 mi

    %70
    re(dod) re fa
    mi(dod) re mi
    mi2 la,

    %73
    dod4(re) mi fa
    sol(mi) fa mi8 [re]
    mi2 dod4 re

    %76
    re2 r
    fa re\mbreak
    si4(do) re sol,

    %79
    do(mi) re fa
    mi(re) do2
    la4(si) do la

    %82
    re fa mi re
    do2 si8[la] si4
    la2 r

    %85
    mi' do
    fa~fa8 [re mi fa]
    si, [do re si] sol4 fa'

    %88
    mi2~mi8 [do re mi]
    la, [si do la] fa4 mi'\mbreak
    re2~re8 [si do re]

    %91
    sold, [la si sold] mi4 re'
    do la4. do8 [si la]
    mi'4 la,4. do8 [si8 la]

    %94
    mi'4 si sold mi
    mi' si sold mi
    re'4 dod re2~

    %97
    re r4 fa
    mi2 re8[do] si [la]
    do2 si4. do8

    %100
    la2 r

}

IIItesto = \lyricmode {

    Co -- me pre -- sto nel Por -- to pre -- sto pre -- sto pre -- sto, nel Por -- to

    cru -- de -- le, cru -- de -- le il mio fa -- to mi vol -- le gui -- dar - - - - - - - - - - - -

    mi vol -- le gui -- dar - - mi vol -- le gui -- dar!

    Co -- me pre -- sto nel Por -- to pre -- sto pre -- sto pre -- sto, nel Por -- to

    cru -- de -- le il mio fa -- to mi vol -- le gui -- dar - - - - - - - mi vol -- le gui -- dar,

    mi vol -- le gui -- dar - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  mi vol -- le mi vol -- le gui -- dar!

    Quan -- do_al -- tro -- ve le stan -- che mie ve -- le nem -- bo i -- ra -- to do -- ve -- va por -- tar,

    quan -- do_al -- tro -- ve le stan -- che mie ve -- le nem -- bo i -- ra - to do -- ve -- va por -- tar,

    nem -- bo_i -- ra - - - - - - - - - - - - - - - - - - - - - - - - - - - to do -- ve -- va, do -- ve -- va por -- tar.

}

IIIbcn =\relative do {

    r4
    fa2 fa
    mi do
    fa la

    %4
    sib mi,4 fa
    do2 do
    do do

    %7
    do4 sib la sol
    fa2 r
    fa' r

    %10
    fa r
    fa mi\mbreak
    fa r

    %13
    fa fa
    fa r
    mi! r

    %16
    fa r
    \clef tenor \key fa\major fa\solo fa
    fa fa

    %19
    sol sol
    si si
    si si

    %22
    si si\mbreak
    do la
    sol sol,

    %25
    do'8[sol] mi do fa2
    do'8[sol] mi do fa2
    mi r4 la

    %28
    sol2 sol,
    \clef bass\key fa\major do\tu do
    fa fad

    %31
    sol r4 si
    do2 sol
    do, r\mbreak

    %34
    re mi
    fa r
    fa r

    %37
    fa fa
    sib, r
    \clef tenor \key fa\major mi!\solo la

    %40
    re, sol
    do fa,
    sib sib

    %43
    la r
    do do,\mbreak
    fa4 fa fa fa

    %46
    fa2 r
    fa4 fa fa fa
    fa2 r

    %49
    fa4 fa fa fa
    sib2 sol
    la fa

    %52
    re' mi
    fa sib,
    do sib

    %55
    la la\mbreak
    la la
    la la

    %58
    la la
    la r
    R1

    %61
    sib2 r
    do do,
    \clef bass \key fa\major fa fa

    %64
    mi do
    fa la
    do, fa

    %67
    sib, do\mbreak
    fa r4 do
    fa,2 r

    %70
    sib' fa
    sol sib
    la r

    %73
    la r
    la re,
    sol, la

    %76
    re re
    re r4 fad\mbreak
    sol2 fa

    %79
    mi si
    do r4 mi
    fa2 r

    %82
    si,  do4 re
    mi2 mi,
    la la

    %85
    la4 \clef tenor \key fa\major la'4\solo la la
    re, re re2
    sol sol

    %88
    do,4 do do2
    fa fa\mbreak
    si,4 si si2

    %91
    mi mi
    la la
    la fa

    %94
    mi mi
    mi mi
    mi r

    %97
    R1
    r4 mi fa2
    mi1

    %100
    la,2 r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s1
    <6>2 <7>
    s <6>
    s1*7
    s2 <6>
    s1
    <7->
    s
    <7 5>
    s1*13
    s2 <7>
    s1
    <_!>
    s2 <_! 7>
    s1
    <6>2 <6>
    s1
    s
    <7->
    s1*26
    <6>2 <7>
    s <6>
    <7> s
    <6>1
    s
    s
    <5>2 <6>
    <6> <6>
    <_+>1
    <_+>
    s
    <6>2 <_+>
    s1
    s2 s4 <6>
    <_!>2 <6 4!>
    <6>1
    s2 s4 <6>
    s1
    <6+>2 <6>
    <6 4> <3+>

}

forma = {

    \time 2/2
    \key fa\major
    \tempo 1 = 45
    \partial 4 s4
    \mark\markup {\segno}
    s1*7\once \override Score.RehearsalMark.extra-offset = #'(+5 . 0)
    \mark \markup {All[egr]o}
    \tempo 1 = 60
    s1*61
    s2 \bar "||"\break
    s
    s1*31
    \bar "||"
    \mark\markup\center-column\smaller {"Dal"\segno}

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


IIIvla = {
    \IIIglobal
    \clef alto
    <<\IIIvlan \forma>>
}

IIIsoprano = {
    \new Voice = "porto"
    <<\IIIsopranon \forma>>
}


IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}



IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IVfln =\relative do'' {

    r4
    R1
    r8 si'16. do32 re8[re] re fa,16. sol32 lab8 [lab]
    lab sol sol sol  sol sol fa[fa]

    %4
    mib16. re32 mib16. fa32 sol4 r r8 mib16. fa32
    sol8 mib r4 r8 sol16. lab32 sib8 [sol]\mbreak
    fa8 fa re'[re] re do16. si32 do4

    %7
    r2 r8sol16. mib32 fa8[fa]~
    fa16. sol32 fa16. sol32 fa8 do' re4 r
    r2 r8 sib16. la?32 sib4~\mbreak

    %10
    sib8\solo sib lab16. sol32 fa16. mib32 re8 sol16. la32 si8[do]
    re4 r  r8 si16.[do32] re8 sol,
    sol la16. sib32 do4 sib2

    %13
    lab~\mbreak lab8 sol r4
    r2 r8 do16.[sib32] lab8 lab
    lab lab16. sol32 fa8[fa] re' si re4

    %16
    r r8 sol,16. lab32 sol16. lab32 sol16. lab32 sol8[sol]\mbreak
    fa8 sol sol sol fa [lab?16. sol32] fa8 re'~
    re sol,16. lab32 sol8 re' do4 r

    %19 OOKK
    R1
    r8 sib16. la32 sib8 sol\mbreak fa do'16. sib32 la8 sol
    r fa16. mi32 fa4 r8 la sol16 fa mi8

    %22
    fa16. sol32 la16. sib32 la8 sol r fad16. sol32 la8 la16. sol32
    fad8 do' r4\mbreak r r8 re16. do32
    sib8 sol16. lab32 sib8 sol r do16. la32 re8 re

    %25
    re4 r r2
    R1
    r2 r4 r8 mib,16. fa32

}

IVvlIn =\relative do'' {

    r8 mib16. fa32
    sol8 sol, sol sol sol mib'16. fa32 sol8 do
    do si r si,16. do32 re8 re,16. mib32 fa8 fa
    fa mib16. fa32 sol8 do16. si32 do8 do' do si

    %4
    do do,16. re32 mib4 r8 mib16. fa32 sol4
    r8 mib,\p mib mib fa mib16. fa32 sol8 mib\mbreak
    lab8 lab lab sol sol16. lab32 sol16. fa32 sol8 sol

    %7
    r fad16. sol32 do8 la? sib8. sib16 do8 do~
    do16. sib32 sib16. mib32 re8 do fa\f sib16. la32 sib8 do~
    do16 sib32 la sib16. re,32 do8 do, re\p re16. mib32 fa8 sol\mbreak

    %10
    fa sol fa[fa] fa mib16. fa32 sol8 mib
    fa re si' [do] do si16. la32 sol8 sol
    sol fa16. sol32 la8 fa fa mib16. fa32 sol8 sol

    %13
    lab fa si8. do16\mbreak re8 re, r r16 si'
    do8 do4 si8 do sol4 fa8~
    fa fa16. sol32 lab8 lab re,! sol16. la32 si4~

    %16
    si8 do mib[re] r mib16.\f fa32 sol8 mi\mbreak
    do sol'16. lab32 sib8 sib sib16 lab32 sol fa16. sol32 lab8 lab
    lab16. sol32 sol16. fa32 mib8 re mib4 r8 sol,\p

    %19
    fa16 re32 mib fa16 fa mib8 sol do fa, do' do,16. do'32
    r8 re,16. mib32 fa8 sol\mbreak la fa16. sol32 la8 mi
    r la16. sib32 do8 re sib16. sol32 la16.[fa'32] mi16 re dod8

    %22
    r fa,16. fa32 fa8 sol r do16. re32 mib?8 mib,
    do' fad, r4\mbreak r16 re do16. sol'32 sol8 fad
    sol sib mib[mib,]mib fa fa[lab]

    %25
    fa lab r4 r sol8\p fa
    fa2 mib4 r
    r2 r8 mib'16. fa32 sol4

}


IVvlIIn =\relative do'' {

    r8 do16. re32
    mib8 mib, mib mib mib do'16. re32 mib8 mib
    mib re r sol,16. la32 si8 re re,[re]
    do do'16. si32 do8 sol sol' mib re re

    %4
    mib sol, do,4 r8 do'16. re32 mib4
    r8 do,\p do do do sib r4\mbreak
    re8 do si[sol] do do16. re32 mib8 do

    %7
    r la'16. sol32 fad8 fad sol8. sol16 la8 la,
    re re16. mib32 fa8 fa re re'16.\f mib32 fa16 sol32 fa sol16. sol32
    lab16. fa32 fa16. sib,32 sib8 la sib\p sib,16. do32 re8 mib\mbreak

    %10
    sib sol lab[lab] sib mib r mib
    re sol sol fad sol sol,16. la?32 si8 si
    sib! la! la lab lab8 sol sol[sol']

    %13
    fa fa16. mib32 re8 re16. do32\mbreak si8 si r r16 sol'
    lab8 sol16. fa32 sol8 sol, do do16. mi32 fa8 fa
    fa fa fa fa si, sol sol'4~

    %16
    sol8 fad sol[sol] do4 mib8\f sol\mbreak
    fa16. fa32 mi16. fa32 sol8 mi do do16. mi32 fa8 fa~
    fa16 mib?32 re mib16. do32 do8 si do4 r8 mib,\p

    %19
    re re do[do] la! sib? sib la
    r sib16. do32 re8 sib\mbreak la8 fa' fa mi
    r fa16. sol32 la8 fa mi fa sol[la]

    %22
    r re,16. re32 re8 sib r la16. sib32 do8 do16. sib32
    la8 la r4\mbreak r16 sib la16. sol32 re'8 re
    sol, sol'16. fa32 sol8 mib? lab la16. fa32 sib,8 sib

    %25
    sib8 sib r4 r do8\p lab
    sib2 mib4 r
    r2 r8 do'16. re32 mib4

}


IVvlan =\relative do' {

    r4
    R1
    r2 r8 si si si
    do do16. re32 mib8 mib16. fa32 sol8 sol lab sol

    %4
    sol mib do4 r2
    r8 sol\p lab lab fa' sib, r4\mbreak
    re8 do si[sol] do do,16. re32 mib8 do

    %7
    r la'?16. sol32 fad8 fad sol8. sol16 la8 la
    re, re'16. mib32 fa8 fa, sib fa'4\f  mib8
    fa fa sol[fa] fa\p sib,16. do32 re8 mib\mbreak

    %10
    sib sol lab[lab] sib mib, r mib'
    re sol, sol fad sol sol16. la?32 si8 si
    sib! la! la lab lab sol sol sol

    %13
    fa fa16. mib32 re8 re'16. do32\mbreak si8 si r r16 sol
    lab8 sol16. fa32 sol8 sol do, do'16. mi32 fa8 fa
    fa fa fa[fa,] si sol sol4~

    %16
    sol8 fad sol4 mib8[sol] do\f reb\mbreak
    do sib16. do32 reb8 do do fa do[fa]
    re16. sol32 do,16.[do32]  mib8 sol sol4 r8 mib\p

    %19
    re re, do[do'] la! sib sib la
    r sib16. do32 re8 sib\mbreak la fa fa[mi]
    r fa16. sol32 la8 fa mi fa sol[la]

    %22
    r re16. re32 re8 sib r la16. sib32 do8 do16. sib32
    la8 la r4\mbreak r16 sib la16. sol32 re'8 re,
    sol sol16. fa32 sol8 mib lab la16. fa32 sib8 sib

    %25
    sib sib r4 r do8\p lab
    sib2 mib,4 r
    R1

}

IVsopranon = \relative do'' {

    \autoBeamOff

    r4
    R1*3
    r4 r8 do16. re32 mib16[re] do8 r do16. re32
    mib8 do16 sib lab8 lab lab sol r sol16 lab\mbreak

    %6
    si8 do re16[mib] fa8 fa16[re] mib8 r mib16 re
    do16[re] mib4 re16 do sib[sol] mib'4 re16 do
    fa16. mib32 re16 do32[sib] sib8[la] sib4 r

    %9
    r2 r4 r8 sib16 do\mbreak
    re8 mib do16[sib] lab8 lab sol r sol16 la
    si8. do16 re8 mib  mib re r re16 re

    %12
    mi8 fa4 do16 do re8 mib?4 sol,16 la
    si do re8. mib16 fa8~\mbreak fa16 re mib fa sol16. fa32 mib16. re32
    do16. fa32 mib16. re32 mib8[re] do4. reb16 do

    %15
    reb[mib] fa4 do16 sib32[lab] sol16[si re?8.] si32[do] re16[mib32 fa]
    sol16. re32 mib16 re32[do] do8[si] do4 r\mbreak
    R1

    %18
    r2 r4 sol8 do
    do sib r mib16 do fa8 mib16 re mib8 fa
    fa sib, r re16 mi\mbreak fa8 la,16[sib] do[sib] do8

    %21
    do fa, r la16 si dod8 re16 fa mi[re] dod8
    re la r re16. re32 re8 do r la16. sib32
    do16. re32 mib8 r16 mib re do\mbreak re[sol] fad[sol] sib,8[la]

    %24
    sol mib' r16 sib do16. reb32 reb16. do32 fa8 r re16 fa
    lab,8 fa' r4 r8 re mib do
    re2 mib~

    %27
    mib4. do16. re32 mib16[re] do8 r do16. re32

}

IVtesto = \lyricmode {

    Mi ri -- ve -- di, mi ri -- vedi, _ o sel -- va_om -- bro -- sa, ma non più Re -- gi -- na,_e Spo -- sa,

    mi ri -- ve -- di sven -- tu -- ra -- ta, di -- sprez -- za -- ta Pa -- sto -- rel -- la.

    Mi ri -- ve -- di_o sel -- va_om -- bro -- sa, ma non più Re -- gi -- na,_e Spo -- sa,

    mi ri -- ve -- di sven -- tu -- ra -- ta, mi ri -- ve -- di sven -- tu -- ra -- ta,

    di -- sprez -- za -- ta di -- sprez -- za -- ta Pa -- sto -- rel -- la;

    sven -- tu -- ra -- ta, di -- sprez -- za - - - ta Pa -- sto -- rel -- la.

    E' pur quel -- lo, quel -- lo, quel -- lo il pa -- trio Mon -- te, que -- sta_è pur l'a -- mi -- ca Fon -- te,

    que -- sto_è_il Pra -- to, e que -- sto_è_il Ri -- o e sol' i -- o, e sol' io non son, no no non son più quel -- la,

    no non son più quel -- la, no non son più,  no non son più quel -- la.

    Mi ri -- ve -- di, mi ri-

}

IVbcn =\relative do {

    r4
    do r8 do16. re32 mib8 mib mib do
    sol' sol, r4 r2
    r4 r8 do16. re32 mib8 mib fa sol

    %4
    do, do do4 r2
    do8 do do do re mib r4\mbreak
    \clef tenor\key sol \minor re'8\solo do si sol do do,16. re32 mib8 do

    %7
    r la'16. sol32 fad8 fad sol8. sol16 la8 la
    re, re'16. mib32 fa8 fa, \clef bass\key sol \minor  sib8\tu sib,16. do32 re8 mib
    mib re mib fa sib,\noBeam \clef tenor\key sol \minor sib'16.\solo do32 re8 mib\mbreak

    %10
    sib sol lab[lab] sib mib, r mib'
    re sol, sol fad sol sol16. la32 si8 si
    sib! la! la lab lab sol sol sol

    %13
    fa? fa16. mib32 re8 re'16. do32\mbreak si8 si r r16 sol
    lab8 sol16. fa32 sol8 sol, do4 r
    R1

    %16
    \clef bass\key sol \minor r2 do8\tu do do[sib]\mbreak
    lab16. lab'32 sol16. fa32 mi8 do fa, fa'~fa16. mib?32 re16. do32
    si16. si32 do16.[fa32] sol8 sol, do4  \clef tenor\key sol \minor  r8 mib'\solo

    %19
    re re, do[do'] la! sib sib la
    r sib16. do32 re8 sib\mbreak la fa fa[mi]
    r fa16. sol32 la8 fa mi fa sol[la]

    %22
    r re16. re32 re8 sib r la16. sib32 do8 do16. sib32
    la8 la r4\mbreak r16 sib la16. sol32 re'8 re,
    sol sol16. fa32 sol8 mib lab la16. fa32 sib8 sib

    %25
    sib8 sib r4 r do8 lab
    sib4 sib, mib r
    \clef bass\key sol \minor  R1

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s2 <6>
    <6 4>8 <5 3!> s4 s2
    s4 s8 s16. <6!>32 <6>4 <6 5 _->8 <_!>
    s1
    <5>4 <6-> <6 5-> s
    s1*2
    s2 s4 <6>8 <6>
    <4! 2>8 <6> <6 5> s s2
    s1*6
    s2 <_->4 s8 <6 4! _->
    <6>8 <6!>
    <5-> <7> <4> <3-> s4
    <7- 5>16. <6>32 s16. <_->32 <6 4>8 <3!>

}

forma = {

    \time 4/4
    \key sol\minor
    \tempo 4 = 40
    \partial 4 s4
    s1*4
    \mark\markup {\segno}
    s1*13
    s2 s4
    \bar "||"\break
    s
    s1*9
    \bar "||"
    \mark\markup\center-column\smaller {"Dal"\segno}

}


IVfl = {
    \IVglobal
    <<\IVfln \forma>>
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

IVsoprano = {
    \new Voice = "rivedi"
    <<\IVsopranon \forma>>
}


IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}



Vglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

VobIn =\relative do'' {

    r8
    r la16 sol fa mi
    re8 r16 fa' mi re
    r sol fa8[mi]

    %4
    la sol mi
    fa r r
    R4.*2

    %8
    r8 r16 la, re16\p [do]
    sib la sol fa mi re\mbreak
    la'8 dod\f[mi]

    %11
    la r r
    r r re,
    r r do

    %14
    r r do
    r r re
    r r fa

    %17
    r r do
    r r re\mbreak
    r r mi

    %20
    fa mi r
    fa r r
    R4.

    %23
    mi8 r r
    fa r r
    R4.

    %26
    r8 r16 si, mi re
    do [si] la sol fa mi
    la8. la16 re8\mbreak

    %29
    re16 si la[do] la8
    r16 re do8[si]
    do r r

    %32
    r16 si re do sib la
    sol[fa] mi8 r
    mi' fa r

    %35
    r r mib~
    mib re r
    R4.*2

    %39
    r8 r mi\p
    fa  mi re
    dod re4

    %42
    dod16 re mi[la,] mi'8
    la, r r
    mi' r r

    %45
    fa r r\mbreak
    R4.
    fa8\f sol8. sol16

    %48
    fa8 r r
    r la, re
    R4.

    %51
    r8 do mi
    R4.
    r8 re fa

    %54
    r mi sol
    r dod, la\mbreak
    r dod la

    %57
    r dod re
    R4.
    la4.

    %60
    r8 la16\f sol fa mi
    re8 r16 fa' mi re
    r sol fa8[mi]

    %63
    la sol mi
    fa r r
    R4.\mbreak

    %66
    r8 re si
    do mi16 re do si
    sol'8 r r

    %69
    r sol\p mi
    r si16 do re8\noBeam
    r si16[re] do8

    %72
    r sol8.\noBeam la32 si
    do8 r r\mbreak
    R4.*2

    %76
    r8 si8. do32[re]
    mi8 r r
    r fa r

    %79
    r mi r
    r fa r
    R4.*2

    %83
    r8 mi8. fa32[sol]\mbreak
    la8 r r
    r re, r

    %86
    r do r
    r la' r
    R4.

    %89
    do,8 r r
    sib r r
    fa' r r

    %92
    r16 mi\p sol mi re8\noBeam
    r16 mi\p sol mi re8\noBeam
    r16 mi\p sol mi do8\noBeam\mbreak

    %95
    R4.*3
    r16 la\f  la si do re
    mi[fa] mi8 la

    %100
    r16 re, re8[dod]
    re16 fa la8\noBeam r
    r16 sol\noBeam fa8 mi

    %103
    la sol mi
    fa r r

}

VvlIn =\relative do'' {

    r16 la'
    re la, la sol fa mi
    re fa' mi re do sib
    sib' re \once\stemUp la,8 [dod']

    %4
    r16 re, mi,8 [dod']
    re r r
    R4.*2

    %8
    la8 r re16\p do
    sib la sol fa mi re\mbreak
    la' mi'\f mi re dod si

    %11
    la8 re,\p do
    sib16 do re mi fa re
    sol8. fa16 mi sol

    %14
    la sol fa mi re do
    sib fa' sol fa mi re
    sol fa mi re do do'

    %17
    sib la sol fa mi re
    do8. la16 fa'8\mbreak
    re'16\p do si la sol do

    %20
    si8 do r
    re r r
    R4.

    %23
    si8 r r
    sold r r
    R4.*2

    %27
    la16\f mi la sol fa mi
    re la' re[mi] fa8~\mbreak
    fa16 re do[la] mi' la

    %30
    fa la \once\stemUp mi,8[sold']
    la r r
    re,,\noBeam\p re'16 do sib la

    %33
    sol fa mi re do8\noBeam
    sib' do16 do, fa mib
    re8 sib' do

    %36
    fa,16 sib sib,8[fa']~
    fa8 mi?16 re mi8~\mbreak
    mi re16 dod re fa

    %39
    sib16[la] sol8 la~
    la16 sol sol fa sol8\noBeam
    r16 la sol fa mi re

    %42
    la'8 dod8. dod16
    re8 r r
    la r r

    %45
    la r r\mbreak
    r16 sib\p\noBeam la sib la sol
    fad[la] re8\f sib'

    %48
    la la,16 sol fa mi
    re8 r r
    sib'8. la16 sol fa

    %51
    mi8 r r
    do'8. sib16 la sol
    fa8 r r

    %54
    r sib r
    r la la,\mbreak
    la'4 fa8

    %57
    la4 si!8
    R4.
    la

    %60
    r16 la'\f la, sol fa mi
    re fa' mi re do sib
    sib' re\once\stemUp la,8 [dod']

    %63
    r16 re, mi,8 [dod']
    re r r
    R4.\mbreak

    %66
    re,16 fa re si re8\noBeam
    r16 do' sol' fa mi re
    do sol do,8\noBeam r

    %69
    r si'\p do
    r sol la
    r si sol

    %72
    r sol16 fa mi re
    do8 r r\mbreak
    r si'16 la sold8\noBeam

    %75
    r do16 si la8\noBeam
    r sold'16 la si8\noBeam
    la r r

    %78
    r sold, r
    r la r
    r la r

    %81
    R4.
    r8 mi sold
    la16 mi dod'[re] mi8\mbreak

    %84
    re r r
    r sib r
    r sol' r

    %87
    r do r
    R4.
    la,8 r r

    %90
    re, r r
    re' r r
    sol,4.\p~

    %93
    sol~
    sol8 do do,\mbreak
    R4.

    %96
    r8 r fa\p~
    fa mi4
    r16 fa\f fa sol la si

    %99
    do re dod8.[dod16]
    re16 fa mi8.[mi16]
    la8 r16 dod re la

    %102
    sib re\once\stemUp la,8 [dod']
    r16 re, mi,8 [dod']
    re r r

}


Vvlan =\relative do' {

    r8
    r la'16 sol fa mi
    re8 r r
    re fa la

    %4
    r16 la\noBeam sib8 [la]
    la r r
    R4.*2

    %8
    fa8 r re16 do
    sib la sol fa mi re\mbreak
    la'8. si16 dod8

    %11
    re r r
    R4.*7
    r8 r do

    %20
    re sol r
    si, r r
    R4.

    %23
    sold'8 r r
    si r r
    R4.*2

    %27
    la,8\noBeam la'16 sol fa mi
    fa8. mi16 re do\mbreak
    fa8 mi r16 mi

    %30
    la,[fa'] mi8 mi
    mi r r
    re8. do16 sib la

    %33
    sol fa mi re do8\noBeam
    sol' la r
    R4.

    %36
    r8 r do
    sol'8. sol,16 sib8\mbreak
    la fa' re

    %39
    dod4 mi8
    la,4 re8
    mi sol4

    %42
    mi8. mi16 sol8
    la r r
    mi r r

    %45
    re r r\mbreak
    R4.
    re8 re re

    %48
    re la16[sol fa mi]
    re8 r re'16 do
    sib8. la16 sol fa

    %51
    mi8 r mi'16 re
    do8. sib16 la sol
    fa8 r r

    %54
    r sol r
    r la r\mbreak
    mi'4 re8

    %57
    mi4 si8
    R4.
    la

    %60
    r8 la'16\f sol fa mi
    re8 r r
    re fa la

    %63
    r16 la\noBeam sib8 la
    la r r
    R4.

    %66
    r8 r sol
    sol do, fa
    sol r r

    %69
    r sol\p sol
    r sol re
    r sol mi

    %72
    r sol16 fa mi re
    do8 r r\mbreak
    r fa mi

    %75
    r mi fad
    r si, sold'
    mi r r

    %78
    r si r
    r do r
    r re r

    %81
    R4.*2
    r8 la' la,\mbreak
    la r r

    %85
    r sol' r
    r fa r
    r fa r

    %88
    R4.
    fa8 r r
    sib, r r

    %91
    sib' r r
    r do, si!
    r do si

    %94
    r sol' la\mbreak
    R4.
    r8 r re,

    %97
    do4.
    r8 fa8. fa16
    sol8. fa16 mi8

    %100
    la sib la
    la r re,
    re fa la

    %103
    r16 la sib8[la]
    la r r

}

Vtenoren = \relative do' {

    \autoBeamOff

    r8
    R4.*4
    r8 re16[la] mi'[la,]
    fa' [mi re la re mi]

    %7
    fa [mi re la re mi]
    fa[mi] re[dod] re[do]
    sib[la] sol[fa] mi[re]\mbreak

    %10
    la'[sol] la8 r
    r re do
    sib8. do16 re8

    %13
    re16[do] do8. sib16
    la8[sib] do
    re[sib] re

    %16
    mi[do] fa~
    fa mi16[re]  do[sib]
    la[sib] do8 re\mbreak

    %19
    si!16[do] re8 mi
    fa mi r16 mi
    fa[mi fa re] fa[mi]

    %22
    re[do re si do la]
    si[la sold la si do]
    re[do si do re si]

    %25
    mi8 fa16[mi] re[mi]
    do8(si4)
    la8 r r

    %28
    R4.*3
    r8 la mi'
    fa16[mi] re[do] sib[la]

    %33
    sol[fa] mi[re] do8
    sib' la r
    re mib4~

    %36
    mib8 re fa
    sib,16[la] sib8 mi!\mbreak
    la,16[sol la8] re

    %39
    sol,16[fa] sol8 mi'
    fa[mi] re
    dod re4

    %42
    mi8 la, r
    la re16[dod re la]
    mi'8.[re16 mi la,]

    %45
    fa'8. mi16 re8\mbreak
    mi dod4
    re8 r r

    %48
    re la16[sol fa mi]
    re8[la' re]~
    re16 [do sib la sol fa]

    %51
    mi8[do' mi]~
    mi16 [re do sib la sol]
    fa[la] re[mi fa re]

    %54
    sib[sol] mi'[fa sol mi]
    dod[re mi la, fa' la,]\mbreak
    dod[re mi la, fa' la,]

    %57
    mi'[fa sol mi] fa8
    r re16[mi] fa[re]
    re8(dod4)

    %60
    re8 r r
    R4.*3
    r8 la si

    %65
    do16[re] mi[re] do8\mbreak
    fa16[re] si[sol] fa'8
    fa mi r

    %68
    r sol,16[do] si[la]
    si[do] re8 mi
    si16[do] re[mi] fa[mi]

    %71
    re[do re si mi do]
    re8 sol, r
    mi'[do] la\mbreak

    %74
    re8. do16 si8
    mi8. re16 do8
    do si r

    %77
    r la16[si] do[la]
    re[do] re[do] si8
    mi16[re] mi[re] do8

    %80
    fa16[mi] re8 re
    re8. fa16 mi8
    fa do[si]

    %83
    la r r\mbreak
    r re16[mi] fa[re]
    sib[re] sib[sol] do8

    %86
    la16[do] fa8 do
    la16[do] fa8 r16 fa,
    sol[la sib sol] do8~

    %89
    do16 [la do la] re8~
    re16 [sib re sib] fa'8~
    fa16[re  fa re] sol[re]

    %92
    mi![do mi do] fa[re]
    mi[do mi do fa re]
    mi[do mi do] fa8\mbreak

    %95
    r fa,16[sol] la[sib]
    do[la] re8. fa16
    la,8(sol4)

    %98
    fa8 r r
    R4.*5
    r8 re' mi

}

Vtesto = \lyricmode {

    A -- gi -- ta - - ta da fie -- ra pro -- cel -- la in quel pra -- to lan -- gui -- va_u -- na Ro -- sa

    che pom -- po -- sa tra le ro -- se sem -- bra -- va_u -- na stel -- la, sem -- bra - - - - va u -- na ste -- la.

    A -- gi -- ta -- ta da fie -- ra pro -- cel -- la lan -- gui -- va, lan -- gui -- va_u -- na Ro -- sa

    che - pom -- po -- sa tra le ro -- se sem -- bra - - va u -- na stel -- la, sem -- bra - - - - - - - - - va u -- na stel -- la.

    Ma ces -- sa to quel nem -- bo fa -- ta -- le, ri -- pi -- glia -- va_il suo fa -- sto re -- a - le, e ve -- sti -- ta  di

    por -- po -- ra_e d'o -- ro,  scin -- til -- la -- va più_al -- te -- ra, più_al -- te -- ra e più bel -- la_e più bel -- la;

    scin -- til -- la -- va più_al -- te -- ra_e più bel -- la, più_al -- te - - - - - - - - ra e più bel -- la, più bel -- la.

    A -- gi-

}

Vbcn =\relative do {

    r8
    r la'16 sol fa mi
    re8 r r
    sol la8. la,16
    fa8 sol la
    re r r
    re r r
    re r r
    re r r
    r r sib\mbreak
    la la'8. sol16
    fa4 fad8
    r sol fa!
    mi8. re16 do8
    fa r r
    sib r r
    do,8. sib16 la8
    sol4 do8
    fa r r\mbreak
    sol8. fa16 mi8
    re do r
    sold' r r
    sold4 la8
    mi r r
    si? r r
    do re4
    mi8 mi,4
    r8 la'16 sol fa mi
    re8. do16 si la\mbreak
    sold8 la r16 do
    re8 mi mi,
    la r r
    R4.*2
    sol'8 fa r
    fad sol la
    sib4 la8
    sol4 do,8fa4 fa8
    mi8. re16 dod8
    re4 sib'8
    la sib4
    la8. sol16 fa mi
    fa8 r r
    dod16 si la8 dod
    re16 mi fa8[sib]\mbreak
    sol la la,
    re16 do sib la sol8\noBeam
    re' r r
    R4.
    r8 sib'16 la sol fa
    mi8 r r
    r do'16 sib  la sol
    fa8 r fa
    sol r sol
    la r r\mbreak
    la4 re,8 la'4 sold8
    r r sold
    la la,4
    re8\noBeam la'16 sol fa mi
    re8 r r
    sol la8. la,16
    fa8 sol la
    re r r
    mi r r\mbreak
    re4 sol,8
    do4 re8
    mi4 fad8
    sol4 do8
    sol4 fa?8
    sol4 do,8
    sol'8. fa16 mi re
    do8 r do\mbreak
    fa16 mi re8 mi16 re
    do si la8[red]
    mi4 re?8
    do r r
    si r r
    do r r
    re4 do8
    si4 do8
    re mi mi,
    la la' sol\mbreak
    fa r r
    sol4 mi8
    fa4 mi8
    fa r r
    fa4 mi8
    fa4 fa8
    sol4 la8
    sib4 si8
    do4 si8
    do4 si8
    do8. sib16 la8\mbreak
    R4.
    la,8 sib4
    do4.
    fa,4 fa'8
    mi sol4
    fa8 sol la
    fa r fa
    sol la8. la,16
    fa8 sol la
    re r r

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s  <_+>4
    s4.
    <_->8 <6 4>8. <3+>16
    <6>8 <_- 6> <_+>
    s4.*4
    s4 <6>8
    <_+>4.
    <6>
    s8 <_-> <6>
    <7>16 <6> s4
    s4.*2
    s4 <6>8
    <7 _-> <6>4
    s4.
    <_!>4 <6>8
    <6>4.
    <7 5>
    <7 5>
    <_+>
    <6+>
    <6>
    <6 4>8 <3> s
    s4.*2
    <7 5>4 s16 <6>
    s8 <6 4> <3+>
    s4.*3
    <6>4.
    <6>8 <6-> <5->
    <4>8 <3> <6>
    <7> <6> <7->
    <7> <6> <6>
    <6+>4.
    s4 <6>8
    <_+> <6> s
    <_+>4.
    <6>
    s
    s8 <6> <6>
    <6> <_+>4
    s8 <6> s
    s4.*3
    <6>4.
    s
    s4 <6>8
    <_-> s <6>
    <_+> s s
    <_+>4.
    <_+>4 <7 5>8
    s s <7 5>
    <6 4> <3+> s
    s <_+>4
    s4.
    <_->8 <6 4>8. <3+>16
    <6>8 <_- 6> <_+>
    s4.
    <6>
    <6>
    <4>8 <3> <6>
    <6>4 <6>8
    s4.
    s4 <6>8
    s4.*2
    s4 <6>8
    s <6> <_+>
    <5>16 <6> s8 <7 5>
    <6 4> <5 3+> <6 4+>
    <6>4.
    <6+>
    <6>
    s4 <6>8
    <6+>4 <6>8
    s <6 4> <3+>
    s <_+> <6 4+>
    <6>4.
    <_->4 <6>8
    s4 <6>8
    s4.
    <4- 2>4 <6>8
    <5>4 <6>8
    <_->4 <6>8
    <5>4.
    s
    s
    s4 <6>8
    s4.
    <6>
    <6 4>8 <3>4
    s4.
    <6>8 <6+ 4>4
    <6>8 <_-> <3+>
    <6> s <6>
    <_-> s s
    <6> <_-> <_+>

}

forma = {

    \time 3/8
    \key la\minor
    \tempo 4. = 60
    \partial 8 s8
    s4.*5
    \mark\markup {\segno}
    s4.*58
    s8
    \bar "||"\break
    s4
    s4.*40
    \bar "||"
    \mark\markup\center-align\smaller {"Dal"\segno}

}


VobI = {
    \Vglobal
    <<\VobIn \forma>>
}


VvlI = {
    \Vglobal
    <<\VvlIn \forma>>
}


Vvla = {
    \Vglobal
    \clef alto
    <<\Vvlan \forma>>
}

Vtenore = {
    \new Voice = "procella"
    <<\Vtenoren \forma>>
}


Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma \Vbfn>>
}



VIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

VIobIn =\relative do'' {

    r2 do16 re mi fa sol8 la
    sol do, r4 r2
    do'8 si16 la sol fa mi re mi4 re

    %4
    si re do sol'
    sol1\tr~
    sol2~sol8 fa16 mi do'8 sol

    %7
    mi4 re8 do16 si do si do re mi8 la
    mi re16 do si la sol fa mi4 r
    r2 r4 do'16 re mi fa

    %10
    sol8 do, r4 do16 re mi fa sol8 do,
    R1
    sol16 la si do re4 si r

    %13
    R1
    r2 fa'8[sol] mi fa
    re mi fa4 r2

    %16
    R1\fermopz\mbreak
    r2 sol8 mi16 fa sol8 do,
    si4 re re4. fa8

    %19
    mi8. re16 do8 mi re4 si8 re
    do1\tr~\mbreak
    do4 re2\tr~re4~

    %22
    re re2\p mi4~
    mi fa4. mi16 re sol8 fa
    mi8 re16 do re8 sol r2

    %25
    r16 mi re do re8 la si2
    r do16 re mi fa sol8 la
    sol do, r4 do'8[si16 la sol fa mi re]

    %28
    mi4 re si re
    do sol' sol2~
    sol~sol8 fa16 mi do'8 sol

    %31
    mi4 re8 do16 do do si do re mi8 la\mbreak
    mi8 re16 do si la sol fa mi4 r
    R1

    %34
    r2 mi'8\p mi mi re
    dod la dod4 re mi
    fa r\mbreak sib,\p fa'

    %37
    mi la, re2~
    re8 mi16 fa sol8 mi dod mi mi dod
    r mi mi dod la16 la' la la mi la la la

    %40
    la,8 re re do si16 re re re si re re re\mbreak
    do4 re mi8 re do si
    la4 mi' re sol,

    %43
    la1
    sol4-! r r2
    R1

    %46
    do16 re mi fa sol8 la

}

VIvlIn =\relative do'' {

    do16 re mi fa sol8 la sol do, r4
    do16 re mi fa sol8 la16 si do8[si16 la sol fa mi re]
    mi8 do r sol' sol,16 sol' sol sol sol, sol' sol sol

    %4
    sol, fa' fa fa sol, fa' fa fa sol, mi' mi mi sol, mi' mi mi
    re do si la sol8 sol'8. la16 si do re fa, mi re\mbreak
    mi re mi fa re mi fa re mi do re do do'4~

    %7
    do8[si16 la sol fa mi re] mi re do si do4~
    do8[si16 la sol fa mi re] do4 r
    r2 do'16 re mi fa sol8 do,

    %10
    mi,4 r mi\p~mi16 fa sol la
    re, re' re re sol,8 mi\mbreak re16 re' re re sol,8 mi
    r16 sol sol sol sol, sol' sol sol sol, sol' sol sol sol, sol' sol sol

    %13
    sol, la si do re8 si sol'4 r
    sol16 la si do re4 re, do
    si4. do8 re4 sol

    %16
    si, r r2\fermopz\mbreak
    r mi8 do16 re mi8 la
    fa'\p re16 mi fa8 fa sol, la si sol

    %19
    do si la[sol] fa4 sol
    r16 do'\f do do do,4 fa,\p mi\mbreak
    r16 la'\f la la la,8 re si\p re la[re]

    %22
    si sol fad16 re'\p re re re, re' re re sol, sol' sol sol
    do, la sol la fa sol mi fa re8 sol, mi'[re]
    do4 si r2

    %25
    r8 sol' la4 re,2\mbreak
    do'16\f re mi fa sol8 la sol do, r4
    do'8[si16 la sol fa mi re] mi8 do r sol'

    %28
    sol,16 sol' sol sol sol, sol' sol sol sol, fa' fa fa sol, fa' fa fa
    sol, mi' mi mi sol, mi' mi mi re do si la sol8 sol'~
    sol16 la si do re fa, mi re mi do re do do'4~

    %31
    do8[si16 la sol fa mi re] mi re do si do4~\mbreak
    do8 si16 la sol fa mi re do4 r
    la'4\p r8 sold la4 fa

    %34
    r16 mi'\p mi mi \parenthesize mi8 \parenthesize re mi,4 sol
    la8 la la sib la fa la[dod,]
    re4 r\mbreak fa2\p

    %37
    la sib8 la sol fa
    mi re mi[sol] la2~
    la la8 la la sol

    %40
    fad4 r sol8 sol sol fa\mbreak
    mi16 sol sol sol re sol sol sol do,4 r
    r la'2\p sol4~

    %43
    sol fad la,2
    si4-! r sol'8 mi la4
    si r16 sol\f la si do re mi fa sol8 la

    %46
    sol8 do, r4

}


VIvlan =\relative do' {

    mi4 r8 do do4 r8 do
    do4 r8 do sol'4 sol
    sol8 mi r4 mi si

    %4
    re si mi do
    si si si r8 sol'\mbreak
    sol,4 si8 re sol,4 mi'8 sol

    %7
    sol4 sol sol r8 la,
    mi'4 re mi r
    r2 mi4 r

    %10
    mi r sol r
    R1
    r4 sol,16 la si do re4 r

    %13
    R1
    r4 sol,16 la si do re4 do
    si4. do8 re si do[do,]

    %16
    sol'4 r r2\fermopz \mbreak
    r mi'8 do16 re mi8 la,
    re4 si sol8 la si sol

    %19
    do si la sol fa4 sol
    do,8 do' fa[sol] fa4 mi\mbreak
    fa fad sol fad

    %22
    r8 sol fad re si sol r sol
    la sol fa mi re sol mi'[re]
    do4 si r2

    %25
    r8 sol' re4 sol2\mbreak
    mi4 r8 do do4 r8 do
    sol'4 sol sol8 mi r4

    %28
    mi si re si
    mi do si si
    si r8 sol' sol4 mi8 sol

    %31
    sol4 sol sol r8 la,\mbreak
    mi'4 re mi r
    la,4 r8 sold la4 fa'

    %34
    mi8 mi mi re do4 sib
    la8 la la sol fa re' dod la
    fa4 r\mbreak re'2

    %37
    do sib~
    sib la~
    la la8 la la sol

    %40
    fad4 r sol'8 sol sol fa?\mbreak
    mi8 do si [sol] do,4 r
    do'2 si

    %43
    la1
    si4-! r do la
    sol r mi' r8 do

    %46
    do4 r8 do

}

VIsopranon = \relative do'' {

    \autoBeamOff

    R1*7
    r2 r4 do8 sol
    mi'4 re do r

    %10
    sol' fa mi r8 do
    fa[re] mi do\mbreak fa[re] mi[do]
    re4 sol, sol16[la si do] re8 sol

    %13
    re8. do16 si8 sol do8. re16 mi8 fa
    re4 r fa8[sol] mi[sol]
    re mi fa2 mi4

    %16
    re1\tr\fermata\mbreak
    re8 si16 do re8 sol, do4 r
    fa8 re16 mi fa8 fa fa4 re8 fa

    %19
    mi8. re16 do8 mi re do16[re] sol,8 si
    do4 r8 do la do sol do\mbreak
    la4 r8 re si re la re

    %22
    si4 re2 mi4~
    mi fa4. mi16[re] sol8 fa
    mi re16[do] re4 r sol8 fa

    %25
    mi[re16 do] re8 la si4. do8\mbreak
    do4 r r2
    R1*5

    %32
    r2 r4 mi8 re
    do[si] la si do4 re
    mi4 si mi8 mi mi re

    %35
    dod [la] dod4 re mi
    fa8 mi re do?\mbreak sib4 fa'
    mi la, re8 do sib la

    %38
    sol[re'] sol[mi] dod4 r8 mi
    mi[dod] r mi la,4 r
    re8 re re do si4 si\mbreak

    %41
    do re mi8 re do si
    la4 mi' re sol,
    do8 si la sol fad[la] do[la]

    %44
    re4-! r mi8[do] fad[re]
    sol4 r r2
    r

}

VItesto = \lyricmode {

    Cre -- di, cre -- di_A -- mor cre -- di_A -- mor che_in -- de -- gno in -- de -- gno  se -- i, del - bel ti -- tolo, _

    bel ti -- tolo _ d'A -- mor, cre -- di, cre -- di, cre -- di_A -- mor.  Cre -- di che_in -- de -- gno sei,

    cre -- di che_in -- de -- gno sei del bel ti -- tolo, _ bel ti -- to -- lo d'A -- mor, in -- de -- gno_in -- de -- gno

    sei, in -- de -- gno_in -- de -- gno  sei del bel ti -- to -- lo,  bel ti -- to -- lo,  del bel ti - to -- lo d'A -- mor.

    Se del Nu -- me è pro -- prio_il Be -- ne: per -- ché spar -- gi_af -- fan -- ni_e pe -- ne?

    O per -- ché tra gl'al -- tri De -- i re -- gna_un Nu -- me tra -- di -- tor?

    Per -- ché per -- ché per -- ché spar -- gi_af -- fan -- ni_e pe -- ne?

    O per -- ché tra gl'al -- tri De -- i re -- gna_un Nu -- me tra -- di -- tor? Tra -- di -- tor?

}

VIbcn =\relative do {

    do4 r8 fa mi4 r8 fa
    mi4 r8 fa mi4 si
    do si do sol'

    %4
    sol, sol' sol, sol'
    sol, sol' sol, r8 si\mbreak
    do4 si do r8 mi

    %7
    sol4 sol, do r8 fa
    sol4 sol, do r
    r8 do' si sol mi4 r

    %10
    r8 mi re[sol,] do4 mi
    si do\mbreak si do
    sol' r8 sol, sol'4 sol,

    %13
    sol' sol, mi' do
    sol' sol, \clef tenor re''\solo do
    si4. do8 re si do [do,]

    %16
    sol'4 r r2\fermopz\mbreak
    r mi'8 do16 re mi8 la,
    re4 si sol8 la si sol

    %19
    do[si] la sol fa4 sol
    \clef bass r8 do\tu la mi fa4 mi\mbreak
    fa fad sol fad

    %22
    sol \clef tenor r8 re'\solo si sol r sol
    la sol fa mi re sol mi'[re]
    do4 si r2

    %25
    \clef bass r8 mi,\tu fa4 sol sol,\mbreak
    do r8 fa mi4 r8 fa
    mi4 si do si

    %28
    do sol' sol, sol'
    sol, sol' sol, sol'
    sol, r8 si do4 r8 mi

    %31
    sol4 sol, do r8 fa\mbreak
    sol4 sol, do r
    \clef tenor la'\solo r8 sold la4 fa'

    %34
    mi8 mi mi re do4 sib
    la8 la la sol fa re' dod la
    re,4 r\mbreak r16 re' re re re, re' re re

    %37
    do, do' do do do, do' do do sib4 r
    sib r r16 la la la la, la' la la
    la, la' la la la, la' la la la,8 la' la sol

    %40
    fad4 r sol'8 sol sol fa\mbreak
    mi do si sol do,4 r
    r16 do' do do do, do' do do si, si' si si si, si' si si

    %43
    la,  la' la la la,  la' la la la,  la' la la la,  la' la la
    si4-! r do la
    sol r \clef bass do,\tu r8 fa

    %46
    mi4 r8 fa

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>
    <6> <6>4 <6>
    s <6> s2
    <7> <6 4>
    <5 3> s
    s s4 s8 <6>
    <6 4>4 <3> s2
    <6 4>4 <3> s2
    s <6>
    s8 <6> <7>4 s <6>
    <5->2 <6>
    s1
    s2 <6>
    s1*6
    s4 <6>8 <6> s2
    s1*4
    s8 <6> <6>4 <3> s
    s2 <6>
    <6>4 <6> s2
    s <7>
    <6 4> <5 3>
    s4 s8 <6> s2
    <6 4>4 <3> s2
    <6 4>4 <3> s2
    s1*13
    <6>2

}

forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 42
    s1
    \mark\markup {\segno}
    s1*30
    s2.
    \bar "||"\break
    s4
    s1*13
    s2
    \bar "||"
    \mark\markup\center-align\smaller {"Dal"\segno}

}


VIobI = {
    \VIglobal
    <<\VIobIn \forma>>
}


VIvlI = {
    \VIglobal
    <<\VIvlIn \forma>>
}


VIvla = {
    \VIglobal
    \clef alto
    <<\VIvlan \forma>>
}

VIsoprano = {
    \new Voice = "amor"
    <<\VIsopranon \forma>>
}


VIbc = {
    \VIglobal
    \clef bass
    <<\VIbcn \forma \VIbfn>>
}



VIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

VIIfln =\relative do'' {

    R1
    r8 sib' sib sib sib sib sib sib
    sib lab r sol sol fa r mib

    %4
    r sol lab4 sol8 sib16. sib32 sib4\mbreak
    R1
    r8 sib do4 r8 fa, do'4

    %7
    r2 r8 sib16. la32 sib8 fa
    fa1\tenuto~
    fa2 mib8 sib' sib sib

    %10
    mib, mib mib sol lab16 sol lab8 fa lab
    lab?4 r r2
    R1

    %13
    r8 fa16 sol lab8 lab mib mib mib[do']
    sol sol fa fa16. sol32 lab8 lab sol do
    r8 lab sol fa r2

    %16
    r r4 r8 sib\mbreak
    sib4 r r8 sib sib sib
    sib2~sib8 lab16 sol do sib lab sol

    %19
    fa8 sol lab4 sol r
    r8 sol lab sol lab lab16 sol lab8 sol
    lab16 sol lab8 sol si\mbreak do sol do [do]

    %22
    do sib16 la sib4 r8 sol16 fad sol8 sol
    r8 sol16 sib la8 fad sol4 r
    r8 sol16 la sib la sib la sib8 sol16 la sib8 do\mbreak

    %25
    re4 r r2
    R1
    r4 r8 sib sib sib r sib

    %28
    sib sol lab4 sol8 sib16. sib32 sib4

}

VIIvlIn =\relative do'' {

    r8 mib lab fa r mib,\p lab fa
    sol4 r8 lab[sol lab sol fa]
    r mib' re re, r do' sib sib,

    %4
    fa'16. fa'32 sol16.[mib32] mib8 re mib sib16. sib32 mib4\mbreak
    r8 sol,\p sol sol lab lab sib[sib]
    sib sib sol[sol] fa fa mib[mib]

    %7
    mib mib mib mib mib sib fa'[fa]
    fa fa fa[mib] fa fa fa[mib]\mbreak
    fa fa fa[fa] sol sol sib[sib]

    %10
    lab lab do[sib] lab fa re[re]
    fa lab r4 r8 sol'16.\f mib32 \once\stemDown lab8 fa,
    r sib\p sib sib\mbreak do do mib,[sol]

    %13
    r re re re sib sib' sib lab
    sol sol sib[sib] lab mib' re do
    r mib, re do r fa mib4~

    %16
    mib re r8 sol'\f lab fa\mbreak
    r mib, lab fa sol4 r8 lab
    sol lab sol lab sol mib' fa[fa]

    %19
    fa16. re32 mib16.[mib,32] mib8  re mib4 r
    r8 mib'16\p re do8[do] do16 si do8 r do16 do
    si8 re, re[re]\mbreak mib mib' mib mib

    %22
    fad, sol r sib16. la?32 sol8 sol r4
    r8 sol mib[mib] sib' la16 sol sol8 fad
    sol4 r8 sol16. fad32 sol8 sol re[la']\mbreak

    %25
    r la16. la32 si8[re] sol, sol' r4
    sol,4 r8 sol sol4 fad
    sol8 sol'\f lab fa r mib lab fa

    %28
    fa,16. fa'32 sol16. mib32 mib8 re mib sib16. sib32 mib4

}


VIIvlIIn =\relative do'' {

    r8 sol' fa re r sol,\p fa re
    mib4 r8 re mib re mib re
    r lab' sib4 r8 fa sol4

    %4
    lab8 mib16. sol32 fa8 fa sol sol16. sol32 sol4\mbreak
    r8 mib\p mib mib do do fa[fa]
    mib mib do[do] re re mib[la!]

    %7
    la la la la fa fa re[re]
    re re re[mib] re re re[mib]\mbreak
    re re re[re] mib[mib] sol sol

    %10
    mib mib mib mib fa [lab] sib lab
    lab? re, r4 r8 sib\noBeam fa' re
    r mib\p mib mib\mbreak mib mib sol mib

    %13
    r lab lab lab sol sol sol fa~
    fa[mib] re re do do' sib lab
    r do, sib lab r re mib la,

    %16
    sib2 mib8 mib'\f fa re\mbreak
    r sol, fa re mib4 r8 re
    mib re mib re mib sib' lab[do]

    %19
    re16. sib32 sib16.[sol32] fa8 fa sol4 r
    r8 mib fa mib fa fa16. mib32 fa8 mib
    fa si, si sol\mbreak do [do] fad sol

    %22
    la sib r sol16. fa32 mib8[mib] r4
    r8 re16. re32 do8 fad re mib re re'16 do
    sib8[sol] sol, re' sib'[re,] sol fad\mbreak

    %25
    r8 fad16. fad32 sol8 sol sol si, r4
    mib r8 mi re2
    r8 sib'\f\noBeam fa' re r sol fa re

    %28
    lab mib16. sol32 fa8 fa sol sol16. sol32 sol4

}


VIIvlan =\relative do' {

    r8 sib sib sib r sib\p sib sib
    sib4 r8 re mib re mib re
    r lab' lab re, r fa fa sib,

    %4
    re[sib] do re sib\noBeam mib16. mib32 mib4\mbreak
    r8 sib sib sib fa' fa fa fa
    sib, sib mib[mib] fa sib sib[la!]

    %7
    fa[fa] do do sib[re] sib sib
    sib sib re[do] sib[sib] re do\mbreak
    sib[sib] lab lab sol sol sol sol

    %10
    lab lab lab sol fa re re re
    re re r4 r8 sib' re[fa]
    r sib, sib sib\mbreak lab[lab] sib sib

    %13
    r fa' fa fa mib[mib] sib fa'
    sol sib, sib sib mib4 r
    r8 do sib lab r re mib la,

    %16
    sib2 mib8 sib'\f do sib\mbreak
    r sib, sib sib sib4 r8 re
    mib re mib re mib[mib] do lab'

    %19
    lab? sol do,[sib] sib4 r
    r8 mib fa mib fa fa16. mib32 fa8 mib
    re[si] si sol\mbreak do, do'16. sib?32 la!8 sol

    %22
    fad sol r sol'16. fad?32 mib8 mib, r4
    r8 sib'16. sib32 do8 la sib[do] re re,
    sol4 r8 sol16. fad32 sol8 sol sol fad\mbreak

    %25
    r fad16. fad32 sol8 si do si r4
    do r8 dod re4 re,
    sol r8 sib sib sib sib sib

    %28
    re[sib] do re sib mib16. mib32 mib4

}

VIIsopranon = \relative do'' {

    \autoBeamOff

    R1*3
    r2 r4 r8 sib16 sib\mbreak
    mib4 r8 mib16 mib fa8[lab,] fa' lab,16 lab

    %6
    lab8 sol r do16 do do8[sib] r mib16 mib
    mib8 do la!16[do] mib8 mib re r fa16 mib
    re8 fa sib, la sib16[do] re[fa] sib,8 la\mbreak

    %9
    sib16[do] re8 r re16 sib mib8 reb16[do] reb8 fa16[reb]
    reb8[do] r mib re16[mib] fa[re] sib8 fa'
    lab, fa' r re16 sib mib4 r8 re16 sib

    %12
    mib4 r8 mib16 sol\mbreak do,8 mib sib mib
    lab,16[sol] lab4 sol16 fa sib8 do16[re] mib8 fa
    sib,4 re mib r8 mib

    %15
    re do r do sib  lab sol4~
    sol fa mib r\mbreak
    R1*2

    %19
    r2 r4 r8 mib'16 re
    do8 mib16 re do8 do do16[si] do8 r do16 do
    re[mib] fa[re] sol,8 fa'\mbreak mib16[re] do8 r mib16 mib

    %22
    mib8 re re16[do] re8 re do r do16 mib
    re8 sol, r do16 mib re8 do16 sib sib8. la16
    sol8 sib16 do re8 re16 re re8 sib16 do re8 mib\mbreak

    %25
    re4. sol16 fa mib8 re r sol16 fa
    mib8[do] fad sol sib,4 la
    sol4 r r2

    %28
    r r4 r8 sib16 sib

}

VIItesto = \lyricmode {

    Fi -- ni -- rà, fi -- ni -- rà, bar -- ba -- ra sor -- te, il pia -- cer, il pia -- cer, ch'hai d'ol -- trag -- giar -- mi;

    tu non sai più che_in -- vo -- lar -- mi che_in -- vo -- lar -- mi, io che per -- der più non ho,

    che per -- der più non ho, no; fi -- ni -- rà, fi -- ni -- rà, tu non sai più che_in -- vo -- lar -- mi,

    io che per -- der per -- der più non ho, che per -- der, che per -- der più non ho.

    De la Pro -- le, e del Con -- sor -- te, e del Re -- gno mi spo -- glia -- sti:

    sol la vi -- ta mi la -- scia -- sti, e pur que -- sta, e pur que -- sta, io ti da -- rò, mi la -- scia -- sti

    la vi -- ta la vi -- ta sol, e pur que -- sta e pur que -- sta io ti da -- rò. Fi -- ni-

}

VIIbcn =\relative do {

    mib4 r8 sib mib4 r8 sib
    mib4 r r r8 sib'
    do do, sib[sib'] lab lab, sol[sol']

    %4
    re mib lab,[sib] mib4 r
    r8 mib\p^\markup\italic "senza Cemb[alo]" mib mib mib mib re[re]
    mib mib mib mib re re do[do]

    %7
    fa fa fa fa sib, sib sib sib
    sib\noBeam \clef tenor\key sol\minor sib' re do sib[sib] re do\mbreak
    sib sib lab[lab] sol sol sol sol

    %10
    lab lab lab sol fa re re re
    re re r4\clef bass\key sol\minor r8 sol_\tu ^\markup\italic "senza Cemb[alo]" fa sib
    r sol sol sol\mbreak lab[lab] sol sol

    %13
    r fa fa fa sol sol, sol lab
    sib sib sib sib do4 r
    r2 r4 r8 \clef tenor\key sol\minor la'!8

    %16
    sib2 mib,8\noBeam \clef bass \key sol\minor mib_\tu^\markup\italic "con Cemb[alo]" lab,8[sib]\mbreak
    mib4 r8 sib mib4 r
    r2 r8 mib lab lab

    %19
    sib mib, lab,[sib] mib4 r
    \clef tenor\key sol\minor r8 mib'\solo fa mib fa fa16. mib32 fa8 mib
    re si si sol\mbreak do, do'16. sib?32 la!8 sol

    %22
    fad sol r sol'16. fa?32 mib8 mib, r4
    r8 sib'16. sib32 do8 la sib do re re,
    sol4 r8 sol16. fad32 sol8 sol sol[fad]\mbreak

    %25
    r fad16. fad32 sol8 si do[si] r4
    do4 r8 dod re4 re,
    sol \clef bass\key sol\minor r8 sib mib,4 r8 sib

    %28
    re mib lab,[sib] mib4 r

}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    <7>8 <6> <7> <6> <7> <6> <7> <6>
    <5->4 <6 5> s2
    s1*11
    s2 s4 <6>
    s1
    s2 s4 <6>
    <7-> <6 5> s2
    s1*8
    <5->4 <6 5>

}

forma = {

    \time 4/4
    \key sol\minor
    \tempo 4 = 40
    s1*4
    \mark\markup {\segno}
    s1*14
    s2 s4
    \bar "||"%\break
    s
    s1*9
    \bar "||"
    \mark\markup\center-align\smaller {"Dal"\segno}

}


VIIfl = {
    \VIIglobal
    <<\VIIfln \forma>>
}


VIIvlI = {
    \VIIglobal
    <<\VIIvlIn \forma>>
}


VIIvlII = {
    \VIIglobal
    <<\VIIvlIIn \forma>>
}


VIIvla = {
    \VIIglobal
    \clef alto
    <<\VIIvlan \forma>>
}

VIIsoprano = {
    \new Voice = "sorte"
    <<\VIIsopranon \forma>>
}


VIIbc = {
    \VIIglobal
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>
}



VIIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \tupletSpan 8\con
}

VIIIcrIn = \relative do'' {

    do8\noBeam do16 do do do
    fa8 fa do
    la\noBeam la16 la la la

    %4
    la8 fa la
    do8\noBeam do16 do do do
    fa8 la la

    %7
    sol r r
    R4.
    sol8 sol la

    %10
    sol sol la
    sol r r
    R4.*2

    %14
    sol8 sol16 sol sol sol\mbreak
    sol8 r r
    la r r

    %17
    sol r r
    fa\noBeam fa16 fa fa fa
    sol fa sol la sib sol

    %20
    la8\noBeam la16 la la la
    sib8 sib sib
    la8\noBeam la16 la la la

    %23
    sib8 r r
    la8. la16 sol8
    la la sol

    %26
    fa do la
    fa' do la
    la4.

}

VIIIcrIIn =\relative do'' {

    R4.*2
    do8\noBeam do16 do do do
    fa8 fa do

    %5
    la\noBeam la16 la la la
    la8 do fa\noBeam
    do r r

    %8
    R4.
    do8\noBeam do16 do do do
    do8\noBeam do16 do do do

    %11
    do8 r r
    R4.*2
    do8 do16 do do do\mbreak

    %15
    do8 r r
    fa r r
    do r r

    %18
    la fa la
    do do do
    fa\noBeam fa16 fa fa fa

    %21
    sol8 sol sol
    fa\noBeam fa16 fa fa fa
    sol8 r r

    %24
    fa4 do8
    do4 do8
    do la fa

    %27
    do' la fa
    fa4.

}


VIIIobIn =\relative do'' {

    R4.*4
    la'8 r r
    la r r

    %7
    sol r r
    fa r r
    mi16[fa] mi8 fa

    %10
    mi16[fa] mi8 fa
    sol8. mi16 re8
    do fa re

    %13
    do fa re
    do mi sol
    mi mi mi

    %16
    do do do
    mi mi mi
    la, r r

    %19
    sol' r r
    do, r r
    do16 mi do mi do mi

    %22
    do8 fa la
    sol16 mi sol mi sol mi
    fa8. fa16 sol8

    %25
    fa fa sol
    fa fa do
    la fa' do

    %28
    la4.

}


VIIIobIIn =\relative do'' {

    R4.*4
    fa8 r r
    do r r

    %7
    do r r
    re r r
    do do la

    %10
    do do la
    do mi16 do fa8
    do la si

    %13
    mi la, si
    mi sol mi\mbreak
    do do do

    %16
    la la la
    do do do
    do r r

    %19
    do r r
    la r r
    R4.

    %22
    do16 fa do fa do la
    mi8 mi mi
    la,16 sib do re mi8\noBeam

    %25
    do16 la do fa mi8\noBeam
    do do la
    fa' la la,

    %28
    do4.

}

VIIIvlIn =\relative do'' {

    R4.*2
    do8 r r
    do r r

    %5
    do' la fa
    do16 do do do do do
    do' do, do do do mi

    %8
    fa mi re mi fa re
    mi8 do' la,
    mi' do' la,

    %11
    mi'16 sol mi sol si,[re]
    sol8 la re,
    sol la re,

    %14
    mi16[mi] do8 mi\mbreak
    mi16 sol mi sol  mi sol
    fa la fa la fa la

    %17
    sol sib sol sib sol sib
    la8 r r
    do r r

    %20
    do la fa
    mi16 sol mi sol mi sol
    la8 r r

    %23
    sol16 sib sol sib sol sib
    la [sol] fa8 mi
    fa16 do fa do mi8\noBeam

    %26
    fa16 fa, fa la do8\noBeam
    fa16 fa, fa la do8\noBeam
    do4.

}


VIIIvlIIn =\relative do'' {

    R4.*2
    la8 r r
    la r r

    %5
    la' fa do
    la16 la la la la la
    sol8 sol' sol,

    %8
    si sol' si,
    do mi do
    do mi do

    %11
    do16 mi do mi fa8\noBeam
    mi re si'
    do re si

    %14
    do8. mi,16 do8\mbreak
    sol'16 mi sol mi sol mi
    la fa la fa la fa

    %17
    mi sol mi sol mi sol
    fa8 r r
    sol r r

    %20
    la fa la,
    do r r
    do' la fa

    %23
    mi16 sol mi sol mi sol
    fa8 do sol'
    do, la do

    %26
    la16 la la do fa8\noBeam
    la,16 la la do fa8\noBeam
    la,4.

}


VIIIvlan =\relative do' {

    R4.*2
    fa8 r r
    fa r r

    %5
    fa fa fa
    fa16 fa fa fa fa fa
    sol8 mi do

    %8
    re re re
    do4 do8
    do4 do8

    %11
    do4 si8
    do la' sol
    sol la sol

    %14
    sol8. sol16 sol8\mbreak
    do, do' do,
    do do' do,

    %17
    do do' do,
    do r r
    mi r r

    %20
    do r r
    sol' r r
    fa r r

    %23
    do do' do,
    do do' do,
    do do' do,

    %26
    do\noBeam fa fa
    do fa la
    fa4.

}

VIIIbcn =\relative do {

    R4.*2
    fa8 r r
    fa r r

    %5
    fa r r
    fa fa fa
    mi4 mi8

    %8
    re si sol
    do4 fa,8
    do'4 fa,8

    %11
    do'4 re8
    mi fa sol
    mi fa sol

    %14
    do, do do\mbreak
    do4 do8
    do4 do8

    %17
    do4 do8
    fa r r
    mi r r

    %20
    fa r r
    do r r
    fa r r

    %23
    do do do
    fa la do
    la fa do

    %26
    fa,4 fa'8
    fa fa fa
    fa4.

}

VIIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*6
    <6>4.
    <6!>
    s4.*2
    s4 <6!>8
    <6> <6> <_!>
    <6> <6> <_!>
    s4.*2
    <6 4>4.
    s4 <7>8
    s4.*3
    <7>4.
    s4.*3
    <6>4.

}

forma = {

    \time 3/8
    \key fa\major
    \tempo 4. = 70
    s4.*28
    \bar "|."

}


VIIIcrI = {
    \VIIIglobal
    <<\VIIIcrIn \forma>>
}


VIIIcrII = {
    \VIIIglobal
    <<\VIIIcrIIn \forma>>
}


VIIIobI = {
    \VIIIglobal
    <<\VIIIobIn \forma>>
}


VIIIobII = {
    \VIIIglobal
    <<\VIIIobIIn \forma>>
}


VIIIvlI = {
    \VIIIglobal
    <<\VIIIvlIn \forma>>
}


VIIIvlII = {
    \VIIIglobal
    <<\VIIIvlIIn \forma>>
}


VIIIvla = {
    \VIIIglobal
    \clef alto
    <<\VIIIvlan \forma>>
}


VIIIbc = {
    \VIIIglobal
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
}



IXglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IXflIn =\relative do'' {

    r2 r8 si' do4
    si8 la la[re] re4 si8 do
    do si r4 r2

    %4
    R1
    r4 dod16 si dod re dod si dod re dod si dod re
    dod8 dod dod dod dod la la4

    %7
    fa r r2\mbreak
    R1
    re'4 dod re8 mi dod4

    %10
    re4. la8 la4 r
    R1
    r8 do do4 r8 si si do

    %13
    do4 r r8 re re4
    r8 la si re\mbreak r2
    r8 re re re re2

    %16
    r8 re re re re4. re,8
    mi4 r r r8 la16 si
    do4 r r2\mbreak

    %19
    r si16 la si do si8 la
    sol4 r8 la si si do4
    si r r2

    %22
    r4 fad8 fad sol fad16 mi red4\mbreak
    r8 si' la si r sol16. si32 la8 si
    do mi, mi[sold] la fa! mi[mi]

    %25
    re sold r4 mi si'
    do r8 si\mbreak do si r do16 la
    fad8 mi r4 r fad16. sol32 fad16. sol32

    %28
    fad16. sol32 fad16. sol32 fad16. sol32 fad16. sol32 fad4 re'
    R1*2
    r2

}

IXflIIn =\relative do'' {

    r2 r8 sol' fad4
    sol8 fad fad[fad] sol4 re8 mi
    mi re r4 r2

    %4
    R1
    r4 mi16 re mi fa? mi re mi fa mi re mi fa
    mi8 mi mi mi mi mi fa mi

    %7
    re4 r r2
    R1
    fad4 mi8 sol fad sol mi4

    %10
    la8 sol fad[sol] fad4 r
    R1
    r8 la la4 r8 sol sol la

    %13
    la4 r8 re re4 r8 re
    sol, mi re[fad]\mbreak r2
    r r8 re' re re

    %16
    re2 r8 re re sol,
    sol4 r r r8 re'
    sol,4 r r2\mbreak

    %19
    r sol16 fad sol la sol8 fad
    sol4 r8 fad sol re16. sol32 la4
    sol r r2

    %22
    r r4 fad8 fad\mbreak
    r8 sol fad16 mi fad8 r4 mi8 sold
    la sold la[si] do re la[la]

    %25
    fa? si r4 do, mi
    mi r8 sol\mbreak la sol r la16 fad
    si8 si r4 r2

    %28
    fad16. sol32 fad16. sol32 fad16. sol32 fad16. sol32 fad4 si
    R1*2
    r2

}

IXvlIn =\relative do'' {

    r4 r8 do, sol' r16 si' \once\stemDown la16. re,,32 re16. re32
    sol16. re32 re16. re32 la'16. re,32 re'16.[do32] si16. la32 sol16. fad32 sol8 do,
    sol'8. sol16 la16. re,32 re16. re32 sol16. re32 re16. re32 sol16. re32 re16. re32

    %4
    sol8 fad mi fad\mbreak sol fad mi re
    la' la, r4 r8 la' la la,
    r la' la la, r dod re la'~

    %7
    la re,16. fa?32 mi8 la4 re,16.[fa32] mi8 la\mbreak
    re, si' r4 la8 la si la
    re, fad'16.\f la32 dod,16. la32 la16. la32 re16. la32 la16. la32 mi'16. la,32 la16. sol32

    %10
    fad16. la32 si16. re32 \once\stemUp la8 dod' \once\stemDown re \once\stemUp la, mi16. mi32 mi16. mi32
    la8 re, mi[mi]\mbreak la, la r la'16. mi32
    mi'8 la, mi[fad] sol sol sol[re]

    %13
    la'4 r8 la sol la sol la
    sol do, re[re]\mbreak r2
    r4 r8 la'\p si [la sol fad16 mi]

    %16
    fad8 re sol fad16 mi fad8 re sol, [sol']
    sol4. sol8 fad sol re'16. re,32 re16. re32
    mi8 do r4 r r8 sol'\mbreak

    %19
    re2 sol8 si re fad16. la,32
    si16. re,32 re16. re32 fad'16. la,32 la16. la'32 sol16. re32 sol16. si32 la8 la,
    si\noBeam si16.\p la32 sol8 [la] sol fad si[la]

    %22
    sol fad fad16. si,32 si'16. la32 sol8 do, r16 si si'16. la32\mbreak
    sol8. sol16 red16. red32 red16. red32 mi8 mi16. re?32 do8 si
    la16. mi'32 mi16. mi32 do8 si la8 \parenthesize si do dod

    %25
    re8 mi fa re mi re mi16. mi32 mi16. mi32
    la16. la32 do16. do32 do8 si\mbreak la si r16 do do16. do32
    si16. la32 si8 r16 sol sol16. sol32 fad8 sold lad8. lad16

    %38
    si8 si,r fad' si, fad' mid4
    r2 mid\p fad4 lad si si'8 la
    sol re r do,

}


IXvlIIn =\relative do'' {

    r4 r8 do, sol' r16 re' fad16. re,32 re16. re32
    sol16. re32 re16. re32 la'16. re,32 re'16.[do32] si16. la32 sol16. fad32 sol8 do,
    sol'8. re16 fad16. re32 re16. re32 sol16. re32 re16. re32 sol16. re32 re16. re32

    %4
    si'8 la sol la\mbreak si la sol la
    la la, r4 r8 la' la la,
    r la' la la, r dod re dod

    %7
    re sib16. la32 sol8 la re sib16. la32 sol8 la\mbreak
    re sold, r4 sol'?8 fad sol la
    re,\noBeam la'16.\f re32 mi16. la,32 la16. la32 fad'16. la,32 la16. la32 sol'16. la,32 la16. sol32

    %10
    la16. re32 re16. si32 fad'8 mi \once\stemDown fad[re,] sold,8 sold
    la re mi[mi]\mbreak la, la r la16. sold32
    la8. la16 la8 re mi si si fad'

    %13
    fad?4 r16 fad! fad16. fad32 sol8 fad sol fad
    sol do, re[re]\mbreak  r2
    r4 r8 fad\p si[la sol fad16 mi]

    %16
    fad8 re sol fad16 mi fad8 re sol,  si
    do re mi mi fad sol re8. re16
    mi8 do r4 r r8 mi\mbreak

    %19
    re2 re8 si' si re,16. fad32
    re'16. re,32 re16. re32 do'16. la32 fad16.[fad32] re'16. sol32 si16. sol32 sol8 fad
    sol sol,16.\p fad32 mi8 do r si16. la32 sol8 do

    %22
    si16. si32 si16. si32 fad'16. si,32 si16. la32 sol8 do r16 si si'16. la32\mbreak
    sol8. sol16 red16. red32 red16. red32 mi8 mi16. re?32 do8 si
    la16. mi'32 mi16. mi32 do8 si la8 si do dod

    %25
    re8 mi fa re mi re mi16. mi32 mi16. mi32
    la16. la,32 la'16. la32 la8 sol\mbreak fad sol r16 la la16. la32
    la8 sol r16 sol sol16. sol32 fad8 sold lad8. lad16

    %28
    si8 si, r fad' si, fad' mid4
    r2 mid\p
    fad si,4 re'8 fad16. mi32

    %31
    re8 si r do,

}


IXvlan =\relative do' {

    r4 r8 do sol8 r16 re' do16. re32 re16. re32
    sol16. re32 re16. re32 la'16. re,32 re'16.[do32] si16. la32 sol16. fad32 sol8 do,
    sol'8. si,16 la16. re,32 re16. re32 sol16. re32 re16. re32 sol16. re32 re16. re32

    %4
    sol8 fad mi fad\mbreak sol fad mi re
    la' la r4 r8 la la la
    r la la la r dod re dod

    %7
    re sib16. la32 sol8 la re sib16. la32 sol8 la\mbreak
    re sold, r4 sol8 fad sol la
    re, re'16. fad32 la16. la,32 la16. la32 la'16. la,32 la16. la32 mi'16. la,32 la16. sol32

    %10
    re'16. fad32 re16. re32 re8 la la[re] sold, sold
    la re mi[mi,]\mbreak la la r la16. sold32
    la8. la16 la8 re mi si si[fad]

    %13
    fad?4 r16 fad! fad16. fad32 sol8 fad sol fad
    sol do re[re,]\mbreak r2
    r4 r8 fad si[la sol fad16 mi]

    %16
    fad8 re sol fad16 mi fad8 re sol si
    do re mi mi, fad sol re' re,16. re'32
    mi8 do r4 r r8 do\mbreak

    %19
    re2 re8 sol sol16. re32 re16. re32
    sol16. re32 re16. re32 la'16. fad32 re16. re32 re8 re mi[re]
    re sol16. fad32 mi8 do r si16.la32 sol8 do

    %22
    si16. si32 si16. si32 fad'16. si,32 si16. la32 sol8 do  r16 si si16. la32\mbreak
    sol8. sol16 red16. red32 red16. red32 mi8 mi'16. re?32  do8 si
    la16. mi32  mi16. mi32 do'8 si la si do dod

    %25
    re mi fa re mi re mi16. mi,32 mi16. mi32
    la16. la32 la16. la32 la8 sol\mbreak fad sol r16 la la16. la32
    la8 sol r16 sol sol16. sol32 fad8 sold lad8. lad16

    %28
    si8 si r fad si fad' mid4
    r2 mid,\p
    fad si4 sol'8 re

    %31
    sol sol, r do

}

IXsopranoIn = \relative do'' {

    \autoBeamOff

    r4 re8 mi mi re r4
    r2 r4 re8 mi
    mi re r re si la r re

    %4
    mi re dod[re]\mbreak r4 mi8 fad
    fad?[mi] mi la, r4 mi'8 la,
    dod16[re mi8] r4 r8 mi fa! mi

    %7
    r4 r8 mi fa16[mi] re8 re dod\mbreak
    re16[dod] re8 r fa mi16[dod] la'[re,] mi4
    re r r2

    %10
    r2 r8 re4 do!16[si]
    do8 si16 la la8[sold]\mbreak la la16[sold] la8 mi'
    la,16[si] do4 si16 la sol?[la] si4 la16 sol

    %13
    la[sol la8] r4 r8 re si la
    si la16[sol] sol8 fad\mbreak r2
    r8 re' re re re2~

    %16
    re8[do si la16 sol] re'2~
    re8[do16 si] do8 mi la, sol sol[fad]
    sol mi' r4 r8 sol16[fad] mi[re] do[mi]\mbreak

    %19
    si4(la) sol r
    R1
    r4 si8 mi mi red r4

    %22
    r red8 mi16[red] mi[red] mi8 fad si,\mbreak
    si si r fad' sol16.[fad32] mi8 mi16[re] re[do]
    do8 si r4 r mi8 fa16[mi]

    %25
    fa[mi] mi[re] re[mi] fa8 do4(si)
    la8 mi' fad mi\mbreak red mi r4
    r mi8 mi mi4. re16[dod]

    %28
    re8. dod16 re8 dod re dod re4-!
    r8 re^\p[dod] si re2~
    re4 dod si r

    %31
    r4 re8 mi

}

IXtestoI = \lyricmode {

    Non sei quel -- la non sei quel -- la e pu -- re e pu -- re_il Cor, pu -- re_il Cor di -- ce di -- ce_al Cor

    che quel -- la  che quel -- la  se -- i quel -- la,  che quel -- la  se -- i.

    No, - - non sei quel -- la e pu -- re_il Co -- re di -- ce al Cor,

    di -- ce_al Cor che quel -- la quel -- la  se -- i,

    pur di -- ce_il Cor - - che quel -- la se -- i. che, che quel -- la se -- i.

    Ca -- re la -- bra ca -- re la -- bra_in voi ri -- mi -- ro ri -- mi -- ro quel -- la fi -- glia

    quel -- la fi -- glia che per -- de -- i, in voi ri -- mi -- ro quel -- la fi -- glia, fi -- glia che

    per -- de -- i,  che che per -- de - i. Non sei

}

IXsopranoIIn = \relative do'' {

    \autoBeamOff

    r4 si8 do do si r4
    r2 r4 si8 do
    do si r4 r8 re si la

    %4
    r4 r8 re\mbreak mi re dod re
    re[dod] r4 mi8 la, r4
    r mi'8 la, dod16[re mi8] r mi

    %7
    fa16[mi] re8 re[dod] re4 r8 mi\mbreak
    fa16[mi] fa8  r re dod16[mi] re8 re[dod]
    re4 r r2

    %10
    r r4 mi~
    mi8 re16 do? do8[si]\mbreak la8 la16[sold] la8 mi'
    la,16[si] do4 si16 la sol[la] si4 la16 sol

    %13
    la[sol la8] r4 r8 re si la
    si la16[sol] sol8 fad\mbreak r8 re' re re
    re2~re8[do si la16 sol]

    %16
    re'2~re8[do si la16 sol]
    mi'4. re16[do] do8 si16[do] si8[la]
    sol do r4 r8 mi16[re] do[si] la[sol]\mbreak

    %19
    sol4(fad) sol r
    R1
    r4 r r si8 mi

    %22
    mi red r4 r red8 mi16[red]\mbreak
    mi[red] mi8 fad si, si16[la] sol8 r4
    r mi'16[re] re[do] do[si] la[sold] la8 la

    %25
    la[sold] la4 r2
    r r8 mi' fad mi
    red mi dod16[si] si[lad] lad8 si dod4~

    %28
    dod8 si16[lad] si8 lad si lad si4-!
    r2 r8 re^\p[dod] si
    fad'16[mid] fad8 r4 r2
    r4 si,8 do

}

IXtestoII = \lyricmode {

    Non sei quel -- la non sei quel -- la e pu -- re e pu -- re pu -- re_il Cor di -- ce di -- ce_al Cor

    che quel -- la  se -- i che quel -- la,  che quel -- la  se -- i.

    No, non sei quel -- la e pu -- re_il Co -- re di -- ce al Cor, di -- ce_al Cor,

    che quel -- la quel -- la  se -- i,

    pur di -- ce_il Cor - - che quel -- la se -- i. che, che quel -- la se -- i.

    Va -- ghe lu -- ci va -- ghe lu -- ci_in voi ri -- mi -- ro

    quel -- la Ma -- dre che so -- spi -- ro, in voi ri -- mi -- ro

    quel -- la Ma -- dre, Ma -- dre che so -- spi -- ro, che che  so -- spi -- ro.

    Non sei

}

IXbcn =\relative do {

    sol'8 sol, r do sol'8. sol,16 la16. re32 re16. re32
    sol16.  re32 re16. re32 la'16.[re,32] re'16. do32 si16. la32 sol16. fad32 sol8 do,
    sol'8. sol,16 la16. re32 re16. re32 sol16. re32 re16. re32 sol16. re32 re16. re32

    %4
    sol8 fad mi fad\mbreak sol fad mi re
    la' la, r4 \clef tenor r8 la'\solo la la,
    r la' la la, r dod' re dod

    %7
    re sib16. la32 sol8 la re sib16. la32 sol8 la\mbreak
    re sold, r4 sol8 fad sol la
    \clef bass re,8\tu re la'16. la,32 la16. la32 re16. la32 la16. la32  mi'16. la,32 la'16.[sol32]

    %10
    fad16. fad,32 sol16.[sol'32] la8 la, re\noBeam \clef tenor re'\solo sold, sold
    la re mi[mi,]\mbreak la  la, r la'16. sold32
    la8. la16 la8 re mi si si fad

    %13
    fad?4 r16 fad fad16. fad32 sol8 fad sol[fad]
    sol do re[re,]\mbreak r2
    r4 r8 fad si la sol fad16 mi

    %16
    fad8 re sol fad16 mi fad8 re sol[si]
    do re mi mi, fad sol re[re']
    mi do r4 r \clef bass r8 do,\tu \mbreak

    %19
    re4 re, sol8 sol' re'16. re,32 re16. re32
    sol16.  re32 re16. re32 la'16.[re,32] re'16. do32 si8[sol] do, re
    sol,\noBeam \clef tenor sol''16. fad32 mi8 do r si16. la32 sol8 do

    %22
    si16. si,32 si16. si32 fad'16. si,32 si'16.[la32] sol8 do r16 si, si'16. la32\mbreak
    sol8. sol16 red16. red32 red16. red32 mi8 mi'16. re?32 do8 si
    la16. mi32 mi16. mi32 do'8 si la si do[dod]

    %25
    re mi fa re mi re mi16. mi,32 mi16. mi32
    la16. la,32 la16. la32 la'8 sol\mbreak fad sol r16 la la16. la32
    la8 sol r16 sol sol16. sol32 fad8 sold lad8. lad16

    %28
    si8 si, r fad' si fad' mid4
    r2 mid,\p
    fad\clef bass r8 si16\tu la sol8 re
    sol sol, r do

}

IXbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6 4>8. <5 3>16 <6+>4
    s8 <_+> s4 <6>2
    <6 4>8. <5 3>16 <6+>4
    s16. <_+>32 s8 s16. <_+>32 s8
    <6> <6> <6+> <6> <6> <6> <6+> <_+>
    <6+ 4> <5 3+> s4 s2
    s1*3
    <_+>4 s16. <_+>32 s8 <_+>16. <_+>32 s8 <6+>4
    <6> <6+ 4>8 <3+> <_+>2

}

forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 60
    s2\mark\markup {\segno} s
    s1*19
    s8
    \bar "||"\break
    s
    s2.
    s1*9
    s2
    \bar "||"
    \mark\markup\center-align\smaller {"Dal"\segno}

}


IXflI = {
    \IXglobal
    <<\IXflIn \forma>>
}


IXflII = {
    \IXglobal
    <<\IXflIIn \forma>>
}


IXvlI = {
    \IXglobal
    <<\IXvlIn \forma>>
}


IXvlII = {
    \IXglobal
    <<\IXvlIIn \forma>>
}


IXvla = {
    \IXglobal
    \clef alto
    <<\IXvlan \forma>>
}

IXsopranoI = {
    \new Voice = "quella1"
    <<\IXsopranoIn \forma>>
}

IXsopranoII = {
    \new Voice = "quella2"
    <<\IXsopranoIIn \forma>>
}


IXbc = {
    \IXglobal
    \clef bass
    <<\IXbcn \forma \IXbfn>>
}



Xglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \con
}

XobIn =\relative do'' {

    r4
    re fa mib sib'
    sib re, r fa
    sol r8 fa fa8.[sol16 fa8 mib]

    %4
    re4 r r2
    r r8 fa, sib fa\mbreak
    sib4 r r2

    %7
    r r8 do\p fa do
    fa4 r r2
    R1*5

    %14
    sol4 r r fa
    mib r r2\mbreak
    R1

    %17
    fa4 r fa r
    fa r la r
    sib r r2\mbreak

    %20
    R1
    r4 sol do, r
    do r do r

    %23
    R1\mbreak
    r2 r4 r8 mib
    re4 do sol'-! r8 r16 sol

    %26
    sib4 la re, fa
    mib sib' sib re,
    r fa sol r8 r16 fa\mbreak

    %29
    fa8.[sol16 fa8. mib16] re4 r
    re r sol r
    R1

    %32
    re4 r re fad\mbreak
    R1
    sol4 r r2

    %35
    r la4 r
    r2 la4 r
    R1

    %38
    r8 re, mi fa fa4 fa
    mi r8 mi la4 r
    R1*2\mbreak

    %42
    r4 fa sib8 re, fa4
    sol fa fa mib
    re r

}

XobIIn =\relative do'' {

    r4
    fa re sib re
    sol fa r re
    mib r8 do re sib do4

    %4
    sib r r2
    r r8 fa sib fa\mbreak
    sib4 r r2

    %7
    r r8 do\p fa do
    fa4 r r2
    R1*5

    %14
    mib4 r r re
    sib r r2\mbreak
    R1

    %17
    re4 r do r
    do r do r
    fa r r2\mbreak

    %20
    R1
    r4 mib la, r
    la r la r

    %23
    R1
    r2 r4 r8 do8
    sib4 la mib'-! r8 r16 mib

    %26
    re4 mib sib re
    sib re sol fa
    r re mib r8 do\mbreak

    %29
    re8 sib do4 sib r
    sib r re r
    R1

    %32
    sib4 r sib re\mbreak
    R1
    re4 r r2

    %35
    r fa4 r
    r2 fa4 r
    R1

    %38
    r8 re dod re re4 re
    dod r8 dod re4 r
    R1*2\mbreak

    %42
    r4 do re8 fa re4
    sib do re la8 do
    sib4 r

}

XvlIn =\relative do'' {

    r8 fa
    \tuplet 3/2 {
        sib la sib sib la sib sib la sib fa sol la
        sol fa mib fa mib re
    } do mib r re
    r16 sol fa mib fa8 do' re, sib' do,[la']

    %4
    sib4 r sib,\p la
    sib r r8 fa sib fa\mbreak
    sib4 r la sib

    %7
    la r r8 do\p fa do
    fa4 fa4. mib8 re do
    si4 r r r8 do\p

    %10
    reb2 do4. mib8\mbreak
    reb si do4 fa r
    r2 mib8\p re16 do re8 si

    %13
    do4 r r re8 si
    do4 mib2 re4
    mib8 sib do re mib do16 re mib8 mib\mbreak

    %16
    mib re re[mib] fa4 fa
    fa fa fa fa
    fa fa fa4. fa,8

    %19
    sib8. [do16 re8 sib] mib16 re mib8 r fa,\mbreak
    fa4 r fa la
    sib sol la r

    %22
    do r do8 fa,\p fa fa
    mib'2~mib8 fa, fa fa\mbreak
    mib'2 mib4 r8 mib

    %25
    re4 do mib-! r8 r16 do'\f
    sib4 la \tuplet 3/2 {
        sib8 la sib sib la sib
        sib la sib fa sol la sol fa mib fa mib re
    }

    %28
    do mib r8 re r16 sol fa mib fa8 do'\mbreak
    re,[sib'] do, la' sib4 r
    re,,4\p fad8 la re,4 r8 sol

    %31
    do4 do re8 mib re mib
    re re do sib sib4 la8 re\p \mbreak
    sol do, do do do4 sib8 do

    %34
    re4 r8 re\p mib sol mib re
    dod4 re8 mi! fa4 r8 fa\p
    mi re la[dod] re4 r8 fa\p

    %37
    mi re la[dod]\mbreak re4 r
    r8 fa sol fa re' re re re
    mi,4 r8 dod re4 r

    %40
    r8 sib\p  sib sib mi!2
    fa8 mi16 re do8 sib la4 sol\mbreak
    \tuplet 3/2 { fa'8\f mi fa fa mi fa } fa sib r lab

    %43
    r16 sol fa  mib fa8 do' re, [sib'] do, la'
    sib4 r

}


XvlIIn =\relative do'' {

    r8 fa
    \tuplet 3/2 {
        sib la sib sib la sib sib la sib fa sol la
        sol fa mib fa mib re
    } do mib r re
    r16 sol fa mib fa8 do' re, sib' do,[la']

    %4
    sib4 r re,,4\p do
    sib r r8 fa' sib fa\mbreak
    sib4 r do, sib

    %7
    fa' r r8 do'\p fa do
    fa4 r8 do, do4 do
    sol r r r8 sol'\p

    %10
    lab sol16 lab sib8 mib, mib4 sol\mbreak
    lab sol do, r
    r si sol' sol

    %13
    sol r r si,8 re
    mib mib fa sol lab fa16 sol lab8 lab
    lab sol r sib sib4 la?\mbreak

    %16
    fa r r8 sib, re mib
    fa re' do sib do[mib re do16 sib]
    re8[mib re do16 sib] do8. sib16 la8 do

    %19
    fa,4 r r8 mib do4\mbreak
    re8 fa r4 re fa
    fa do' do r

    %22
    la r la r
    r8 la la do la4 r\mbreak
    r8 la la do la4 r8 do

    %25
    sib4 la sib-! r8 r16 sol'\f
    re'4 do re8. sib16\tuplet 3/2 {
        sib8 la sib
        sib la sib fa sol la sol fa mib fa mib re
    }

    %28
    do mib r8 re r16 sol fa mib fa8 do'\mbreak
    re,[sib'] do, la' sib4 r
    sol, re sib r8 sib

    %31
    mib4 la! sib la8 do
    sib sib la sol sol4 fad\mbreak
    r8 mi mi mi fad re sol,[la]

    %34
    sol'4 r sol r8 sib
    la sol fa mi la4 r
    sol, la sib r

    %37
    sol la\mbreak re r
    r8 la' mi' la, fa' fa fa fa
    dod4 r8 mi la,4 r

    %40
    r8 sol\p sol4. fa8 sol4
    do, fa2 mi4\mbreak
    fa8.\f fa'16 \tuplet 3/2 { fa8 mi fa } fa sib r lab

    %43
    r16 sol fa  mib fa8 do' re, [sib'] do, la'
    sib4 r

}


Xvlan =\relative do' {

    r4
    re sib sib sib
    sib sib fa' sib,
    sib do sib8 re la[fa']

    %4
    fa4 r re do
    sib r r8 fa' sib fa\mbreak
    sib4 r do, sib

    %7
    fa r r8 do'\p fa do
    fa4 r8 lab, lab4 lab
    sol r r r8 mib

    %10
    fa4 sol lab mib\mbreak
    fa mib lab r
    r si do sol

    %13
    mib r r sol
    do do2 sib4
    sib r do fa,\mbreak

    %16
    sib r r8 sib re mib
    fa sib, la sol la4 sib
    la sib la8.[sol16 fa8 mib]

    %19
    re'4 r r8 do la4\mbreak
    sib8 la r4 sib fa
    sib mib fa r

    %22
    fa r fa r
    r8 fa, fa fa fa4 r\mbreak
    r8 fa fa fa fa4 r8 la'

    %25
    fa4 la sol-! r8 r16 do,\f
    fa4 fa fa re
    sib sib sib sib

    %28
    fa' sib,  sib do\mbreak
    sib8 re la[fa'] fa4 r
    sol, re sib' r8 sol

    %31
    la4 fa sib fad
    sol do re re,\mbreak
    r8 mi'! mi mi fad re sol,[la]

    %34
    sib4 r sol' r8 sib
    la sol fa mi re4 r
    sol, la sib r

    %37
    sol la\mbreak re r
    r8 fa mi re sold,2
    la4 r8 sib fa'4 r

    %40
    r8 sol sol fa mi! re do sib
    la4. sib8 do4 do,\mbreak
    fa do' sib8 re re4

    %43
    sib do sib8 re mib[do]
    re4 r

}

XsopranoIn = \relative do'' {

    \autoBeamOff

    r4
    R1*7
    r8 do fa4. mib8 re do
    si[la] sol re' mib8. fa16 sol8 do,

    %10
    reb2 do4. mib8\mbreak
    mib8[si] do do^\markup\italic "a Gual." fa4 r8 do^\markup\italic "a Cost."
    fa4 r8 sol^\markup\italic "a Gual." mib[re16 do] re8 si

    %13
    do4 r8 sol'^\markup\italic "a Cost." mib[re16 do] re8 si
    do4 r r2
    R1

    %16
    r8 sib? re mib fa4 fa
    fa2 fa
    fa fa4 r8 fa,

    %19
    sib8. do16 re8 sib mib16[re] mib4 fa8^\markup\italic "a Gual."\mbreak
    re[do] r fa^\markup\italic "a Cost." re4 do
    sib r r r8 do^\markup\italic "a Gual."

    %22
    fa4 r8 do^\markup\italic "a Cost." fa fa, fa fa
    mib'2~mib8 fa,^\markup\italic "a Gual." fa fa\mbreak
    mib'2~mib8. sol16 fa8 mib

    %25
    re4 do sib-! r8 r16 sol'
    re4 do sib r
    R1*2 r2 r4 r
    R1*2

    %32
    r2 r4 r8 re^\markup\italic "a Gual."
    sol do, do do do4 sib8 do
    re4 r8 re^\markup\italic "a Cost." mib sol mib re

    %35
    dod4 re8 mi! fa4 r8 fa^\markup\italic "a Gual."
    mi[re] la[dod] re4 r8 fa^\markup\italic "a Cost."
    mi[re]la[dod]\mbreak re4 r

    %38
    r8 re mi fa fa2
    mi4 r8 mi^\markup\italic "a Cost." la,4 r8 fa'^\markup\italic "a Gual."
    sib, sib sib sib mi!2

    %41
    fa8 mi16[re] do8 sib la4 sol\mbreak
    fa4 r r2
    R1

    %44
    r2

}

XtestoI = \lyricmode {

    Ed io sem -- pre fe -- de -- le,  e vi -- ve -- re_e mo -- ri -- re mo -- ri -- re per te per te per te - sa --  prò

    per te - sa -- prò.

    Ed io fe -- de -- le sem -- pre sem -- pre  e vi -- ve -- re_e mo -- ri -- re per te per te sa --  prò,

    per te per te mo -- rir fe -- del mo -- rir fe -- del fe -- del mo -- rir sa --  prò, mo -- rir sa --  prò.

    Ed io sem -- pre co -- stan -- te per te, ed io sem -- pre_a -- mo -- ro -- sa per te per te sa -- rò

    per te sa -- rò sem -- pre_a -- mo -- ro -- sa per te per te,

    sem -- pre_a -- mo -- ro -- sa per te per te sa -- rò.

}

XsopranoIIn = \relative do'' {

    \autoBeamOff

    r4
    R1*5
    r8 fa fa8 sib, mib4 re
    do do8 re16[mi!] fa8 do fa do

    %8
    fa4 r r2
    R1*6
    r8 sib, do re mib do16[re] mib8 mib\mbreak

    %16
    mib re r4 r2
    r8 re do sib do[mib] re[do16 sib]
    do8[mib] re[do16 sib] do8. sib16 la8 do

    %19
    fa,4 r r2\mbreak
    R1
    r8 re' mib16[re  mib re] do[re do re] mib[re mib re]

    %22
    do[re do re] mib[re mib re] do4 r
    r8 do do16[sib do sib] do4 r\mbreak
    r8 do do16[sib do sib] do4 r8 do

    %25
    sib4  la sib-! r8 r16 do
    sib4 la sib r
    R1*2

    %29
    r2 r4 r
    r2 r8 re mib4~
    mib8 sol fa mib re[mib] re mib

    %32
    re re do sib sib4 la\mbreak
    R1*2
    r2 r8 la re la

    %36
    r2 r8 re fa re
    r2 r8 re fa mi
    re4 dod8 re re2

    %39
    dod4 r8 dod re4 r
    R1*4
    r2

}

XtestoII = \lyricmode {


    Ti vo -- glio sem -- pre sem -- pre sem -- pre  sem -- pre _a -- mar,

    a -- mar ti vo -- glio sem -- pre sem -- pre, ti vo -- glio_a -- mar - - - - ti vo -- glio_a -- mar,

    a -- mar - - - - - a -- mar - a -- mar - a -- mar sa -- prò a -- mar sa -- prò.

    Sa -- rò sem -- pre pie -- to -- sa mi -- ran -- do_il tuo sem -- bian -- te

    pie -- to -- sa pie -- to -- sa sem -- pre pie -- to -- sa, pie -- to -- sa sa -- rò.

}

Xalton = \relative do' {

    \autoBeamOff

    r4
    R1*3
    r8 sib' sib fa fa4 mib
    re fa8 sol16[la] sib8 fa sib fa\mbreak

    %6
    sib4 r r2
    R1*7
    r8 mib, fa sol lab fa16[sol] lab8 lab

    %15
    lab sol r4 r2\mbreak
    R1
    r8 sib la sol la[sib16 la] sib8[la16 sol]

    %18
    la8[sib16 la] sib8[la16 sol] la8. sol16 fa8 mib
    re4 r r2\mbreak
    R1

    %21
    r8 sib' do16[sib do sib] la[sib la sib] do[sib do sib]
    la[sib la sib] do[sib do sib]la4 r
    r8 la la16[sol la sol] la4 r\mbreak

    %24
    r8 la la16[sol la sol] la4 r8 la
    fa4 fa sol r8 r16 mib
    fa4 fa sib r

    %27
    R1*2
    r2 r4 r8 re,
    sol sib la sol16[fad] sol8 re r sib'

    %31
    do sib la sol fa[sol] la do
    sib sib la sol sol4 fad\mbreak
    R1

    %34
    r8 re sol re r2
    R1
    r2 r8 fa la fa

    %37
    R1
    r8 fa mi re sold2
    la4 r8 sol? fa4 r

    %40
    R1*4
    r8 sib sib fa

}

XtestoIII = \lyricmode {

    Ti vo -- glio sem -- pre_o -- diar, sem -- pre, sem -- pre, sem -- pre_o -- diar

    o -- diar ti vo -- glio sem -- pre, sem -- pre,

    ti vo -- glio_o -- diar - - - - ti vo -- glio_o -- diar o -- diar - - - - -

    o -- diar - o -- diar - o -- diar  sa -- prò, o -- diar  sa -- prò.

    Sa -- rò sem -- pre cru -- de -- le, sa -- rò sem -- pre cru -- de -- le,

    mi -- ran -- do_il tuo sem -- bian -- te cru -- de -- le cru -- de -- le

    sem -- pre cru -- de -- le sa -- rò.

    Ti vo -- glio

}

Xbcn =\relative do {

    r4
    sib' r sol re
    mib sib' la sib
    mib, la, sib fa

    %4
    sib r r2
    r r8 fa' sib fa\mbreak
    sib4 \clef tenor \key fa\major r8 re\solo do4 sib

    %7
    fa r r8 do' fa do
    fa4 r8 lab, lab4 r
    r2 r4 r8 mib

    %10
    fa4 sol lab mib\mbreak
    fa mib lab r
    r si do sol

    %13
    mib r r sol
    \clef bass \key fa\major do^\markup\italic "[tutti]" r8 do, fa4 sib,
    mib r \clef tenor \key fa\major do'\solo fa,\mbreak

    %16
    sib r r2
    \clef bass \key fa\major r8 sib\tu la sol la4 sib
    la sib la8.[sol16 fa8 mib]

    %19
    re4 r\clef tenor \key fa\major r8 do'\solo la4\mbreak
    sib8 la r4 sib fa
    sib, \clef bass \key fa\major mib\tu fa r

    %22
    fa r fa r
    \clef tenor \key fa\major r8 fa fa fa fa4 r\mbreak
    r8 fa fa fa fa4 \clef bass \key fa\major r8 fa

    %25
    sib4 fa sol-! r8 r16 mib
    fa4 fa, sib r
    sol' re mib sib'

    %28
    la sib mib, la,\mbreak
    sib fa sib r
    sol' re sib r8 sol'

    %31
    la4 fa sib fad
    sol do, re re,\mbreak
    R1

    %34
    sib'4 r r2
    r re4 r
    r2 re4 r

    %37
    R1
    r8 fa mi re sold2
    la4 r8 sol? fa4 r

    %40
    R1
    \clef tenor \key fa\major la4\solo r8 sib do4 do,\mbreak
    fa \clef bass \key fa\major la\tu re, sib

    %43
    mib la,! sib fa
    sib r

}

Xbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s2 <6->4 <6>
    s1*12
    <_->4 s8 <_-> <7->4 <7->
    <4>8 <3> s4 s2
    s1
    s2 <6>
    s1
    <6>
    s
    s4 <6> s2
    s1*2
    s2 s4 s8 <7->
    s2 <6->4 s8 s16 <6>
    <6 4>4 <3> s2
    <6->4 <5-> s2
    <5->1
    s
    s4 <_+> s s8 <6->
    <5->1
    s4 <_- 6> <6 5> <_+>
    s1
    <6>
    s1*3
    s8 <6> <6+> s <7 5>2
    <_+>4 s8 <6 4+> <6>4 s
    s1*2
    s4 <6> <6> <7->
    s s s <7->

}

forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 55
    \partial 4 s4
    s1*3
    s2
    \mark\markup {\segno}
    s
    s1*24
    s2.
    \bar "||"\break
    s4
    s1*14
    s2
    \bar "||"
    \mark\markup\center-align\smaller {"Dal"\segno}

}


XobI = {
    \Xglobal
    <<\XobIn \forma>>
}


XobII = {
    \Xglobal
    <<\XobIIn \forma>>
}


XvlI = {
    \Xglobal
    <<\XvlIn \forma>>
}


XvlII = {
    \Xglobal
    <<\XvlIIn \forma>>
}


Xvla = {
    \Xglobal
    \clef alto
    <<\Xvlan \forma>>
}

XsopranoI = {
    \new Voice = "sempre1"
    <<\XsopranoIn \forma>>
}

XsopranoII = {
    \new Voice = "sempre2"
    <<\XsopranoIIn \forma>>
}

Xalto = {
    \new Voice = "sempre3"
    <<\Xalton \forma>>
}


Xbc = {
    \Xglobal
    \clef bass
    <<\Xbcn \forma \Xbfn>>
}



XIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

XIflIn =\relative do'' {

    r4
    R1
    r2 r4 sib'16. do32 sib16. do32
    lab16. sib32 lab16. sib32 sol16. lab32 sol16. lab32 fa8 sib r4

    %4
    R1
    r4 fa16. sol32 fa16. sol32 lab8 lab r4\mbreak
    R1

    %7
    r8 do sol lab sol4 r
    R1
    r2 r4 sib16. do32 sib16. do32

    %10
    lab16. sib32 lab16. sib32 sol8 sib\mbreak sib sib do4
    re r r2
    R1

    %13
    r2 r8 sib lab sol
    r2 r8 sol16. lab32 sib8 sol\mbreak
    fa4 r r8 fa16. sol32 lab16. sol32 lab16. sol32

    %16
    fa4 r r8 fa16. sol32 lab16. sol32 lab16. sol32
    lab8 lab sol[mib] r2
    r r8 sol16. lab32 sib8 mib,

    %19
    mib sib' sol [do] sib sib sib[sib]\mbreak
    sib1\tr
    lab8 sib16. do32 sol8 lab sol4 r

    %22
    R1
    sol8 sol sol[sol] fa do' sib la?16. sol32\mbreak
    fa4 r r2

    %25
    r r8 la16. sib32 do8  mib,
    mib mib mib[mib] mib do' r4
    r8 do sib do r do sib do\mbreak

    %28
    r4 r8 sol sib2~
    sib~sib~
    sib4 la sol r

    %31
    r2 r4 fa16. sol32 lab16. fa32
    sib8 lab sol[lab] sol4 r

}

XIobIn =\relative do'' {

    r4
    R1*2
    r2 r4 sib16. do32 sib16. do32
    re16. mib32 re16. mib32 fa16. sol32 fa16. sol32 fa8 sib, r4

    %5
    r2 r4 fa'16. sol32 lab16. fa32\mbreak
    sol8 fa r4 r2
    mib8 mib4 re8 mib4 r

    %8
    R1*3
    r4 sib16. do32 sib16. do32 re16. mib32 re16. mib32 fa16. sol32 fa16. sol32
    re4 r r r8 mib

    %13
    mib16. re32 mib16. do32 re8. mib16 mib4 r
    r8 sib' lab sol r4 r8 mib\mbreak
    re4 r r8 re16. mib32 fa16. mib32 fa16. mib32

    %16
    re4 r r8 re16. mib32 fa16. mib32 fa16. mib32
    fa8 re mib4 r2
    r r8 mib16. fa32 sol8 sib

    %19
    sib4 r8 fa16. mib32 fa8 mib r4\mbreak
    r8 mib fa16. mib32 re16. fa32 mib8[mib] sol lab
    do,16. mib32 sol16. do,32 sol'8 re sol4 r

    %22
    R1
    mi8[mi] mi mi fa fa fa[mib?]
    re4 r r2

    %25
    r r8 fad16. sol32 la8 do,
    la do do[do] do do r4
    r8 mib re mib r mib re mib\mbreak

    %28
    r2 r8 sol\noBeam sol la
    mi4. la8 mi4. mi8
    re4 r r8 sib sol'4

    %31
    r2 r4 re16. mib32 fa16. re32
    r8 mib mib re mib4 r

}

XIvlIn =\relative do'' {

    r8 mib
    sib'[sol16. lab32] sib8 mib, lab sol r mib
    sib'8 sol16. lab32 sib8 do re, mib r sol,\p
    fa8 re mib[mib] re sib r4

    %4
    r2 r4 fa''16.\f sol32 fa16. sol32
    lab8 lab r8 re,,16. mib32 fa8 fa r4\mbreak
    r fa'16. sol32 lab16. fa32 sib16. mib,32 do'16. lab32 sol8 fa

    %7
    r16 lab sol16. fa32 sol8 fa mib mib, sib'[mib,]
    r mib\p mib sib fa' sib r4
    r8 mib, mib lab fa sib, r sol'

    %10 OOKK
    fa re sol[mib]\mbreak fa fa mib[mib]
    re re r4 r r8 do
    sib sib do[do] sol sol do[lab]

    %13
    sib sib' lab4 sol8 sol fa mib
    r sol fa mib r mib16. fa32 sol8 sib\mbreak
    re,8 re fa re16. mib32 fa8 re re re

    %16
    re re fa re16. mib32 fa8 re re re
    re8 fa mib2 re4
    mib8\noBeam sol'16.\f lab32 sib8 mib, lab sol r mib

    %19
    sib' sol16. lab32 sib8 do re, mib16. mib32 sib'16. sol32 mib16. sol32\mbreak
    lab16. sib32 sol16. lab32 fa16. sol32 lab16. fa32 sib16. lab32 sol16. fa32 sol8 fa
    mib16. lab32 sol16. fa32 sol8 fa mib16. sol,32 lab16. fa32 sol4

    %22
    r8 do\p sol16. lab32 fa16. sol32 mib8 mib'16. re32 mib8 mib,16. fa32
    mi8 sol mi[mi] la do16. mib32 re16. re,32 mib?16.[mib32]\mbreak
    fa8 fa'16. fa,32 fa8\noBeam re'16. re,32 mib8 re r4

    %25
    sol8 fa fa[mib!] re4 r
    do8 do fad[sol] la la r la
    sol do, re[la'] sol do, re la'\mbreak

    %28
    sol la16. sib32 do8 do16. re32 mi,8 [mi] sol fad
    sol la sib[fad] sol[la] sib sol
    re2 sol8\noBeam sol'16.\f lab32 sib8 mib,

    %31
    lab16. sib32 sol16. lab32 fa16. sol32 fa16. sol32 lab8 lab r4
    sib16. mib,32 do'16. lab32 sol8 fa sol4 r

}


XIvlIIn =\relative do'' {

    r4
    sol'8 mib16. fa32 sol8 sib, fa' mib r4
    mib8 sib mib[lab] sib, sib r4
    r2 r4 r8 re,16. do32

    %4
    sib8 sib sib la sib8 re re'16.\f mib32 re16. mib32
    fa8 fa r4 r8 fa,16. mib32 re8 re\mbreak
    mib re re'16. mib32 fa16. re32 mib8 mib mib[re]

    %7
    do, do' sib[re] mib mib, sib'[mib,]
    r mib sol, sol re' mib r4
    sol,8 sol sol lab lab sol r4

    %10 OOKK
    r4 sol'8 mib\mbreak re re do[do]
    sib sib r sib'16. la32 sib8 sib, la[la]
    re\noBeam re'16. re,32 mib8\noBeam mib'16. mib,32 mib8\noBeam mib'16. mib,32 mib8 mib

    %13
    sib sib sib sib mib4 r8 sol
    fa mib r sol fa mib r sol,16. lab32\mbreak
    sib8 sib sib sib sib sib sib sib

    %16
    sib8 sib sib sib sib sib sib sib
    fa'4 sol,8 lab sib2
    mib8\noBeam mib'16.\f fa32 sol8 sib, fa' mib r4

    %19
    mib8 sib mib [lab] sib, sib r sib
    fa'16. sol32 mib16. fa32 re16. mib32 fa16. re32 sol16. fa32 mib16. mib32 mib8 re
    r16 do re16. mib32 mib8 re mib16. mib,32 fa16. re32 mib4

    %22
    r8 mib\p mib re do do16. si32 do8 do
    sib? sib sib sib la! la sib[do]\mbreak
    re re re[sib] do8. si16 r4

    %25
    mi8 fa do[do] do4 r
    do8 sib? la[sol] fad' fad r fad
    sol do, sib[fad'] sol la, sib[fad']\mbreak

    %28
    sol,8[re' mib mib16. re32] dod8 dod dod dod
    dod dod dod dod dod dod dod dod
    re2 sol,4 r8 sol'

    %31
    fa'16. sol32 mib16. fa32 re16. mib32 re16. mib32 fa8 fa r4
    mib8 mib mib re mib4 r

}


XIvlan =\relative do' {

    r4
    mib8 sib' sol mib re sib' r4
    sol8 mib sol fa fa sol r4
    R1

    %4
    r2 r4 sib8 fa
    re re r4 r2\mbreak
    r4 fa8 re sib fa' sol lab

    %7
    r mib mib sib sib4 r
    r8 mib, sol sol re mib r4
    sol8 sol sol lab lab sol r4

    %10
    r sol8 mib\mbreak re re' do[do]
    sib sib r4 r r8 la
    sib[sib] do do sol sol do[lab]

    %13
    sib sib sib sib mib,4 r8 sol
    fa mib r sol fa mib r sol16. lab32\mbreak
    sib8 sib sib sib sib sib sib sib

    %16
    sib8 sib sib sib sib sib sib sib
    fa4 sol8 lab sib2
    mib8 sib mib[sib] re sib' r4

    %19
    sol8 sol sol fa fa sol r sol16. mib32\mbreak
    fa8 sib sib[sib] do mib, sib'[sib]
    r16 mib, re16. do32 sib8[sib] sib sib sib4

    %22
    r8 mib mib re do do16. si32 do8 do
    sib[sib] sib sib la! la sib do\mbreak
    re re re[sib] do si r4

    %25
    mi,8[fa] do' do do4 r
    do8[sib] la sol fad fad r fad
    sol la sib fad sol la sib fad\mbreak

    %28
    sol re' mib mib16. re32 dod8 dod dod dod
    dod dod dod dod dod dod dod dod
    re2 sol,4 r8 mib'

    %31
    re sib re[re] re re r4
    sib8[fa'] sib, sib sib4 r

}

XIalton = \relative do' {

    \autoBeamOff

    r4
    R1*6
    r2 r4 r8 mib
    sib' sol16[lab] sib8 mib, lab sol r mib

    %9
    sib' sol16. lab32 sib8 do re, mib r4
    r sib'8 lab16 sol\mbreak fa8 sib la!4
    sib r r r8 fa

    %12
    fa16.[sol32 fa16. sol32] lab16.[sib32 sol16. lab32] sib8 [sol] mib do'
    sol4 fa mib r8 sib'
    lab sol r sib lab[sol] r sib\mbreak

    %15
    sib8[sib,] re[fa] lab2~
    lab8[sib,] re[fa] lab2~
    lab8[re,] sib' do sol4 fa8. sol16

    %18
    mib4 r r2
    R1*2
    r2\fermopz r4 r8 sol

    %22
    do sol16[fa] sol8 si do sol r sol16[la!]
    sib?8 sol16[fa] sol8 do do fa, r la\mbreak
    sib16[la] sib8 sib sol lab sol r sol

    %25
    do16[sib] lab sol lab8 sol fad4. la16[sol]
    fad8 sol la16[sib] do8 mib,16[re] mib8 r do'
    sib16[sol] fad8 sol16[re] do'8 sib16[sol] fad8 sol16[re] do'8\mbreak

    %28
    sib[fad] sol4 r8 sol sib la
    sol fad sol la sib fad sol4~
    sol fad sol r

    %31
    R1
    r2 r4 r8 mib

}

XItesto = \lyricmode {

    Ho_in se -- no due fiam -- mel -- le, del pa -- ri_il -- lu -- stri e bel -- le. Una è la tua bel -- lez -- za, e l'al - - tra è_il tuo va -- lor,

    bel -- lez -- za,  va -- lor, bel -- lez - - - - za, bel -- lez -- za, va -- lor.

    L'af -- fet -- to del mio pet -- to in am -- be s'è di -- vi -- so: a -- do -- ro_il tuo bel vi -- so,

    a -- do -- ro il tuo bel cor, in am -- be s'è di -- vi -- so: a -- do -- ro_il tuo bel vi -- so,_il tuo bel vi -- so,

    a -- do -- ro,_a -- do -- ro_il tuo bel cor, il tuo bel cor. Ho_in

}

XIbcn =\relative do {

    r4
    mib8 mib mib sol re mib r4
    sol8 sol sol lab lab sol r4
    R1

    %4
    r2 r4 sib8 sib
    sib sib, r4 r2\mbreak
    r4 sib'8 lab sol lab sib sib,

    %7
    r16 do' sib16. lab32 sib8 sib, mib4 r
    \clef tenor\key sol \minor r8 mib\solo sol sol re mib r4
    sol8 sol sol[lab] lab sol r4

    %10
    r sol8 mib\mbreak re[re'] do do
    sib sib, r4 r r8 la'?
    sib sib do[do] sol sol do[lab]

    %13
    sib sib sib sib, mib4 r8 sol
    fa mib r sol fa mib r sol16. lab32\mbreak
    sib8 sib sib sib sib sib sib sib

    %16
    sib8 sib sib sib sib sib sib sib
    fa4 sol8 lab sib4 sib,
    \clef bass\key sol \minor mib8\tu mib mib sol re mib r4

    %19
    sol8 sol sol lab lab sol r sol\mbreak
    re mib sib'[lab] sol lab sib[sib,]
    r16 do' sib16. lab32 sib8 sib, mib sib mib,4

    %22
    \clef tenor\key sol \minor r8 mib'' mib re do do16. si32 do8 do
    sib! sib sib[sib] la! la sib[do]\mbreak
    re re re[sib] do si r4

    %25
    mi,8 fa do'[do] do4 r
    do8 sib la[sol] fad fad r4
    sol8[la] sib fad sol la sib[fad]\mbreak

    %28
    sol re' mib mib16. re32 dod8 dod dod dod
    dod dod dod dod dod dod dod dod
    re4 re, sol\clef bass\key sol\minor r8 sol\tu

    %31
    re[mib] sib' sib, sib'[sib,] r4
    sol'8 lab sib sib, mib4 r

}

XIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s s8 <6> <5->2
    <6>4 s8 <6> <4 2> <6> s4
    s1
    s
    <5->
    s4 s8 <6 4> <6> <6 5> <6 4> <3>
    s16 <6-> <6>16. <6>32 <6 4>8 <3> s2
    s1*10
    s2 <5->
    <6>4 s8 <6> <4 2> <6> s <6>
    <5->2 <6>4 <6 4>8 <3>
    s16 <6-> <6>16. <6 5>32 s4 s2
    s1*8
    s2 s4 s8 <6>
    <5->2 <5->
    <6>8 <6> <6 4> <3>

}

forma = {

    \time 4/4
    \key sol\minor
    \tempo 4 = 55
    \partial 4 s4
    s1*7
    \mark\markup {\segno}
    s1*14
    \bar "||"\break
    s1*11
    \bar "||"
    \mark\markup\center-align\smaller {"Dal"\segno}

}


XIflI = {
    \XIglobal
    <<\XIflIn \forma>>
}


XIobI = {
    \XIglobal
    <<\XIobIn \forma>>
}


XIvlI = {
    \XIglobal
    <<\XIvlIn \forma>>
}


XIvlII = {
    \XIglobal
    <<\XIvlIIn \forma>>
}


XIvla = {
    \XIglobal
    \clef alto
    <<\XIvlan \forma>>
}

XIalto = {
    \new Voice = "seno"
    <<\XIalton \forma>>
}


XIbc = {
    \XIglobal
    \clef bass
    <<\XIbcn \forma \XIbfn>>
}



XIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \tupletSpan 8\con
}

XIIcrIn = \relative do'' {

    do8 fa fa
    fa16 sol la sol la sib
    la8 la la

    %4
    la fa do
    fa la16 sib do sib
    la sol la sib do sib

    %7
    la8 r r
    R4.
    la8. sib16 la sol

    %10
    la8 sib sol\mbreak
    fa r r
    sol do sib

    %13
    la r r
    R4.*21
    sol16[la] sib8 sib\mbreak

    %36
    la16[sib] do8 la
    sol16[la] sib8 sib
    la16[sib] do8 la

    %39
    sol8 r r
    R4.*28
    do,8 fa fa

    %69
    fa16 sol la sol la  sib
    la8. la16 sib8\mbreak
    la8. la16 sib8


    %72
    la r r
    R4.*25
    R4.\fermata

    %99
    R4.*5
    do,8 fa fa\mbreak
    fa16 sol la sol la sib

    %106
    la8. la16 sib8
    la8. la16 sib8
    la r r

}

XIIcrIIn =\relative do'' {

    R4.*2
    do8 fa fa
    fa16 sol la sol la sib

    %5
    la8 fa do
    fa fa16 sol la sol
    fa8 r r

    %8
    R4.
    fa8 fa sol
    do, r r\mbreak

    %11
    do do do
    sol' sol4
    fa8 r r

    %14
    R4.*21
    do8 sol' sol\mbreak
    fa16[sol] la8 fa

    %37
    do sol' sol
    fa16[sol] la8 fa
    do r r

    %40
    R4.*28
    r8 la la
    la do do

    %70
    fa8. fa16 sol8\mbreak
    fa8. fa16 sol8
    fa r r

    %73
    R4.*25
    R4.\fermata
    R4.*5

    %104
    r8 la, la\mbreak
    la do do
    fa8. fa16 sol8

    %107
    fa8. fa16 sol8
    fa8 r r

}


XIIobIn =\relative do'' {

    R4.*4
    la'8 r r
    la r r

    %7
    la la, re
    sol do,16 re mi8
    fa do re

    %10
    do re sol\mbreak
    la16 sol fa mi fa8\noBeam
    sib sol4

    %13
    la8 r r
    R4.*3
    r8 la16[sol] la8

    %18
    R4.*7
    si,16[do] re8 r
    re r r

    %27
    re r r
    re r r
    R4.*3

    %32
    r8 re16 do re8\noBeam
    R4.*2
    sol16[fa] mi8 mi\mbreak

    %36
    fa8. fa16 do re
    mi8 mi  mi
    fa8. mi16 fa8

    %39
    sol sol sol
    fa r r
    r r re16 mib

    %42
    fa8 r r
    r r re16 mib
    fa8 r r

    %45
    R4.*3\mbreak
    mi8 r r
    fa8. mi16 fa mi

    %50
    fa8 r r
    fa r r
    do r r

    %53
    do fa sib,
    la sol4
    fa la8

    %56
    sib r r
    fa' r r
    re do16 sib do re

    %59
    sib8 r r\mbreak
    r sol'16 fa mi re
    do sib la sol fa8\noBeam

    %62
    R4.
    r16 fa' mi re do sib
    la8 sol4

    %65
    la8 r r
    R4.
    do8\f fa fa

    %68
    fa16 sol la sol la sib
    la8 fa do
    la'4 sol8\mbreak

    %71
    la4 sol8
    la r r
    R4.

    %74
    r8 fa16 sol la fa
    sib8 r r
    r mi,16 re mi fa

    %77
    re8 r r
    R4.*2
    r8 do fa

    %81
    mi r r
    R4.*4
    fa16 mi re8[re]

    %87
    re r r
    r r re
    sol r r

    %90
    r r do,
    fa r r
    R4.*4

    %96
    r8 r fa
    fa r r
    R4.\fermata

    %99
    R4.*4
    r16 do fa8 fa
    fa16 sol la sol la sib\mbreak

    %105
    la8 fa do
    la'4 sol8
    la4 sol8

    %108
    la r r

}


XIIobIIn =\relative do'' {

    R4.*4
    fa8 r r
    fa r r

    %7
    do4 si8
    do mi do
    r do16 sib? la sol

    %10
    la8 sib sol\mbreak
    do8. sib16 do8
    sol' do,4

    %13
    do8 r r
    R4.*3
    r8 fa16[mi] fa8

    %18
    R4.*7
    sol,16[la] si8 r
    si r r

    %27
    si r r
    si r r
    R4.*3

    %32
    r8 si16[la] si8
    R4.*2
    mi16[re] do8 sol'\mbreak

    %36
    la16 sol fa8 fa
    sol sol sol
    la16 sol fa sol la8\noBeam

    %39
    mi mi mi
    do r r
    r r sib

    %42
    do r r
    r r sib16 do
    re8 r r

    %45
    R4.*3\mbreak
    mi8 r r
    do\noBeam la16 sol la sol

    %50
    la8 r r
    re r r
    sol r r

    %53
    la,4 re8
    do r r
    la4 do8

    %56
    fa, r r
    re' r r
    fa r r

    %59
    fa r r\mbreak
    R4.
    r8 r fa,

    %62
    do' do do
    do r r
    do mi4

    %65
    fa8 r r
    R4.
    do8\f la la

    %68
    do do do
    do la la
    do4 mi8\mbreak

    %71
    do4 mi8
    do r r
    R4.

    %74
    r8 re16 mi fa re
    sol8 r r
    r dod, la

    %77
    la r r
    R4.*2
    r8 la la

    %81
    la' r r
    R4.*4
    r8 fa fa

    %87
    fa r r
    r r si,
    mi r r

    %90
    r r la,
    re r r
    R4.*4

    %96
    r8 r fa
    fa r r
    R4.\fermata

    %99
    R4.*4
    r16 do fa8 fa
    fa16 sol la sol la sib\mbreak

    %105
    do,8 la la
    do4 mi8
    do4 mi8

    %108
    do r r

}

XIIvlIn =\relative do'' {

    R4.*4
    fa8\noBeam fa,16 sol la sol
    fa8 fa' fa,

    %7
    do' fa16 mi fa sol
    mi8 sol16 fa sol la
    do, fa mi re do sib

    %10
    la[fa'] sol8 mi\mbreak
    la16[sib] do8 fa,
    sol8 mi8. fa16

    %13
    fa8 r r
    R4.*3
    r8 la,16 sib do re

    %18
    sol,8 la\noBeam r
    r si16 do re mi
    la,8\noBeam si r

    %21
    r do16 re mi fa
    do8 r r\mbreak
    r la\p sol

    %24
    r sol do
    si16 la sol8[sol,]
    re' r r

    %27
    re r r
    re r r
    R4.

    %30
    r8 r si\p
    do re mi
    fa sol fa

    %33
    mi do la
    fa' sol4
    do8. do16 mi8\mbreak

    %36
    do fa16 sol la sib
    do8 sol16 fa mi re
    do[sib] la sib do re

    %39
    mi fa sol la sib sol
    do8 r r
    la,,4 sib8

    %42
    la r r
    la4 sib8
    sib re sib

    %45
    fa' r r
    sib, re sib
    la sol fa'\mbreak

    %48
    sol, r r
    la r r
    la r r

    %51
    sib4 la8
    mi' r r
    fa la, sib

    %54
    do4  do8
    fa16 fa' mib re mib fa
    re8 r r

    %57
    sib, r r
    la r r
    sib r r\mbreak

    %60
    mi! r r
    fa4 re8
    do4 sib8

    %63
    la4 fa'8~
    fa mi4
    fa8 do' fa

    %66
    fa, mi4
    fa8\f do' do
    do4 do'8

    %69
    la16 sib do sib do re
    do sib la do mi,8\noBeam\mbreak
    do'16 sib la do mi,8\noBeam

    %72
    fa r r
    fa, r r
    r re'16[re,] do' la

    %75
    re8 r r
    r8 mi16[mi,] dod' la
    re8 r r

    %78
    r sib la
    sol8. fa16 mi8
    fa8. sol16 fa sol

    %81
    la8 r r
    r fa\p la\mbreak
    sib8. sib16 do8

    %84
    fa,8. sol16 la fa
    sib8 la mi
    fa16 sol la[re] fa8

    %87
    sol, r r
    sol16 la si8[re]
    do r r

    %90
    fa,16 sol la8[do]
    si16 la si8[sold]
    mi4 la8

    %93
    sib!4 fa8\mbreak
    mi fa16[la] dod8
    re4 sol,8

    %96
    fa4  re'8
    sold, r r
    R4.\fermata

    %99
    r8 r sold
    la4 fa8
    mi4.

    %102
    la,
    fa'8 do'\f do
    do4 do'8\mbreak

    %105
    la16 sib do sib do re
    do sib la do mi,8\noBeam
    do'16 sib la do mi,8\noBeam

    %108
    fa r r

}


XIIvlan =\relative do' {

    R4.*4
    la'8.\noBeam sol16 la sol
    fa8 fa fa

    %7
    la4 fa8
    sol4 mi8
    la4 re,8

    %10
    fa re do\mbreak
    do la do
    re sol4

    %13
    la8 r r
    R4.*10
    r8 mi sol

    %25
    sol r r
    si, r r
    si r r

    %28
    si r r
    R4.
    r8 r sol'~

    %31
    sol8 fa sol
    la sol4
    sol la8

    %34
    re, si4
    mi do8\mbreak
    do do do

    %37
    do do do
    do do do
    do do do

    %40
    do r r
    fa4 sib,8
    mib r r

    %43
    fa4 sib,8
    fa' re fa
    la r r

    %46
    fa re fa
    fa sib, fa\mbreak
    sol r r

    %49
    la r r
    la r r
    sib4 la8

    %52
    mi r r
    fa la sib
    do4 do,8

    %55
    fa4 la8
    sib r r
    sib r r

    %58
    la r r
    sib r r\mbreak
    mi,! r r

    %61
    fa4 fa'8
    fa \noBeam mi sol
    do,4 sib8

    %64
    do4.
    la8. sol16 fa8
    do4.

    %67
    fa8 la la'
    la16 sib la sol fa mi
    fa8 fa fa

    %70
    fa4 sol8\mbreak
    la4 sol8
    la r r

    %73 OOKK
    fa r r
    r sib, do
    sib r r

    %76
    r la mi'
    fa r r
    r sol fa

    %79
    mi4 do8
    do fa4
    mi8 r r

    %82
    r re fa,\mbreak
    sol4 la8
    sib4 fa8

    %85
    sol la4
    re16[mi] fa8 re
    si r r

    %88
    sol4 fa8
    mi r r
    fa4 mi8

    %91
    re4 mi8
    do'4 la8
    re4 re8\mbreak

    %94
    dod re mi
    fa4 mi8
    re4 re,8

    %97
    sold r r
    R4.\fermata
    r8 r mi

    %100
    la4 fa8
    mi4.
    la

    %103
    fa8 la\f la'
    la16 sib la sol fa mi\mbreak
    fa8 fa fa

    %106
    fa4 sol8
    la4 sol8
    la r r

}

XIIsopranon = \relative do'' {

    \autoBeamOff

    R4.*13
    do8 fa16[mi] fa8
    do8 fa16[mi] fa8

    %16
    do8 sib4
    la16[sol] fa8 r
    do' re do

    %19
    si16[do] re8 r
    re mi re
    do16[re] mi8 r

    %22
    mi fa mi\mbreak
    re8 do16[si] do8
    fa mi16[re] mi[fa]

    %25
    re8.[do16 si la]
    sol8[si sol]
    re'16[do] re8[sol]

    %28
    re4.~
    re
    re16[mi] fa8 re

    %31
    mi8. re16 do8
    re si4
    sol'16[fa mi re] do8

    %34
    fa re4
    do8 r r\mbreak
    R4.*4

    %40
    do8 re mib
    mib? re16[do  re8]
    do re mib

    %43
    mib? re16[do  re8]
    re16[mib] fa8 re
    do[sib] la

    %46
    re16[mib] fa8 re
    do8[mi!] fa\mbreak
    sib, la sib

    %49
    do16[sib] do8 r
    do sib do
    re8. mi16 fa8

    %52
    sol16[fa mi re do sib]
    la8 fa' sib,
    la16[sib] sol4

    %55
    fa8 r r
    fa' mib16[re mib fa]
    re8[sib re]

    %58
    fa[mib16 re mib fa]
    re8[fa re]\mbreak
    sol16[fa mi! re do sib]

    %61
    la8 do fa
    la,[sol] mi'
    fa mi16[re do sib]

    %64
    la8 sol4
    fa8[do'] fa
    la, sol4

    %67
    fa8 r r
    R4.*5
    do'8 fa mi

    %74
    re16[dod] re8 r
    re mi re
    dod16[si] dod8 r

    %77
    la re do
    sib8. do16 re8
    do sib4

    %80
    sib8 la r
    la mi' la,
    fa'8. mi16 re8\mbreak

    %83
    mib mib4
    mib8(re4)
    mi!8 la, dod

    %86
    re r r
    re16[mi] fa8 re
    si16[do] re8 r

    %89
    do16[re] mi8 do
    la16[si] do8 r
    si16[do] re8 si

    %92
    mi8. re16 do8
    fa sib,!4\mbreak
    sib8(la4)~

    %95
    la8[si dod]
    re[mi fa]
    si,4.

    %98
    R\fermata
    fa'8[mi] re8
    do8. si16 la8

    %101
    si sold4
    la4.
    R4.*6

}

XIItesto = \lyricmode {

    Co -- me va l'A -- pe di fio -- re_in fio -- re: fa -- sto -- so,_al -- te -- ro, su -- per -- bo_A -- mo -- re

    di Bel -- la in Bel -- la vo -- lan -- do va - - - - di Bel -- la_in Bel -- la vo -- lan -- do va, vo -- lan -- do va.

    Di fio -- re_in fio -- re, co -- me fa l'A -- pe, su -- per -- bo_A -- mo -- re, fa -- sto -- so,_al -- te -- ro,

    di Bel -- la_in Bel -- la, di Bel -- la_in Bel -- la vo -- lan - do, vo -- lan -- do va,

    vo -- lan - - - - - do, vo -- lan -- do va, vo -- lan -- do va, vo -- lan -- do va.

    Fe -- ri -- sce que -- sta, ri -- sa -- na quel -- la: in u -- na_ac -- cen -- de la sua fa -- cel -- la,

    nel -- l'al -- tra de -- sta la cru -- del -- tà, la cru -- del -- tà, in u -- na_ac -- cen -- de la sua fa -- cel -- la,

    nel -- l'al -- tra de -- sta la cru -- del -- tà, - -  de -- sta, de -- sta la cru -- del -- tà.

}

XIIbcn =\relative do {

    R4.*3
    fa8 r r
    fa r r

    %6
    fa r r
    fa4 re8
    do4 sib8

    %9
    la4 sib8
    do sib do\mbreak
    fa8. sol16 la8

    %12
    sib do do,
    fa r r
    R4.

    %15
    fa8 r r
    la sol4
    fa8 r r

    %18
    mi fa4
    sol8 r r
    fa sol4

    %21
    la8 r r
    r la sol\mbreak
    fa4 mi8

    %24
    re do4
    sol8 r r
    sol' r r

    %27
    sol r r
    sol r r
    R4.

    %30
    \clef tenor\key fa\major r8 r si\solo
    do re mi
    fa sol fa

    %33
    mi do la
    fa sol4
    \clef bass\key fa\major do,8 r r\mbreak

    %36
    do r r
    do r r
    do r r

    %39
    do do' sib
    la r r
    \clef tenor\key fa\major la4\solo sib8

    %42
    la r r
    la4 sib8
    sib re sib

    %45
    fa r r
    sib re sib
    la sol fa\mbreak

    %48
    sol r r
    la r r
    la r r

    %51
    sib4 la8
    mi r r
    fa la sib

    %54
    do4 do,8
    fa4 la8
    sib r r

    %57
    sib r r
    la r r
    sib r r\mbreak

    %60
    mi,! r r
    fa4 re'8
    do4 sib8

    %63
    la4 sib8
    do do,4
    la'8. sol16 fa8

    %66
    do' do,4
    \clef bass\key fa\major fa8\tu fa fa
    fa r r

    %69
    fa r r
    fa4 do8\mbreak
    fa fa do

    %72
    fa, r r
    fa' r r
    r sib la

    %75
    sol r r
    r la sol
    fa r r

    %78
    r sol fa
    mi4 do8
    fa8. mi16 re8

    %81
    dod r r
    \clef tenor\key fa\major r re'\solo fa,\mbreak
    sol4 la8

    %84
    sib4 fa8
    sol la4
    re16[mi] fa8 re

    %87
    si r r
    sol4 fa8
    mi r r

    %90
    fa4 mi8
    re4 mi8
    do'4 la8

    %93
    re4 re8\mbreak
    dod re mi
    fa4 mi8

    %96
    re4 re,8
    sold r r
    R4.\fermata

    %99
    r8 r mi
    la4 fa8
    mi4.

    %102
    la,
    \clef bass\key fa\major fa'8\tu fa fa
    fa r r\mbreak

    %105
    fa r r
    fa4 do8
    fa fa do

    %108
    fa, r r

}

XIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*6
    s4 <6!>8 s4 <6 4>8
    <6>4 <6>8
    <6 4> <6 5> s
    s4 <6>8
    <6>4.
    s4.*3
    <6>8 <6> s
    s4.
    <6>8 <6>4
    <_!>4.
    <6>8 <_!>4
    <5>4.
    s8 <6> <6>
    <6>4 <6>8
    <6!>4.
    <_!>
    <_!>
    <_!>
    <_!>
    s4.*7
    <6 4>4.
    <5>
    <6 4>
    s
    <6>
    s4.*29
    s4 <7>8
    s4 <7>8
    s4.
    s
    s
    <5>
    s8 <_+> s
    <6>4.
    s4 <6>8
    s4 <7>8
    <4>8. <3>16 s8
    s4.*25
    s4 <7>8
    s4 <7>8

}

forma = {

    \time 3/8
    \key fa\major
    \tempo 4. = 70
    s4.*13\break
    \mark\markup {\segno}
    s4.*59
    \bar "||"\break
    s4.*36
    \bar "||"
    \mark\markup\smaller {"Dal" \segno}

}


XIIcrI = {
    \XIIglobal
    <<\XIIcrIn \forma>>
}


XIIcrII = {
    \XIIglobal
    <<\XIIcrIIn \forma>>
}


XIIobI = {
    \XIIglobal
    <<\XIIobIn \forma>>
}


XIIobII = {
    \XIIglobal
    <<\XIIobIIn \forma>>
}


XIIvlI = {
    \XIIglobal
    <<\XIIvlIn \forma>>
}


XIIvla = {
    \XIIglobal
    \clef alto
    <<\XIIvlan \forma>>
}

XIIsoprano = {
    \new Voice = "ape"
    <<\XIIsopranon \forma>>
}


XIIbc = {
    \XIIglobal
    \clef bass
    <<\XIIbcn \forma \XIIbfn>>
}
%#(set-global-staff-size 15.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #2

    }

    \header {
        title = \markup\smaller{La Griselda - Sinfonia e Arie con strumenti}
        composer = \markup \center-column{"A. Scarlatti (1660 -1725)"}
    }

    \markup\huge{"[1.] Sinfonia avanti l'Opera - Presto"}

    \score {

        \new ChoirStaff
        \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Tromba [I]"}
                    \set Staff.midiInstrument = #"trumpet"
                    \set Staff.shortInstrumentName = "tp1"
                    \ItpI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Tromba [II]"}
                    \set Staff.midiInstrument = #"trumpet"
                    \set Staff.shortInstrumentName = "tp2"
                    \ItpII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oubuè [I]"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob1"
                    \IobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oubuè [II]"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob2"
                    \IobII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso"\vspace #-0.2"continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

    \markup\huge{"[2.] Sinfonia p[er] lo sbarco - All[egr]o"}

    \score {

        \new ChoirStaff
        \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Corno da caccia [I]"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr1"
                    \IIcrI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Corno da caccia [II]"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr2"
                    \IIcrII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oubuè [I]"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob1"
                    \IIobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oubuè [II]"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob2"
                    \IIobII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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

    \markup\huge{"[3.] Aria -  ”Come presto nel porto crudele” - All[egr]o moderato"}

    \score {

        \new ChoirStaff
        \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Corno"\vspace #-0.3"da caccia [I]"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr1"
                    \IIIcrI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Corno"\vspace #-0.3"da caccia [II]"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr2"
                    \IIIcrII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oubuè [I]"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob1"
                    \IIIobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oubuè [II]"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob2"
                    \IIIobII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 2/2 r4  r\longa r\breve r1 ^\markup\center-align "[Roberto]" do''2 fa''}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "Rob"
                \IIIsoprano \IIIglobal
                \new Lyrics \lyricsto "porto" \IIItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso"\vspace #-0.2"continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

    \paper  {

        systems-per-page = #3

    }

    \markup\huge{"[4.] Aria -  ”Mi rivedi o selva ombrosa” - Moderato"}

    \score {

        \new ChoirStaff
        \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Due Flauti"\vspace #-0.3"unis[o]ni"}
                \set Staff.midiInstrument = #"recorder"
                \set Staff.shortInstrumentName = "fl"
                \IVfl
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IVvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IVvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\minor \time 4/4  r4 r\breve r1 r4 r8 ^\markup\center-align "Griselda" do''16. re''32}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "Gri"
                \IVsoprano \IVglobal
                \new Lyrics \lyricsto "rivedi" \IVtesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso"\vspace #-0.2"continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 16)
            indent = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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

    \paper  {

        systems-per-page = #4

    }

    \markup\huge{"[5.] Aria -  ”Agitata da fiera procella” - Vivace"}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Due Oubuè"\vspace #-0.3"unis[oni]"}
                \set Staff.midiInstrument = #"oboe"
                \set Staff.shortInstrumentName = "ob"
                \VobI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violini]"\vspace #-0.3"unis[o]ni"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key la\minor \time 3/8\numericTimeSignature r8 r\longa ^\markup\center-align "Corrado" r8 re'16[la]}
                \clef "treble_8"
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "Cor"
                \Vtenore \Vglobal
                \new Lyrics \lyricsto "procella" \Vtesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso"\vspace #-0.2"continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 15)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \markup\huge{"[6.] Aria -  ”Credi amor” - And[an]te Vivace"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Oubuè"\vspace #-0.3"Solo"}
                \set Staff.midiInstrument = #"oboe"
                \set Staff.shortInstrumentName = "ob"
                \VIobI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violini]"\vspace #-0.3"unis[o]ni"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VIvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \VIvla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 4/4 r\longa r\breve r1 ^\markup\center-align "Costanza" r2 r4 do''8 sol'}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "Cos"
                \VIsoprano \VIglobal
                \new Lyrics \lyricsto "amor" \VItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso"\vspace #-0.2"continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \VIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 15)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \paper  {

        systems-per-page = #3

    }

    \markup\huge{"[7.] Aria -  ”Finirà, barbara sorte” - And[an]te moderato"}

    \score {

        \new ChoirStaff
        \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Due Flauti"\vspace #-0.3"unis[o]ni"}
                \set Staff.midiInstrument = #"recorder"
                \set Staff.shortInstrumentName = "fl"
                \VIIfl
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \VIIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \VIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \VIIvla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\minor \time 4/4  r4 r\breve r1 r2 r4 r8 ^\markup\center-align "Griselda" sib'16 sib'}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "Gri"
                \VIIsoprano \IVglobal
                \new Lyrics \lyricsto "sorte" \VIItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso"\vspace #-0.3"continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \VIIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 16)
            indent = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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

    \paper  {

        systems-per-page = #2

    }

    \markup\huge{"[8.] Caccia Reale - All[egr]o"}

    \score {

        \new ChoirStaff
        \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Cor[no]"\vspace #-0.3"da caccia [I]"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr1"
                    \VIIIcrI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Cor[no]"\vspace #-0.3"da caccia [II]"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr2"
                    \VIIIcrII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oubuè [I]"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob1"
                    \VIIIobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oubuè [II]"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob2"
                    \VIIIobII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \VIIIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \VIIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \VIIIvla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \VIIIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 18)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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

    \markup\huge{"[9.] Aria ”Non sei quella, eppure il cor” - A 2 moderato"}

    \score {

        \new ChoirStaff
        \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Flauto [I]"}
                    \set Staff.midiInstrument = #"recorder"
                    \set Staff.shortInstrumentName = "fl1"
                    \IXflI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Flauto [II]"}
                    \set Staff.midiInstrument = #"recorder"
                    \set Staff.shortInstrumentName = "fl2"
                    \IXflII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IXvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IXvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IXvla
            >>

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4  r4 ^\markup\center-align "Griselda" re''8 mi''}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "Gri"
                    \IXsopranoI \IXglobal
                    \new Lyrics \lyricsto "quella1" \IXtestoI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4  r4 ^\markup\center-align "Costanza" si'8 do''}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "Cos"
                    \IXsopranoII \IXglobal
                    \new Lyrics \lyricsto "quella2" \IXtestoII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IXbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 18)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/12)
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

    \markup\huge{"[10.] Aria ”Ti voglio sempre odiar” - All[egr]o"}

    \score {

        \new ChoirStaff
        \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oubuè [I]"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob1"
                    \XobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oubuè [II]"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob2"
                    \XobII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \XvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \XvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Xvla
            >>

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key fa\major \time 4/4  r4 r\longa r\breve r1 ^\markup\center-align "Griselda" r8 do'' fa''4.}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "Gri"
                    \XsopranoI \Xglobal
                    \new Lyrics \lyricsto "sempre1" \XtestoI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key fa\major \time 4/4  r4 r\longa r1 ^\markup\center-align "Costanza" r8 fa'' fa''}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "Cos"
                    \XsopranoII \Xglobal
                    \new Lyrics \lyricsto "sempre2" \XtestoII
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key fa\major \time 4/4  r4 r\longa r\longa^\markup\center-align "Gualtiero" r8 mib' fa'}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "Gua"
                    \Xalto \Xglobal
                    \new Lyrics \lyricsto "sempre3" \XtestoIII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Xbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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
        system-system-spacing = #'((basic-distance . 35) (padding . 8))
        last-bottom-spacing = #'((padding . 5))
        bottom-margin = 3\mm

    }

    \markup\huge{"[11.] Aria -  ”Ho in seno due fiammelle” - And[an]te moderato"}

    \score {

        \new ChoirStaff
        \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #0
            \override StaffGrouper.staffgroup-staff-spacing.padding = #0
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Flauto solo"}
                \set Staff.midiInstrument = #"recorder"
                \set Staff.shortInstrumentName = "fl"
                \XIflI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Oubuè solo"}
                \set Staff.midiInstrument = #"oboe"
                \set Staff.shortInstrumentName = "ob"
                \XIobI
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \XIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \XIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \XIvla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key sol\minor \time 4/4  r4 r\longa r\breve r2 r4 r8 ^\markup\center-align "Gualtiero" mib'8 sib'}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "Gua"
                \XIalto \XIglobal
                \new Lyrics \lyricsto "seno" \XItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso"\vspace #-0.2"continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \XIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 14)
            indent = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0
                \override StaffGrouper.staff-staff-spacing.basic-distance = #0
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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

        systems-per-page = 2
        last-bottom-spacing = #'((padding . 5))
        bottom-margin = 3\mm

    }

    \markup\huge{"[12.] Aria ”Come va l'ape di fiore in fiore” - All[egr]o"}

    \score {

        \new ChoirStaff
        \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Cor[no] [I]"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr1"
                    \XIIcrI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Cor[no] [II]"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr2"
                    \XIIcrII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oubuè [I]"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob1"
                    \XIIobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oubuè [II]"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob2"
                    \XIIobII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violini]"\vspace #-0.2"Unis[oni]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl"
                \XIIvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \XIIvla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 3/8\numericTimeSignature  r\longa  r\longa  r\longa r1 ^\markup\center-align "Roberto" do''8 fa''16}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "Rob"
                \XIIsoprano \XIIglobal
                \new Lyrics \lyricsto "ape" \XIItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \XIIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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

}