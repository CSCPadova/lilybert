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
        \musicglyph "scripts.prall"
    }
}

%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}

mbreak = { }


Ialton = \relative do' {

    \autoBeamOff

    fa8 do fa fa16 sol la8 la la sol
    sol sol r4 sol8 la sib sib16 la\mbreak
    la8 la r4 fa fa8 mi
    mi4 r si8 si16 do re8 do16 si
    do8 do r4 la'8 la16 la la8 sol\mbreak
    mi mi r4 mi4 fa8 sol
    do, do r4 do re8 mi
    la, la r mi' do do r4

}

Itesto = \lyricmode {

    Qual in piog -- gia do -- ra -- ta_i dol -- ci ra -- i Fe -- bo_a -- mi -- co di -- scio -- glie;
    tal tu, Si -- gnor, men -- tre sa -- pienza  _ ac -- cogli _ ad i -- nau -- ra -- re_im -- prendi, _
    se_a prò di le -- i sua bel -- la lu -- ce ac -- cendi. _

}

Ibcn = \relative do {

    fa1
    do
    fa
    sold,
    red'
    mi
    la,
    fa2 sol4 do,\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 4 = 55
    s1*8
    \bar "||"
    %\mark\markup "D.C."

}

Ialto = {
    \new Voice = "pioggia"
    <<\Ialton \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}





IIcrIn =   \relative do'' {

    la'16 la do do la la sol sol la8 fa4 do8
    la'16 la do do la la sol sol la8 fa4 do8
    la'[sol16 la sib8 la] sol4 r

    %4
    r8 fa16 [fa fa8 fa] sol4 r
    r8 fa16 [fa fa8 fa] sol8[do,16 do do do do do]\mbreak
    fa8[do16 do do do do do] sol'8[do,16 do do do do do]

    %7
    la'8[do,16 do do do do do] sib'4 r8 do,
    fa do fa do fa16 fa do do la la fa fa
    fa'8 do fa do fa16 fa do do la la fa fa

    %10
    do'4 do, fa2\p~
    fa1~
    fa~

    %13
    fa
    do'8[do16 do do8 do] do16 [do do do do do do do]
    fa[do do do do do do do] sol'[do, do do do do do do]\mbreak

    %16
    la'[do, do do do do do do]
    sib'4 r do,8[do16 do do8 do]
    do4 r do8[do16 do do8 do]

    %19
    do4 r do8[do16 do do8 do]
    fa4 la sol2\mbreak
    do,4 r do8\f[do16 do do8 do]

    %22
    do4 r do8[do16 do do8 do]
    R1*3
    do8\p [do16 do do8 do] do4 r

    %27
    do8 [do16 do do8 do] do4 r
    R1
    do8 [do16 do do8 do] do4 r

    %30
    R1*3
    do1\tr~
    do\mbreak

    %35
    do16 [do do do do do do do] fa[do do do do do do do]
    sol'[do, do do do do do do] la'[do, do do do do do do]
    sib'4 r8 do, fa do fa do

    %38
    fa do la do fa do la do
    fa4 r8 fa mi4 fa\mbreak
    do2 fa4 r

    %41
    R1
    la16\f la do do la la sol sol la8 fa4 do8
    la'16 la do do la la sol sol la8 fa4 do8

    %44
    la'[sol16 la sib8 la] sol16[do, do do do do do do] \mbreak
    fa[do do do do do do do] sol'[do, do do do do do do]
    la'[do, do do do do do do] sib'4 r8 do,

    %47
    fa do fa do fa16 fa do do la la fa fa
    fa'8 do fa do fa16 fa do do la la fa fa
    do'4 do, fa2\fermata\mbreak

    %50
    R1*21

}

IIcrIIn = \relative do'' {

    fa16 fa la la fa fa do do fa8 do4 la8
    fa'16 fa la la fa fa do do fa8 do4 la8
    fa'[do16 fa sol8 fa] do4 r

    %4
    r8 do16 [do do8 do] do4 r
    r8 do16 [do do8 do] do[do16 do do do do do]\mbreak
    fa8[do16 do do do do do] sol'8[do,16 do do do do do]

    %7
    la'8[do,16 do do do do do] sib'4 r8 do,
    fa do fa do fa16 fa do do la la fa fa
    fa'8 do fa do fa16 fa do do la la fa fa

    %10
    do'4 do, fa2\p~
    fa1~
    fa~

    %13
    fa
    do'8[do16 do do8 do] do16 [do do do do do do do]
    fa[do do do do do do do] sol'[do, do do do do do do]\mbreak

    %16
    la'[do, do do do do do do]
    sib'4 r  r2
    do,8[do16 do do8 do] do4 r

    %19
    do8[do16 do do8 do] do8[do16 do do8 do]
    fa4 la sol2\mbreak
    do,4 r do8\f[do16 do do8 do]

    %22
    do4 r do8[do16 do do8 do]
    R1*3
    r2 do8\p[do16 do do8 do]

    %27
    do4 r r2
    R1
    do8[do16 do do8 do] do4 r

    %30
    R1*3
    do1\tr~
    do\mbreak

    %35
    do16 [do do do do do do do] fa[do do do do do do do]
    sol'[do, do do do do do do] la'[do, do do do do do do]
    sib'4 r8 do, fa do fa do

    %38
    fa do la do fa do la do
    fa4 r8 fa mi4 fa\mbreak
    do2 fa4 r

    %41
    R1
    fa16 fa la la fa fa do do fa8 do4 la8
    fa'16 fa la la fa fa do do fa8 do4 la8

    %44
    fa'[do16 fa sol8 fa] do16[do do do do do do do] \mbreak
    fa[do do do do do do do] sol'[do, do do do do do do]
    la'[do, do do do do do do] sib'4 r8 do,

    %47
    fa do fa do fa16 fa do do la la fa fa
    fa'8 do fa do fa16 fa do do la la fa fa
    do'4 do, fa2\fermata\mbreak

    %50
    R1*21

}


IIvlIn = \relative do'' {

    la16 la do do la la sol sol la8 fa4 do8
    la'16 la do do la la sol sol la8 fa4 do8
    la'[sol16 la sib8 la] sol sol'16 sol sib sib sol sol

    %4
    la4 r r8 sol16 sol sib sib sol sol
    la4 r r8 do,16[do do do do do]
    fa8[do16 do do do do do] sol'8[do,16 do do do do do]

    %7
    la'8[do,16 do do do do do] sib'4 r8 do,
    fa do fa do fa16 fa do do la la fa fa
    fa'8 do fa do fa16 fa do do la la fa fa

    %10
    do'4 do, la'\p fa
    do fa\mbreak la do
    fa8 do4 la8 fa la4 do8

    %13
    fa do4 la8 fa4. fa8
    \once\stemUp mi8[sol'16 sol sol8 sol] sol16[do, do do do do do do]
    fa[do do do do do do do] sol'[do, do do do do do do]\mbreak

    %16
    la'[do, do do do do do do]
    sib'4 r do,,~do16 re mi fa
    sol4~sol16[fa mi re] do4~do16[re mi fa]

    %19
    sol4~sol16[ la si sol] do8 [do,16 do do8 do]
    fa4 la sol2\mbreak
    mi'16\f mi sol sol mi mi re re mi8 do4 sol8

    %22
    mi'16 mi sol sol mi mi re re mi8 do4 sol8
    si16[sol sol sol sol sol sol sol] do[sol sol sol sol sol sol sol]
    re'[sol, sol sol sol sol sol sol] mi'[sol, sol sol sol sol sol sol]\mbreak

    %25
    fa'4 r8 sol, do fa, sol[sol,]
    mi'4\p do mi sol
    do sol do,4~do16[re mi fa]

    %28
    sol4~sol16[fa mi re] do4~do16[re mi fa]
    sol8[do,16 do do8 do] fa' mib mib do
    re do sib fa'\mbreak sol fa fa mi

    %31
    mi re do sol' la sol sol fa
    fa mi re la' sib la sol fa
    mi8 [do,16 do do8 do] do4 r

    %34
    do8[do16 do do8 do] do4 r\mbreak
    do'16 [do do do do do do do] fa[do do do do do do do]
    sol'[do, do do do do do do] la'[do, do do do do do do]

    %37
    sib'4 r8 do,  fa do fa do
    fa do la do fa do la do
    fa4 r8 fa, mi4 fa

    %40
    do2 fa4 r8 fa
    fa4. fa8 do2
    la'16\f la do do la la sol sol la8 fa4 do8
    la'16 la do do la la sol sol la8 fa4 do8

    %44
    la'[sol16 la sib8 la] sol[do16 do do do do do]
    fa[do do do do do do do] sol'[do, do do do do do do]
    la'[do, do do do do do do] sib'4 r8 do,

    %47
    fa do fa do fa16 fa do do la la fa fa
    fa'8 do fa do fa16 fa do do la la fa fa
    do'4 do, fa2\fermata\mbreak

    %50
    sib,4 sib sib8[do re do]
    sib[do re mib] fa[sol la fa]
    fa[sol la fa] sib4 sib,
    sib'8[la sol fa] la sol fa mib

    %54
    fa[mib re do] fa4 fa
    fa8[sol fa mib]\mbreak re do sib sib'
    la sol fa mi!  fa4 fa

    %57
    fa8[mi re mi] fa[sol la sib]
    mi,[re do re] mi[fa sol la]
    re,[do sib do] re[mi fa sol]

    %60
    do,[sib la sib] do[re mi fa]\mbreak
    re4 sib' do, la'
    sib,8[do re mi] fa[sol la fa]

    %63
    sib4 re, mi sol
    fa fa sib,8 do re mi
    fa sol la fa sib[la sol fa]

    %66
    mi[re do sol'] la[sol fa mi]\mbreak
    re[do sib fa'] sol[fa mi re]
    do[sib la mi'] fa[mi re do]

    %69
    re4 sib' mib, sol
    fa2\tr sib,\fermata

}

IIvlIIn = \relative do'' {

    fa,16 fa la la fa fa do do fa8 do4 la8
    fa'16 fa la la fa fa do do fa8 do4 la8
    fa'[mi16 fa sol8 fa] mi mi'16 mi sol sol mi mi

    %4
    fa4 r r8  mi16 mi sol sol mi mi
    fa4 r r8 do16[do do do do do]
    fa8[do16 do do do do do] sol'8[do,16 do do do do do]

    %7
    la'8[do,16 do do do do do] sib'4 r8 do,
    fa do fa do fa16 fa do do la la fa fa
    fa'8 do fa do fa16 fa do do la la fa fa

    %10
    do'4 do, fa4\p do
    la do\mbreak fa la
    do8 la4 fa8 do fa4 la8

    %13
    do la4 fa8 do4. la'8
    sol[mi'16 mi mi8 mi] mi16[do do do do do do do]
    fa[do do do do do do do] sol'[do, do do do do do do]\mbreak

    %16
    la'[do, do do do do do do]
    sib'4 r do,,~do16 re mi fa
    sol4~sol16[fa mi re] do4~do16[re mi fa]

    %19
    sol4~sol16[ la si sol] do8 [do,16 do do8 do]
    fa4 la sol2\mbreak
    do16\f do mi mi do do si si do8 sol4 mi8

    %22
    do'16 do mi mi do do si si do8 sol4 mi8
    si'16[sol sol sol sol sol sol sol] do[sol sol sol sol sol sol sol]
    re'[sol, sol sol sol sol sol sol] mi'[sol, sol sol sol sol sol sol]\mbreak

    %25
    fa'4 r8 sol, do fa, sol[sol,]
    do4\p sol do mi
    sol mi do4~do16[re mi fa]

    %28
    sol4~sol16[fa mi re] do4~do16[re mi fa]
    sol8[do,16 do do8 do] do'4 do
    fa, fa\mbreak re' re

    %31
    sol, sol mi' mi
    la, la fa' fa
    sol8[do,,16 do do8 do] do4 r

    %34
    do8[do16 do do8 do] do4 r\mbreak
    do'16 [do do do do do do do] fa[do do do do do do do]
    sol'[do, do do do do do do] la'[do, do do do do do do]

    %37
    sib'4 r8 do,  fa do fa do
    fa do la do fa do la do
    fa4 r8 fa, mi4 fa

    %40
    do2 fa4 r8 fa
    fa4. fa8 do2
    fa16\f fa la la fa fa mi mi fa8 do4 la8

    %43
    fa'16 fa la la fa fa mi mi fa8 do4 la8
    fa'[mi16 fa sol8 fa] mi[do'16 do do do do do]\mbreak
    fa[do do do do do do do] sol'[do, do do do do do do]

    %46
    la'[do, do do do do do do] sib'4 r8 do,
    fa do fa do fa16 fa do do la la fa fa
    fa'8 do fa do fa16 fa do do la la fa fa

    %49
    do'4 do, fa2\fermata\mbreak
    sib,4 sib sib8[do re do]

    %51
    sib[do re mib] fa[sol la fa]
    fa[sol la fa] sib4 sib,
    sib'8[la sol fa] la sol fa mib

    %54
    fa[mib re do] fa4 fa
    fa8[sol fa mib]\mbreak re do sib sib'
    la sol fa mi!  fa4 fa

    %57
    fa8[mi re mi] fa[sol la sib]
    mi,[re do re] mi[fa sol la]
    re,[do sib do] re[mi fa sol]

    %60
    do,[sib la sib] do[re mi fa]\mbreak
    re4 sib' do, la'
    sib,8[do re mi] fa[sol la fa]

    %63
    sib4 re, mi sol
    fa fa sib,8 do re mi
    fa sol la fa sib[la sol fa]

    %66
    mi[re do sol'] la[sol fa mi]\mbreak
    re[do sib fa'] sol[fa mi re]
    do[sib la mi'] fa[mi re do]

    %69
    re4 sib' mib, sol
    fa2\tr sib,\fermata

}

IIvlan = \relative do' {

    do8 fa do mi do la4 fa8
    do' fa do mi do la4 fa8
    do' do re re mi4 r

    %4
    do r do r
    do r do8 do do do\mbreak
    do do do do do do do do

    %7
    do do do do do4 r8 do'
    fa do fa do fa do la fa
    fa' do fa do fa do la fa

    %10
    do'4 do, fa,2\p~
    fa1~
    fa~

    %13
    fa2~fa
    do'8[do16 do do8 do] do2~
    do~do~

    %16
    do~
    do do4~do16 re mi fa
    sol4~sol16[fa mi re] do4~do16[re mi fa]

    %19
    sol4~sol16[ la si sol] do8 [do,16 do do8 do]
    fa4 la sol2\mbreak
    sol8\f[sol16 sol sol8 sol] sol[sol,16 sol sol8 sol]

    %22
    sol'[sol16 sol sol8 sol] sol[sol,16 sol sol8 sol]
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol\mbreak

    %25
    sol4 r8 sol' do fa, sol sol,
    do\p do do do do do do do
    do do do do do4~do16[re mi fa]

    %28
    sol4~sol16[fa mi re] do4~do16[re mi fa]
    sol8[do,16 do do8 do] la4 la
    sib sib\mbreak si si

    %31
    do do dod dod
    re re re re
    do8[do16 do do8 do] do4 r

    %34
    do8[do16 do do8 do] do4 r\mbreak
    do8 do do do do do do do

    %36
    do8 do do do do do do do
    do4 r8 do'  fa do fa do
    fa do la do fa do la do

    %39
    fa4 r8 fa, mi4 fa
    do2 fa,4 r8 fa'
    fa4. fa8 do2

    %42
    do8\f fa do mi do la4 fa8
    do' fa do mi do la4 fa8
    do' do re re do do do do\mbreak

    %45
    do do do do do do do do
    do do do do do4 r8 do'
    fa do fa do fa16 fa do do la la fa fa

    %48
    fa'8 do fa do fa16 fa do do la la fa fa
    do'4do,4 fa,2\fermata\mbreak
    sib4 sib sib8[do re do]

    %51
    sib[do re mib] fa[sol la fa]
    fa[sol la fa] sib4 sib,
    sib'8[la sol fa] la sol fa mib

    %54
    fa[mib re do] fa4 fa
    fa8[sol fa mib]\mbreak re do sib sib'
    la sol fa mi!  fa4 fa

    %57
    fa8[mi re mi] fa[sol la sib]
    mi,[re do re] mi[fa sol la]
    re,[do sib do] re[mi fa sol]

    %60
    do,[sib la sib] do[re mi fa]\mbreak
    re4 sib' do, la'
    sib,8[do re mi] fa[sol la fa]

    %63
    sib4 re, mi sol
    fa fa, sib8 do re mi
    fa sol la fa sib[la sol fa]

    %66
    mi[re do sol'] la[sol fa mi]\mbreak
    re[do sib fa'] sol[fa mi re]
    do[sib la mi'] fa[mi re do]

    %69
    re4 sib' mib, sol
    fa2\tr sib,\fermata

}

IIalton = \relative do' {

    \autoBeamOff

    R1*9
    r2 fa4 do
    la do\mbreak fa la

    %12
    do8 la4 fa8 do fa4 la8
    do la4 fa8 do[re16 mi fa sol la sib]
    do8 do, r4 mi8[fa] sol mi

    %15
    fa[mi] la[fa] sol[la] sib[sol]\mbreak
    \set Score.measureLength = #(ly:make-moment 2 4) la[sol] la fa
    \set Score.measureLength = #(ly:make-moment 4 4) sol[fa] mi[re] do4~do16[re mi fa]

    %18
    sol4~sol16[fa mi re] do4~do16[re mi fa]
    sol4~sol16[ la si sol] do8 do, r do
    fa4 la sol2\mbreak

    %21
    do, r
    R1*4
    do4 sol do mi

    %27
    sol mi do4~do16[re mi fa]
    sol4~sol16[fa mi re] do4~do16[re mi fa]
    sol4 r fa8[mib] mib re

    %30
    re[do] sib4\mbreak sol'8[fa] fa mi
    mi [re] do4 la'8[sol] sol[fa]
    fa[mi] re la' sib[la] sol[fa]

    %33
    do4 r8 do16 [re] mi8[mi16 fa sol8 mi]
    do4 r8 do16[re] mi8[mi16 fa sol8 mi]\mbreak
    do8[do16 sib do8 do] fa8[do16 sib do8 do]

    %36
    sol'8[do,16 sib do8 do] la'8[do,16 sib do8 do]
    sib'4 r8 do, fa [do fa do]
    fa [do la do] fa [do la do]

    %39
    fa16[sol la sib] do8 fa, mi4 fa\mbreak
    do2 fa4 r8 fa
    fa16[sol la sib do8] fa, sol2\tr

    %42
    fa4 r r2
    R1*7
    sib,4 sib sib8[do re do]

    %51
    sib[do re mib] fa[sol la fa]
    fa[sol la fa] sib4 sib,
    \footnote #' (-1 . 2) \markup\column\smaller {" Testo illeggibile nel manoscritto""  "}sib'8[la sol fa] la[sol] fa[mib]

    %54
    fa[mib] re[do] fa4 fa
    fa8[sol] fa[mib]\mbreak re[do] sib4
    r2 fa'4 fa

    %57
    fa8[mi? re mi] fa[sol la sib]
    mi,[re do re] mi[fa sol la]
    re,[do sib do] re[mi fa sol]

    %60
    do,[sib la sib] do[re mi fa]\mbreak
    re4 sib' do, la'
    sib,8[do re mi] fa[sol la fa]

    %63
    sib4 re, mi sol
    fa2 sib,4 r
    r2 sib'8[la] sol[fa]

    %66
    mi[re do sol'] la[sol fa mi]\mbreak
    re[do sib fa'] sol[fa mi re]
    do[sib la mi'] fa[mi re do]

    %69
    re4 sib' mib,? sol
    fa2\tr sib,\fermata

}

IItesto = \lyricmode {

    Om -- bre ne -- re voi ce -- de - - - - - - - - -  - te, vin -- te e lie -- te, in o -- mag -- gio a’ suoi ful -- go - - - - ri
    a’ suoi ful -- go -- ri.

    Om -- bre ne -- re voi ce -- de - - te, vin -- te e lie -- te, vin -- te e lie -- te, in o -- mag -- gio a’ suoi
    ful -- go - - - - - - - - - - - - - - -  ri a’ suoi ful -- go -- ri a’ suoi ful -- go -- ri.

    Puro sol, sag - - - - gio [sag - gio] e cle -- men -- te di sua men -- te fa bril -- lar - - - - - - - - vi_in
    is -- plen -- do - - ri_in is -- plen -- do -- ri fa bril -- lar - - - - - - vi_in is -- plen -- do -- ri.

}

IIbcn = \relative do {

    fa8[fa16 fa fa8 do] fa[fa16 fa fa8 fa]
    fa8[fa16 fa fa8 do] fa[fa16 fa fa8 fa]
    fa fa sib, sib do4 r

    %4
    fa8[fa16 fa fa8 fa] do4 r
    fa8[fa16 fa fa8 fa] do do do do\mbreak
    do do do do do do do do

    %7
    do do do do do4 r8 \clef tenor \key fa\major do'
    fa do fa do fa do la fa
    fa' do fa do fa do la fa

    %10
    \clef bass \key fa\major do'4 do, fa,8 fa fa fa
    fa fa fa fa\mbreak fa fa fa fa
    fa fa fa fa fa fa fa fa

    %13
    fa fa fa fa fa fa fa fa
    do' do do do do2~
    do~do~

    %16
    do~
    do do4~do16 re mi fa
    sol4~sol16[fa mi re] do4~do16[re mi fa]

    %19
    sol4~sol16[ la si sol] do8 [do,16 do do8 do]
    fa4 la sol2\mbreak
    do,8[do16 do do8 sol'] do,[do16 do do8 do]

    %22
    do8[do16 do do8 sol'] do,[do16 do do8 do]
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol\mbreak

    %25
    sol4 r8 sol' do fa, sol sol,
    do do do do do do do do
    do do do do do4~do16[re mi fa]

    %28
    sol4~sol16[fa mi re] do4~do16[re mi fa]
    sol8[do,16 do do8 do] la4 r
    R1*3

    %33
    do8[do16 do do8 do] do4 r
    do8[do16 do do8 do] do4 r\mbreak
    do8 do do do do do do do

    %36
    do8 do do do do do do do
    do4 r8 \clef tenor \key fa\major do'  fa do fa do
    fa do la do fa do la do

    %39
    fa4 \clef bass \key fa\major r8 fa, mi4 fa
    do2 fa,4 r8 fa'
    fa4. fa8 do2

    %42
    fa8[fa16 fa fa8 do] fa[fa16 fa fa8 fa]
    fa8[fa16 fa fa8 do] fa[fa16 fa fa8 fa]
    fa fa sib, sib do do do do\mbreak

    %45
    do do do do do do do do
    do do do do do4 r8 \clef tenor \key fa\major do'
    fa do fa do fa16 fa do do la la fa fa

    %48
    fa'8 do fa do fa16 fa do do la la fa fa
    do'4\clef bass \key fa\major do,4 fa,2\fermata\mbreak
    sib4 sib sib8[do re do]

    %51
    sib[do re mib] fa[sol la fa]
    fa[sol la fa] sib4 sib,
    sib'8[la sol fa] la sol fa mib

    %54
    fa[mib re do] fa4 fa
    fa8[sol fa mib]\mbreak re do sib sib'
    la sol fa mi!  fa4 fa

    %57
    fa8[mi re mi] fa[sol la sib]
    mi,[re do re] mi[fa sol la]
    re,[do sib do] re[mi fa sol]

    %60
    do,[sib la sib] do[re mi fa]\mbreak
    re4 sib' do, la'
    sib,8[do re mi] fa[sol la fa]

    %63
    sib4 re, mi sol
    fa fa, sib8 do re mi
    fa sol la fa sib[la sol fa]

    %66
    mi[re do sol'] la[sol fa mi]\mbreak
    re[do sib fa'] sol[fa mi re]
    do[sib la mi'] fa[mi re do]

    %69
    re4 sib' mib, sol
    fa2\tr sib,\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 2 = 60
    s1*15
    \set Score.measureLength = #(ly:make-moment 2 4)
    s2
    \set Score.measureLength = #(ly:make-moment 4 4)
    s1*32
    s2\mark\markup {"  [Fine]"} s \break
    s1*21
    \bar "||"
    \mark\markup "D.C."

}

IIcrI = {
    <<\IIcrIn \forma>>

}

IIcrII = {
    <<\IIcrIIn \forma>>

}

IIvlI = {
    <<\IIvlIn \forma>>

}

IIvlII = {
    <<\IIvlIIn \forma>>

}

IIvla = {
    \clef alto
    <<\IIvlan \forma>>

}

IIalto = {
    \new Voice = "ombre"
    <<\IIalton \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}




IIIalton = \relative do' {

    \autoBeamOff

    re8 re fa fa16 la la8 re, r4
    r16 re re mi fa8 fa16 mi mi8 mi r4
    sol fa8 mi fa fa r4
    fa mi8 re sold sold r la
    mi mi r mi do do re mi
    la, la r4 mi'8 fa sol fa16 mi
    fa8 fa r16 re dod re la8 la r4\fermata

}

IIItesto = \lyricmode {

    Co -- sì fia che ba -- le -- ni,
    del gran Fe -- lippo _ al guar -- do,
    di sa -- pi -- en -- za o -- gni più cu -- po a -- ver -- no.
    E gior -- no sor -- ga_al ne -- ro
    che_in lei va -- sto ne sor -- ga al -- to sen -- tie -- ro.

}

IIIbcn = \relative do {

    re1~
    re2 dod~
    dod re~
    re~re
    mi4 la,~ la2
    dod1
    sold2 la4 re\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 4 = 55
    s1*7
    \bar "||"
    %\mark\markup "D.C."

}

IIIalto = {
    \new Voice = "baleni"
    <<\IIIalton \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}





IVcrIn = \relative do'' {

    la'8 la16 sib do sib
    la8 fa fa
    la8 la16 sib do sib

    %4
    la8 fa fa
    do do do
    fa fa fa

    %7
    la sol16 la sib la
    sol4 r8
    R4.*8

    %17
    do8 do16 do do do
    do8 sib la
    do8 do16 do do do

    %20
    do8 sib la
    do,8 do16 do do do
    do8 do16 do do do

    %23
    do8 do16 do do do
    do8 do16 do do do
    do4 fa8
    fa do do\mbreak

    %27
    fa,4 r8
    R4.*3
    do'8\p do16 do do do

    %32
    do4 r8
    R4.
    do8 do16 do do do

    %35
    do4 r8
    R4.
    do8 do16 do do do

    %38
    do4 r8\mbreak
    do4 r8
    do8 do16 do do do

    %41
    do4 r8
    do8 do16 do do do
    do4 r8

    %44
    do8 do16 do do do
    do4 r8
    R4.*6

    %52
    do8 do16 do do do
    do4 r8
    do8 do16 do do do

    %55
    do4 r8
    fa sol sol
    do,4 r8

    %58
    R4.*12
    do8 do16 do do do
    do4 r8

    %72
    R4.*2
    la'16 sol la8 la
    sol16 fa sol8 sol

    %76
    la16 sol la8 la
    sol16 fa sol8 sol
    la4 r8

    %79
    R4.
    la8\f la16 sib do sib
    la4 r8

    %82
    R4.
    sol8\p sol16 sol sol sol\mbreak
    sol8 sol16 sol sol sol

    %85
    sol8 sol16 sol sol sol
    sol4 r8
    R4.*2

    %89
    la8\f la16 sib do sib
    la8 fa fa
    la8 la16 sib do sib

    %92
    la8 fa fa
    do do do
    fa fa fa

    %95
    do'8 do16 do do do\mbreak
    do8 sib la
    do8 do16 do do do

    %98
    do8 sib la
    do,8 do16 do do do
    do8 do16 do do do

    %101
    do8 do16 do do do
    do8 do16 do do do
    do4 fa8

    %104
    fa do do
    la4.\fermata
    R4.*28

}

IVcrIIn = \relative do'' {

    fa8 fa16 sol la sol
    fa8 do do
    fa fa16 sol la sol

    %4
    fa8 do do
    la la la
    do do do

    %7
    fa do16 fa sol fa
    do4 r8
    R4.*8

    %17
    la'8 la16 la la la
    la8 sol fa
    la8 la16 la la la

    %20
    la8 sol fa
    do8 do16 do do do
    do8 do16 do do do

    %23
    do8 do16 do do do
    do8 do16 do do do
    do4 fa8

    %26
    fa do do\mbreak
    fa,4 r8
    R4.*3

    %31
    do'8 \p do16 do do do
    do4 r8
    R4.

    %34
    do8 do16 do do do
    do4 r8
    R4.
    do8 do16 do do do

    %38
    do4 r8\mbreak
    do4 r8
    do8 do16 do do do

    %41
    do4 r8
    do8 do16 do do do
    do4 r8

    %44
    do8 do16 do do do
    do4 r8
    R4.*7

    %53
    do8 do16 do do do
    do4 r8
    do8 do16 do do do

    %56
    fa8 sol sol
    do,4 r8
    R4.*12

    %70
    do8 do16 do do do
    do4 r8
    R4.*2

    %74
    fa16 do fa8 fa
    do16 la do8 do
    fa16 do fa8 fa

    %77
    do16 la do8 do
    do4 r8
    R4.

    %80
    fa8\f fa16 sol la sol
    fa4 r8
    R4.

    %83
    do8\p do16 do do do\mbreak
    do8 do16 do do do
    do8 do16 do do do

    %86
    do4 r8
    R4.*2
    fa8\f fa16 sol la sol

    %90
    fa8 do do
    fa fa16 sol la sol
    fa8 do do

    %93
    la la la
    do do do
    la'8 la16 la la la\mbreak

    %96
    la8 sol fa
    la8 la16 la la la
    la8 sol fa

    %99
    do8 do16 do do do
    do8 do16 do do do
    do8 do16 do do do

    %102
    do8 do16 do do do
    do4 fa8
    fa do do

    %105
    la4.\fermata
    R4.*28

}


IVvlIn = \relative do'' {

    R4.*8
    la8 la16 sib do sib
    la8 fa fa

    %11
    la8 la16 sib do sib
    la8 fa fa\mbreak
    do do do

    %14
    fa fa fa
    la sol16 la sib la
    sol4 r8

    %17
    do do16 do do do
    do8 sib la
    do do16 do do do

    %20
    do8 sib la
    do8 do,16 do do do

    %22
    sib'8 do,16 do do do
    la'8 do,16 do do do
    sol'8 do,16 do do do

    %25
    fa8. sol16 la8
    sib do do,\mbreak
    fa4 r8

    %28
    R4.*4
    do8\p do16 do do do
    do4 r8

    %34
    R4.
    do8 do16 do do do
    do4 r8

    %37
    R4.
    do8 do16 do do do\mbreak
    sib'8 do,4
    do8. re16 do8

    %41
    la' do,4
    do8. re16 do8
    sol'8 do,4

    %44
    do8 si do
    r sol' do,
    si do fa

    %47
    mi re4\tr
    mi'8\f mi16 fa sol fa
    mi8 do do

    %50
    mi mi16 fa sol fa\mbreak
    mi8 do do
    sol'8 sol16 sol sol sol

    %53
    sol8 fa mi
    sol8 sol16 sol sol sol
    sol8 fa mi

    %56
    fa, sol sol
    do,4 r8
    R4.*5\mbreak

    %63
    fa'8\p fa fa
    fa fa fa
    sol sol sol

    %66
    sol sol sol
    la la la
    la la la

    %69
    sib sib sib
    sol\f do,16 do do do
    do4 r8

    %72
    do,4 r8\mbreak
    do4 r8
    R4.*7

    %81
    la''8\f la16 sib do sib
    la4 r8
    sib\p sib16 sib sib sib\mbreak

    %84
    sol8 sol16 sol sol sol
    mi8 mi16 mi mi mi
    do4 r8

    %87
    R4.*2
    la8\f la16 sib do sib
    la8 fa fa

    %91
    la8 la16 sib do sib
    la8 fa fa
    do do do

    %94
    fa fa fa
    do' do16 do do do
    do8 sib la

    %97
    do do16 do do do
    do8 sib la
    do8 do,16 do do do

    %100
    sib'8 do,16 do do do
    la'8 do,16 do do do
    sol'8 do,16 do do do

    %103
    fa8. sol16 la8
    sib do do,
    fa4.\fermata

    %106
    re'8 re, re'
    la la, la'\mbreak
    re8 re, re'

    %109
    la la, la'
    la la, la'
    re8 re, re'

    %112
    la la, la'
    re8 re, re'
    la la, la'

    %115
    re8 re, re'
    la la, la'
    re8 re, re'

    %118
    la la, la'
    re8 re, re'
    la la, la'

    %121
    re re, re'
    sold, sold, sold'
    la la, la'

    %124
    sold sold, sold'
    la la, la'
    sold sold, sold'

    %127
    la la, la'
    sold sold, sold'
    la la, la'

    %130
    sold sold, sold'
    la la, la'
    mi mi mi

    %133
    la4.\fermata

}

IVvlIIn = \relative do'' {

    R4.*8
    fa,8 fa16 sol la sol
    fa8 do do

    %11
    fa8 fa16 sol la sol
    fa8 do do\mbreak
    la la la

    %14
    do do do
    fa mi16 fa sol fa
    mi4 r8

    %17
    la la16 la la la
    la8 sol fa
    la la16 la la la

    %20
    la8 sol fa
    do'8 do,16 do do do

    %22
    sib'8 do,16 do do do
    la'8 do,16 do do do
    sol'8 do,16 do do do

    %25
    fa8. sol16 la8
    sib do do,\mbreak
    fa4 r8

    %28
    R4.*4
    do8\p do16 do do do
    do4 r8

    %34
    R4.
    do8 do16 do do do
    do4 r8

    %37
    R4.
    do8 do16 do do do\mbreak
    sib'8 do,4
    do8. re16 do8

    %41
    la' do,4
    do8. re16 do8
    sol'8 do,4

    %44
    do8 si do
    r sol' do,
    si do fa

    %47
    mi re4\tr
    do'8\f do16 re mi re
    do8 sol sol

    %50
    do do16 re mi re\mbreak
    do8 sol sol
    mi' mi16 mi mi mi

    %53
    mi8 re do
    mi mi16 mi mi mi
    mi8 re do

    %56
    fa, sol sol
    do,4 r8
    R4.*5\mbreak

    %63
    do'8\p do do
    re re re
    re re re

    %66
    mi mi mi
    mi mi mi
    fa fa fa

    %69
    fa fa fa
    mi\f do16 do do do
    do4 r8

    %72
    do,4 r8\mbreak
    do4 r8
    R4.*7

    %81
    fa'8\f fa16 sol la sol
    fa4 r8
    sol\p sol16 sol sol sol\mbreak

    %84
    mi8 mi16 mi mi mi
    do8 do16 do do do
    sol4 r8

    %87
    R4.*2
    fa8\f fa16 sol la sol
    fa8 do do

    %91
    fa8 fa16 sol la sol
    fa8 do do\mbreak
    la la la

    %94
    do do do
    la' la16 la la la\mbreak
    la8 sol fa

    %97
    la la16 la la la
    la8 sol fa
    do'8 do,16 do do do

    %100
    sib'8 do,16 do do do
    la'8 do,16 do do do
    sol'8 do,16 do do do

    %103
    fa8. sol16 la8
    sib do do,
    fa4.\fermata

    %106
    re'8 re, re'
    la la, la'\mbreak
    re8 re, re'

    %109
    la la, la'
    la la, la'
    re8 re, re'

    %112
    la la, la'
    re8 re, re'
    la la, la'

    %115
    re8 re, re'
    la la, la'
    re8 re, re'

    %118
    la la, la'
    re8 re, re'
    la la, la'

    %121
    re re, re'
    sold, sold, sold'
    la la, la'

    %124
    sold sold, sold'
    la la, la'
    sold sold, sold'

    %127
    la la, la'
    sold sold, sold'
    la la, la'

    %130
    sold sold, sold'
    la la, la'
    mi mi mi

    %133
    la4.\fermata

}

IVvlan = \relative do' {

    R4.*8
    do8 do do
    do4.

    %11
    do8 do do
    do4.\mbreak
    do8 do do

    %14
    la4.
    do8 do do
    do4 r8

    %17
    fa4 r8
    fa fa16 fa fa fa

    %19
    fa4 r8
    fa fa16 fa fa fa
    do'8 do,16 do do do

    %22
    sib'8 do,16 do do do
    la'8 do,16 do do do
    sol'8 do,16 do do do

    %25
    fa8. sol16 la8
    sib do do,\mbreak
    fa4 r8

    %28
    R4.*4
    do8 \p do16 do do do
    do4 r8

    %34
    R4.
    do8 do16 do do do
    do4 r8

    %37
    R4.
    do8 do16 do do do\mbreak
    sib'8 do,4
    do8. re16 do8

    %41
    la' do,4
    do8. re16 do8
    sol'8 do,4

    %44
    do8[si] do
    r sol' do,
    si[do] fa

    %47
    mi re4\tr
    sol8 \f sol sol
    sol mi mi

    %50
    sol mi mi\mbreak
    sol mi mi
    do8 do16 do do do

    %53
    do8 do16 do do do
    do8 do16 do do do
    do8 do16 do do do

    %56
    fa8 sol sol
    do,4 r8
    R4.*5\mbreak

    %63
    la'8\p la la
    sib sib sib
    si si si

    %66
    do do do
    dod dod dod
    re re re

    %69
    re re re
    do\f do16 do do do
    do4 r8

    %72
    do,4 r8\mbreak
    do4 r8
    R4.*7

    %81
    do'4\f do8
    do4 r8
    mi,8\p mi16 mi mi mi\mbreak

    %84
    do'8 do16 do do do
    sol8 sol16 sol sol sol
    mi4 r8

    %87
    R4.*2
    do8 do do
    do4.

    %91
    do8 do do
    do4.
    do8 do do

    %94
    do4.
    fa4 r8\mbreak
    fa8 fa16 sol la sol

    %97
    fa4 r8
    fa8 fa16 sol la fa
    do'8 do,16 do do do

    %100
    sib'8 do,16 do do do
    la'8 do,16 do do do
    sol'8 do,16 do do do

    %103
    fa8. sol16 la8
    sib do do,
    fa,4.\fermata

    %106
    re''8 re, re'
    la la, la'\mbreak
    re8 re, re'

    %109
    la la, la'
    la la, la'
    re8 re, re'

    %112
    la la, la'
    re8 re, re'
    la la, la'

    %115
    re8 re, re'
    la la, la'
    re8 re, re'

    %118
    la la, la'
    re8 re, re'
    la la, la'

    %121
    re re, re'
    sold, sold, sold'
    la la, la'

    %124
    sold sold, sold'
    la la, la'
    sold sold, sold'

    %127
    la la, la'
    sold sold, sold'
    la la, la'

    %130
    sold sold, sold'
    la la, la'
    mi mi, mi'

    %133
    la4.\fermata

}

IValton = \relative do' {

    \autoBeamOff

    R4.*26
    r8 do fa
    mi[fa] sol

    %29
    fa[sol] la
    sol[fa] sol
    r fa la

    %32
    sol[fa mi]
    la[sol fa]
    sol[fa mi]

    %35
    la[sol fa]
    sib[la] sol
    la[sol] fa

    %38
    sol4 r8\mbreak
    sib do,4
    do8. re16 do8

    %41
    la' do,4
    do8. re16 do8
    sol'8 do,4

    %44
    do8[si] do
    r sol' do,
    si[do] fa

    %47
    mi re4\tr
    do4 r8
    R4.*8

    %57
    mi8 fa[sol]
    fa sol[la]
    mi fa[sol]

    %60
    fa sol[la]
    si, do[re]
    mi[re] do\mbreak

    %63
    r fa mib
    re16 [do re sib? la sib]
    sol'8[ la fa]

    %66
    mi16 [re mi do si do]
    la'8 [sib? sol]
    fa16 [mi fa re dod re]

    %69
    sib'16[la sol8 fa]
    mi[re] do
    r mi sol

    %72
    sib, [mi sol]\mbreak
    mi[sol sib]
    la16[sol la fa mi fa]

    %75
    sol[fa sol mi re mi]
    la[sol la fa mi fa]
    sol[fa sol mi re mi]

    %78
    fa8 sol la
    sol mi4\tr
    fa4 r8

    %81
    R4.
    r8 fa do
    sol'4.~\mbreak

    %84
    sol~
    sol
    do,8 sol' sib

    %87
    la sol fa
    sol [fa] mi
    fa4.

    %90
    R4.*16
    la4 re,8
    dod[si] la\mbreak

    %108
    la'4 re,8
    dod[si] la
    r r mi'

    %111
    fa[mi] re
    mi[re] dod
    re4.

    %114
    r8 r mi
    fa mi re
    mi[re] dod

    %117
    re4.
    r8 r sol\mbreak
    fa[mi] re

    %120
    dod4.
    re
    r8 r mi

    %123
    do?[si] la
    fa'[mi] re
    do4.

    %126
    r8 r mi
    do[si] la
    fa'[mi] re

    %129
    do4.
    r8 r mi
    la4 do,8

    %132
    si4.
    la\fermata

}

IVtesto = \lyricmode {

    Lu -- ce pla -- ci -- da_e se -- re -- na
    il suo vol - - - - to_a noi spe -- dì.

    Lu -- ce pla -- ci -- da lu -- ce pla -- ci -- da e se -- re -- na
    il suo vol -- to_a noi spe -- dì.

    Lu -- ce pla -- ci -- da_e se -- re -- na e se -- re -- na il suo
    vol - - - - - - to il suo vol - - - - - - to a noi spe -- dì, il suo vol -- to il suo vol -- to a noi spe -- dì.

    In un gior -- no sì se -- re -- no
    fe -- li -- ce di -- ver -- rà e chia -- ro il pren -- de -- rà
    l’au -- gu -- sta men -- te,
    fe -- li -- ce di -- ver -- rà e sag -- gio_il pren -- de -- rà
    l’au -- gu -- sta men -- te

}

IVbcn = \relative do {

    fa8 fa, fa
    fa' fa16 sol la sol
    fa8 fa, fa

    %4
    fa' fa16 sol la sol
    fa8 fa16 sol la sol
    fa8 fa16 sol la sol

    %7
    fa8 fa sib,
    do4 r8
    fa fa, fa

    %10
    fa' fa16 sol la sol
    fa8 fa, fa
    fa' fa16 sol la sol\mbreak

    %13
    fa8 fa16 sol la sol
    fa8 fa16 sol la sol
    fa8 fa, fa

    %16
    do'4 r8
    fa4 r8
    fa fa16 fa fa fa

    %19
    fa4 r8
    fa fa16 fa fa fa
    do'8 do,16 do do do

    %22
    sib'8 do,16 do do do
    la'8 do,16 do do do
    sol'8 do,16 do do do

    %25
    fa8. sol16 la8
    sib do do,\mbreak
    fa4 r8

    %28
    do do' do,
    fa, fa' fa,
    do' do16 do do do

    %31
    do4 r8
    R4.
    do8 do16 do do do

    %34
    do4 r8
    R4.
    do8 do16 do do do

    %37
    do4 r8
    R4.\mbreak
    do8 do16 do do do

    %40
    do4 r8
    do8 do16 do do do
    do4 r8

    %43
    do8 do16 do do do
    do4 r8
    do do16 do do do

    %46
    sol'8 mi re
    do16 fa sol8 sol,
    do' do, do

    %49
    do do16 re mi re
    do8 do, do\mbreak
    do' do16 re mi re

    %52
    do8 do16 do do do
    do8 do16 do do do
    do8 do16 do do do

    %55
    do8 do16 do do do
    fa8 sol sol
    do,4 r8

    %58
    fa4 r8
    do4 r8
    fa4 r8

    %61
    sol4 r8
    do,4 r8\mbreak
    R4.*7

    %70
    do8 do16 do do do
    do4 r8
    do4 r8\mbreak

    %73
    do4 r8
    fa fa, fa
    do'' do, do

    %76
    fa fa, fa
    do'' do, do
    fa,4 fa'8

    %79
    sib do do,
    fa fa, fa
    fa' fa, fa

    %82
    fa'4 r8
    do8 do16 do do do\mbreak
    do8 do16 do do do

    %85
    do8 do16 do do do
    do4 do8
    fa sol la

    %88
    sib do do,
    fa8 fa, fa
    fa' fa16 sol la sol

    %91
    fa8 fa, fa
    fa' fa16 sol la sol
    fa8 fa16 sol la sol

    %94
    fa8 fa16 sol la sol
    fa4 r8\mbreak
    fa8 fa16 sol la sol

    %97
    fa4 r8
    fa8 fa16 sol la fa
    do'8 do,16 do do do

    %100
    sib'8 do,16 do do do
    la'8 do,16 do do do
    sol'8 do,16 do do do

    %103
    fa8. sol16 la8
    sib do do,
    fa,4.\fermata

    %106
    re''8 re, re'
    la la, la'\mbreak
    re8 re, re'

    %109
    la la, la'
    la la, la'
    re8 re, re'

    %112
    la la, la'
    re8 re, re'
    la la, la'

    %115
    re8 re, re'
    la la, la'
    re8 re, re'

    %118
    la la, la'
    re8 re, re'
    la la, la'

    %121
    re re, re'
    sold, sold, sold'
    la la, la'

    %124
    sold sold, sold'
    la la, la'
    sold sold, sold'

    %127
    la la, la'
    sold sold, sold'
    la la, la'

    %130
    sold sold, sold'
    la la, la'
    mi mi, mi'

    %133
    la4.\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 3/8
    %\override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 4. = 65
    s4.*104
    s8\mark\markup "[Fine]"s4\break
    s4.*28
    \bar "||"
    \mark\markup "D.C."

}

IVcrI = {
    <<\IVcrIn \forma>>

}

IVcrII = {
    <<\IVcrIIn \forma>>

}

IVvlI = {
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}

IVvla = {
    \clef alto
    <<\IVvlan \forma>>

}

IValto = {
    \new Voice = "luce"
    <<\IValton \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
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

        systems-per-page = #5

    }

    \header {
        title = \markup\smaller\center-column {"Cantata ”Qual in pioggia dorata” [RV 686]"}
        composer = \markup \center-column{"A. Vivaldi (1678 - 1741)"}
    }

    \markup \huge \column{"[1.] Recitativo - Qual in pioggia dorata"}

    \score {

        \new PianoStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 4/4 fa'8^\markup\center-align "[Alto]"  do'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \Ialto\global
                \new Lyrics \lyricsto "pioggia" \Itesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Basso""continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Ibc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 20)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #3
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

    \markup \huge \column{"[2.] All[egr]o - Ombre nere"}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Corno da caccia 1"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr1"
                    \IIcrI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Corno da caccia 2"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr2"
                    \IIcrII\global
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino 1]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIvlI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino 2]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 4/4 fa'4^\markup\center-align "[Alto]"do'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIalto\global
                \new Lyrics \lyricsto "ombre" \IItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Basso continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIbc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 16.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

    \markup \huge \column{"[3.] Recitativo - Così fia che baleni"}

    \score {

        \new PianoStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 4/4 re'8^\markup\center-align "[Alto]"  re'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIIalto\global
                \new Lyrics \lyricsto "baleni" \IIItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Basso""continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 20)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #3
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

    \markup \huge \column{"[4.] All[egr]o - Luce placida e serena"}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Corno da caccia 1"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr1"
                    \IVcrI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Corno da caccia 2"}
                    \set Staff.midiInstrument = #"french horn"
                    \set Staff.shortInstrumentName = "cr2"
                    \IVcrII\global
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino 1]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IVvlI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Violino 2]"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IVvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IVvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 3/8\numericTimeSignature r8 do'4^\markup\center-align "[Alto]" fa'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IValto\global
                \new Lyrics \lyricsto "luce" \IVtesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Basso continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IVbc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 16)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #0.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
                \override StaffGrouper.staff-staff-spacing.padding = #0.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
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
