\language "italiano"
	%********************************** VARIABILI


\version "2.18.0"

su = \change Staff = up

giu = \change Staff = down

ten = _\markup \italic "ten"

cres = _\markup \italic "cres"

dolce = _\markup \italic "Dolce"

arco = _\markup \italic "arco"

pizz = _\markup \italic "pizzic"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

pad = \once \override TextScript.padding = #2.5

padall = \override TextScript.padding = #1.8

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

ds = _\markup \italic \right-align {"Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

tr = \trill

tu = _\markup \italic {"tutti"}

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


mbreak = { }



Ifln = \relative do'' {

   sol8
   mi(fa sol) do-. sol mi'16 sol si,8(do)
   sol(la si) mi-. re fa16 la si,8(do)
   sol mi'16 sol si,8(do) sol re'16 fa si,8(do)

   %4
   sol do16 mi si8(do) fad(sol) r re\mbreak
   si16(do re) fa-. re do si la sol(la sib) dod mi(fa sol) sib-.
   sol8 mi16 dod sib8(la) sol'(fa) r mi

   %7
   re16(mi fa) la fa mi re do si(do re) fa sol(la si) re\mbreak
   si!8 lab16 fa si8(do) mib,(re) r sol
   do, mi16 sol sib8(la) si,! re16 fa la8(sol)

   %10
   mi16-. do(si la) sol'(fa) mi(fa) re-. si(la sol) fa'(mi) re(mi)
   do-. la(sol fa) mi'(re) do(re)\mbreak fa,(mi fa) sol la si do re
   mi(re mi) fa sol la si do si,8(do) r4

   %13
   r8 sol'-.\p si,(do) sol mi'16 sol si,8(do)
   r sol' re(mi) si fa'16 la si,8(re)\mbreak
   sol, mi'16 sol si,8(do) sol re'16 fa si,8(do)

   %16
   sol do16 mi si8(do)fad(sol) r sol\f
   do, mi16 sol sib8(la) si,! re16 fa la8(sol)
   mi16-. do(si la) sol'(fa) mi(fa)\mbreak re-. si(la sol) fa'(mi) re(mi)

   %19
   do-. la(sol fa) mi'(re) do(re) fa,(mi fa) sol la si do re
   mi(re mi) fa sol la si do si,8(do) r do\p
   mi,(fa sol) do sol mi'16 sol si,8(do)\mbreak  % fine sesta riga

   %22
   sol(la si) mi re fa16 la si,8(re)
   sol, mi'16 sol si,8(do) sol re'16 fa si,8(re)
   sol, do16 mi si8(do) fad(sol) r4

   %25
   r8 mi16 sol si,8(do) \once\stemUp sol si'16 re fad,8(sol)\mbreak
   do, la'16 do fad,8(sol) fad,(sol) r re'
   sol, si16 re fa8(mi) fad, la16 do mi8(re)

   %28
   si16-. sol(fad mi) re'(do) si(do) la-. fad(mi re) do'(si) la(si)\mbreak
   sol'-. mi(re do) si'(la) sol(la) do,(si do) re mi fad sol la
   si,(la si) do re mi fad sol fad,8(sol) r re'\f

   %31
   si(do re) sol re si'16 re fad,8(sol)\mbreak
   re(mi fad) si la do16 mi fad,8(sol)
   re si'16 re fad,8(sol) re la'16 do fad,8 (sol)

   %34
   re sol16 si fad8(sol) dod,(re) r re
   fa!16-. mi(re mi)\mbreak do'(si) la(si) do,(si do) re mi fad sol la
   si,(la si) do re mi fad sol fad,8(sol) r4

   %37
   r2 r8 mi'16\p sol si,8(do)
   r2 r8 fa16 la dod,8(re)
   la fa'16 la\mbreak dod,8(re) la mi'16 sol dod,8(mi)

   %40
   la, re16 fa dod8(re) sold(la) r4
   r r8 fa sol,(la si) r
   r4 r8 sol' la,(si do) r

   %43
   R1\mbreak
   r4 r8 sol mi(fa sol) r
   r sol'-. si,(do) sol mi'16 sol si,8(do)

   %46
   r sol'-. re(mi) si fa'16 la si,8(re)
   sol, mi'16 sol si,8(do) sol re'16 fa si,8(re)\mbreak %fine pagina
   sol, do16 mi si8(do) sol fa'16 la si,8(re)

   %49
   sol, mi'16 sol si,8(do) sol re'16 fa si,8(re)
   sol, do16 mi si8(do) fad(sol) r sol
   do, mi16 sol \mbreak sib8(la) si,! re16 fa la8(sol)

   %52
   mi16-. do(si la) sol'(fa) mi(fa) re-. si(la sol) fa'(mi) re(mi)
   do-. la(sol fa) mi'(re) do(re) fa,(mi fa) sol la si do re\mbreak
   mi(re mi) fa sol la si do si,8(do) r re\f

   %55
   si16(do re) fa re do si la sol(la sib) dod mi(fa sol) sib
   sol8 mi16 dod sib8(la) sol'(fa)\mbreak r mi
   re16(mi fa) la fa mi re do si(do re) fa sol(la si) re

   %58
   si!8 lab16 fa si8(do) mib,(re) r sol
   do, mi16 sol sib8(la)\mbreak si,? re16 fa la8(sol)
   mi16-. do(si la) sol'(fa) mi(fa) re-. si(la sol) fa'(mi) re(mi)

   %61
   do-. la(sol fa) mi'(re) do(re) fa,(mi fa) sol la si do re
   mi(re mi) fa sol la si do si,8(do) r4\fermata
   r8 do16 mi sold,8(la) r si'16 re fa,8(mi)

   %64
   r la16 do red,8(mi) r sold16 si red,8(mi)
   la16(si do8)~do16 si(la sold) la8 do,16 mi sold,8(la)\mbreak
   fa'16(sol la8)~la16 sol( fa mi) fa(mi fa) la do8(si)

   %67
   sol16(la si8)~si16 la(sol fad) sol8 mi16 sol lad,8(si)
   la'?16(si do8)~do16 si(la sol)\mbreak fad(mi red) fad si8-. r
   r sol16 si red,8( mi) si fad'16 la \once\slurDashed red,8 (fad)

   %70
   si, mi16 sol red8(mi) do'(si) r4
   R1
   r2 r4 r8 si\f \mbreak

   %73
   sol16-. mi(re dod) si'(la) sol(la) fad-. red(dod si) la'(sol) fad(sol)
   mi-. do(si la) sol'(fad) mi(fad) la,(sol la) si dod red mi fad
   sol(fad sol) la si dod red mi\mbreak red,8(mi) r4

   %76
   r8 do16\p mi sold,8(la) r8 do16 mi sold,8(la)
   r re16 fa sold,8 la r16 si(la sold) fa'(mi) re(mi)\mbreak
   do(re mi8)~mi16 re(do si) mi(fa sol8)~sol fa16 mi

   %79
   fa(sol la8)~la16 sol(fa mi) fad (sol la8)~la16 sol la fad
   si1~\mbreak
   si8 do,16(re mi fa sol la) sib8(la) r4

   %82
   r16 sol(fa mi) re'(do) si(do) \appoggiatura la8 sold4 r8 si,16(do32 re)
   do8 si16 sold la8 sol16 mi\mbreak re'8 do16 la si8 do16 re
   mi,8 do'16 si la8 sold la4 r8 do

}

Ivocen = \relative do' {

    \autoBeamOff
    r8
    R1*11
    r2 r4 r8 do
    mi,[fa] sol mi' re16[si] do8 r mi

    %14
    sol,[la] si\mbreak sol' fa16[mi] fa8 r  sol,-\tweak Y-offset #-1 -\tweak X-offset # +3 ^\markup {\musicglyph "scripts.prallup" }
    \grace s1 sol'4 fa16[mi] re[do] -\tweak Y-offset #-1 -\tweak X-offset # +2 ^\markup {\musicglyph "scripts.prallup" } \grace s1 fa4 mi16[re] do[si]
    do[(re mi sol] fa8) mi16 fa re4 r

    %17
    R1*3
    r2 r4 r8 sol
    do,[(re)] mi r r4 r8 sol

    %22
    si,[(do)] re r r4\mbreak r8 sol,
    mi'[fa] sol do, si\tr[la] sol fa'
    mi[fa] sol do, si[la] sol re'\mbreak

    %25
    mi4 re16[do] si[la] -\tweak Y-offset #-1 -\tweak X-offset # +2 ^\markup {\musicglyph "scripts.prallup" } \grace s1 re4 do16[si] la[sol]
    la[(si do mi] re8) do16 re si8 sol fa'4~\mbreak
    fa8 mi r mi mi16 do la8 r4

    %28
    re~re16[mi re mi] re4~re16[mi do re]
    mi[sol fad mi]\mbreak re[do si do] la[sol la si] do[re mi fad]
    sol8 re si la16 sol sol4 r

    %31
    R1*5
    r2 r4 r8 re'\mbreak
    si[(do)] re sol, fa'16[re] mi8 r mi

    %38
    dod[re] mi la, sol'16[mi] fa8 r la\mbreak
    fa[sol] la re, dod[si] la sol'
    fa[sol] la re, dod[(si)] la dod\mbreak

    %41
    re[(mi)] fa re si[(la)] sol si
    mi[fa] sol mi do [si] la do
    -\tweak Y-offset #-1 -\tweak X-offset # +2 ^\markup {\musicglyph "scripts.prallup" } \grace s1 fa4 mi16[re] do[si] fa'8.[sol32 la] sol16[fa] mi[re]

    %44
    do[(si la sol] fa'8)mi16 re do4 r8 do
    mi,[fa] sol mi'\mbreak re16[si] do8 r mi
    sol,[la] si sol' fa16[mi] fa8 r sol,

    %47
    sol'4 fa16[mi] re[do] fa4 mi16[re]\mbreak do[si]
    do[(re mi sol] fa8) mi16 fa \grace mi8 re4 r8 fa
    mi[fa] sol do, si[(la)] sol fa'

    %50
    mi[fa] sol\mbreak do, si la16 sol sol'4~
    sol16[mi] do8 r do fa16 re si8 r4
    sol4~sol16[la sol la]\mbreak sol4~sol16[la fa sol]

    %53
    la[do si la] sol[fa mi fa] re[do re mi] fa[sol la si]
    do8 sol \appoggiatura fa'16 mi8 re16 do do4 r
    R1*7

    %62
    r2 r4 r8\fermata mi
    do16[si la si] do[re mi fa] si,[fa' mi re] do[si la sold]
    la8 [do16 mi]  la8 do, do[(si)] r si\mbreak

    %65
    do16[re mi8]~mi16 re do[(si)] do[re mi8]~mi re16 dod
    re[mi fa8]~fa16 mi[re] dod\mbreak re8 la r red
    mi16[fad sol8]~sol16 fad[mi] red mi[fad sol8]~sol fad16 mi\mbreak

    %68
    fad[sol la8]~la16 sol[fad] mi red[mi fad red] si8 la
    sol[la] si mi red16[(mi red mi] fad8)\mbreak dod16 si
    sol'8[(la16 sol)] fad[mi] red[(mi)] la,4 r8 fad'

    %71
    sol[(fad16 red] mi8) re?16 si\mbreak la'8[(sol16 mi] fad8) sol16 la
    si,8 sol'16[(fad mi8)] red mi4 r
    R1*2

    %75
    r2 r4 r8 si\mbreak
    do16[re mi8]~mi16 re do[(si)] la[si do8]~do si16 la
    si[do re8]~re16 do[si] la\mbreak sold8[la16 si] mi,8 sold

    %78
    la16[si do8]~do16 si[la] sold dod16[re mi8]~mi re16 dod
    re[mi fa8]~fa16\mbreak mi[(re)] dod red[mi fad8]~fad16[mi fad red]
    mi8[mi,16 fad]sold[la si do] re![mi re do] re[do re si]

    %81
    do[si la si] do[re mi fa] sol[la sol fa]\mbreak sol[fa sol mi]
    fa[mi re mi] fa4~fa16[mi re do] si8 mi,16 mi'
    mi8[(re16 si] do8) re16 mi fa8[(mi16 do] re8) mi16 fa\mbreak

    %84
    do[(fa mi re] do8\tr) si16 la la4 r

}

Itesto = \lyricmode {

   Ach, ziehe _ die Seele _ mit Seilen _ der Liebe, _

   o Je --  su, ach zei -- ge dich kräf -- tig  in ihr,

   ach, ziehe _ die Seele _ ach, ziehe _ die Seele _ mit Seilen _ der Liebe, _

   o Je -- su, ach zei -- ge dich kräf -- tig  in ihr, o Je -- su, ach zeige _ dich

   kräf - - - - - - tig kräftig _ in ihr,

   ach, ziehe _ die Seele _ mit Seilen _ der Liebe, _

   ach, zie -- he die See -- le mit Sei -- len der Lie -- be,

   ach, ziehe _ die Seele _ mit Seilen _ der Liebe, _ o

    Je -- su, ach zei -- ge dich kräf -- tig in ihr,

    ach, ziehe _ die Seele _ mit Seilen _ der Liebe, _ o

    Je -- su, ach zei -- ge dich kräf -- tig in ihr,

    ach, ziehe _ die Seele _ mit Seilen _ der Liebe, _ o

    Je -- su, ach zeige _ dich kräf - - - - -  - tig, kräftig _ in ihr.

    Er -- leuch - - - - - te sie er -- leuch -- te sie, dass sie dich

    gläu -- big er -- kenne, _  gib, dass sie mit hei -- ligen _

    Flam -- men ent -- bren -- ne, ach wür -- ke ein gläu  -- biges _

    Dür --  sten nach dir, ach würke _ ein gläu  -- biges _

    Dür --  sten nach dir,

    er -- leuch -- te sie, dass sie dich

    gläu -- big er -- ken --  ne,  gib, dass sie mit hei -- ligen _

    Flam -- men ent -- bren - - - - - - - - - - - ne,

    ach wür -- ke ein gläu  -- biges _

    Dür --  sten nach dir.

}

Ibcn = \relative do {

   mi8-.
   do(re mi) r r mi(re do)
   si(do re) r r la'(sol fa)
   mi4 r si r

   %4
   do8-. mi(re do) sol'-. si,(do re)
   sol,(la si) re-. fa (mi) r re\mbreak
   re'(dod) r la re,(mi fa) la-.

   %7
   si,(do re) fa-. sol,(la si) do-.
   re(do) r fad-. mi-. la(sol fa?)
   mi r fa r re r mi \parenthesize r

   %10
   do r re r si r\mbreak do r
   la r fa r si (la) do [(si)]
   do la' sol[sol,] do4 r8 mi^\p

   %13
   do(re mi) r r mi(re do)
   si(do re) r r la'(sol fa)\mbreak
   mi4 r si r

   %16
   r8 mi(re do) sol'-. la(sol fa!)
   mi r fa r re r mi r
   do r re r si r do r

   %19
   la r fa r si(la) do[(si)]\mbreak
   do la' sol[sol,] do sol do,\noBeam r
   r4 r8 mi'-. ^\markup {[\musicglyph #"p"]} fa(mi re) do-.

   %22
   r4 r8 si'-. do(si la) sol-.
   do4 r fa, r
   r8 re mi la, sol(la si) sol\mbreak

   %25
   do4 r si r
   r8 la re re, sol(la si) sol
   do r do' r la r si r

   %28
   sol r mi r fad r sol r
   do, r la r\mbreak fad r re r
   r sol re' re, sol-. si\f(do re)

   %31
   sol(la si) r r si(la sol)
   fad(sol la) r r mi(re do)
   si4 r fad' r

   %34
   sol8-. si(la sol)\mbreak re'-. re,(do si)
   do r mi r fad(mi) sol[(fad)]
   sol mi si[re] sol, si^\p(do re)

   %37
   sol(la si) r r do,(re mi)
   la,(si dod) r r re(mi fa)\mbreak
   r4 r8 fa sol4 r8 dod,

   %40
   re4 r8 sib la(si dod) sol'-.
   fa(mi re) r r fa(mi re)
   do(re mi) r r sol(fa mi)\mbreak

   %43
   re(mi fa) la-. si,(do re) fa-.
   mi(fa sol)[sol,] do(re mi) re-.
   do(re mi) r r mi(re do)

   %46
   si(do re) r r la'(sol fa)
   mi4 r\mbreak si r
   r8 mi(re do) sol'(fa mi) re-.

   %49
   do4 r fa r\mbreak  %%% fine pagina OK OK
   r8 re mi la, sol(la si) sol-.
   mi r fa r re' r si r

   %52
   do r la r si r do r
   fa r re r si r sol r\mbreak
   r do sol' sol, do-. mi^\f(re do)

   %55
   sol'(la si) re-. fa,(mi) r re
   re'(dod) r la re,(mi fa)  la-.
   si,(do re) fa-.sol,(la si) do\mbreak

   %58
   re(do) r fad sol-. la(sol fa?)
   mi r fa r re r mi r
   do r re r si r do r

   %61
   la r fa r si[(la)] do(si)\mbreak
   do do' sol sol, do,4\fermata r
   r8 do'^\p(si la) r sold(la si)

   %64
   r si(do) la-. r mi'(fad sold)
   r la re, mi r la mi sol?\mbreak
   r fa?(sol la) r re,(red) si

   %67
   r mi la, si r mi (fad sol)
   r la red, mi si la'(sol fad)
   mi4 r la r\mbreak

   %70
   r8 sol do la r red, fad si,
   mi(fad sol) sold-. la(si do) fad,-.
   sol mi si' si, mi(sol si) red^\f

   %73
   mi r dod r\mbreak  red r si r
   do! r la r red,(dod) mi[(red)]
   mi(do?) sol [si] mi, mi'\p(fad sold)

   %76
   la4 r8 mi fa?4 r8 do\mbreak
   re4 r8 fa mi(re do) si
   r do(re mi) r dod(si la) r

   %79
   fa'(sol la) r red,(dod si)
   r sold si re r si sold mi\mbreak
   r la(sol? fa!) r mi' dod la

   %82
   re(do? si!) re mi(fad sold) mi
   la4 r sold r
   r8 la, mi' mi, la4 r8 mi' _\markup\right-align\italic"Da Capo[dal segno]"

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <6>8
    s2 s8 <6> <6> s
    <6> <6> <6 4 2> s s <6> s <6 4 2>
    <6>2 <6 5>
    s8 <6> <6> s s4 s8 < [_+]>
    s4 <6 5> <4 2>8 <6\\ 5-> s <[6-] 4>
    <[6-] 4 2> <6 5> s <7 [_+]>s4 <6>
    <7>2 <7>
    <6>8 <6- 4> s<6 7 5> <6- 4>4 s8 <5 _!>
    <6>2 <6 5>
    s <6 5>
    <6 5>4 <6 5> <6 5>8 <6> <6 4 2> <6 5>
    s <6> <6 4> <5 3> s4 s8 <6>
    s4 <6> s8 <6> <6> s
    <6> <6> <6 4> s s <6> s <4 2>
    <6>2 <6 5>
    s8 <6> <6> s s2
    <6 5->2 <[6!] 5>
    <6 5> <6 5>
    <6 5>4 <6 5> <6 5>8 <6> <6 4 2> <6 5>
    s <6> <6 4> <5 3> s2

    %20
    s4 s8 <6> <6 4 2> <6> <6> s
    s4 s8 <6 4 2> <6 4 2>4 <4 2 6>
    s2 <6 4 2>
    s8 <6> <6> <6\\> s4 <6>
    s2 <6>
    s8 <[7]> <[_+]> <7> s4 <6 5>
    <4>8 <3> s4 <6\\ 5> <5\\>

    %28
    <6 5>4 <6 5> <6 5> s
    <7>2 <6 5>4 <7 [_+]>
    s4 <6 4>8 <5 [_+]> s4 <6 5>8 <[_+]>
    <6\\> s <6> s s<6> <6\\> s
    <6 5> s <6\\ 4 3> s s <6> <[_+]> <4\+ 2>
    <6>2 <6 5>
    s8 <6> <6\\> s s <[_+]> <6 4> <6>
    s4 <6> <6 5>8 <6> <6 4 2> <6 5>
    s4 <6>8 <[_+]> s <6> <6 5> <[_+]>
    s4 <6>8 s s <6> s <7 _+>
    <[_+]> s <6> s s s <6\\> <6>
    s4 s8 <6 5> <6 [4\+] 2>4 s8 <6 5>
    s4 s8 <6> <[_+]>4 s8 <6 4\+ 2>
    <6> <6\\> s s s <6 > <7 5 3> s
    s8 <6> <6> s s <6> <6> <6>

    %43
    <7>4 <6 4 2> <7 5> <6 4 3>
    <6> <7 4>8 <3> s4 <6>
    s <6> s8 <6> <6> s
    <6 > <6 5> <6 4 3> s s <6> s <4 2>
    <6>2 <6 5>
    s8 <6> <6> s s <6> s4
    s2 <6 4 2>

    %50 fine pagina  Fin qui OK
    s8 <6> <6> <6> s4 <6>
    <6>2 <6 5>4 <6 5>
    s <7> <6 5>2
    s <6 5>4 <7>
    s <6 4>8 <5 3> s <6> <6>4
    s <6> <6 4 2>8 <6\\ 5-> s <6- 4>
    <6- 4 2> <6 5>  s <7 [_+]> <4> s <6> <[_+]>
    <7>4 <6 4 3> <7> <6 5>
    <6 4 3>8 <6- 4> s <7- 5> <4>4 <5 3>
    <6>2 <6 5>
    <6 5> <6 5>
    <6 5>4 <6 5><6 5>8 <6> <6 4 2> <6 5>
    s4 <6 4>8 <5 3> s2
    s8 <6> <6\\> s  s <6 5> s <6\\>
    s <7> <6> s s <_+> <6\\> <6>
    s  s <7 5> <_+>  s s <_+> <6 4\+ 2>
    s <6> <7 5> < [_+]> s <[3]> <7 5> <7 [_+]>
    s4 <7 5>8 < [_+]> s s <6\\> <6>
    s <7> <7 5> s <_+> <6> s <6\\>
    s2 <6 [4\+] 3>

    %70
    s8 <6> <6> <6 5> s <6 5> <6\\> <7 _+>
    s8 <6\\> <6> <6 5> s <6 4> <6 [4\+] 3> <6>
    <6>8 s <6 4> <[5\\] 3> s s <_+> <6>
    s4 <6 5> <6 5> <7 _+>
    <5> <6\\ 5> <6 5>8 <6> <6\\ 4> <6 5>
    s4 <6>8 <_+> s4 <7>8 <6 5>
    s4 s8 <7 _+> <5>4 s8 <6>
    <6 5>4 s8 <6 4 3> <_+>4 <6>8 <6\\>
    s s <7 5> <_+> s <6 5!> <6> <7  [_+]>
    s <6> <7 5> < [_+]> s <6 5> <6> <7 _+>
    s <6> <6\\ 4> <6 [4\+] 2> s <6\\ 4> s <6 5>
    s s <6 4 2> <6> s <6\\> <6 5> s
    s4 <7> <9 _+>8 <7> <6 5> s
    s2 <7 5>
    s4 <6 4>8 <5 _+>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 50
    \partial 8 s8
    \mark\markup\smaller {\musicglyph "scripts.segno" }
    s1*62\break
    s1*22
    \bar "||"
    \mark\markup\smaller {\musicglyph "scripts.segno" }

}

Ifl = {
    <<\Ifln \forma>>

}

Ivoce = {
    \new Voice = "ach"
    <<\Ivocen \forma>>
}



Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}
#(set-global-staff-size 17)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \con \terzine

}

\paper {

    systems-per-page = #5
    print-first-page-number = ##t
    first-page-number = #2

}

    \markup \huge {"Aria «Ach, ziehe die Seele» [BWV 96]"}

    \score {

        \new ChoirStaff	<<

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Travers[iere]""Solo"}
                \set Staff.midiInstrument = #"flute"
                \Ifl \global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Tenore"}
                \incipit { \clef tenor \key do\major\time 2/2  r8}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \Ivoce \global
                \new Lyrics \lyricsto "ach" \Itesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Continuo"}
                \set Staff.midiInstrument = #"cello"
                \Ibc \global
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width = 1.5\cm

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
