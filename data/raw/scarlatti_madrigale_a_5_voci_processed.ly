\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

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

dolce = _\markup\italic"doux"

fort = _\markup\italic"fort"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { solo }

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


mbreak = { }


IsopranoIn = \relative do'' {

    \autoBeamOff

    r4 re sib la
    r2 r4 la
    si! do fa,2

    %4
    fa r
    r r4 la~
    la sol8 fa\mbreak mi2~

    %7
    mi4 re r2
    r4 fa sol la
    r2 sib2~

    %10
    sib4 la8 sol fa2
    mi re
    R1*2\mbreak

    %14
    la'4 re fa mi8 do
    re4. do16[sib] la8.[sol16] fa4
    R1

    %17
    r2 r4 sol~
    sol fa2 mi4
    la2 r\mbreak

    %20
    r4 la2 fa8 re
    dod4 re mi fa8. sol16
    la4. si8 dod4 re~

    %23
    re dod re la~
    la la8 si\mbreak do si la4
    r8 si16[la] sold8 la r2

    %26
    R1
    r2 sol4 sol8 la
    si4. la16 sol fad4 re

    %29
    R1\mbreak
    si'4 si8 dod re2~
    re4 do!8 la do[si] do4~

    %32
    do si do sol
    sol la si8[do] re4\mbreak
    re sol,4. fa!8 mi4

    %35
    re2 sol8 sol re'4
    re2 r
    r4 mib,8 fa sol2

    %38
    fa r
    r4 sol8 la\mbreak sib8[do] re4
    la8 fad sol2 fad4

    %41
    sol2 r
    R1
    r2 r8 sol la si

    %44
    do2 la4 r\mbreak
    r8 la sib sib do4 re8[mi!]
    fa2 r4 mib

    %47
    lab,2. sol4~
    sol la! sib2
    la r\mbreak

    %50
    r r4 fad
    sol2. fad4~
    fad sold la2

    %53
    la2. mi'4
    fa!8 mi16[re] dod4 re8[do16 sib] la4
    r2 r4 r8 la\mbreak

    %56
    sib8. la32 [sol] fad4 sol r8 re'
    re4 re fad, sol
    la8[si!] do2 si8[la]

    %59
    si2 r\fermata
    r4 sol sib sol\mbreak
    r8 fa sib2 la4

    %62
    r r8 fa' mib4 do
    r r8 mib re2
    sib4. sol8 fa4 re'~

    %65
    re fa do2\mbreak
    r4 la re2
    re4. re8 dod4. re8

    %68
    mi4 re dod r
    r8 re re re fa fa mi4
    la, r\mbreak r8 re dod dod

    %71
    re8. re16 do!8 si la la si4
    do8. si16 la8 do fa,4 mi8 la\mbreak
    si! la4 sold8 la[mi] re4

    %74
    la' r r2
    r8 re re re fa fa mi4
    la, r r8 la sold sold\mbreak

    %77
    la8. sol!16 fa8 mi re re mi4
    fa8.[sol16] la4 re, r
    r8 la' la sib do4 do

    %80
    fa2\mbreak mi
    re1
    r8 re dod dod re sib la la

    %83
    sib4 la8 sol fa4 sol
    la4. sol8\mbreak fa[do] mi4
    la2 r

    %86
    r8 mi' mi mi fa2
    mi do8.[re16] mi4
    mi2 r8 do16[re] mi8 mi\mbreak

    %89
    do2 r
    r8 la la la sib sib la4
    re,8 sol fad fad sol sol re' re\mbreak

    %92
    re[do] sib4 la4. sol16[fa]
    mi8 mi' fa[mi16 re] mi2
    re1\fermata

}

ItestoI = \lyricmode {

    Cor mi -- o, deh non lan -- gui -- re, deh non lan -- gui -- re, con mi -- o, deh non lan -- gui - re,

    ché fai te -- co lan  -- guir - - - lan - - guir l'a -- ni -- ma mi -- a, l'a -- ni -- ma mi - - - - a.

    O -- di i cal -- di so -- spi - ri, o -- di i cal -- di so -- spi -- ri, o -- di i cal -- di so -- spi - - ri a te l'in -- vi - a

    la pie -- ta -- te e'l de -- si -- re, la pie -- ta -- de, la pie -- ta -- de_e'l de -- si - - re;

    s'io ti po -- tes -- si, s'io ti po -- tes -- si dar mo -- ren -- do a -- i -- ta,

    mor -- re - - - i per dar -- ti vi - ta, per dar -- ti vi -- ta, per dar -- ti vi - - - - ta.

    Ma vi -- vi,  ma vi -- vi,  ma vi -- vi,  ma vi -- vi, ohi -- mè! Ma vi -- vi, ma vi -- vi, ohi -- mè! - - Ohi -- mè!

    Chè_in -- giu -- sta -- men -- te mo -- re chi vi -- vo tien nell'  al -- trui pet -- to_il co -- re,

    nell'  al -- trui pet -- to il co - - - -  re, chè_in -- giu -- sta -- men -- te mo -- re chi vi -- vo tien nell'  al -- trui pet -- to_il co - - re,

    chè_in -- giu -- sta -- men -- te mo - re chi vi -- vo tien nell'  al -- trui pet -- to il co - - - - - re,

    chè_in -- giu -- sta -- men -- te mo - re chi vi -- vo tien chè_in -- giu -- sta -- men -- te

    mo -- re chi vi -- vo tien nell'  al -- trui pet -- to_il co - re, il co - re.

}

IsopranoIIn = \relative do'' {

    \autoBeamOff

    r2 r4 fa,
    sol la r la
    sold la re,2~

    %4
    re mi~
    mi r4 re'\mbreak
    sib2 la~

    %7
    la r
    r4 re, mi fa
    r la2 sol8 fa

    %10
    mi2. re4~
    re dod re2
    R1\mbreak

    %13
    r2 re
    la'2. do4~
    do sib8 fa la4 do~

    %16
    do la8 mi fa2~
    fa mi~\mbreak
    mi4 fa sol8[la] sib4

    %19
    la fa8 re dod4 re
    mi fa8. sol16 la4 la
    r la2 fa8 re\mbreak

    %22
    dod4 re mi fa8. sol16
    la2 la4 r
    do do8 re mi re do[fa]

    %25
    re4 mi\mbreak la, r
    R1
    sol4 sol8 la si4 sol

    %28
    fad sol la si8[dod]
    re2 mi~
    mi8[dod] re4 r2

    %31
    R1\mbreak
    r2 sol,4 do~
    do do si2

    %34
    si si4 dod
    re la8 si do!4 la
    r2 r4 fa'~\mbreak

    %37
    fa8 mib mib4 re2
    r4 sib8 do re2~
    re4 dod re2

    %40
    re4. re8 re2
    re r\mbreak
    r8 si do re mi2~

    %43
    mi4 fa mi2
    r r8 do re mi
    fa2~fa8[mib] re8 do16[sib]\mbreak

    %46
    do2 r4 do
    fa,2. mib4
    sol2. sol4~

    %49
    sol fad r2
    r4 si dod2~
    dod re~

    %52
    re4 re,8[mi]\mbreak fad4 mi8[re]
    mi2 r
    r4 r8 mi' fa mi16[re] dod4

    %55
    re8 [do!16 sib] la4 r2
    r8 sib la la\mbreak sol re r4
    r8 re' sib sib la4 sol~

    %58
    sol fad sol2~
    sol r\fermata
    sol4 sib sol r

    %61
    r r8 fa'\mbreak do2
    fa, r4 sol
    sol2 sol

    %64
    r4 sib2 fa4
    r2 r4 fa
    do' re r la~

    %67
    la sold\mbreak la4. si?8(
    dod4) la la r
    R1

    %70
    r8 la la la sib sib la4
    re,2 r8 la' sold sold\mbreak
    la8. sold16 fa8 mi re re mi4

    %73
    fa8 fa mi si' do4 si
    mi, fa4. sol8 la4\mbreak
    sib4. la16[sol] fa8[sol] la4~

    %76
    la sol8[fa] mi4. re8
    dod4 re2 dod4
    re2 r8 la' sold la\mbreak

    %79
    la8. la16 fa8 fa mi fa4 mi8
    fa[re] la'4 r2
    r r8 la la la

    %82
    sib sib la4\mbreak re,2
    r r8 re' dod dod
    re re do! si la la si4

    %85
    la2\mbreak r8 la la la
    sib sib la4 re,2
    R1

    %88
    r8 mi' do do16[re] mi4 r\mbreak
    r2 r8 re dod dod
    re8. do?16 sib8 la sol4 re8 re

    %91
    sib4 re sol8[re] la'4\mbreak
    sib8[do re mi] fa4. mi16[re]
    dod4 re2 dod4

    %94
    re1\fermata

}

ItestoII = \lyricmode {

    Cor mi -- o, deh non lan -- gui -- re, cor mi -- o, cor mi -- o, deh non lan -- gui - - re,

    ché fai te -- co lan  -- guir te -- co lan -- guir - - - - l'a -- ni -- ma mi -- a, l'a -- ni -- ma mi -- a,

    l'a -- ni -- ma mi -- a, l'a -- ni -- ma mi -- a.

    O -- di i cal -- di so -- spi - ri, o -- di i cal -- di so -- spi - - - - ri, a te l'in -- vi -- a

    la pie -- ta -- de_e'l de -- si -- re, la pie -- ta -- de, la pie -- ta - de e'l de -- si -- re;

    s'io ti po -- tes -- si dar, s'io ti po -- tes - si dar mo -- ren -- do a -- i -- ta,

    mor -- re - - - - i per dar -- ti vi - ta, per dar -- ti vi -- ta, per dar -- ti vi - - ta.

    Ma vi -- vi,  ma vi -- vi,  ma vi -- vi,  ohi -- mè! Ma vi -- vi, vi -- vi, ohi -- mè! Ohi -- mè!

    Chè_in -- giu -- sta -- men -- te mo -- re chi vi -- vo tien nell'  al -- trui pet -- to_il co -- re,

    nell'  al -- trui pet -- to_il co - - - - - - - - - - - - - re, chi vi -- vo tien nell'  al -- trui pet -- to il co -- re

    chè_in -- giu -- sta -- men -- te mo -- re chi vi -- vo tien nell'  al -- trui pet -- to_il co -- re,

    chè_in -- giu -- sta -- men -- te mo -- re chi vi -- vo tien, chi vi -- vo tien  nell'  al -- trui pet -- to,

    nell'  al -- trui pet -- to_il co - - - - - re.

}

IsopranoIIIn = \relative do'' {

    \autoBeamOff

    r2 r4 re,
    mi fa r2
    r4 mi'2 re8 do

    %4
    si2. la4~
    la sold la2\mbreak
    r r4 la

    %7
    fa2. mi4
    fa2 r
    R1*2

    %11
    r4 la re fa~
    fa mi8 do re2~
    re4 do8[la]\mbreak sib2

    %14
    la re,4 la'
    r2 do4 la8 fa
    sol4 la2 si!4~

    %17
    si8[do] re2 do8[si]\mbreak
    do4. si8 do4 r
    r la2 fa8 re

    %20
    dod4 re mi fa8 sol16[fa]
    mi4 fa8[sol] la2\mbreak
    r4 la2 fa8 re

    %23
    mi2 re
    R1
    r2 do'4 do8 re

    %26
    mi re do4 r8 re16[do] si8 do\mbreak
    r2 si4 si8 dod
    re4 si la sol~

    %29
    sol fad mi2
    fad fad4 fad8 sold
    la2~\mbreak la4 sol!8 mi

    %32
    fa?2 mi4. sol8
    sol4. fad8 sol2
    re r

    %35
    r do'~
    do8 sib sib4 la2\mbreak
    r r4 re8 mib

    %38
    fa2 fa,
    r re8 mi fad[sol]
    la4 sib8 sib la2

    %41
    sol\mbreak r8 re mi fad
    sol2. la4
    sol8 do4 si8 do2

    %44
    r8 do, re mi fa?4. sol8\mbreak
    la4 re, fa2~
    fa r4 sol

    %47
    si!2 do~
    do4 dod re2~
    re la

    %50
    si!2. la4\mbreak
    sol4. la8 si4 la
    re2. dod8[si]

    %53
    dod2 r
    r r4 r8 mi
    fa mi16[re] dod4 re8 do16[sib] la4\mbreak

    %56
    r2 r8 re sib sib
    la4 re, r8 re' sib sib
    la2 sol~

    %59
    sol r\fermata
    r sol4 sib\mbreak
    fa r r8 fa do'4~

    %62
    do si! do4. do8
    mib4 do r r8 sib
    re2. sib4

    %65
    fa2 r\mbreak
    la4 la4. sol8[fa mi]
    re4 r r8 mi' dod[si]

    %68
    la[sol] fa fa' mi4 r
    R1*3
    r8  la, la la\mbreak sib sib la4

    %73
    re, r r8 la' sold sold
    la8. sol!16 fa8 mi re  re mi4\mbreak
    fa sol la4. sol8

    %76
    fa4 mi8[re] do4 mi
    R1
    r8 re' re re fa fa mi4\mbreak

    %79
    la,4 r r2
    r8 fa fa sol la mi la4~
    la8[re,] sol2 fad4

    %82
    sol r r8 sol fad fad\mbreak
    sol sol fa! mi re4 mi
    fa4. sol8 la4 mi'~

    %85
    mi8 mi fa[dod] re[re,] fa4\mbreak
    mi la r8 la la la
    do do si4. la4 sold8

    %88
    la2 r8 la si mi\mbreak
    mi4. mi8 re4 r
    r8 fad, fad fad sol sol la4

    %91
    sib r r8 sol fad fad\mbreak
    sol la sib do re[do] sib4
    la1

    %94
    la\fermata
}

ItestoIII = \lyricmode {

    Cor mi -- o, deh non lan -- gui - - re, cor mi - o,

    ché fai te -- co lan  -- gui - - re, ché fai te -- co lan  -- gui - - - - - -  re

    l'a -- ni -- ma mi -- a, l'a -- ni -- ma mi - a,  l'a -- ni -- ma mi -- a.

    O -- di i cal -- di so -- spi - ri, o -- di i cal -- di so -- spi - - ri,  o -- di i cal -- di so -- spi -- ri a te l'in -- vi -- a

    la pie -- ta -- de, la pie -- ta -- de, la pie -- ta -- de e'l de -- si -- re;

    s'io ti po -- tes -- si dar, - - - s'io ti po -- tes - - si dar mo -- ren -- do a -- i -- ta,

    mor -- re - - - - - - i per dar -- ti vi - - ta, per dar -- ti vi -- ta, per dar -- ti vi -- ta.

    Ma vi -- vi,  ma vi -- vi,_ohi -- mè! Ma vi -- vi, ma vi -- vi,_ohi -- mè! Ohi -- mè! - -  Ma vi - vi, ohi -- mè!

    Chè_in -- giu -- sta -- men -- te mo -- re chi vi -- vo tien nell'  al -- trui pet -- to_il co -- re, il co - - - - re,

    chè_in -- giu -- sta -- men -- te mo -- re, chè_in -- giu -- sta -- men -- te mo - - re chi vi -- vo tien

    nell'  al -- trui pet -- to_il co - - re, il co - - - re, chè_in -- giu -- sta -- men -- te mo - - re chi vi -- vo, vi -- vo tien,

    chè_in -- giu -- sta -- men -- te mo -- re chi vi -- vo tien  nell'  al -- trui pet -- to_il co -- re.

}

IsopranoIVn = \relative do'' {

    \autoBeamOff

    R1
    r4 la fa mi
    r2 fa'~

    %4
    fa4 mi8 re do2
    si la
    R1\mbreak

    %7
    r4 re sib2
    la r4 re
    mi fa re2~

    %10
    re4 do8[sib] la[sol fa sol]
    la2 r4 re,
    la' do~\mbreak do si?8 sold

    %13
    la2. sol!4~
    sol8[fa16 mi] fa4 r2
    la4 re r2

    %16
    do la4 fa
    sol1\mbreak
    lab2 sol~

    %19
    sol8[fa16 mi] re4 r2
    r r4 la'~
    la fa8 re dod4 re

    %22
    mi fa8. sol16 la2~\mbreak
    la fa
    R1

    %25
    r2 la4 la8 si
    do si la[fa'] r8 fa16[mi] re8 mi
    R1

    %28
    si4 si8 dod\mbreak re4 si
    la si2 lad4
    si r re, re8 mi

    %31
    fa!2 mi4. do8
    re2 do4 mi\mbreak
    mi do re4. mi16[fad]

    %34
    sol2 r
    R1
    r2 la4. si8

    %37
    do2. sib4~
    sib8[la16 sol] fa8[sol] la2
    sol\mbreak r4 re8 mi

    %40
    fad[la] re,4 re'8 do16[sib] la4
    si!2 r
    R1*2

    %44
    r8 mi, fa sol la4. sib8\mbreak
    do4 fa, la sib~
    sib8[la16 sol] la4 r do,

    %47
    re8[mib fa sol] lab4 do
    r2 r4 re,
    la'8[sol] la4\mbreak r fad

    %50
    sol2 fad
    mi r4 la
    si2 fad4. sold8

    %53
    la4 mi dod'2
    re8 sib la4\mbreak re, r
    r2 re'4 re~

    %56
    re re8 re re4 re
    fad, sol la sib8.[do16]
    re2 re\parenthesize ~

    %59
    re r\fermata\mbreak
    r r4 sol,
    sib fa r r8 la

    %62
    re4. re8 sol,4 r
    r mib sib'sol
    r2 sib\mbreak

    %65
    re4 sib2 la4
    fa4. fa8 re4 r
    r re mi mi'8[re]

    %68
    dod4 re mi r
    R1*5\mbreak
    r8  la, la la sib sib la4

    %75
    re, re'2 dod8 dod
    re8. re16 do!8 si la la si4\mbreak
    la8 mi' la,8.[sol16] fa8[sol] la4~

    %78
    la re, r2
    r r8 do do do
    re4 re8 re'\mbreak dod4 dod

    %81
    re8 re re do?16[sib] la8 re, re'4
    re r r re
    re4. mi8 fa fa mi4\mbreak

    %84
    la,2 r8 do si si
    do8. si16 la8 la la la  re4~
    re dod re2\mbreak

    %87
    r8 sol, sol sol la la si4
    do2 r8 do si si
    do8. si16 la8 sol\mbreak la sib sol4

    %90
    fad re sib re
    sol la re,8[sib'] la4
    sol2 la4 r\mbreak

    %93
    la8 la4 sol16[fa] mi8[fad] sol4~
    sol fad8[mi] fad2\fermopz

}

ItestoIV = \lyricmode {

    Cor mi -- o, deh non lan -- gui - re, cor mi -- o, deh non lan -- gui - - re,

    ché fai te -- co lan  -- gui - re, ché fai te -- co lan  -- gui - -  re

    l'a -- ni -- ma mi -- a, l'a -- ni -- ma mi -- a.

    O -- di i cal -- di so -- spi - ri, o -- di i cal -- di so -- spi - ri,  o -- di i cal -- di so -- spi -- ri a te l'in -- vi - a

    la pie -- ta - - - de, la pie -- ta -- de e'l de -- si -- re;

    s'io ti po -- tes - - si dar, - -  mo -- ren - do a -- i -- ta,

    mor -- re - i, mor -- re - - - i per dar -- ti vi -- ta, per dar -- ti, per dar -- ti vi - - - - ta.

    Ma vi -- vi,  ma vi -- vi,_ohi -- mè! Ma vi -- vi, ma vi -- vi, ohi -- mè! Ohi -- mè! Ohi -- mè!  Vi -- vi, ohi -- mè!

    Chè_in -- giu -- sta -- men -- te mo -- re chi vi -- vo tien nell'  al -- trui pet -- to_il co -- re, il co - - re,

    chè_in -- giu -- sta -- men -- te chi vi -- vo tien

    nell'  al -- trui pet -- to_il co -- re, chè_in -- giu -- sta -- men -- te mo -- re chi vi -- vo tien,

    nell'  al -- trui pet -- to_il co - re, chè_in -- giu -- sta -- men -- te mo -- re chi vi -- vo tien,

    nell'  al -- trui pet -- to_il co -- re, nell'  al -- trui pet -- to_il co - - re, il co - - - - re.

}

Ialton = \relative do' {

    \autoBeamOff

    R1
    r4 fa re do
    R1*2

    %5
    mi2 fa
    re dod
    re sol,

    %8
    r2 r4 re'\mbreak
    dod re sol,2~
    sol la~

    %11
    la r
    r4 la re fa~
    fa mi8 do? re2~

    %14
    re r4 la\mbreak
    re2 fa
    mi4 do re2~

    %17
    re8[do] si4 do2~
    do4 do2 dod4
    re4. do?16[sib] la4 la'~\mbreak

    %20
    la fa8 re dod4 re
    la2. la4
    la2 la~

    %23
    la re
    R1
    r2 fa\mbreak

    %26
    mi8. mi16 fa8[la] re, fa sol do,
    mi4 mi8 fad sol4 mi
    re1

    %29
    re2 dod\mbreak
    si r
    R1

    %32
    r2 do4 do~
    do8[si] la4 sol2
    sol r

    %35
    r mi'4 fad
    sol re8 mi\mbreak fa!4 re
    R1

    %38
    re4. mib8 fa2
    mi! re
    re re

    %41
    sol, r
    r8 sol la si do2~\mbreak
    do4 re do2

    %44
    R1*2
    r4 fa do2~
    do do

    %48
    mib re~
    re4 re r2
    R1\mbreak

    %51
    r4 mi re4. dod8
    si2 la
    la r

    %54
    r r4 la'
    fa8[sol] la la sib la16[sol] fad4\mbreak
    sol re sib sol

    %57
    re'1~
    re2 sol,~
    sol r\fermata

    %60
    R1
    re'2 fa
    re do4 mib\mbreak

    %63
    do2 sol'4 sib
    sol2 re~
    re fa

    %66
    fa4 re sib r
    si!2 la~
    la4 re la' r\mbreak

    %69
    R1*2
    r8 re, re re fa fa mi4
    la,2 r8 re dod dod

    %73
    re8. re16 do!8 si\mbreak
    la la si4
    do re re do

    %75
    sib2 la
    R1
    r8 la' la la sib sib la4\mbreak

    %78
    re,8 la' fa8. sol16 la8 re, mi mi
    fa4 re sol8[la] sol4
    fa2 r8 la, la la\mbreak

    %81
    sib4. la16[sol] re'2
    sol,4 la sib8.[do16] re4
    sol,2 r

    %84
    r r8 la' sold sold
    la8. sol?16 fa8 mi\mbreak fa4 re
    sol, la r2

    %87
    r8 mi' mi mi fa fa mi4
    la,2 r8 la' sold sold\mbreak
    la8. sol!16 fa8 mi fa sol mi4

    %90
    re r r8 sol fad fad
    sol4 re sib re\mbreak
    sol,2 fa4 sol

    %93
    la1
    re\fermata

}

ItestoV = \lyricmode {

    Cor mi -- o, deh non lan -- gui - re, deh non lan -- gui -- re,

    ché fai te -- co lan  -- guir, ché fai te -- co lan  -- guir, - -  lan -- guir, - - -

    l'a -- ni -- ma mi -- a, l'a -- ni -- ma mi -- a.

    O -- di i cal -- di so -- spi -- ri, o -- di i cal -- di so -- spi - ri,  a te l'in -- vi -- a

    la pie -- ta -- de_e'l de -- si -- re, la pie -- ta -- de e'l de -- si -- re;

    s'io ti po -- tes -- si dar, mo -- ren -- do a -- i -- ta,

    mor -- re - - - i per dar -- ti, per dar -- ti vi -- ta, per dar -- ti vi -- ta.

    Ma vi -- vi,  ma vi -- vi, ma vi -- vi, ma vi -- vi, ohi -- mè! Ohi -- mè! Ohi -- mè!

    Chè_in -- giu -- sta -- men -- te mo -- re chi vi -- vo tien nell'  al -- trui pet -- to_il co -- re, il co - - re,

    chè_in -- giu -- sta -- men -- te mo -- re chi vi -- vo tien

    nell'  al -- trui pet -- to_il co - re, chè_in -- giu -- sta -- men -- te mo -- re, mo - - re chi vi -- vo tien,

    nell'  al -- trui pet -- to_il co -- re, chè_in -- giu -- sta -- men -- te mo -- re chi vi -- vo tien,

    nell'  al -- trui pet -- to_il co -- re, chi vi -- vo tien nell'  al -- trui pet -- to il co -- re.

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 40
    s1*94
    \bar "|."

}

IsopranoI = {
    \new Voice = "cor1"
    <<\IsopranoIn \forma>>
}

IsopranoII = {
    \new Voice = "cor2"
    <<\IsopranoIIn \forma>>
}

IsopranoIII = {
    \new Voice = "cor3"
    <<\IsopranoIIIn \forma>>
}

IsopranoIV = {
    \new Voice = "cor4"
    <<\IsopranoIVn \forma>>
}

Ialto = {
    \new Voice = "cor5"
    <<\Ialton \forma>>
}
#(set-global-staff-size 18)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

\paper {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    subtitle = \markup\larger \center-column{"Cor mio, deh non languire - Madrigale a cinque Voci a Tavolino,""quattro Soprani, et un Contralto"}
    composer = \markup {"A. Scarlatti (1660-1725)"}
}

\markup\huge "Largo sempre. Si deve cantare sempre adagio per sentire le consonanze"

\score {

    \new ChoirStaff  <<

        \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 r4 ^\markup\center-align "Canto Primo" re'' sib'}
            \clef violin
            \set Staff.midiInstrument = #"synth voice"
            \set Staff.shortInstrumentName = "sop1"
            \IsopranoI \global
            \new Lyrics \lyricsto "cor1" \ItestoI
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 r2 ^\markup\center-align "Canto secondo  " r4 fa'}
            \clef violin
            \set Staff.midiInstrument = #"synth voice"
            \set Staff.shortInstrumentName = "sop2"
            \IsopranoII \global
            \new Lyrics \lyricsto "cor2" \ItestoII
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 r2 ^\markup\center-align "Canto Terzo  " r4 re' }
            \clef violin
            \set Staff.midiInstrument = #"synth voice"
            \set Staff.shortInstrumentName = "sop3"
            \IsopranoIII \global
            \new Lyrics \lyricsto "cor3" \ItestoIII
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 r1 ^\markup\center-align "Canto Quarto  " r4 la'}
            \clef violin
            \set Staff.midiInstrument = #"synth voice"
            \set Staff.shortInstrumentName = "sop4"
            \IsopranoIV \global
            \new Lyrics \lyricsto "cor4" \ItestoIV
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key do\major \time 4/4 r1 ^\markup\center-align "Contralto  " r4 fa'}
            \clef "treble_8"
            \set Staff.midiInstrument = #"synth voice"
            \set Staff.shortInstrumentName = "alt"
            \Ialto \global
            \new Lyrics \lyricsto "cor5" \ItestoV
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width =2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/32)
            \override SpacingSpanner.uniform-stretching = ##t
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



