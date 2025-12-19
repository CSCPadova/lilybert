\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

unis = _\markup\italic "Unisoni"

arco = _\markup \italic "arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzic."

soli = ^\markup \italic { Soli}

dolce = _\markup \italic { dolce }

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

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-0
    \center-column {
	  \musicglyph "scripts.turn"
      \musicglyph "scripts.prall"}}
mbreak = { }


Isopranon = \relative do'' {

    \autoBeamOff

    R1*8
    r8 mi re4 dod r
    R1

    %11
    r8 mi re4 dod8 dod16 si dod8 si
    r8 dod16 si dod8 si dod si la16[(sold la si)]\mbreak
    sold4 r r r8 mi'

    %14
    re dod r dod si4 la8 mi'
    re dod re16[(dod re mi)] dod4 r
    r2 dod16[(si dod si] dod8) si

    %17
    r2 dod16[(si dod si] dod8) si\mbreak
    dod8 si16 si dod8 red mi si r4
    mi16[(red mi red] mi8) red r2

    %20
    mi8 red16 red mi8 dod red red r mi
    dod4 r8 mi dod si la4\mbreak
    sold mi'16[(re? mi re] dod8) dod16 dod re[(dod re dod]

    %23
    si8) si dod16[(si dod si] la8) si16 dod re8 dod
    si si r dod re4 r8 dod
    re dod si4 la r\mbreak

    %26
    r8 la la la la2
    la8 si si si si2~
    si si4 r

    %29
    dod16[(si dod si] dod8) si dod16[(si dod si] dod8) si
    dod8 dod16 re mi8 si\mbreak dod8 la la la
    la1

    %32
    la2 la4 r8 re
    dod4 r8 re dod dod r \parenthesize re
    dod4 r8 dod si2~

    %35
    si8 la16[(sold] la4) r2
    r4 r8 dod re4 re8 re\mbreak
    re2 dod

    %38
    R1
    r4 la do do8 do
    do?2 si4 r

    %41
    R1
    r4 mi mi re8 la
    do4 si r re

    %44
    re do8 si\mbreak do2
    si1
    R

    %47
    r8 mi re4 dod? r
    R1
    r8 mi re4 dod8 dod16 si dod8 si

    %50
    r8 dod16 si dod8 si dod si la16[(sold la si)]\mbreak
    sold4 r r r8 mi'

    %52
    re dod r dod si4 la8 mi'
    re dod re16[(dod re mi)] dod4 r
    r2 dod16[(si dod si] dod8) si

    %55
    r2 dod16[(si dod si] dod8) si\mbreak
    dod8 si16 si dod8 red mi si r4
    mi16[(red mi red] mi8) red r2

    %58
    mi8 red16 red mi8 dod red red r mi
    dod4 r8 mi dod si la4\mbreak
    sold mi'16[(re? mi re] dod8) dod16 dod re[(dod re dod]

    %61
    si8) si dod16[(si dod si] la8) si16 dod re8 dod
    si si r dod re4 r8 dod
    re dod si4 la r\mbreak

    %64
    r8 la la la la2
    la8 si si si si2~
    si si4 r

    %67
    dod16[(si dod si] dod8) si dod16[(si dod si] dod8) si
    dod8 dod16 re mi8 si\mbreak dod8 la la la
    la1

    %70
    la2 la4 r8 re
    dod4 r8 re dod dod r re
    dod4 r8 dod si2~

    %73
    si8 la16[(sold] la4) r2\fermopz

}

ItestoI = \lyricmode {

    Mor -- ta -- les, mor -- ta -- les non au -- ditis _ non au -- ditis _ non au -- di -- tis,

    mor -- ta -- les, mor -- ta -- les non non au -- di -- tis, ri -- det, ri -- det, ri -- det

    Au -- ro -- ra_in Cæ -- lo, ri -- det, ri -- det Au -- ro -- ra_in Cæ -- lo, et vos,

    et vos dor -- mi -- tis, ri -- det Au -- ro -- ra, ri -- det Au -- ro -- ra_in Cæ -- lo,

    et vos, et vos dor -- mi -- tis, et vos dor -- mi -- tis, et vos dor -- mi -- tis,

    ri -- det, ri -- det, ri -- det Au -- ro -- ra_in Cæ -- lo, et vos dor -- mi -- tis;

    et vos dor -- mi -- tis, et vos dor -- mi -- tis. Tam lon -- go so -- po -- re,

    tam lon -- go so -- po -- re, cur mem -- bra so -- pi -- tis,

    cur mem -- bra so -- pi -- tis.

    Mor -- ta -- les, mor -- ta -- les non au -- ditis _ non au -- ditis _ non au -- di -- tis,

    mor -- ta -- les, mor -- ta -- les non non au -- di -- tis, ri -- det, ri -- det, ri -- det

    Au -- ro -- ra_in Cæ -- lo, ri -- det, ri -- det Au -- ro -- ra_in Cæ -- lo, et vos,

    et vos dor -- mi -- tis, ri -- det Au -- ro -- ra, ri -- det Au -- ro -- ra_in Cæ -- lo,

    et vos, et vos dor -- mi -- tis, et vos dor -- mi -- tis, et vos dor -- mi -- tis,

    ri -- det, ri -- det, ri -- det Au -- ro -- ra_in Cæ -- lo, et vos dor -- mi -- tis;

    et vos dor -- mi -- tis, et vos dor -- mi -- tis.

}

Ialton = \relative do' {

    \autoBeamOff

    R1*7
    r2 r4 r8 mi
    la4. (sold8) la4 r

    %10
    r2 r4 r8 mi
    la4. (sold8) la la16 sold la8 sold\mbreak
    r8 la16 sold la8 sold la sold fad4

    %13
    mi r r8 mi16 mi fad8 mi
    r sold16 sold la8 sold r4 r8 mi
    sold la si4 la r

    %16
    r2\mbreak  la16 [(sold la sold] la8) sold
    r2 la16[(sold la sold] la8) sold
    la sold16 sold la8 fad sold sold r4

    %19
    sold16[(fad sold fad]  sold8) fad r2\mbreak
    sold8 fad16 fad sold8 lad si fad r sold
    la4 r8 sold la sold fad4

    %22
    mi r la16[(sold la sold] fad8) fad16 fad
    sold[(fad sold fad] mi8) la\mbreak fad8 sold16 la sold8 la
    sold sold r la fad4 r8 la

    %25
    fad mi re4 dod8 la' la la
    la2 la8 la la la
    la1~

    %28
    la2 sold8 mi mi mi
    mi1~
    mi2 mi

    %31
    fad16[(mi fad mi] fad8) mi fad16[(mi fad mi] fad8) mi
    fad fad16 sol? la8 mi fad fad r8 fad\mbreak
    mi4 r8 fad mi mi r fad

    %34
    mi4 r8 mi re2~
    re8 dod16[(si] dod4) r2  %%% fin qui
    R1

    %37
    r2 r4 mi
    sol sol8 sol sol2
    fad r

    %40
    r r4 re\mbreak
    fa4 fa fa4. fa8
    mi4 r r la

    %43
    la sol8 mi fa2
    mi4 si'2 la4~
    la sold8[(fad] sold2)

    %46
    r2 r4 r8 mi
    la4. (sold8) la4 r
    r2 r4 r8 mi

    %49
    la4. (sold8) la la16 sold la8 sold\mbreak
    r8 la16 sold la8 sold la sold fad4
    mi r r8 mi16 mi fad8 mi

    %52
    r sold16 sold la8 sold r4 r8 mi
    sold la si4 la r
    r2\mbreak  la16 [(sold la sold] la8) sold

    %55
    r2 la16[(sold la sold] la8) sold
    la sold16 sold la8 fad sold sold r4
    sold16[(fad sold fad]  sold8) fad r2\mbreak

    %58
    sold8 fad16 fad sold8 lad si fad r sold
    la4 r8 sold la sold fad4
    mi r la16[(sold la sold] fad8) fad16 fad

    %61
    sold[(fad sold fad] mi8) la\mbreak fad8 sold16 la sold8 la
    sold sold r la fad4 r8 la
    fad mi re4 dod8 la' la la

    %64
    la2 la8 la la la
    la1~
    la2 sold8 mi mi mi

    %67
    mi1~
    mi2 mi
    fad16[(mi fad mi] fad8) mi fad16[(mi fad mi] fad8) mi

    %70
    fad fad16 sol? la8 mi fad fad r8 fad\mbreak
    mi4 r8 fad mi mi r fad
    mi4 r8 mi re2~

    %73
    re8 dod16[(si] dod4) r2\fermopz

}

ItestoII = \lyricmode {

    Mor -- ta -- les, mor -- ta -- les non au -- ditis _ non au -- ditis _ non au -- di -- tis,

    non au -- ditis, _ non au -- ditis _ non non au -- di -- tis, ri -- det, ri -- det, ri -- det

    Au -- ro -- ra_in Cæ -- lo, ri -- det, ri -- det Au -- ro -- ra_in Cæ -- lo, et vos,

    et vos dor -- mi -- tis, ri -- det Au -- ro -- ra, ri -- det Au -- ro -- ra_in Cæ -- lo,

    et vos, et vos dor -- mi -- tis, et vos dor -- mi -- tis, et vos dor -- mi -- tis,

    et vos dor -- mi -- tis,

    ri -- det, ri -- det, ri -- det Au -- ro -- ra_in Cæ -- lo, et vos dor -- mi -- tis;

    et vos dor -- mi -- tis. Tam gra -- vi cor -- po -- re,

    tam gra -- vi cor -- po -- re, cur mem -- bra so -- pi -- tis,

    so -- pi -- tis.

    Mor -- ta -- les, mor -- ta -- les non au -- ditis _ non au -- ditis _ non au -- di -- tis,

    non au -- ditis, _ non au -- ditis _ non non au -- di -- tis, ri -- det, ri -- det, ri -- det

    Au -- ro -- ra_in Cæ -- lo, ri -- det, ri -- det Au -- ro -- ra_in Cæ -- lo, et vos,

    et vos dor -- mi -- tis, ri -- det Au -- ro -- ra, ri -- det Au -- ro -- ra_in Cæ -- lo,

    et vos, et vos dor -- mi -- tis, et vos dor -- mi -- tis, et vos dor -- mi -- tis,

    et vos dor -- mi -- tis,

    ri -- det, ri -- det, ri -- det Au -- ro -- ra_in Cæ -- lo, et vos dor -- mi -- tis;

    et vos dor -- mi -- tis.

}


IvlIn = \relative do'' {

    r4 r8 mi la4. sold8
    la mi la mi dod si r mi
    la4. sold8 la dod16 si dod8 si

    %4
    r dod,16 si dod8 si\mbreak dod si16 si la sold la si
    sold8 mi'16 mi fad8 mi r dod16 dod re8 dod
    r la'16 la si8 la sold la la8. sold16

    %7
    la8 la,16 la si8 la sold la la8. sold16\mbreak
    la8 mi' la mi dod si la sold
    r2 r8 dod'16 dod dod8 si

    %10
    dod si la16 sold la si sold4 r
    R1*2
    r4 r8 si la sold r4  %%% da qui

    %14
    r2\mbreak r8 la16 la si8 la
    r2 r8 mi16 mi fad8 mi
    sold la si4 la r

    %17
    dod16 si dod si dod8 si r2
    r sold16 fad sold fad sold8 fad
    r2\mbreak sold16 fad sold fad sold8 fad

    %20
    R1*4
    mi16 re mi re dod si dod si la si la si sol si dod si
    la8 la re,4 la' r

    %26
    fad16 mi fad mi fad8 mi\mbreak fad16 mi fad mi fad8 mi
    fad4 r la16 sold la sold la sold la sold
    la sold la sold la sold la fad mi4 r

    %29
    la16 sold la sold la8 sold\mbreak la16 sold la sold la8 sold
    la16 si dod si la8 sold la4 r
    re16 dod re dod re8 dod re16 dod re dod re8 dod

    %32
    re16 mi fad mi re8 dod re4 r8 fad,\mbreak
    la4 r8 la dod4 r8 la
    dod8 si la4 si2

    %35
    mi,4 r r2
    R1*10
    r8 mi' la mi dod si la sold

    %47
    r2 r8 dod'16 si dod8 si\mbreak
    dod si la16 sold la si sold4 r
    R1*2

    %51
    r4 r8 si la sold r4
    r2\mbreak r8 la16 la si8 la
    r2 r8 mi16 mi fad8 mi

    %54
    sold la si4 la r
    dod16 si dod si dod8 si r2
    r sold16 fad sold fad sold8 fad

    %57
    r2\mbreak sold16 fad sold fad sold8 fad
    R1*4
    mi16 re mi re dod si dod si la si la si sol si dod si

    %63
    la8 la re,4 la' r
    fad16 mi fad mi fad mi fad mi fad mi fad mi fad8 mi
    fad4 r la16 sold la sold la sold la sold

    %66
    la sold la sold la sold la fad mi4 r
    la16 sold la sold la8 sold\mbreak la16 sold la sold la8 sold
    la16 si dod si la8 sold la4 r

    %69
    re16 dod re dod re8 dod re16 dod re dod re8 dod
    re16 mi fad mi re8 dod re4 r8 fad,\mbreak
    la4 r8 la dod4 r8 la

    %72
    dod8 si la4 si2
    mi,4 r r2\fermata

}

IvlIIn = \relative do'' {

    r2 r8 mi re4
    dod r8 mi la mi dod si
    r mi re4 dod8 la'16 sold la8 sold

    %4
    r8 la,16 sold la8 sold\mbreak la8 sold16 la fad4
    mi r8 si'' la sold r sold
    fad mi r mi re16 mi dod re si8. si16

    %7
    la4 r8 mi re16 mi dod re si8. si16
    la4 r8 mi''\mbreak la mi dod si
    r2 r8 la'16 sold la8 sold

    %10
    la sold fad4 mi r
    R1*2
    r8 mi16 mi fad8 mi r2

    %14
    r r8 mi16 mi fad8 mi
    r2 r4 r8 mi\mbreak
    re dod re16 dod re mi dod4 r

    %17
    la'16 sold la sold la8 sold r2
    r mi16 red mi red mi8 red
    r2 mi16 red mi red mi8 red

    %20
    R1*4\mbreak
    r4 r8 mi, fad16 sol fad sol fad8 mi
    fad la si4 dod r

    %26
    re,16 dod re dod re8 dod re16 dod re dod re8 dod
    re4 r fad8 fad fad fad\mbreak
    fad fad fad fad sold4 r

    %29
    mi8 mi mi mi mi mi mi mi
    mi mi mi mi mi4 r
    la,8 la la la la la la la

    %32
    la la la la la4 r8 re\mbreak
    mi4 r8 re mi4 r8 re
    mi4 r8 dod re2

    %35
    la'4 r r2
    R1*10
    r4 r8 mi'\mbreak la mi dod si

    %47
    r2 r8 la'16 sold la8 sold
    la sold fad4 mi r
    R1*2

    %51
    r8 mi16 mi fad8 mi r2
    r r8 mi16 mi fad8 mi
    r2 r4 r8 mi\mbreak

    %54
    re dod re16 dod re mi dod4 r
    la'16 sold la sold la8 sold r2
    r mi16 red mi red mi8 red

    %57
    r2 mi16 red mi red mi8 red
    R1*4\mbreak
    r4 r8mi, fad16 sol fad sol fad8 mi

    %63
    fad la si4 dod r
    re,16 dod re dod re8 dod re16 dod re dod re8 dod
    re4 r fad8 fad fad fad\mbreak

    %66
    fad fad fad fad sold4 r
    mi8 mi mi mi mi mi mi mi
    mi mi mi mi mi4 r

    %69
    la,8 la la la la la la la
    la la la la la4 r8 re\mbreak
    mi4 r8 re mi4 r8 re

    %72
    mi4 r8 dod re2
    la'4 r r2\fermopz

}

Ibcn = \relative do {

    r8 mi la mi dod la si mi
    la,4 r r8 mi' la mi
    dod la si mi la,4 r8 mi'

    %4
    la,4 r8 mi' la, mi'4 red8
    mi sold la sold fad mi fad mi\mbreak
    re dod re dod si la mi' mi,

    %7
    la dod re dod si la mi' mi,
    la4 r r8 mi' la mi
    dod la si mi la,4 r8 mi'

    %10
    la, mi'4 red8 mi mi la mi\mbreak
    dod la si mi la,4 r8 mi'
    la,4 r8 mi' la, mi'4 red8

    %13
    mi8 mi la sold fad mi la sold
    fad mi fad mi re dod re dod
    si la4 sold8\mbreak la dod re dod

    %16
    si la4 sold8 la4 r8 mi'
    la,4 r8 mi' la,4 r8 mi'
    la, mi' la, si mi4 r8 si

    %19
    mi4 r8 si mi4 r8 si
    mi si mi fad\mbreak si,4 r8 mi
    la,4 r8 mi' la, mi'4 red8

    %22
    mi16 re? mi re dod8 si la4 re
    mi16 re mi re dod8 si re dod si la
    mi'4 r8 la, re4 r8 la\mbreak

    %25
    re la4 sold8 la4 r8 la
    re4 r8 la re4 r8 la
    re4 r8 red mi red mi red

    %28
    mi red mi red mi4 r8 mi
    la,4 r8 mi'\mbreak la,4 r8 mi'
    la,4 r8 mi' la,4 r8 la'

    %31
    re,4 r8 la' re,4 r8 la'
    re,4 r8 la' re,4 r8 re
    la'4 r8 re, la'4 r8 re,

    %34
    la'4 la,2 sold4
    la r r2\mbreak
    fad'8 sold la fad si la si la

    %37
    sold mi fad sold la si dod la
    si la sol? la si la si dod
    re re, fad re la' sol la sol

    %40
    fad re mi fad\mbreak sol la si sol
    re' do re do si sol la si
    do do, mi do fa mi fa fa,

    %43
    mi' re mi mi, la la' si la
    sold fad sold mi la la, do re\mbreak
    mi red mi red mi2

    %46
    la,4 r r8 mi' la mi
    dod la si mi la,4 r8 mi'
    la, mi'4 red8 mi mi la mi\mbreak

    %49
    dod la si mi la,4 r8 mi'
    la,4 r8 mi' la, mi'4 red8
    mi8 mi la sold fad mi la sold

    %52
    fad mi fad mi re dod re dod
    si la4 sold8\mbreak la dod re dod
    si la4 sold8 la4 r8 mi'

    %55
    la,4 r8 mi' la,4 r8 mi'
    la, mi' la, si mi4 r8 si
    mi4 r8 si mi4 r8 si

    %58
    mi si mi fad\mbreak si,4 r8 mi
    la,4 r8 mi' la, mi'4 red8
    mi16 re? mi re dod8 si la4 re

    %61
    mi16 re mi re dod8 si re dod si la
    mi'4 r8 la, re4 r8 la\mbreak
    re la4 sold8 la4 r8 la

    %64
    re4 r8 la re4 r8 la
    re4 r8 red mi red mi red
    mi red mi red mi4 r8 mi

    %67
    la,4 r8 mi'\mbreak la,4 r8 mi'
    la,4 r8 mi' la,4 r8 la'
    re,4 r8 la' re,4 r8 la'

    %70
    re,4 r8 la' re,4 r8 re
    la'4 r8 re, la'4 r8 re,
    la'4 la,2 sold4

    %73
    la r r2\fermopz

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>4 <7>8 <7 _+>
    s2 s8 <_+> s4
    <6> <7>8 <7 _+> s4 s8 <_+>
    s4 s8 <_+> s <4+ 2>4 <6 5->8
    <_+>8 <6> <6> <6> s <_+> s <_+>\mbreak
    s <6> <6> <6> <6+> s <5 4> <_+>
    s8 <6> s <6> <6+> s <5 4> <_+>
    s2 s8 <_+> s <_+>
    <6> s <7> <7_+> s4 s8 <_+>
    s <4+ 2>4 <6 5->8 <_+> s s <_+>\mbreak
    <6>4 <7>8 <7 _+> s4 s8 <_+>
    s4 s8 <_+> s <4 2 _+>4 <6 5->8
    <_+>4 <6>8 <6> <6+> <_+> <6> <6>
    <6> <_+> <6> <_+> <6> <6> <6> <6>
    <6+> <5> <4 2> <6 5->\mbreak s4 <6>8 <6>
    <6+> <5> <4 2> <6 5-> s4 s8 <_+>
    s4 s8 <_+> s4 s8 <_+>
    s <_+> s <_+> <_+>4 s8 <_+>
    <_+>4 s8 <_+> <_+>4 s8 <_+>
    <_+> <_+> <_+> <_+>\mbreak <_+>4 s8 <_+>
    s4 s8 <_+> s <5> <4 2> <6 5->
    <_+>4 s8 <6+> s2
    <_+>4 <6> s <6+>
    <_+>1\mbreak
    s8 <5> <4 2> <6 5-> s2
    s1
    s4 s8 <6 5-> s <6 5-> <_+> <6 5->
    <_+> <6 5-> <_+> <6 5-> <_+>4 s8 <_+>
    s4 s8 <_+>\mbreak s4 s8 <_+>
    s4 s8 <_+> s2
    s1*3
    s4 <5>4 <4 2> <6 5->
    s1\mbreak %%%  Fine allegro
    s4 <6> s2
    <6 5->4 <6> s <6>
    <6> s <6> <6>
    s <6> <_-> <_->
    <5-> <6!>\mbreak s <6>
    <_->8 <_!> <_-> <_!> <5-> s <6-> s
    s4 <6> <7> <6>
    <6! 4> <5 3> <_-> <5->
    <6 5-> s <9 _-> <6>\mbreak
    <5 4> <_+> <_+>2 %%% fine adagio

    s2 s8 <_+> s <_+>
    <6> s <7> <7_+> s4 s8 <_+>
    s <5 _+> <4 2> <6 5->8 <_+> s s <_+>\mbreak
    <6>4 <7>8 <7 _+> s4 s8 <_+>
    s4 s8 <_+> s <5 _+> <4 2> <6 5->8
    <_+>4 s  <6> s
    <6>8 <_+> <6> <_+> s s <6> <6>
    <6+> <5> <4 2> <6 5->\mbreak s4 <6>8 <6>
    <6+> <5> <4 2> <6 5-> s4 s8 <_+>
    s4 s8 <_+> s4 s8 <_+>
    s <_+> s <_+> <_+>4 s8 <_+>
    <_+>4 s8 <_+> <_+>4 s8 <_+>
    <_+> <_+> <_+> <_+>\mbreak <_+>4 s8 <_+>
    s4 s8 <_+> s <5 _+> <4 2> <6 5->
    <_+>4 s8 <6+> s2
    <_+>4 s s <6+>
    <_+>1\mbreak
    s8 <5> <4 2> <6 5-> s2
    s1
    s4 s8 <6> s <6 > s s
    s8 <6> s <6 > <_+> s s4
    s4 s8 <_+>\mbreak s4 s8 <_+>
    s4 s8 <_+> s2
    s1*3
    s4 <5>4 <4 2> <6 5->

}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 40
    s1*35\break
      \once \override Score.RehearsalMark.extra-offset = #'(-3 . -1)
    \mark\markup\huge "Adagio"
    \tempo 4 = 60
    s1*10\break
      \once \override Score.RehearsalMark.extra-offset = #'(-3 . -1)
    \mark\markup\huge "Allegro"
    \tempo 2 = 40
    s1*28
    \bar "||"

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

Isoprano = {
    \new Voice = "mortales1"
    <<\Isopranon \forma>>
}

Ialto = {
    \new Voice = "mortales2"
    <<\Ialton \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}




IIsopranon = \relative do'' {

    \autoBeamOff

    R1*2
    r4 re8 la fad16[( sol la si] la8.) sol16
    fad4 r r8 la re dod16[(si)]

    %5
    la[(si la si] sol4) fad r
    R1
    r4 re'8 la fad16[(sol la si] la8.) sol16\mbreak

    %8
    fad4 r r8 la re dod16[(si)]
    la[(si la si] sol4) fad re'8 mi
    la, la16 la re8 sold,16 la la2

    %11
    la4 re8 mi la, la re mi\mbreak
    la, la16 la re8 sol,16 sol sol8 fad16 fad si8 la16 sol
    re'8 mi16 fad re8. dod16(re4) re8 mi

    %14
    la, la16 la re8 sol,16 sol\mbreak sol8 fad16 fad si8 la16 sol
    re'8 mi16 fad re8. dod16 (re4) fad,8 sold
    la si16 dod re8 dod16 re mi8 la, r4

    %17
    r mi'8 fad\mbreak mi si16 dod re8 mi16 re
    dod8[(re16 dod] si[re dod si] dod[si)] la8 la si
    dod si16 dod re8 dod16 re mi8 la, r4

    %20
    r mi'8 fad mi si16 dod re8 mi16 re\mbreak
    dod8[(re16 dod] si[re dod si] dod8[si16 la] re8[dod16 si]
    dod[si dod si] la[dod si la] sold8) fad16 mi mi'8 re16[(dod]

    %23
    si) la16[(si dod)] la8. sold16[(la8)] la re[(dod16 si]\mbreak
    dod[si dod si] la[dod si la] sold8) fad16 mi mi'8 re16[(dod]
    si) la[(si dod)] la8. sold16(la4) r

    %26
    R1*2
    r4 re8 la fad16[( sol la si] la8.) sol16
    fad4 r r8 la re dod16[(si)]

    %30
    la[(si la si] sol4) fad r
    R1
    r4 re'8 la fad16[(sol la si] la8.) sol16\mbreak

    %33
    fad4 r r8 la re dod16[(si)]
    la[(si la si] sol4) fad re'8 mi
    la, la16 la re8 sold,16 la la2

    %36
    la4 re8 mi la, la re mi\mbreak
    la, la16 la re8 sol,16 sol sol8 fad16 fad si8 la16 sol
    re'8 mi16 fad re8. dod16(re4) re8 mi

    %39
    la, la16 la re8 sol,16 sol\mbreak sol8 fad16 fad si8 la16 sol
    re'8 mi16 fad re8. dod16 (re4) r4

}

IItestoI = \lyricmode {

    E -- ia sur -- gi -- te, non tan -- tæ mo -- ræ, e -- ia sur -- gi -- te,

    non tan -- tæ mo -- ræ non plus ul -- tra dor -- mi -- te,_o

    pu -- pil -- læ, non plus ul -- tra,  non plus ul -- tra

    dor -- mi -- te,_o pu -- pil -- læ, non non non dor -- mi -- te,_o pu -- pil -- læ,

    non plus ul -- tra dor -- mi -- te,_o pu -- pil -- læ, non non non

    dor -- mi -- te,_o pu -- pil -- læ,

    ec -- ce_al -- bentes _ in Cæ -- lo scin -- tillæ, _

    jam co -- ruscant _ sur -- gentis _ Au -- ro -- ræ,

    ec -- ce_al -- bentes _ in Cæ -- lo scin -- tillæ, _

    jam co -- ruscant _ sur -- gentis _ Au -- ro -- ræ,

    sur -- gen -- tis Au -- ro -- ræ, Au -- ro -- ræ, sur -- gen -- tis Au -- ro -- ræ.

    E -- ia sur -- gi -- te, non tan -- tæ mo -- ræ, e -- ia sur -- gi -- te,

    non tan -- tæ mo -- ræ non plus ul -- tra dor -- mi -- te,_o

    pu -- pil -- læ, non plus ul -- tra,  non plus ul -- tra

    dor -- mi -- te,_o pu -- pil -- læ, non non non dor -- mi -- te,_o pu -- pil -- læ,

    non plus ul -- tra dor -- mi -- te,_o pu -- pil -- læ, non non non

    dor -- mi -- te,_o pu -- pil -- læ.

}

IIbcn = \relative do {

    r16 re dod re si8 dod re16 la' sol la fad8 sol
    la16 re dod re si8 dod re16 fad, mi re sol8 la
    re,4 r r2

    %4
    r16 re dod re si8 dod re16 la' sol la fad8 sol
    la16 re dod re si8 dod re16 la sol la fad8 sol
    la16 re, dod re si8 dod re16 fad mi re sol8 la

    %7
    re,4 r r2
    r16 re dod re si8 dod re16 la' sol la fad8 sol
    la16 re dod re si8 dod re16 re, dod re si8 dod

    %10
    re16 re' dod re si8 mi r16 la, sol la fad8 sol
    la16 re, dod re si8 dod re16 la' sol la fad8 sol
    la16 re, dod re si8 mi\mbreak dod16 re dod re sol, sol' fad sol

    %13
    fad fad mi re sol8 la re,16 re' dod re si8 dod
    re16 re, dod re si8 mi dod16 re dod re sol, sol' fad sol
    fad fad mi re la'8 la, re4 r\mbreak

    %16
    r2 r16 la' sold la fad8 sold
    la16 mi re mi dod8 re mi16 la sold la fad8 sold
    la16 dod, si la re8 mi la,4 r

    %19
    r2 r16 la' sold la fad8 sold\mbreak
    la16 mi re mi dod8 re mi16 la sold la fad8 sold
    la16 dod, si la re8 mi la,16 la' sold la fad8 sold

    %22
    la16 mi re mi dod8 re mi16 mi' re mi dod8 re\mbreak
    mi16 dod si la re,8 mi la,16 la' sold la fad8 sold
    la16 mi re mi dod8 re mi16 mi re mi dod8 la

    %25
    sold sold'16 la re,8 mi la,4 r
    r16 re dod re si8 dod\mbreak re16 la' sol la fad8 sol
    la16 re dod re si8 dod re16 fad, mi re sol8 la

    %28
    re,4 r r2
    r16 re dod re si8 dod re16 la' sol la fad8 sol
    la16 re dod re si8 dod re16 la sol la fad8 sol

    %31
    la16 re, dod re si8 dod re16 fad mi re sol8 la
    re,4 r r2
    r16 re dod re si8 dod re16 la' sol la fad8 sol

    %34
    la16 re dod re si8 dod re16 re, dod re si8 dod
    re16 re' dod re si8 mi r16 la, sol la fad8 sol
    la16 re, dod re si8 dod re16 la' sol la fad8 sol

    %37
    la16 re, dod re si8 mi\mbreak dod16 re dod re sol, sol' fad sol
    fad fad mi re sol8 la re,16 re' dod re si8 dod
    re16 re, dod re si8 mi dod16 re dod re sol, sol' fad sol

    %40
    fad fad mi re la'8 la, re4 r

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6> s <6>
    s <6> s <6 5>
    s1
    s4 <6> s <6>\mbreak
    s4 <6> s <6>
    s <6> s <6 5>
    s1
    s4 <6> s <6>\mbreak
    s <6> s <6 >
    s <6+> s <6>
    s <6> s <6>
    s <6>\mbreak <5-> s
    <6> <6 5> s <6>
    s <6> <5-> s
    <6> <4>8 <3> s2\mbreak
    s s4 <6>
    s <6> <_+> <6>
    s <6 5>8 <_+> s2
    s s4 <6>\mbreak
    s16 <_+> s8 <6>4 <_+> <6>
    s <6 5>8 <_+> s4 <6>
    s16 <_+> s8 <6>4 <_+> <6>\mbreak
    s4 <6 5>8 <_+> s4 <6>
    s16 <_+> s8 <6>4 <_+> <6>
    <6> <6 5>8 <_+> s2
    s4 <6>\mbreak s <6>
    s <6> s <6 5>8 <3>
    s1
    s4 <6> s <6>
    s <6>\mbreak s <6>
    s <6> s <6 5>8 <3>
    s1
    s4 <6> s <6>
    s <6>\mbreak s <6>
    s <6+> s <6>
    s <6> s <6>
    s <6> <5-> s
    <6> <6 5>8 <3> s4 <6>
    s <6> <6 5-> s
    <6> <4>8 <3>

}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 45
    s1*40
    \bar "||"

}

IIsoprano = {
    \new Voice = "eia"
    <<\IIsopranon \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}




IIIvlIn = \relative do'' {

    r16 fad mi fad
    re8 mi fad16 la sol fad mi4 r16 fad mi fad
    re8 mi dod re si si mi,16 mi' re dod
    si la si dod la8. sold16 la dod si dod la la' sol la\mbreak
    fad fad mi fad re8 mi la,16 dod si dod re la' sol fad
    mi fad mi fad sol8 la16 sol fad la sol fad mi8. mi16
    fad4 r r16 la, sol la fad8 sol
    la1

}

IIIvlIIn = \relative do'' {

    r16 re dod re
    si8 dod re16 fad mi re dod4 r16 re dod re
    si8 dod la si sold fad16 sold la dod si la
    sold mi mi'8 fad si,\mbreak dod16 mi re mi dod re si dod
    la8 la' sol la fad16 mi sol mi la fad mi re
    dod la dod la re8 mi la, re re8. dod16
    re4 r\mbreak r16 fad, mi fad re8 mi
    fad1

}

IIIbcn = \relative do {

    r8 re
    sol mi re sol r16 la sol la fad8. fad16
    sol8 mi fad re mi16 mi' re mi dod8 re
    mi16 dod si la re,8 mi la,4 r
    r16 re' dod re si8 dod\mbreak re16 la sol la fad8 sol
    la16 re, dod re si8 dod re16 fad mi re sol8 la
    re,16 re' dod re si8 dod re4 r
    re,1

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s2 s4 <6>
    s s <_+> <6>
    <_+> <6 5>8 <_+> s2
    s4 <6> s <6>
    s <6> s <6 5>8 <3>
    s4 <6>

}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 45
    \partial 4 s4
    s1*7
    \bar "||"

}

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    <<\IIIvlIIn \forma>>

}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}




IValton = \relative do' {

    \autoBeamOff

    r4 re sol r8 sol
    si4 si8 sol16 la fad4 fad
    la8. [sol16] fad[sol mi sol] fad8 fad16 fad la8[(fad)]

    %4
    re8. re16 re4 r si'\mbreak
    sol8. sol16 sol8 si fad fad r fad
    la8. la16 la8 sol sol4 sol

    %7
    la8.[sol16] fad8[sol16 mi] red8. red16 red8 mi16 fad\mbreak
    si,8[dod16 red] mi[fad sold? la]\mbreak si8 mi, r mi
    mi re re mi dod4 dod

    %10
    r la'8 mi sol4 sol8 fad
    fad fad r fad re8. re16 re8 fad
    sol [fad] fad[sol16 fad] sol2

    %13
    fad4 re8[mi16 fad]\mbreak si,8[dod16 red] mi8[fad]
    sol[fad16 mi] si'8[la16 sol] fad8. mi16 re4
    dod2 si

}

IVtestoII = \lyricmode {

    Ut quid ut quid er -- go tor -- pendes _ o - - culi _ sic dor -- mitant, _

    en quo -- modo _ tor -- rentes _ & Ze -- phiri _ spi -- rantes,  _

    pla - - cide _ re -- so -- nan - - tes un -- dique _ vos in -- vitant, _ & cer -- tatim _

    su -- aves _ vos dul -- citer _ e som - - no ex - - - - - citant _ a -- ves.

}

IVbcn = \relative do {

    sol'1~
    sol2 la~
    la1

    %4
    sol~
    sol2 red~\mbreak
    red mi

    %7
    fad1
    sold~
    sold2 la~

    %10
    la~\mbreak la
    lad si
    si,4 lad si8 si' dod la

    %13
    re dod si la sol fad mi red
    mi4 r8 mi re lad si re16 mi
    fad2 si,

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <7>2 <6>
    s1
    s
    s2 <6>
    s1
    <5>2 <6+>
    <6>1
    s
    <7>2 <6>
    <6> s
    <6>4 <6> <6> <5->
    s2 s4 s8 <6>
    s2 s8 <6 5-> s4
    <5 4+>

}


forma = {

    \time 4/4
    \key re\major
    \tempo 4 = 55
    s1*15
    \bar "||"

}

IValto = {
    \new Voice = "quid"
    <<\IValton \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}




Valton = \relative do' {

    \autoBeamOff

    R4.*18
    mi16 [fad sol la si fad]
    sol [fad sol fad mi red]

    %21
    mi8 si r
    mi16 [fad sol la si fad]
    sol [fad sol fad mi red]

    %24
    mi8 si r\mbreak
    R4.
    si'8 fad sol

    %27
    red16 [(dod red8)] mi
    si' fad sol
    red16 [(dod red8)] mi

    %30
    r fad sol
    la sold16 [(la si8)]
    mi, red16 [(dod red8)]\mbreak

    %33
    mi si r
    R4.*3
    r8 si' fad

    %38
    R4.
    r8 si fad
    R4.

    %41
    si8 fad sol
    red16 [(dod red8)] mi
    r fad sol

    %44
    la sol16 [(la si8)]
    mi, red16 [(dod red8)]\mbreak
    mi red16[(dod red8)]

    %47
    mi fad16[(mi fad8)]
    sol8. la16 si8
    mi, red16[mi fad mi]

    %50
    mi8.[fad16 mi fad]
    sol8 mi re16[(do)]
    si4.~

    %53
    si~
    si~
    si

    %56
    si
    mi8 fad16[(mi fad8)]
    sol8. la16 si8

    %59
    mi, red16[mi fad mi]
    mi4.
    mi8 red16[mi fad mi]

    %62
    mi4.
    R4.*9
    si'8 sol r

    %73
    fad re r\mbreak
    la' fad r16 fad
    mi8 dod r

    %76
    fad16 mi fad mi fad mi
    fad[mi fad sol fad sol]
    la4.~

    %79
    la4 la8
    fad16 mi fad mi fad mi \mbreak
    fad16[mi fad sol la fad]

    %82
    mi4.~
    mi4 mi8
    r la16[(sold)] la[(sold)]

    %85
    fad8 si16[(la)] si[(la)]
    sold[(fad)] mid4
    fad8. [mi16 fad mid]\mbreak

    %88
    fad[mid fad sold la sold]
    fad4.~
    fad8 si16[(lad)] si[(lad)]

    %91
    si[(la?)] sol[(fad)] sol[(fad)]
    mi[(re)] dod4
    si r8

    %94
    si' sol r
    fad re r\mbreak
    la' fad r16 fad

    %97
    mi8 dod r
    fad16 mi fad mi fad mi
    fad mi si'[(lad)] si[(lad)]

    %100
    si[(la?)] sol[(fad)] sol[(fad)]
    mi[(re)] dod4
    si8 re mi

    %103
    fad4.~
    fad~
    fad

    %106
    fad
    r8 fad si
    sol16[(fad)] sol[(fad)] mi[(fad)]

    %109
    re[(mi)] dod4
    si4.
    R4.*18

    %129
    mi16 [fad sol la si fad]
    sol [fad sol fad mi red]
    mi8 si r

    %132
    mi16 [fad sol la si fad]
    sol [fad sol fad mi red]
    mi8 si r\mbreak

    %135
    R4.
    si'8 fad sol
    red16 [(dod red8)] mi

    %138
    si' fad sol
    red16 [(dod red8)] mi
    r fad sol

    %141
    la sold16 [(la si8)]
    mi, red16 [(dod red8)]\mbreak
    mi si r

    %144
    R4.*3
    r8 si' fad
    R4.

    %149
    r8 si fad
    R4.
    si8 fad sol

    %152
    red16 [(dod red8)] mi
    r fad sol
    la sol16 [(la si8)]

    %155
    mi, red16 [(dod red8)]\mbreak
    mi red16[(dod red8)]
    mi fad16[(mi fad8)]

    %158
    sol8. la16 si8
    mi, red16[mi fad mi]
    mi8.[fad16 mi fad]

    %161
    sol8 mi re16[(do)]
    si4.~
    si~

    %164
    si~
    si
    si

    %167
    mi8 fad16[(mi fad8)]
    sol8. la16 si8
    mi, red16[mi fad mi]

    %170
    mi4.
    mi8 red16[mi fad mi]
    mi4.

    %173
    R4.*9

}

VtestoII = \lyricmode {

    Au - - ræ, ven - - ti blan -- di & len -- ti, blan -- di & len -- ti,

    e -- cho  læ -- ta, su -- sur -- rantes  _ au -- ræ, ven -- ti

    blan -- di & len -- ti, e -- cho  læ -- ta, su -- sur -- rantes, _

    or -- tam lu -- cem jam a -- do -- rant,  - jam a -- do -- rant,

    or -- tam lu -- cem jam a -- do -- rant, a -- do -- rant.

    Col -- les, mon -- tes, a -- quæ & fon -- tes, in -- ter fron -- des

    mur -- mu -- ran - tes, in -- ter fron -- des mur -- mu -- ran - tes,

    so -- lis du -- cem sic e -- xo -- rant, - -

    so -- lis du -- cem sic e -- xo -- rant,

    col -- les, mon -- tes, a -- quæ & fon -- tes, in -- ter fron -- des

    mur -- mu -- rantes, _   so -- lis du -- cem sic e -- xo -- rant, sic e -- xo -- rant,

    so -- lis du -- cem sic e -- xo -- rant.

    Au - - ræ, ven - - ti blan -- di & len -- ti, blan -- di & len -- ti,

    e -- cho  læ -- ta, su -- sur -- rantes  _ au -- ræ, ven -- ti

    blan -- di & len -- ti, e -- cho  læ -- ta, su -- sur -- rantes, _

    or -- tam lu -- cem jam a -- do -- rant,  - jam a -- do -- rant,

    or -- tam lu -- cem jam a -- do -- rant, a -- do -- rant.

}


VvlIn = \relative do'' {

    mi,16 fad sol la si fad
    sol fad sol fad mi red
    mi8 si si

    %4
    si si si
    sol' mi red
    mi16 red mi red mi fad

    %7
    si,8 sol' fad
    sol16 fad sol fad sol la\mbreak
    fad8 sol fad

    %10
    sol16 fad sol fad sol la
    fad sol la sol fad sol
    la sol fad sol la sol

    %13
    fad8 sol fad16 sol
    mi8 r r
    fad16 sol la sol fad sol

    %16
    la sol fad sol la sol\mbreak
    fad8 sol fad16 sol
    mi8 r r

    %19
    R4.*5
    r8 sol fad
    sol16 fad sol fad sol la

    %26
    fad8 r r
    R4.*6
    r8 sol fad

    %34
    sol16 fad sol fad sol la
    fad8 sol fad\mbreak
    sol16 fad sol fad sol la

    %37
    fad8 r r
    sol16 fad sol fad sol la
    fad8 r r

    %40
    sol16 fad sol fad sol la
    fad8 r r
    R4.*10

    %52
    r8 sol fad\mbreak
    sol16 fad sol fad sol la
    fad8 sol fad

    %55
    sol16 fad sol fad sol la
    fad sol la fad sol la
    si8 red, si'

    %58
    si8. la16 sol8
    do, si4
    si8 mi8. si'16

    %61
    la8 fad16 sol la8\mbreak
    sol16 la si la si do
    si8 r r

    %64
    red,16 mi fad mi red mi
    fad mi red mi fad mi
    red8 mi red

    %67
    mi sol fad16 sol
    mi fad sol la si do\mbreak
    si la sol la si do

    %70
    si la sol la si do
    si4.
    sol16 la si dod? re mi

    %73
    fad sol la fad, la sol
    fad sol la si dod re
    mi8 mi, fad16 sol

    %76
    fad sol la8 la\mbreak
    la la r
    re,16 dod re dod re dod

    %79
    re dod re mi re mi
    re dod re dod re dod
    re dod re mi fad mi

    %82
    dod si dod si dod si
    dod si dod re dod re\mbreak
    mi8 dod'16 si dod si

    %85
    la8 fad8. la16
    si la sold fad sold la
    fad8 r r

    %88
    R4.
    r8 re'16 dod re dod
    re dod re dod re dod

    %91
    si4 si8
    mi,16 fad fad mi fad mi\mbreak
    re mi fad sol la si

    %94
    sol la si dod re mi
    fad sol la fad, la sol
    fad sol la si dod re

    %97
    mi re dod si la si
    dod red mi red mi red
    mi sol, fad mi fad mi\mbreak

    %100
    re dod si8 mi16 fad
    sol8 fad8. fad16
    fad8 r r

    %103
    r re dod
    re16 dod re dod re mi
    dod8 re dod

    %106
    re16 dod re dod re mi
    dod8 lad'16 sold fad si\mbreak
    mi,8 si' lad

    %109
    si si8. lad16
    si4.
    mi,16 fad sol la si fad %111  Da qui si ripete

    %112
    sol fad sol fad mi red
    mi8 si si
    si si si

    %115
    sol' mi red
    mi16 red mi red mi fad\mbreak
    si,8 sol' fad

    %118
    sol16 fad sol fad sol la
    fad8 sol fad
    sol16 fad sol fad sol la

    %121
    fad sol la sol fad sol
    la sol fad sol la sol
    fad8 sol fad16 sol

    %124
    mi8 r r
    fad16 sol la sol fad sol\mbreak
    la sol fad sol la sol

    %127
    fad8 sol fad16 sol
    mi8 r r
    R4.*5

    %134 OOKK
    r8 sol fad
    sol16 fad sol fad sol la
    fad8 r r

    %137
    R4.*6
    r8 sol fad
    sol16 fad sol fad sol la

    %145
    fad8 sol fad\mbreak
    sol16 fad sol fad sol la
    fad8 r r

    %148
    sol16 fad sol fad sol la
    fad8 r r
    sol16 fad sol fad sol la

    %151
    fad8 r r
    R4.*10
    r8 sol fad\mbreak

    %163
    sol16 fad sol fad sol la
    fad8 sol fad
    sol16 fad sol fad sol la

    %166
    fad sol la fad sol la
    si8 red, si'
    si8. la16 sol8

    %169
    do, si4
    si8 mi8. si'16
    la8 fad16 sol la8\mbreak

    %172
    sol16 la si la si do
    si8 r r
    red,16 mi fad mi red mi

    %175
    fad mi red mi fad mi
    red8 mi red
    mi sol fad16 sol

    %178
    mi fad sol la si do\mbreak
    si la sol la si do
    si la sol la si do

    %181
    si4.

}

VvlIIn = \relative do'' {

    R4.*2
    mi,16 fad sol la si fad
    sol fad sol fad mi red

    %5
    mi8 si si
    si si si
    sol' mi red

    %8
    mi16 red mi red mi fad
    red8 mi red\mbreak
    mi16 red mi red mi fad

    %11
    red mi fad mi red mi
    fad mi red mi fad mi
    red8 mi red

    %14
    mi r r
    red16 mi fad mi red mi\mbreak
    fad mi red mi fad mi

    %17
    red8 mi red
    mi r r
    R4.*5

    %24
    r8 mi red
    mi16 red mi red mi fad
    red8 r r

    %27
    R4.*6\mbreak
    r8 mi red
    mi16 red mi red mi fad

    %35
    red8 mi red
    mi16 red mi red mi fad
    red8 r r

    %38
    mi16 red mi red mi fad
    red8 r r\mbreak
    mi16 red mi red mi fad

    %41
    red8 r r
    R4.*10
    r8 mi red

    %53
    mi16 red mi red mi fad
    red8 mi red
    mi16 red mi red mi fad\mbreak

    %56
    red mi fad red mi fad
    sol8 la fad
    mi16 fad sol fad mi8

    %59
    la fad16 sol la8
    sol16 fad mi re do si
    do8 si4

    %62
    si8 sol'16 fad sol la
    sol8 r r\mbreak
    fad16 sol la sol fad sol

    %65
    la sol fad sol la sol
    fad8 sol fad16 sol
    mi8 mi red

    %68
    mi8. fad16 sol la
    sol fad mi fad sol la
    sol fad mi fad sol la

    %71
    sol4.\mbreak
    R
    la'16 sol fad mi re dod

    %74
    re8 la la
    la8. dod,16 re mi
    la,8 re16 dod re dod

    %77
    re dod re mi re mi
    fad mi fad mi fad mi
    fad mi fad sol fad sol\mbreak

    %80
    la8 la la
    r la la
    la16 sold la sold la sold

    %83
    la sold la si la si
    dod8 mi, r
    R4.*4

    %89
    r8 si'16 lad si lad
    si8 fad fad\mbreak
    re mi16 fad si, fad'

    %92
    lad si si8. lad16
    si dod re mi fad re
    si8 r r

    %95
    la'16 sol fad mi re dod
    re8 la8. la16
    la8. sol16 mi fad

    %98
    sol si si8 si\mbreak
    si8. dod16 si dod
    fad,8 mi si'

    %101
    si si8. lad16
    si8 r r
    r si, lad

    %104
    si16 lad si lad si dod
    lad8 si lad
    si16 lad si lad si dod\mbreak

    %107
    lad8 dod re
    si mi8. mi16
    fad8 fad8. fad16

    %110
    fad4.
    R4.*2
    mi16 fad sol la si fad

    %114
    sol fad sol fad mi red
    mi8 si si
    si si si

    %117
    sol' mi red
    mi16 red mi red mi fad
    red8 mi red\mbreak

    %120
    mi16 red mi red mi fad
    red mi fad mi red mi
    fad mi red mi fad mi

    %123
    red8 mi red
    mi r r
    red16 mi fad mi red mi\mbreak

    %126
    fad mi red mi fad mi
    red8 mi red
    mi r r

    %129
    R4.*5
    r8 mi red
    mi16 red mi red mi fad

    %136
    red8 r r
    R4.*6\mbreak
    r8 mi red

    %144
    mi16 red mi red mi fad
    red8 mi red
    mi16 red mi red mi fad

    %147
    red8 r r
    mi16 red mi red mi fad
    red8 r r\mbreak

    %150
    mi16 red mi red mi fad
    red8 r r
    R4.*10

    %162
    r8 mi red
    mi16 red mi red mi fad
    red8 mi red

    %165
    mi16 red mi red mi fad\mbreak
    red mi fad red mi fad
    sol8 la fad

    %168
    mi16 fad sol fad mi8
    la fad16 sol la8
    sol16 fad mi re do si

    %171
    do8 si4
    si8 sol'16 fad sol la
    sol8 r r\mbreak

    %174
    fad16 sol la sol fad sol
    la sol fad sol la sol
    fad8 sol fad16 sol

    %177
    mi8 mi red
    mi8. fad16 sol la
    sol fad mi fad sol la

    %180
    sol fad mi fad sol la
    sol4.

}

Vbcn = \relative do {

    R4.*4
    mi16 fad sol la si fad
    sol fad sol fad mi red

    %7
    mi4 si8
    si si si
    si mi si

    %10
    si si si
    si la si
    la si la

    %13
    si16 si' sol la si8\mbreak
    mi,8 r r
    si la si

    %16
    la si la
    si16 la sol la si8
    mi r r

    %19
    mi4 red8  %% Aurae
    mi4 fad8
    sol16 fad sol fad mi red

    %22
    mi4 red8
    mi4 fad8\mbreak
    sol8. la16 si8

    %25
    mi, mi, r
    si' r r
    si' fad sol

    %28
    red16 dod red8 mi
    si' fad sol
    red16 dod red8 mi

    %31
    fad4 sol8
    la si si,
    mi16 fad sol la si8\mbreak

    %34
    si, si si
    si r r
    si si si

    %37
    si r r
    si si si
    si r r

    %40
    si si si
    si r r
    si' fad sol

    %43
    red16 dod red8 mi
    fad mi16 fad sol8\mbreak
    la si16 la si la

    %46
    sol la si la si la
    sol8 fad red
    mi16 red mi fad sol8

    %49
    la si si,
    mi r r
    R4.

    %52
    r8 mi si
    mi mi mi,
    si' mi si\mbreak

    %55
    mi mi mi,
    si'' la si16 la
    sol8 fad red

    %58
    mi16 red mi fad sol8
    la si si,
    mi16 re do si la sol

    %61
    la8 si si'
    mi, mi, mi'
    mi r r

    %64
    si la si\mbreak
    la si la
    si16 si' sol la si8

    %67
    mi, mi, si'
    mi mi, r
    mi' mi, r

    %70
    mi' mi, r
    mi'4.
    mi16 fad sol la si dod

    %73
    re8 r16 re, fad mi\mbreak
    re mi fad sol la si
    dod si la sol fad mi

    %76
    re4 la8
    re re, r
    re'' re, la'

    %79
    re, re, r
    re'4 la8
    re re, r

    %82
    la'' la, mi'
    la la, r
    la' la, r\mbreak

    %85
    re16 dod re dod re dod
    si8 dod dod,
    fad'16 sold la sold la sold

    %88
    fad8. mid16 fad sold
    la8 si fad
    si, re fad

    %91
    sol16 fad mi re mi re
    dod si fad'8 fad,\mbreak
    si' si, r

    %94
    mi16 fad sol la si dod
    re8 r16 re, fad mi
    re mi fad sol la si

    %97
    dod si la si dod red
    mi8 mi, si'
    mi, re16 dod re dod

    %100
    re8 mi mi,
    mi' fad fad,\mbreak
    si r r

    %103
    r si fad
    si si' si,
    fad' r r

    %106
    fad fad fad
    fad16 sol fad mi re8
    mi8. re16 dod8

    %109
    si fad' fad,
    si4.
    R4.*4  %%% da qui si ripete

    %115
    mi16 fad sol la si fad
    sol fad sol fad mi red
    mi4 si8

    %118
    si si si
    si mi si
    si si si

    %121
    si la si
    la si la
    si16 si' sol la si8\mbreak

    %124
    mi,8 r r
    si la si
    la si la

    %127
    si16 la sol la si8
    mi r r
    mi4 red8  %% Aurae

    %130
    mi4 fad8
    sol16 fad sol fad mi red
    mi4 red8

    %133
    mi4 fad8\mbreak
    sol8. la16 si8
    mi, mi, r

    %136
    si' r r
    si' fad sol
    red16 dod red8 mi

    %139
    si' fad sol
    red16 dod red8 mi
    fad4 sol8

    %142
    la si si,
    mi16 fad sol la si8\mbreak
    si, si si

    %145
    si r r
    si si si
    si r r

    %148
    si si si
    si r r
    si si si

    %151
    si r r
    si' fad sol
    red16 dod red8 mi

    %154
    fad mi16 fad sol8\mbreak
    la si16 la si la
    sol la si la si la

    %157
    sol8 fad red
    mi16 red mi fad sol8
    la si si,

    %160
    mi r r
    R4.
    r8 mi si

    %163
    mi mi mi,
    si' mi si\mbreak
    mi mi mi,

    %166
    si'' la si16 la
    sol8 fad red
    mi16 red mi fad sol8

    %169
    la si si,
    mi16 re do si la sol
    la8 si si'

    %172
    mi, mi, mi'
    mi r r
    si la si\mbreak

    %175
    la si la
    si16 si' sol la si8
    mi, mi, si'

    %178
    mi mi, r
    mi' mi, r
    mi' mi, r

    %181
    mi'4.

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*4
    s8 <6> <_+>
    <6> <6> s
    s4 <_+>8
    <6 4> s s
    <_+> s <_+>
    <6 4> s s
    <_+> <6 4+> <_+>
    <6 4+> <_+> <6 4+>
    <_+> <6> <_+>\mbreak
    s4.
    <_+>8 <6 4+> <_+>
    <6 4+> <_+> <6 4+>
    <_+> <6> <_+>
    <_+> s s
    s s <6>  %%% DA QUA
    s s <6+>
    <6> <6> s
    s s <6>
    s s <6+>\mbreak
    <6>4 <_+>8
    s4.
    <_+>
    <_+>8 <6+> <6>
    <6> <6> s
    <_+> <6+> <6>
    <6> <6> s
    s s <6>
    <6 5> <_+> s
    s s <_+>\mbreak
    <6>4.
    <_+>
    <6 4>
    <_+>
    <6 4>
    <_+>
    <6 4>
    <_+>
    <_+>8 <6+> <6>
    <6> <6> s
    <6+> s <6>\mbreak
    s <_+> s
    <6> <_+> <_+>
    <6> <6+> <6 5->
    s s <6>
    <6 5> <5 4> <_+>
    s4.*2
    s8 s <_+>
    s4.
    <_+>8 s <_+>\mbreak
    s4.
    <_+>8 s <_+>
    <6> <6 +> <6 5->
    s s <6>
    <_-> <5 4> <_+>
    s8 s <_->
    <_-> <_+> s
    s4.
    s
    <_+>8 <6 4+> <_+>\mbreak
    <6> <_+> <6>
    <_+> <6> <_+>
    s s <_+>   %%% FIN QUI
    s4.*5
    s8 s <6>\mbreak
    s4.
    <6>
    s4.*6
    s8 s <_+>
    s4.*3
    <6+ 5>8 <5 4> <_+>
    s <6> <6>
    s4.
    <6>8 s <_+>
    <6> s <_+>
    s4.
    <6+>8 <5 4> <_+>\mbreak
    s4.
    s8 <6> s
    s s <6>
    s <6> s
    <6>4.
    <6>8 s <_+>
    s <6> s
    <6> s s
    s <5 4> <_+>\mbreak
    s4.
    s8 s <_+>
    s4.
    <_+>
    <6 4>
    <_+>4 <6>8
    s s <6+>
    s <5 4> <_+>
    s4.*5
    s8 <6> <_+>\mbreak
    <6>4.
    s4 <_+>8
    <6 4>4.
    <_+>8 s <_+>
    <6 4> s s
    <_+> <6> <_+>
    <6 4+> <_+> <6 4+>
    <_+> <6> <_+>
    s4.
    <_+>8 <6 4+> <_+>
    <6> <_+> <6>\mbreak
    <_+> <6> <_+>
    s4.
    s8 s <6>  %%% DA QUA
    s s <6+>
    <6> <6> s
    s s <6>
    s s <6+>\mbreak
    <6>4 <_+>8
    s4.
    <_+>
    <_+>8 <6+> <6>
    <6> <6> s
    <_+> <6+> <6>
    <6> <6> s
    s s <6>
    <6 5> <_+> s
    s s <_+>\mbreak
    <6 4>4.
    <_+>
    <6 4>
    <_+>
    <6 4>
    <_+>
    <6 4>
    <_+>
    <_+>8 <6+> <6>
    <6> <6> s
    <6+> s <6>\mbreak
    s <_+> s
    <6> <_+> <_+>
    <6> <6+> <6 5->
    s s <6>
    <6 5> <5 4> <_+>
    s4.*2
    s8 s <_+>
    s4.
    <_+>8 s <_+>\mbreak
    s4.
    <_+>8 s <_+>
    <6> <6 +> <6 5->
    s s <6>
    <_-> <5 4> <_+>
    s8 s <_->
    <_-> <_+> s
    s4.
    s
    <_+>8 <6 4+> <_+>\mbreak
    <6> <_+> <6>
    <_+> <6> <_+>
    s s <_+>

}


forma = {

    \time 3/8
    \key re\major
    \tempo 4 = 55
    s4.*181
    \bar "||"

}

VvlI = {
    <<\VvlIn \forma>>

}

VvlII = {
    <<\VvlIIn \forma>>

}

Valto = {
    \new Voice = "venti"
    <<\Valton \forma>>
}

Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
}




VIsopranon = \relative do'' {

    \autoBeamOff
    re4 mi8 dod la4 la8 si
    si4 si r mi,~
    (mi16[fad sold la] si[dod re si] mi8) mi16 si dod8 re
    dod4 dod r8 mi dod16[( re si dod]\mbreak
    la[dod si re] dod[mi re fad] mi8) mi r mi
    fad dod16 re mi[(re mi fad] re4) re
    si8 si16 fad sol8 la sol16[(fad sol fad] mi[si' dod si]\mbreak
    lad[sold lad sold] fad[dod' re dod] si[dod re mi] fad[si, dod re]
    dod2) si

}

VItestoI = \lyricmode {

    O quam for -- mo -- sa Au -- ro -- ra or -- bem il -- lumi - navit, _

    quam læ -- ta & lu -- cida _ ho -- ra diem _ ex -- i -- la -- ra -- vit.

}

VIbcn = \relative do {

    la1
    sold~
    sold
    la~
    la
    lad2 si~
    si mi
    fad sol4 re
    mi fad si,2

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6>
    s1*3
    <6>1
    s
    <_+>2 <6>4 <6>
    <6 5> <_+>

}


forma = {

    \time 4/4
    \key re\major
    \tempo 4 = 57
    s1*9
    \bar "||"

}

VIsoprano = {
    \new Voice = "quam"
    <<\VIsopranon \forma>>
}

VIbc = {
    \clef bass
    <<\VIbcn \forma \VIbfn>>
}




VIIsopranon = \relative do'' {

    \autoBeamOff

    R4.*6
    fad,8 dod'16[(si dod si)]
    la8 re4

    %9
    dod8 si16 [(dod fad,8)]
    fad8 dod'16[(si dod si)]
    la8 re4

    %12
    dod8 si16 [(dod fad,8)]
    dod' re4~
    re8 dod dod\mbreak

    %15
    si [(dod16 si la si]
    dod4) dod8
    dod re4~

    %18
    re8 dod dod
    fad8.[(mi16 re dod]
    re[dod si dod la si]

    %21
    dod[si dod si la sold]
    la[si] sold4)
    fad dod'8\mbreak

    %24
    fad8.[(mi16 re dod]
    re[dod si dod la si]
    dod[si dod si la sold]

    %27
    la[si] sold4)
    fad4.
    R4.*3

    %32
    la8 si16[(la si la]
    sold8) la si
    dod dod16[(re mi8)]\mbreak

    %35
    R4.*3
    la,8 si16[(la si la]
    sold8) la si

    %40
    dod dod16[(re)] mi8
    sold, la si
    dod dod16[(re mi8)]

    %43
    mi fad16[(mi fad mi]
    red8) mi mi
    fad16[(mi] red4)\mbreak

    %46
    mi4.
    dod8 red16[(dod red dod]
    sid8) dod red

    %49
    mi8.[(red16 mi red]
    mi[dod] sid4)
    dod red8

    %52
    mi8.[(red16 mi red]
    mi [dod] sid4)
    dod4.

    %55
    R4.*6\mbreak
    fad,8 dod'16[(si dod si)]
    la8 re4

    %63
    dod8 si16 [(dod fad,8)]
    fad8 dod'16[(si dod si)]
    la8 re4

    %66
    dod8 si16 [(dod fad,8)]
    dod' re4~
    re8 dod dod\mbreak

    %69
    si [(dod16 si la si]
    dod4) dod8
    dod re4~

    %72
    re8 dod dod
    fad8.[(mi16 re dod]
    re[dod si dod la si]

    %75
    dod[si dod si la sold]
    la[si] sold4)
    fad dod'8\mbreak

    %78
    fad8.[(mi16 re dod]
    re[dod si dod la si]
    dod[si dod si la sold]

    %81
    la[si] sold4)
    fad4.

}

VIItestoI = \lyricmode {

    Au -- ro -- ram sic ra -- ram, et lu -- cem præ -- cle -- ram,
    quis un -- quam spec -- ta -- vit, quis un -- quam spec -- ta -- vit,
    spec -- ta -- vit, tam pu -- rum ni -- to -- rem,
    tam pu -- rum ni -- to -- rem, & gra -- tum al -- bo -- rem,
    sol non -- quam for -- ma -- vit, sol non -- quam for -- ma -- vit, for -- ma -- vit.
    Au -- ro -- ram sic ra -- ram, et lu -- cem præ -- cle -- ram,
    quis un -- quam spec -- ta -- vit, quis un -- quam spec -- ta -- vit,
    spec -- ta -- vit.

}

VIIbcn = \relative do {

    fad8 dod'16 si dod si
    la8 re4
    dod8 si16 dod fad,8

    %4
    fad dod'16 si dod si
    la8 re4
    dod4.

    %7
    fad,8 mid4
    fad8 si,4
    fad4.

    %10
    fad'8 mid4
    fad8 si,4
    fad4.\mbreak

    %13
    fad'8 si16 la si la
    sold8 la la,
    re r r

    %16
    dod r r
    fad si16 la si la
    sold8 la r

    %19
    lad r r
    si r r
    la mid4

    %22
    fad8 dod' dod,
    fad r r\mbreak
    lad, r r

    %25
    si r r
    la'? mid4
    fad8 dod' dod,

    %28
    fad4.
    la8 si16 la si la
    sold8 la si

    %31
    dod dod16 re mi8
    dod, re4
    mi8 fad sold

    %34
    la4 mi8\mbreak
    la si16 la si la
    sold8 la si

    %37
    dod dod16 re mi8
    dod, re4
    mi8 fad sold

    %40
    la r r
    mi8 fad sold
    la r r

    %43
    sold la4
    fad8 sold4\mbreak
    la8 fad4

    %46
    mi8 fad sold
    la fad4
    sold8 lad sid

    %49
    dod4 sold8
    dod, sold4
    dod8 dod' sid

    %52
    dod4 sold8
    dod, sold' sold,
    dod4.

    %55
    fad8 dod'16 si dod si
    la8 re4
    dod8 si16 dod fad,8

    %58
    fad dod'16 si dod si
    la8 re4
    dod4.

    %61
    fad,8 mid4
    fad8 si,4
    fad4.

    %64
    fad'8 mid4
    fad8 si,4
    fad4.\mbreak

    %67
    fad'8 si16 la si la
    sold8 la la,
    re r r

    %70
    dod r r
    fad si16 la si la
    sold8 la r

    %73
    lad r r
    si r r
    la mid4

    %76
    fad8 dod' dod,
    fad r r\mbreak
    lad, r r

    %79
    si r r
    la'? mid4
    fad8 dod' dod,

    %82
    fad4.

}

VIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8 <6> s
    s4.
    <6>
    s8 <6> s
    s4.
    <6>
    s8 <6 5->4
    s4.*2
    s8 <6 5->4
    s4.*3
    <6 5->8 <4> <3>
    s4.
    <6>
    s
    <6 5->
    <6>
    s
    s8 <6 5->4
    s8 <5 4> <_+>
    s4.
    <6>
    s
    s8 <6 5->4
    s8 <4> <_+>
    s4.*3
    <6>4.
    <6>8 <6> <5>
    <_+> s <6>
    s <_+> s
    s <6+> s
    <6> s <6+>
    <6> s s
    <6> <6> <5>
    <_+> s <6>
    s4.
    <_+>8 s <6>
    s4.
    <6>8 <6> <5>
    <6+> <6> s
    <6> <6+> s
    <_+> s <6>
    s <6+> s
    <6> <6> <6>
    s s <6>
    s <4+> s
    s s <6>
    s s <6>
    s <4> <_+>
    s4.
    s8 <6> s
    s4.
    <6>
    s8 <6> s
    s4.
    <6>
    s8 <6 5-> s
    s4.*2
    s8 <6 5->4
    s4.*3
    <6 5->8 <4> <3>
    s4.
    <6>
    s
    <6 5->
    <6>
    s
    s8 <6 5->4
    s8 <5 4> <_+>
    s4.
    <6>
    s
    s8 <6 5->4
    s8 <4> <_+>

}


forma = {

    \time 3/8
    \key re\major
    \tempo 2 = 45
    s4.*82
    \bar "||"

}

VIIsoprano = {
    \new Voice = "raram"
    <<\VIIsopranon \forma>>
}

VIIbc = {
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>
}




VIIIsopranon = \relative do'' {

    \autoBeamOff

    R1

    %47
    r8 mi re4 dod r
    R1
    r8 mi re4 dod8 dod16 si dod8 si

    %50
    r8 dod16 si dod8 si dod si la16[(sold la si)]\mbreak
    sold4 r r r8 mi'

    %52
    re dod r dod si la r mi'
    re dod re16[(dod re mi)] dod4 r
    r2 dod16[(si dod si] dod8) si

    %55
    r2 dod16[(si dod si] dod8) si\mbreak
    dod8 si16 si dod8 red mi si r4
    mi16[(red mi red] mi8) red r2

    %58
    mi8 red16 red mi8 dod red red r mi
    dod4 r8 mi dod si la4\mbreak
    sold mi'16[(re? mi re] dod8) dod16 dod re[(dod re dod]

    %61
    si8) si dod16[(si dod si] la8) si16 dod re8 dod
    si si r dod re4 r8 dod
    re dod si4 la r\mbreak

    %64
    r8 la la la la2
    la8 si si si si2~
    si si4 r

    %67
    dod16[(si dod si] dod8) si dod16[(si dod si] dod8) si
    dod8 dod16 re mi8 si\mbreak dod8 la la la
    la1

    %70
    la2 la4 r8 re
    dod4 r8 re dod dod r re
    dod4 r8 dod si2~

    %73
    si8 la16[(sold] la4) r2\fermata

}

VIIItestoI = \lyricmode {

    Mor -- ta -- les, mor -- ta -- les non au -- ditis, _ non au -- ditis, _ non au -- di -- tis,

    mor -- ta -- les, mor -- ta -- les non non au -- di -- tis, ri -- det, ri -- det, ri -- det

    Au -- ro -- ra_in Cæ -- lo, ri -- det, ri -- det Au -- ro -- ra_in Cæ -- lo, et vos,

    et vos dor -- mi -- tis, ri -- det Au -- ro -- ra, ri -- det Au -- ro -- ra_in Cæ -- lo,

    et vos, et vos dor -- mi -- tis, et vos dor -- mi -- tis, et vos dor -- mi -- tis,

    ri -- det, ri -- det, ri -- det Au -- ro -- ra_in Cæ -- lo, et vos dor -- mi -- tis;

    et vos dor -- mi -- tis, et vos dor -- mi -- tis.

}

VIIIalton = \relative do' {

    \autoBeamOff

    %46
    r2 r4 r8 mi
    la4. (sold8) la4 r
    r2 r4 r8 mi

    %49
    la4. (sold8) la la16 sold la8 sold\mbreak
    r8 la16 sold la8 sold la sold fad4
    mi r r8 mi16 mi fad8 mi

    %52
    r sold16 sold la8 sold r4 r8 mi
    sold la si4 la r
    r2\mbreak  la16 [(sold la sold] la8) sold

    %55
    r2 la16[(sold la sold] la8) sold
    la sold16 sold la8 fad sold sold r4
    sold16[(fad sold fad]  sold8) fad r2\mbreak

    %58
    sold8 fad16 fad sold8 lad si fad r sold
    la4 r8 sold la sold fad4
    mi r la16[(sold la sold] fad8) fad16 fad

    %61
    sold[(fad sold fad] mi8) la\mbreak fad8 sold16 la sold8 la
    sold sold r la fad4 r8 la
    fad mi re4 dod8 la' la la

    %64
    la2 la8 la la la
    la1~
    la2 sold8 mi mi mi

    %67
    mi1~
    mi2 mi
    fad16[(mi fad mi] fad8) mi fad16[(mi fad mi] fad8) mi

    %70
    fad fad16 sol? la8 mi fad fad r8 fad\mbreak
    mi4 r8 fad mi mi r fad
    mi4 r8 mi re2~

    %73
    re8 dod16[(si] dod4) r2\fermata

}

VIIItestoII = \lyricmode {

    Mor -- ta -- les, mor -- ta -- les non au -- ditis _ non au -- ditis _ non au -- di -- tis,

    non au -- ditis, _ non au -- ditis _ non non au -- di -- tis, ri -- det, ri -- det, ri -- det

    Au -- ro -- ra_in Cæ -- lo, ri -- det, ri -- det Au -- ro -- ra_in Cæ -- lo, et vos,

    et vos dor -- mi -- tis, ri -- det Au -- ro -- ra, ri -- det Au -- ro -- ra_in Cæ -- lo,

    et vos, et vos dor -- mi -- tis, et vos dor -- mi -- tis, et vos dor -- mi -- tis,

    et vos dor -- mi -- tis,

    ri -- det, ri -- det, ri -- det Au -- ro -- ra_in Cæ -- lo, et vos dor -- mi -- tis;

    et vos dor -- mi -- tis.

}


VIIIvlIn = \relative do'' {

    r8 mi la mi16 re dod8 si la sold

    %47
    r2 r8 dod'16 si dod8 si\mbreak
    dod si la16 sold la si sold4 r
    R1*2

    %51
    r4 r8 si la sold r4
    r2\mbreak r8 la16 la si8 la
    r2 r8 mi16 mi fad8 mi

    %54
    sold la si4 la r
    dod16 si dod si dod8 si r2
    r sold16 fad sold fad sold8 fad

    %57
    r2\mbreak sold16 fad sold fad sold8 fad
    R1*4
    mi16 re mi re dod si dod si la si la si sol si dod si

    %63
    la8 la re,4 la' r
    fad16 mi fad mi fad mi fad mi fad mi fad mi fad8 mi
    fad4 r la16 sold la sold la sold la sold

    %66
    la sold la sold la sold la sold mi4 r
    la16 sold la sold la8 sold\mbreak la16 sold la sold la8 sold
    la16 si dod si la8 sold la4 r

    %69
    re16 dod re dod re8 dod re16 dod re dod re8 dod
    re16 mi fad mi re8 dod re4 r8 fad,\mbreak
    la4 r8 la dod4 r8 la

    %72
    dod8 si la4 si2
    mi,4 r r2\fermopz

}

VIIIvlIIn = \relative do'' {

    r4 r8 mi\mbreak la mi dod si

    %47
    r2 r8 la'16 sold la8 sold
    la sold fad4 mi r
    R1*2

    %51
    r8 mi16 mi fad8 mi r2
    r r8 mi16 mi fad8 mi
    r2 r4 r8 mi\mbreak

    %54
    re dod re16 dod re mi dod4 r
    la'16 sold la sold la8 sold r2
    r mi16 red mi red mi8 red

    %57
    r2 mi16 red mi red mi8 red
    R1*4\mbreak
    r4 r8mi, fad16 sol fad sol fad8 mi

    %63
    fad la si4 dod r
    re,16 dod re dod re8 dod re16 dod re dod re8 dod
    re4 r fad8 fad fad fad\mbreak

    %66
    fad fad fad fad sold4 r
    mi8 mi mi mi mi mi mi mi
    mi mi mi mi mi4 r

    %69
    la,8 la la la la la la la
    la la la la la4 r8 re\mbreak
    mi4 r8 re mi4 r8 re

    %72
    mi4 r8 dod re2
    la'4 r r2\fermopz

}

VIIIbcn = \relative do {

    la4 r r8 mi' la mi
    dod la si mi la,4 r8 mi'
    la, mi'4 red8 mi mi la mi\mbreak

    %49
    dod la si mi la,4 r8 mi'
    la,4 r8 mi' la, mi'4 red8
    mi8 mi la sold fad mi la sold

    %52
    fad mi fad mi re dod re dod
    si la4 sold8\mbreak la dod re dod
    si la4 sold8 la4 r8 mi'

    %55
    la,4 r8 mi' la,4 r8 mi'
    la, mi' la, si mi4 r8 si
    mi4 r8 si mi4 r8 si

    %58
    mi si mi fad\mbreak si,4 r8 mi
    la4 r8 mi la, mi'4 red8
    mi16 re? mi re dod8 si la4 re

    %61
    mi16 re mi re dod8 si re dod si la
    mi'4 r8 la, re4 r8 la\mbreak
    re la4 sold8 la4 r8 la

    %64
    re4 r8 la re4 r8 la
    re4 r8 red mi red mi red
    mi red mi red mi4 r8 mi

    %67
    la,4 r8 mi'\mbreak la,4 r8 mi'
    la,4 r8 mi' la,4 r8 la'
    re,4 r8 la' re,4 r8 la'

    %70
    re,4 r8 la' re,4 r8 re
    la'4 r8 re, la'4 r8 re,
    la'4 la,2 sold4

    %73
    la r r2\fermopz

}

VIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 s4 s8 <_+>
    <6> s <7> <7_+> s4 s8 <_+>
    s <5 _+> <4 2> <6 5->8 <_+> s s <_+>\mbreak
    <6>4 <7>8 <7 _+> s4 s8 <_+>
    s4 s8 <_+> s <5 _+> <4 2> <6 5->8
    <_+>4 s  <6> s
    <6>8 <_+> <6> <_+> s s <6> <6>
    <6+> <5> <4 2> <6 5->\mbreak s4 <6>8 <6>
    <6+> <5> <4 2> <6 5-> s4 s8 <_+>
    s4 s8 <_+> s4 s8 <_+>
    s <_+> <6 5> <_+> <_+>4 s8 <_+>
    <_+>4 s8 <_+> <_+>4 s8 <_+>
    <_+> <_+> <_+> <_+>\mbreak <_+>4 s8 <_+>
    s4 s8 <_+> s <5 _+> <4 2> <6 5->
    <_+>4 s8 <6> s2
    <_+>4 s s <6+>
    <_+>1\mbreak
    s8 <5> <4 2> <6 5-> s2
    s1
    s4 s8 <6 5-> <_+> <6 > <_+> <6>
    <_+>8 <6> <_+> <6 > <_+>4 s8 <_+>
    s4 s8 <_+>\mbreak s4 s8 <_+>
    s4 s8 <_+> s2
    s1*3
    s4 <5>4 <4 2> <6 5->

}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 40
    s1*28
    \bar "|."


}

VIIIvlI = {
    <<\VIIIvlIn \forma>>

}

VIIIvlII = {
    <<\VIIIvlIIn \forma>>

}

VIIIsoprano = {
    \new Voice = "mortales1"
    <<\VIIIsopranon \forma>>
}

VIIIalto = {
    \new Voice = "mortales2"
    <<\VIIIalton \forma>>
}

VIIIbc = {
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
}


global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup\smaller\center-column {"Concerto Sacro V Op. II"}
        composer = \markup \center-column{"A. Scarlatti (1660 - 1725)"}
    }

    \markup \huge {[1.] Mortales non auditis. Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 4/4 r8 mi''8^\markup\center-align "Canto" re''4}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \Isoprano \global
                \new Lyrics \lyricsto "mortales1" \ItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key re\major \time 4/4 r2 r4 r8 mi'8^\markup\center-align "Alto"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \Ialto \global
                \new Lyrics \lyricsto "mortales2" \ItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Ibc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

}

\bookpart {

    \paper  {

        systems-per-page = #7

    }

    \markup \huge {[2.] Eia surgite}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 4/4 r8 re''8^\markup\center-align "Canto" la'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \IIsoprano \global
                \new Lyrics \lyricsto "eia" \IItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[3.] Ritornello}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 18)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

}

\bookpart {

    \paper  {

        systems-per-page = #6

    }

    \markup \huge {[4.] Ut quid. Recitativo}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key re\major \time 4/4 r4 re'^\markup\center-align "Alto" sol'}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IValto \global
                \new Lyrics \lyricsto "quid" \IVtestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IVbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup \huge {[5.] Auræ, venti. Largo}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key re\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r1 mi'16^\markup\center-align "Alto" fad'}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \Valto \global
                \new Lyrics \lyricsto "venti" \VtestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \VvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Vbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup \huge {[6.] O quam formosa.  Recitativo}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 4/4 re''4^\markup\center-align "Canto" mi''8}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \VIsoprano \global
                \new Lyrics \lyricsto "quam" \VItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \VIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 18)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

}

\bookpart {

    \paper  {

        systems-per-page = #6

    }

    \markup \huge {[7.] Auroram sic raram. Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r1 fad'8^\markup\center-align "Canto"dod''16}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \VIIsoprano \global
                \new Lyrics \lyricsto "raram" \VIItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \VIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 18)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup \huge {[8.] Mortales [ripresa]. Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 4/4 r1 r8 mi''8^\markup\center-align "Canto" re''4}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \VIIIsoprano \global
                \new Lyrics \lyricsto "mortales1" \VIIItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key re\major \time 4/4 r2 r4 r8 mi'8^\markup\center-align "Alto"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \VIIIalto \global
                \new Lyrics \lyricsto "mortales2" \ItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VIIIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \VIIIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"Violoncello"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \VIIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

}

