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



IvlIn = \relative do'' {

    fa4 r4 r8 do re16 re, mib' re
    do8 do16 fa fa fa, fa sib sol do sib sib fa fa' mib fa
    re4 r r2\mbreak

    %4
    r r8 do re16 re, mib' re
    do do' do la fa fa, fa sib sol do sib sib fa fa' mib fa
    re4 r  r r8 fa

    %7
    do8 la r sol16 la sib8 re re la\mbreak
    r2 r4 r8 do'
    fa, fa, la do sib sib la re

    %10
    mib sib sib' do fa, sib, fa16 fa' mib fa
    re8 re,16 re' fa fa, fa sib sol do sib sib fa fa' mib fa
    re fa fa sib do8. do16 sib4 r

    %13
    r8 la16 sib do re do re sib do sib do la8 do
    r mib, re16 mib re do sib8 sib'16 sib sib8. la16\mbreak
    sib8 re do4 re r

    %16
    r4 r8 re re do16 do sib8 la
    r4 r8 sol sol fa16 fa fa8 mib
    r2 r4 r8 la

    %19
    si dod16 dod re8 la r2\mbreak
    r r4 r8 la
    la sib r sib sib16 sol do,8~do16 sib do sib

    %22
    la4 r r2
    R1*3
    r8 do' la la, r re' sib sib,

    %27
    r do' lab fa\mbreak r re' sib sol
    r mib do sol r sol' re sib
    r sol' la8. la16 fa la sib do

    %30
    re8 la mi fa r la la, fa'16 sol la8 la,\mbreak
    r fa'16 sol la8 mi r re mi8. mi16
    re4 r r8 do re16 re, mib' re

    %33
    do8 do16 fa fa fa, fa sib sol do sib sib fa fa' mib fa
    re4 r r2\mbreak
    r r8 do re16 re, mib' re

    %36
    do do' do la fa fa, fa sib sol do sib sib fa fa' mib fa
    re4 r  r r8 fa
    do8 la r sol16 la sib8 re re la\mbreak

    %39
    r2 r4 r8 \parenthesize do'
    fa, fa, la do sib sib la re
    mib sib sib' do fa, sib, fa16 fa' mib fa

    %42
    re8 re,16 re' fa fa, fa sib sol do sib sib fa fa' mib fa
    re fa fa sib do8. do16 sib4 r
    r8 la16 sib do re do re sib do sib do la8 do

    %45
    r mib, re16 mib re do sib8 sib'16 sib sib8. la16\mbreak
    sib8 re do4 re r

}

IvlIIn = \relative do'' {

    re4 r r8 la16 sol fa sol la fa
    la8 la r re sib16 fa sib' sol do8. do16
    sib4 r r2\mbreak

    %4
    r2 r8 la,16 sol fa sol la fa
    la8 la r re sib16 fa sib' la do8. do16
    sib4 r r r8 re,

    %7
    la do r do sol sib la fa
    r2 r4 r8 sol'\mbreak
    re8 re, do' fa mib16 fa mib fa re8 fa

    %10
    sol sol, re' la' re,16 mib fa8 do8. do16
    sib4 r8 re sib16 fa sib' sol do8. do16
    sib re, re fa fa fa mib fa\mbreak re4 r8 re16 mib

    %13
    fa sol fa sol mib fa mib fa re8 fa r la16 sib
    do re do re sib do sib la sol8 fa16 sol do,8. do16
    re8 sib'16 sib sib8. la16\mbreak sib4 r

    %16
    r r8 re, mi fad16 fad sol8 re
    r4 r8 sol la si16 si do8 sol
    r2 r4 r8 la

    %19
    la sol16 sol sol8 fa r2\mbreak
    r r4 r8 do
    do re r fa do' fa, sol4

    %22
    fa r r2
    R1*3\mbreak
    r4 r8 la [sol re] r sol

    %27
    do, do, r fa' [re sib] r sol'
    mib do r mib [do sol] r re''
    la re, re16 do re do\mbreak sib8 re~re16 mi fa sol

    %30
    la8 la, r fa'16 sol la8 la, r la'16 si
    dod8 la r la16 sol fa8 la la,16 la' sol la
    fa4 r r8 la,16 sol fa sol la fa

    %33
    la8 la r re sib16 fa sib' sol do8. do16
    sib4 r r2\mbreak
    r2 r8 la,16 sol fa sol la fa

    %36
    la8 la r re sib16 fa sib' la do8. do16
    sib4 r r r8 re,
    la do r do sol sib la fa

    %39
    r2 r4 r8 sol'\mbreak
    re8 re, do' fa mib16 fa mib fa re8 fa
    sol sol, re' la' re,16 mib fa8 do8. do16

    %42
    sib4 r8 re sib16 fa sib' sol do8. do16
    sib re, re fa fa fa mib fa\mbreak re4 r8 re16 mib
    fa sol fa sol mib fa mib fa re8 fa r la16 sib

    %45
    do re do re sib do sib la sol8 fa16 sol do,8. do16
    re8 sib'16 sib sib8. la16\mbreak sib4 r

}

Isopranon = \relative do'' {

    \autoBeamOff

    r8 fa16 mib re8 do16 sib fa'8 do sib16[(do)] la[(sib)]
    do8 do r sib sib16 la sib sib sib8.[(la16)]\mbreak
    sib4 r8 la16 sib do[re do re] mib[fa mib fa]

    %4
    re8 mi!16 fa fa8. mi16[(fa8)] do16 do sib8 la16 sib
    do8 do16 fa re8 sib\mbreak sib16[(la)] sib8 sib8.[(la16)]
    sib4 r r2

    %7
    r8 la16 sib do[re do re] sib[do sib do] re8 do
    r4 r8 re16 mib fa[sol fa sol] mib[fa mib fa]\mbreak
    re8 sib r do16 re mib8 sib r4

    %10
    r8 mib fa mib re16[(do)] sib8 sib8. la16(
    sib8) fa' re sib sib16[(la)] sib8 sib8. la16(
    sib8) re16 re do4 \mbreak re r

    %13
    R1*2
    r2 r4 r8 re
    re do16 do do8 sib r2

    %17 OOKK
    r r4 r8 do
    do sib16 sib sib8 la r2
    r4 r8 la sib4 sib8 si\mbreak

    %20
    do16[re do re] do8 do r do do la
    r re re16[mi re mi] do2
    do4 r8 la si dod16 dod re8 la

    %23
    r4 r8 sol la si16 si do8 sol\mbreak
    r4 r8 la si dod16 dod re8 la
    R1

    %26
    r8 do re4 re8 re mib16[fa mib fa]
    mib8 do r fa fa re r re
    do sol16 sol mib'[fa mib fa]\mbreak mib8 do16 sol sol[la sib do]

    %29
    re[do sib do] la4 sib8 sib la re16 re
    mi4 la, r8 re mib16[fa mib re]
    dod8 re4 dod8 re la la4\mbreak

    %32
    la8 fa'16 mib re8 do16 sib fa'8 do sib16[(do)] la[(sib)]
    do8 do r sib sib16 la sib sib sib8. la16(\mbreak
    sib4) r8 la16 sib do[re do re] mib[fa mib fa]

    %35
    re8 mi!16 fa fa8. [(mi16)] fa8 do16 do sib8 la16 sib
    do8 do16 fa re8 sib\mbreak sib16[(la)] sib8 sib8. la16(
    sib4) r r2

    %38
    r8 la16 sib do[re do re] sib[do sib do] re8 do
    r4 r8 re16 mib fa[sol fa sol] mib[fa mib fa]\mbreak
    re8 sib r do16 re mib8 sib r4

    %41
    r8 mib fa mib re16[(do)] sib8 sib8. la16(
    sib8) fa' re sib sib16[(la)] sib8 sib8. la16(
    sib8) re16 re do4 re r

    %44
    R1*3

}

ItestoI = \lyricmode {

    Pro -- pe -- rate _ fi -- de -- les, pro -- pe -- rate _ fi -- de -- les, pro -- pe -- ra -- te, pro -- pe -- ra - - te

    fi -- de -- les, pro -- pe -- ra -- te fi -- de -- les, fi -- de -- les pro -- pe -- ra -- te, pro -- pe -- ra - - te pro -- pe -- ra - - te,

    pro -- pe -- rate, _ fi -- de -- les pro -- pe -- ra -- te, fi -- de -- les pro -- pe -- ra -- te, pro -- pe -- ra -- te.

    Ad a -- quas flu -- entes, _ ad a -- quas flu -- entes, _ et mel -- lis tor -- ren - tes,

    gau -- dentes _ gu -- sta - te, ad a -- quas flu -- entes, _ ad a -- quas flu -- entes, _ ve -- nite _ po -- tate, _

    et mel -- lis tor -- ren - tes,

    gau -- dentes _ gu -- state, _ gau -- den - tes gu -- sta - - te, gau -- dentes _ gu -- state, _

    gu -- sta - - - te,  gu -- sta -- te.

    Pro -- pe -- rate _ fi -- de -- les, pro -- pe -- rate _ fi -- de -- les, pro -- pe -- ra -- te, pro -- pe -- ra - - te

    fi -- de -- les, pro -- pe -- ra -- te fi -- de -- les, fi -- de -- les pro -- pe -- ra -- te, pro -- pe -- ra - - te pro -- pe -- ra - - te,

    pro -- pe -- rate, _ fi -- de -- les pro -- pe -- ra -- te, fi -- de -- les pro -- pe -- ra -- te, pro -- pe -- ra -- te.

}

Ialton = \relative do' {

    \autoBeamOff

    r2 r8 fa16 fa fa8 mib16 fa
    fa8 fa r fa sol16 fa fa sol fa4
    fa8 re16 mi? fa[sol fa sol] la[sib la sib] sol[la sol la]

    %4
    sib8 sib16 la sol4 fa8 fa16 fa fa8 mib16 fa
    fa8 fa r fa sol16 fa fa sol fa4
    fa8 re16 mib fa[sol fa sol]\mbreak mib [fa mib fa] re8 fa

    %7
    r2 r8 re16 mib fa[sol fa sol]
    mib[fa mib fa] re8[fa] do4 sol'
    r8 re16 mib fa8 do r4 r8 la'16 sib\mbreak

    %10
    sol[la sol la] fa8 la sib fa fa4
    fa  r8 fa sol16 fa fa sol fa4
    fa8 fa16 fa fa4 fa r

    %13
    R1*2
    r2 r4 r8 re\mbreak
    mi fad16 fad sol8 re r4 r8 sol

    %17
    sol fa?16 fa fa8 mib r2
    r4 r8 la la sol16 sol sol8 fa
    r2 r8 fa sol16[fa sol fa]\mbreak

    %20
    sol8 sol la16[sol la sol] la8 la r la
    la fa r fa sol fa4 mi8
    fa4 r8 la la sol16 sol sol8 fad

    %23
    r4 r8 sol\mbreak sol fa16 fa fa8 mi
    r4 r8 la la sol16 sol sol8 fa
    r fa sol16[fa sol fa] sol8 sol la16[sol la sol]

    %26
    la8 la r fa re4 sol8 sol\mbreak
    mib4 mib8 fa fa4 fa8 sol
    sol sol r sol sol mib r sol

    %29
    la sol4 fad8 sol sol la la16 la
    la8 fa r la la2\mbreak
    sol8 [la8.] sib16[la sib] la[sol fa sol] mi?4

    %32
    fa r r8 fa16 fa fa8 mib16 fa
    fa8 fa r fa sol16 fa fa sol fa4
    fa8 re16 mi? fa[sol fa sol] la[sib la sib] sol[la sol la]

    %35
    sib8 sib16 la sol4 fa8 fa16 fa fa8 mib16 fa
    fa8 fa r fa sol16 fa fa sol fa4
    fa8 re16 mib fa[sol fa sol]\mbreak mib [fa mib fa] re8 fa

    %38
    r2 r8 re16 mib fa[sol fa sol]
    mib[fa mib fa] re8[fa] do4 sol'
    r8 re16 mib fa8 do r4 r8 la'16 sib\mbreak

    %41
    sol[la sol la] fa8 la sib fa fa4
    fa  r8 fa sol16 fa fa sol fa4
    fa8 fa16 fa fa4 fa r

    %44
    R1*3

}

ItestoII = \lyricmode {

    Pro -- pe -- rate _ fi -- de -- les, fi -- de -- les, pro -- pe -- ra -- te, pro -- pe -- ra - - - te

    fi -- de -- les, pro -- pe -- ra -- te fi -- de -- les, fi -- de -- les pro -- pe -- ra -- te, pro -- pe -- ra - - te pro -- pe -- ra - - - te,

    pro -- pe -- rate, _ pro -- pe -- ra - te,  pro -- pe -- ra -- te, fi -- de -- les pro -- pe -- ra -- te pro -- pe -- ra -- te.

    Ad a -- quas flu -- entes, _ ve -- nite _ po -- tate, _ ve -- nite _ po -- ta -- te, et mel -- lis tor -- ren - tes,

    gau -- dentes _ gu -- sta - - te, ad a -- quas flu -- entes, _ ad a -- quas flu -- entes, _ ve -- nite _ po -- tate, _

    et mel -- lis tor -- ren - tes, et mel -- lis tor -- ren -- tes, et mel -- lis tor -- ren -- tes

    gau -- dentes _ gu -- sta - - te, gau -- den -- tes,  gu -- sta -- te, gu -- sta - - - - te.

    Pro -- pe -- ra -- te fi -- de -- les, fi -- de -- les, pro -- pe -- ra -- te, pro -- pe -- ra - - - te

    fi -- de -- les, pro -- pe -- ra -- te fi -- de -- les, fi -- de -- les pro -- pe -- ra -- te, pro -- pe -- ra - - te pro -- pe -- ra - - - te,

    pro -- pe -- rate, _ pro -- pe -- ra - te,  pro -- pe -- ra -- te, fi -- de -- les pro -- pe -- ra -- te pro -- pe -- ra -- te.

}

Itenoren = \relative do' {

    \autoBeamOff

    r2 r8 la16 la sib8 do16 re
    la8 la r re mib16 do fa mib do4
    re r r2

    %4
    r\mbreak r8 la16 la sib8 do16 re
    la8 la r re mib16 do fa mib do4
    re r8 la16 sib do[re do re] sib[do sib do]

    %7
    la8[do sol mib']\mbreak re sib r la16 sib
    do[re do re] sib[do sib do] la[sib la sib] do[re sib do]
    re8 fa r4 r8 sib,16 do re8 la

    %10
    r do re mib fa re do4\mbreak
    re r8 re mib16 do fa mib do4
    re8 sib16 sib sib8.[(la16)] sib4 r

    %13
    R1*3
    r2 r4 r8 sol
    la si16 si do8 sol r2

    %18
    r4 r8 la\mbreak si dod16 dod re8 la
    r2 r8 re mib16[re mib re]
    mib8 mi fa16[mi fa mi] fa8 fa r do

    %21
    do sib r sib sib16[do la sib] sol4
    la r\mbreak r4 r8 re
    re do?16 do do8 si r4 r8 do

    %24
    do sib?16 sib sib8 la r4 r8 la
    sib4 si8 si do16[re do re] do8 do
    r4 r8 la\mbreak sib?16[la sib la] sib8 sib

    %27
    do16[sib do sib] do8 do re16[do re do] re8 re
    mib16[re mib re] mib8 mib r mib re4
    re8 re re4\mbreak re8 re fa fa16 fa

    %30
    mi4 re r8 fa mib?16[re mib? fa]
    mi?8[fa] mi4 fa8 re re8.[(dod16)]
    re4 r r8 la16 la sib8 do16 re

    %33
    la8 la r re\mbreak mib16 do fa mib do4
    re r r2
    r r8 la16 la sib8 do16 re

    %36
    la8 la r re mib16 do fa mib do4
    re r8 la16 sib do[re do re] sib[do sib do]
    la8[do sol mib']\mbreak re sib r la16 sib

    %39
    do[re do re] sib[do sib do] la[sib la sib] do[re sib do]
    re8 fa r4 r8 sib,16 do re8 la
    r do re mib fa re do4\mbreak

    %42
    re r8 re mib16 do fa mib do4
    re8 sib16 sib sib8.[(la16)] sib4 r
    R1*3

}

ItestoIII = \lyricmode {

    Pro -- pe -- rate _ fi -- de -- les, fi -- de -- les, pro -- pe -- ra -- te, pro -- pe -- ra -- te fi -- de -- les,

    fi -- de -- les, pro -- pe -- ra -- te, pro -- pe -- ra - - - te, pro -- pe -- ra - - - - te, pro -- pe -- ra -- te

    fi -- de -- les,  pro -- pe -- ra -- te, fi -- de -- les,

    pro -- pe -- ra -- te,  pro -- pe -- ra -- te.

    Ve -- nite _ po -- ta -- te, ve -- nite _ po -- ta -- te, et mel -- lis tor -- ren - tes,

    gau -- dentes _ gu -- sta - te, ve -- nite _ po -- tate, _ ve -- nite _ po -- tate, _

    et mel -- lis tor -- ren - tes, et mel -- lis tor -- ren -- tes, et mel -- lis tor -- ren - tes

    gau -- den -- tes, gu -- sta -- te, gau -- den -- tes,  gu -- sta -- te, gu -- sta - - te gu -- sta -- te.

    Pro -- pe -- ra -- te fi -- de -- les, fi -- de -- les, pro -- pe -- ra -- te, pro -- pe -- ra -- te fi -- de -- les,

    fi -- de -- les, pro -- pe -- ra -- te, pro -- pe -- ra - - - te, pro -- pe -- ra - - - - te, pro -- pe -- ra -- te

    fi -- de -- les,  pro -- pe -- ra -- te, fi -- de -- les,

    pro -- pe -- ra -- te,  pro -- pe -- ra -- te.

}

Ibasson = \relative do {

    \autoBeamOff

    r2 r8 fa16 mib re8 do16 sib
    fa'8 fa r sib mib,16 fa re mib fa4
    sib, r r2

    %4
    r r8 fa'16 mib re8 do16 sib
    fa'8 fa r sib mib,16 fa re mib fa4
    sib, r r r8 re16 mib

    %7
    fa [sol fa sol] mib[fa mib fa] sol8[sol,] re' fa\mbreak
    r2 r4 r8 sol16 la
    sib[do sib do] la[sib la sib] sol[la sol la] fa[sol fa sol]

    %10
    mib[fa mib fa] re8 do16 do sib do re mib fa4
    sib, r8 sib'\mbreak mib,16 fa re mib fa4
    sib,8 sib'16 sib, fa'4 sib, r

    %13
    R1*4
    r2 r4 r8 do
    re mi!16 mi fa8 fa, r2

    %19
    R1
    r2 r4 r8 fa'\mbreak
    fa re r re mi [fa] do4

    %22
    fa r r r8 re
    mi fad16 fad sol8 sol, r4 r8 do
    re mi16 mi fa8 fa, r2

    %25
    r8 re' mib16[re mib re]\mbreak mib8 mi fa16[mi fa mi]
    fa8 fa r fa sol16[fa sol fa] sol8 sol
    lab16[sol lab sol] lab8 la sib16[la sib la] sib8 si

    %28
    do16[si do si] do8 do,\mbreak r do' sib sol16 sol
    fad8 [sol] re4 sol,8 sol' fa? re16 re
    dod8 re r re dod8[re do re]

    %31
    mi re la'4 re,8 re la'[(la,)]
    re4 r\mbreak r8 fa16 mib re8 do16 sib
    fa'8 fa r sib mib,16 fa re mib fa4

    %34
    sib, r r2
    r r8 fa'16 mib re8 do16 sib
    fa'8 fa r sib mib,16 fa re mib fa4

    %37
    sib, r r r8 re16 mib
    fa [sol fa sol] mib[fa mib fa] sol8[sol,] re' fa\mbreak
    r2 r4 r8 sol16 la

    %40
    sib[do sib do] la[sib la sib] sol[la sol la] fa[sol fa sol]
    mib[fa mib fa] re8 do16 do sib do re mib fa4
    sib, r8 sib'\mbreak mib,16 fa re mib fa4

    %43
    sib,8 sib'16 sib, fa'4 sib, r
    R1*3

}

ItestoIV = \lyricmode {

    Pro -- pe -- rate _ fi -- de -- les, fi -- de -- les pro -- pe -- ra -- te, pro -- pe -- ra -- te fi -- de -- les,

    fi -- de -- les, pro -- pe -- ra -- te, pro -- pe -- ra - - - te, pro -- pe -- ra - - - - - te,

    fi -- de -- les,  pro -- pe -- ra -- te, fi -- de -- les, pro -- pe -- ra -- te,  pro -- pe -- ra -- te.

    Ad a -- quas flu -- entes, _ gau -- dentes _ gu -- sta - te, ve -- nite _ po -- tate, _ ve -- nite _ po -- tate, _

    et mel -- lis tor -- ren - tes, et mel -- lis tor -- ren -- tes, et mel -- lis tor -- ren - tes

    gau -- den -- tes, gu -- sta - te, gau -- den -- tes,  gu -- sta -- te, gu -- sta - - - te gu -- sta -- te.

    Pro -- pe -- ra -- te fi -- de -- les, fi -- de -- les pro -- pe -- ra -- te, pro -- pe -- ra -- te fi -- de -- les,

    fi -- de -- les, pro -- pe -- ra -- te, pro -- pe -- ra - - - te, pro -- pe -- ra - - - - - te,

    fi -- de -- les,  pro -- pe -- ra -- te, fi -- de -- les, pro -- pe -- ra -- te,  pro -- pe -- ra -- te.

}

Ibcn = \relative do {

    sib4 r r8 fa'16 mib re8 do16 sib
    fa'8 fa, r sib' mib,16[fa re mib] fa8 fa,
    sib sib' la fa r fa mib do

    %4
    sib sib' do do,\mbreak fa, fa'16 mib re8 do16 sib
    fa'8 fa, r sib' mib,16[fa re mib] fa8 fa,
    sib sib' la fa r  do sol' re16 mib

    %7
    fa8 fa, mib'16[fa mib fa] sol8 sol, re' fa
    do do' sib sib,\mbreak la la'16 sib do8 sol16 la
    sib8 sib, la' la, sol' sol, fa' fa,

    %10
    mib' mib re do sib16 do re mib fa8 fa,
    sib4 r8 sib' mib,16 [fa re mib] fa8 fa,
    sib sib fa' fa, sib4 r8 sib'\mbreak

    %13
    la fa r do sol' re16 mib fa sol fa sol
    mib fa mib fa sol8 re mib16 fa re mib fa8 fa,
    sib sib' fa fa, sib4 r8 sib'

    %16
    la la, sol' sol, la' re, sol sol, \mbreak
    re' re, do' do, fa' sol do do,
    re mi! fa fa, sol la re re,

    %19
    sol la re re, \clef tenor\key fa\major r8 re'' mib16 re mib re
    mib8 mi fa16 mi fa mi\mbreak fa8 fa, \clef bass\key fa\major r fa
    fa re r re mi fa do do,

    %22
    fa4 r8 fa' mi mi, re' re,
    mi' fad sol sol, re' re, do' do,
    re' mi fa fa, mi' mi, re' re,\mbreak

    %25
    r re' mib16 re mib re mib8 mi fa16 mi fa mi
    fa8 fa, r fa' sol16 fa sol fa sol8 sol,
    lab'16 sol lab sol lab8 la sib16 la sib la sib8 si\mbreak

    %28
    do16 si do si do8 do, do do' sib? sol
    fad sol re re, sol sol' fa? re
    dod re r re dod re do re

    %31
    mi re la' la, re re, la'' la,
    re4 sib r8 fa'16 mib re8 do16 sib
    fa'8 fa, r sib' mib,16[fa re mib] fa8 fa,

    %34
    sib sib' la fa r fa mib do
    sib sib' do do,\mbreak fa, fa'16 mib re8 do16 sib
    fa'8 fa, r sib' mib,16[fa re mib] fa8 fa,

    %37
    sib sib' la fa r  do sol' re16 mib
    fa8 fa, mib'16[fa mib fa] sol8 sol, re' fa
    do do' sib sib,\mbreak la la'16 sib do8 sol16 la

    %40
    sib8 sib, la' la, sol' sol, fa' fa,
    mib' mib re do sib16 do re mib fa8 fa,
    sib4 r8 sib' mib,16 [fa re mib] fa8 fa,

    %43
    sib sib fa' fa, sib4 r8 sib'\mbreak
    la fa r do sol' re16 mib fa sol fa sol
    mib fa mib fa sol8 re mib16 fa re mib fa8 fa,

    %46
    sib sib'16 sib, fa'8 fa, sib4 r

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 s4 <6>
    s2 s8 <6> s4
    s <6> s <6>8 <6 _->
    s <6 5> <4> <3> s4 <6>
    s2 s8 <6> s4
    s <6> s s8 <6>
    s4 <6> s2
    <_-> <6>4 <_->
    s <6> s <6>
    s <6> s2
    s s8 <6> s4
    s <4>8 <3> s2
    <6>4 s8 <_-> s <6> s4
    <6> s8 <6> s4 <4>8 <3>
    s4 <4>8 <3> s2
    <5>8 <6+> s4 s2
    <6!>4 s8 <_-> s <_!> s <_->
    <7> <5> <4> <3> <_!> <_+> s4
    <_!>8 <_+> s4 s8 <6> s4
    <6>2 s
    s8 <6> s <6> <6 5->4 <4>8 <3>
    s4 s8 <6> <5+> <6+> <4> <_+>
    <7> <5-> <4> <_!> <5> <6+> s4
    <7>8 <5-> <4> <3> <5+> <6+> <4> <3>
    s8 <6> s4 <6> s
    s s8 <6> <5>4 <6->
    <5> <6> s <5>8 <6>
    <_->4 <_-> <_-> <6>
    <6> <4+>8 <3> s4 <6>
    <6> s <6> <6 _->
    <6+> <4+> s <4+>
    s2 s4 <6>8 <_->
    s1
    s4 <6> s <6>
    s8 <6 5> <4> <3> s4 <6>8 <_->
    s2 <6 5>8 <6> <4> <3>
    s4 <6> s8 <_->  s <6>
    s4 <6> s <6 4>
    <_->2 <6>4 <_->
    s <6> <6-> <6>
    s <6>8 <6 _-> s4 <4>8 <3>
    s2 s8 <6> <4> <3>
    s4 <4>8 <3> s2
    <6>4 s8 <_-> s <6> s4
    <6> s8 <6> <6 5> <6> <4> <3>
    s4 <4>8 <3>

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 50
    s1*15
    \tempo 4 = 50
    s1*15
    \tempo 2 = 50
    s1*16
    \bar "|."

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

Isoprano = {
    \new Voice = "fideles1"
    <<\Isopranon \forma>>
}

Ialto = {
    \new Voice = "fideles2"
    <<\Ialton \forma>>
}

Itenore = {
    \new Voice = "fideles3"
    <<\Itenoren \forma>>
}

Ibasso = {
    \clef bass
    \new Voice = "fideles4"
    <<\Ibasson \forma>>
}



Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}



%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


IIsopranon = \relative do'' {

    \autoBeamOff

    r4 re8 sib mib4 mib8 mib
    dod4 dod r dod8 re
    re4 re8 re si4 si

    %4
    r si8 do? re4 re8 mib
    do4 do\mbreak do16[sol la si] do[re mib do]
    fa8.[mib16] re[mib do re] si8 si16 si do8 re

    %7
    sol,4 sol r do8 sol
    r mib'16 re do8 re16 mib\mbreak la,8 la r fa
    la la la sib do4 do

    %10
    mib8 mib16 mib mib8 re sib4 sib
    sib4. fa8 sol4 do8 sib
    la4 la re4. la8

    %13
    si4 mi8 re\mbreak dod dod re mi
    la,[ si16 dod] re4~re dod
    re r r2

}

IItestoI = \lyricmode {

    O quam dul -- ces li -- quores, _ quam su -- a -- ves hu -- mores, _ ex hox fon -- te be -- a -- to,

    pro - - - - fluunt _ in -- ces -- san -- ter, sem -- per, sem -- per hic a -- bun -- danter  _ mor -- tales _ pro -- pi -- nabunt, _

    Cœ -- li ju -- cun -- di -- ta -- tes, et di -- vi -- nas po -- tabunt, _ et di -- vi -- nas po -- tabunt, _ vo -- lup -- ta - - tes.

}

IIbcn = \relative do {

    sol'1~
    sol
    fa2~fa

    %4
    fa1
    mib
    re2~\mbreak re

    %7
    do1
    do2 fa~
    fa mib

    %10
    mib? re
    re8 do re sib mib re mi do\mbreak
    fa sol fa mi re mi fa re

    %13
    sol fad sold mi la sol? fa mi
    fa mi fa re la'4 la,
    re r r2

}



IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <5>2 <6->
    <4+ 2>1
    <6>2 <4+ 2>
    <4+ 2>1
    <6>
    <5>2 <6!>
    <_->1
    <_->
    s2 <6>
    s <6>
    <6>4 <6> <5> <6>
    s2 s4 <6>
    <_!> <6> <_+> <6>
    s <6> <4> <_+>

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 50
    s1*15
    \bar "|."

}

IIsoprano = {
    \new Voice = "dulces"
    <<\IIsopranon \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}



%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}



IIIvlIn = \relative do'' {

    R4.
    r8 sib' sol
    do16 sib do sib do8

    %4
    r do la
    re16 do re do re8
    r re sib

    %7
    mib16 re mib re do re
    sib do la8. la16\mbreak
    sol8 r r

    %10
    r sib, sol
    do16 sib do sib do8
    R4.

    %13
    r8 sib' sib,
    r sol' sol,
    mib'16 re mib re mib8

    %16
    r fa fa,
    re'16 do re do re8\mbreak
    r8 sib' sib,

    %19
    la'16 sol la sol la8
    r la la,
    r re' re,

    %22
    r sol16 fad sol la
    fad mi fad mi fad8
    sol sol, r

    %25
    mib'16 re mib re mib8\mbreak
    fa8 fa, r
    re'16 do re do re8

    %28
    mib mib, r
    fad' fad, r
    re'' re, la'~

    %31
    la sol16 fad sol8
    r do, do,
    r re'' re,

    %34
    r sol16 sol, sol'8~\mbreak
    sol8 fad16 sol la8
    r re re,

    %37
    r sib'16 la sol8
    sol4 fad8
    sol sib sib,

    %40
    re' do, la'~
    la sol16 fad sol8
    sol sol, sol'~

    %43
    sol fad16  sol la8
    r re re,
    r sib'16 la sol8

    %46
    sol4 fad8
    sol4.
    r8 sib la

    %49
    do16 sib do sib do8
    r do la
    re16 do re do re8

    %52
    r re sib\mbreak
    mib16 re mib re do re
    sib do la8. la16

    %55
    sol8 r r
    r mib16 re mib re
    do8 r r

    %58
    r fa16 mib fa mib
    re8 r r\mbreak
    r sol16 fa sol fa

    %61
    mib8 mib, fa
    do16 re mib fa sol8
    fa16 mib re8. do16

    %64
    do8 r r
    do'' do, r16 si'
    do8 do8. si16

    %67
    do8 r r\mbreak
    r fa, fa
    fa16 mib fa mib fa8

    %70
    r mib mib
    mib16 re mib  re mib8
    r re re

    %73
    re16 do re do re sib
    do8. mi!16 re fa
    mi8 mi, r\mbreak

    %76
    re' re, r
    re16 mi fa sol la8
    sol16 fa mi8. mi16

    %79
    re8 fa' fa,
    r sol' sol,
    la si dod

    %82
    re re8. dod16
    re8 la r
    R4.\mbreak

    %85
    r8 sib' sol
    do16 sib do sib do8
    do do la

    %88
    re16 do re do re8
    r re sib
    mib16 re mib re do re

    %91
    sib do la8. la16
    sol8 r r
    r sib, sol

    %94
    do16 sib do sib do8
    R4.
    r8 sib' sib,

    %97
    r sol' sol,
    mib'16 re mib re mib8
    r fa fa,

    %100
    re'16 do re do re8
    r sib' sib,\mbreak
    la'16 sol la sol la8

    %103
    r la la,
    r re' re,
    r sol16 fad sol la

    %106
    fad mi fad mi fad8
    sol sol, r
    mib'16 re mib re mib8\mbreak

    %109
    fa8 fa, r
    re'16 do re do re8
    mib mib, r

    %112
    fad' fad, r
    re'' re, la'~
    la sol16 fad sol8

    %115
    r do, do,
    r re'' re,
    r sol16 sol, sol'8~\mbreak

    %118
    sol8 fad16 sol la8
    r re re,
    r sib'16 la sol8

    %121
    sol4 fad8
    sol sib sib,
    re' do, la'~

    %124
    la sol16 fad sol8
    sol sol, sol'~
    sol fad16  sol la8

    %127
    r re re,
    r sib'16 la sol8
    sol4 fad8

    %130
    sol4.
    r8 sib la
    do16 sib do sib do8

    %133
    r do la
    re16 do re do re8
    r re sib\mbreak

    %136
    mib16 re mib re do re
    sib do la8. la16
    sol8 r r

}

IIIvlIIn = \relative do'' {

    r8 re sib
    mib16 re mib re mib8
    r mib do

    %4
    fa16 mib fa mib fa8
    r fa re
    sol16 fad sol fad sol8

    %7
    sol sol, r16 fad'\mbreak
    sol8 sol8. fad16
    sol8 r r

    %10
    R4.*2
    r8 do, la
    re16 do re do re8

    %14
    re' re, r
    sol16 fa sol fa sol8
    do do, r

    %17
    fa16 mib fa mib fa8\mbreak
    sib sib, r
    fad' fad, r

    %20
    la' la, r
    sol' sol, r
    re'' sol, r

    %23
    la16 sol la sol la8
    r sol sol,
    sol16 fa sol fa sol8

    %26
    r fa' fa,\mbreak
    fa16 mib fa mib fa8
    r mib' mib,

    %29
    r fad' fad,
    r re'' re,
    r re16 do re mib

    %32
    do8 do, la''~
    la8 sol16 fad sol8~
    sol sol, r\mbreak

    %35
    do' do, r
    la' la, r
    re' re, r

    %38
    mib re16 do re do
    sib8 re sol~
    sol fad16 mi  fad8

    %41
    r re' re,
    r sol sol,
    r do' do,

    %44
    la' la, r
    re' re, r
    mib re16 do re do

    %47
    sib8 re sib
    mib16 re mib re mib8
    r mib do

    %50
    fa16 mib fa mib fa8
    r fa re\mbreak
    sol16 fad sol fad sol8

    %53
    sol sol, r16 fad'
    sol8 sol8. fad16
    sol8 r r

    %56
    r sol sol,
    la r r
    r la' la,

    %59
    sib r r
    r mib mib,\mbreak
    r do' lab

    %62
    sol do16 si do8
    lab16 sol lab16 sol8 fa16
    mib8 sol' mib

    %65
    la16 sol la sol fa sol
    mib fa re8. re16
    do8 r r

    %68
    do do, r\mbreak
    re' re, r
    sib' sib, r

    %71
    do' do, r
    la' la, r
    sib' sib, r

    %74
    sol' sol, sol'~
    sol16 fa sol fa sol mi
    fa8 re' sib

    %77
    la re16 dod re8\mbreak
    sib la16 sib la sol
    fa8 r r

    %80
    sol' sol, r
    fa16 mi re8 r16 la'
    la sol la sib la sol

    %83
    fa4 r8
    r re' sib
    mib16 re mib re mib8

    %86
    r mib do
    fa16 mib fa mib fa8
    r fa re

    %89
    sol16 fad sol fad sol8
    sol sol, r16 fad'\mbreak
    sol8 sol8. fad16

    %92
    sol8 r r
    R4.*2
    r8 do, la

    %96
    re16 do re do re8
    re' re, r
    sol16 fa sol fa sol8

    %99
    do do, r
    fa16 mib fa mib fa8\mbreak
    sib sib, r

    %102
    fad' fad, r
    la' la, r
    sol' sol, r

    %105
    re'' sol, r
    la16 sol la sol la8
    r sol sol,

    %108
    sol16 fa sol fa sol8
    r fa' fa,\mbreak
    fa16 mib fa mib fa8

    %111
    r mib' mib,
    r fad' fad,
    r re'' re,

    %114
    r re16 do re mib
    do8 do, la''~
    la8 sol16 fad sol8~

    %117
    sol sol, r\mbreak
    do' do, r
    la' la, r

    %120
    re' re, r
    mib re16 do re do
    sib8 re sol~

    %123
    sol fad16 mi  fad8
    r re' re,
    r sol sol,

    %126
    r do' do,
    la' la, r
    re' re, r

    %129
    mib re16 do re do
    sib8 re sib
    mib16 re mib re mib8

    %132
    r mib do
    fa16 mib fa mib fa8
    r fa re\mbreak

    %135
    sol16 fad sol fad sol8
    sol sol, r16 fad'
    sol8 sol8. fad16

    %138
    sol8 r r

}

IIIsopranon = \relative do'' {

    \autoBeamOff

    R4.*8
    r8 re sib
    mib16[re mib re] mib8

    %11
    r mib do
    fa16[mib fa mib] fa8
    r fa re

    %14
    sol16[fad sol fad sol8]
    sol, r r\mbreak
    fa'16[mib fa mib fa8]

    %17
    fa, r r
    r8 mib'16[re] mib[re]
    do[sib do sib la8]

    %20
    re16[do re do re do]
    sib[la sib do re do]
    re[mib] do4

    %23
    re4.\mbreak
    r8 re re
    re[sol,] do

    %26
    r do do
    do[fa,] sib
    r sib sol

    %29
    do16[sib do sib do8]
    re, r r
    sib'16[la sib la sib8]~

    %32
    sib la4\mbreak
    r8 re16[do] re[sib]
    mib[re mib re mib re]

    %35
    do[sib do re mib do]
    re8.[do16 sib la]
    sib[re mi? fad sol sol,]

    %38
    do[sib] la4
    sol4.
    R4.

    %41
    r8 re'16[do] re[sib]\mbreak
    mib[re mib re mib re]
    do[sib do re mib do]

    %44
    re8.[do16 sib la]
    sib[re mi fad sol sol,]
    do[sib] la4

    %47
    sol4.
    R4.*7
    r8 sib sol\mbreak

    %56
    do16[sib do sib] do8
    r8 do la
    re16[do re do] re8

    %59
    r re sib
    mib16[re mib re mib re]
    do4.~

    %62
    do16[si] do[re] mib8
    re16[do] si4\mbreak
    do4.

    %65
    R4.*2
    r8 mib mib
    mib?16[re mib re] mib8

    %69
    r re re
    re16[do re do] re8
    r do do

    %72
    do16[sib do sib do la]
    sib4.~\mbreak
    sib16[la sib la sib sol]

    %75
    la4.
    la8 re re
    re16[dod] re[mi] fa8

    %78
    mi16[re] dod4
    re4.~
    re8 do sib

    %81
    la8. sol16 fa[mi]\mbreak
    fa[sol] mi4^+
    re4.

    %84
    R4.*8
    r8 re' sib
    mib16[re mib re] mib8

    %94
    r mib do
    fa16[mib fa mib] fa8
    r fa re

    %97
    sol16[fad sol fad sol8]
    sol, r r\mbreak
    fa'16[mib fa mib fa8]

    %100
    fa, r r
    r8 mib'16[re] mib[re]
    do[sib do sib la8]

    %103
    re16[do re do re do]
    sib[la sib do re do]
    re[mib] do4

    %106
    re4.\mbreak
    r8 re re
    re[sol,] do

    %109
    r do do
    do[fa,] sib
    r sib sol

    %112
    do16[sib do sib do8]
    re, r r
    sib'16[la sib la sib8]~

    %115
    sib la4\mbreak
    r8 re16[do] re[sib]
    mib[re mib re mib re]

    %118
    do[sib do re mib do]
    re8.[do16 sib la]
    sib[re mi? fad sol sol,]

    %121
    do[sib] la4
    sol4.
    R4.

    %124
    r8 re'16[do] re[sib]\mbreak
    mib[re mib re mib re]
    do[sib do re mib do]

    %127
    re8.[do16 sib la]
    sib[re mi fad sol sol,]
    do[sib] la4

    %130
    sol4.
    R4.*8

}

IIItestoI = \lyricmode {

    Quot o -- do -- res, et sa -- po -- res, a -- quæ stil -- lant, stil -- lant im -- mor -- ta - - - - les,

    quot o -- do -- res, et sa -- po -- res, a -- quæ stil -- lant, stil -- lant im -- mor -- ta - - - - - les, im -- mor -- ta - - - - - les.

    Mun -- di_ar -- do -- res, et lan -- guo -- res tem -- pe -- ra - bunt hic mor -- ta -- les,

    mun -- di_ar -- do -- res, et lan -- guo -- res tem -- pe -- ra - - bunt, tem -- pe -- ra -- bunt hic mor -- ta -- les,

    tem -- pe -- ra -- bunt hic mor -- ta -- les.

    Quot o -- do -- res, et sa -- po -- res, a -- quæ stil -- lant, stil -- lant im -- mor -- ta - - - - les,

    quot o -- do -- res, et sa -- po -- res, a -- quæ stil -- lant, stil -- lant im -- mor -- ta - - - - - les, im -- mor -- ta - - - - - les.

}

IIIbcn = \relative do {

    sol'4 r8
    sol,4 r8
    la'4 r8

    %4
    la,4 r8
    sib'4 r8
    sib,4 r8

    %7
    do'16 sib do sib la8
    sol re' re,
    sol4 r8

    %10
    sol,4 r8
    la'4 r8
    la,4 r8

    %13
    sib'4 r8
    si,4 r8\mbreak
    do4 r8

    %16
    la4 r8
    sib'4 r8
    sol4 r8

    %19
    la4 r8
    fad4 r8
    sol4 fa?8~

    %22
    fa mib4
    re8 re' re,
    sib'16 la sib la sib8

    %25
    do, do' do,
    la'16 sol la sol la8
    sib, sib' sib,\mbreak

    %28
    sol'16 fad sol fad sol8
    la, la' la,
    fad'16 mi fad mi fad8

    %31
    sol, sol' sol,
    la'16 sol la sol la8
    sib sib, sib'

    %34
    do16 sib do sib do8
    la la, la'
    fad16 mi fad mi fad8\mbreak

    %37
    sol8. la16 si8
    do re re,
    sol, sol' sol,

    %40
    la'16 sol la sol la8
    sib sib, sib'
    do16 sib do sib do8

    %43
    la la, la'
    fad16 mi fad mi fad8
    sol8. la16 si8\mbreak

    %46
    do re re,
    sol4 r8
    sol,4 r8

    %49
    la4 r8
    la'4 r8
    sib,4 r8

    %52
    sib'4 r8
    do16 sib do sib la8
    sol re' re,

    %55
    sol  r r
    r sib mib,
    fa r r

    %58
    \clef tenor \key fa\major r8 fa' fa,
    sol r r
    \clef bass \key fa\major r8 sol sol,

    %61
    lab lab' fa
    mib8. re16 do8
    fa sol sol,

    %64
    do mib do
    fa16 mib fa mib re8
    do sol' sol,

    %67
    do r r\mbreak
    la r r
    sib r r

    %70
    sol' r r
    la r r
    fad r r

    %73
    sol r r
    mi! r r
    dod r r

    %76
    re sib' la
    fa8. mi16 re8
    sol la la,

    %79
    re fa re\mbreak
    mi mi, mi'
    fa sol la

    %82
    re, la' la,
    re4 r8
    sol4 r8

    %85
    sol,4 r8
    la'4 r8
    la,4 r8

    %88
    sib'4 r8
    sib,4 r8
    do'16 sib do sib la8

    %91
    sol re' re,
    sol4 r8
    sol,4 r8

    %94
    la'4 r8
    la,4 r8
    sib'4 r8

    %97
    si4 r8
    do4 r8
    la4 r8

    %100
    sib4 r8
    sol4 r8
    la4 r8

    %103
    fad4 r8
    sol4 fa?8~
    fa mib4

    %106
    re8 re' re,
    sib'16 la sib la sib8
    do, do' do,

    %109
    la'16 sol la sol la8
    sib, sib' sib,\mbreak
    sol'16 fad sol fad sol8

    %112
    la, la' la,
    fad'16 mi fad mi fad8
    sol, sol' sol,

    %115
    la'16 sol la sol la8
    sib sib, sib'
    do16 sib do sib do8

    %118
    la la, la'
    fad16 mi fad mi fad8\mbreak
    sol8. la16 si8

    %121
    do re re,
    sol, sol' sol,
    la'16 sol la sol la8

    %124
    sib sib, sib'
    do16 sib do sib do8
    la la, la'

    %127
    fad16 mi fad mi fad8
    sol8. la16 si8\mbreak
    do re re,

    %130
    sol4 r8
    sol,4 r8
    la'4 r8

    %133
    sib,4 r8
    sib'4 r8
    si,4 r8

    %136
    do'16 sib do sib la8
    sol re' re,
    sol  r r

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    <6->
    <5->
    <6>
    s
    <6>
    <_->4 <6+>8
    s8 <4> <_+>
    s4.
    <6->
    <5->
    <6>
    s
    <6>
    <_->
    <6>
    s
    <6->
    <6+>
    <6>
    s4 <6>8
    s <7> <6>
    <_+>4.
    <6>4 <6>8
    <9 _-> <8> <_->
    <6>4 <6>8
    s4.
    <6->
    <6+>
    <6>
    <9 _->8 <8> <6->
    <9> s <8>
    <7> <6> <6>
    <_-> s <_->
    <7>8 <6+> <5->
    <6> s <6>
    <_!>  s <6>
    <_-> <4> <_+>
    s4.
    <7>8 s <6+>
    <7> <6> <6>
    <_-> s <_->
    <7> <6+> <5->
    <6> s <6>
    <_!> s <6>
    <_-> <4> <_+>
    s4.
    <6->
    <5->
    <6>
    s
    <6>
    <_->4 <6+>8
    s <4> <_+>
    s4.
    s4 <6>8
    s4.
    s8 <6>4
    s4.
    s8 <6-> s
    s s <_->
    <6> s <_->
    <6 5 _-> <4> <_!>
    <_-> <6> <_->
    s s <6->
    <_-> <5 4> <_!>
    <_->4.
    <5->
    s
    s
    <5->
    <6>
    s
    <6>
    <6 5->
    s8 s <4>
    <6> s <_+>
    <6 5> <5 4> <_+>
    s <6> s
    <7> <6> s
    <6> <_!> <_+>
    s <5 4> s
    s4.

    s4.
    <6->
    <5->
    <6>
    s
    <6>
    <_->4 <6+>8
    s8 <4> <_+>
    s4.
    <6->
    <5->
    <6>
    s
    <6>
    <_->
    <6>
    s
    <6->
    <6+>
    <6>
    s4 <6>8
    s <7> <6>
    <_+>4.
    <6>4 <6>8
    <9 _-> <8> <_->
    <6>4 <6>8
    s4.
    <6->
    <6+>
    <6>
    <9 >8 <8> <6->
    <9> s <8>
    <7> <6> <6>
    <_-> s <_->
    <7>8 <6+> <5->
    <6> s <6>
    <_!>  s <6>
    <_-> <4> <_+>
    s4.
    <7>8 s <6+>
    <7> <6> <6>
    <_-> s <_->
    <7> <6+> <5->
    <6> s <6>
    <_!> s <6>
    <_-> <4> <_+>
    s4.
    <6->
    <5->
    <6>
    s
    <6>
    <_->4 <6+>8
    s <4> <_+>

}


forma = {

    \time 3/8
    \key fa\major
    \tempo 4. = 55
    s4.*138
    \bar "|."

}

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    <<\IIIvlIIn \forma>>

}

IIIsoprano = {
    \new Voice = "odores"
    <<\IIIsopranon \forma>>
}



IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}



%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


IValton = \relative do' {

    \autoBeamOff

    r4 r8 la'\solo sol8. sol16 sol[fa] sol[fa]
    mi8 mi r4 r r8 la
    sol8. sol16 sol[fa] sol[fa] mi8 mi r mi

    %4
    fad16[mi] fad[sol] la8 la\mbreak la sol4 fa?8
    mi [fa] sol4. fa4 mib8
    re [mib] fa4~fa8 mib4 re8

    %7
    do2 re8 [mib fa sol]
    mib2 re
    R1

    %10
    r4 fa mib8 re mib fa\mbreak
    re8. do16(sib4) r r8 fa'
    re mi fa re sol2~

    %13
    sol4 fad r2
    r r4 sol
    do, re mib8[re16 mib] fa8. mib16(

    %16
    re4) r sol8 fa mib sol\mbreak
    do,[re16 mib] fa[mib fa mib] re4. mib16[re]
    mib4 mi8[fa16 mi] fad4 sol~

    %19
    sol fa? mi2
    re4 la'8 sol fa [sol] la4~
    la8[sol16 fa] sol2 fa8[sol]

    %22
    la8.[sol16] la[mi fa sol] fa2
    mi re
    R1*3

}

IVtestoII = \lyricmode {

    Ad ri -- vu -- los a -- mo -- ris, ad a -- quas in -- no -- centes _ ac -- ce -- di -- te lan -- gu -- en - - - - - - - - - - - - tes,

    fons iste _ sa -- lu -- ta -- ris do -- lores _ so -- li -- da -- bit, et cor -- di vi - res pi -- e  re -- stau -- ra - - - - - - - - - bit,

    re -- stau -- ra - - - - - - - bit.

}

IVtenoren = \relative do' {

    \autoBeamOff

    r4 r8 fa mi8. mi16 mi[re] mi[re]
    dod8 dod r4 r r8 fa
    mi8. mi16 mi[re] mi[re] dod8 dod r4

    %4
    r4 r8 la si16[la] si[do] re8 re\mbreak
    re do4 sib8 la [sib] do4~
    do8 sib4 la8 sol[la] sib4~

    %7
    sib4 la si8[do] re4~
    re8 [do16 si] do2 si4
    r do sib?8 la sib do\mbreak

    %10
    do8. sol16(fa4) r2
    r4 r8 sib la sib do la
    si [dod] re2 dod4

    %13
    r re la sib
    do8[sib16 do] re8. do16(sib4) r
    R1

    %16
    re8 do sib re\mbreak sol,[la16 sib] do[sib do sib]
    la8[sib16 do] re[do re do] sib4 si8 [do16 si]
    do2~do4 si8[dod16 si]

    %19
    dod4 re2 dod4
    re2 r4 re8 do
    sib2 la\mbreak

    %22
    r mi'4 re8 re
    re4 dod re2
    R1*3

}

IVtestoIII = \lyricmode {

    Ad ri -- vu -- los a -- mo -- ris, ad a -- quas in -- no -- centes _ ac -- ce -- di -- te lan -- gu -- en - - - - - - - - - - - tes,

    fons iste _ sa -- lu -- ta -- ris do -- lores _ so -- li -- da - bit, et cor -- di vi - res pi -- e  re -- stau -- ra - - - - - - - - - - bit,

    re -- stau -- ra -- bit, re -- stau -- ra  - - bit.

}

IVbcn = \relative do {

    re8 mi fa re sol la sib sol
    la sol la la, re mi fa re
    sol la sib sol la sol la la,

    %4
    re mi fad re sol la si sol
    do, re mi do fa sol la fa\mbreak
    sib, do re sib mib fa sol fa

    %7
    mib do fa mib re do si sol
    do re mib fa sol fa sol fa
    mi! re mi do re do re mi

    %10
    fa fa, la fa\mbreak sol fa sol la
    sib do re mib fa sol la fa
    sol mi re fa mi re mi la,

    %13
    re dod re mi fad re sol sol,
    la' sol fad re sol fa? sol mib\mbreak
    fa mib re sib do sib la fa

    %16
    sib do re sib mib re do mib
    fa mib re fa sol fa sol sol,
    do' sib do do, re re, sol' sol,

    %19
    la' la, re fa\mbreak sol mi la sol
    fa sol fa mi re mi fa fa,
    sol la sib do re mi fa re

    %22
    dod si dod la re mi fa sol
    la sol la sol fad re mi fad\mbreak
    sol la sib do re re, mi fad

    %25
    sol la sib sol la sol fa re
    sol sol, la' la, re4 r

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6> <6> <6 4>
    <5 4> <_+> s <6>
    <6> <6 4> <5 4> <_+>
    <_+> <6> <_!> <6>
    <9> <6> <9> <6>8 <7->
    <9>4 <6> <9> <6->
    <6> s <6!> <6>
    <9 _-> <6> <5 4> <_!>
    <6> <6> <6> <6>8 <6 5->
    <4> <3> <6> s <6->4 <6->
    s <6> s <6>
    <_!>8 <6+> s <6> <7>4 <6+>
    <5 4> <_+> <6> s
    s <6> s2
    s4 <6> <_-> <6>8 <7->
    s4 <6> s <_->8 <6>
    s4 s8 <6> <_->4 <_!>
    <_-> <_!> <7 _+> <_!>
    <7 _+> s <6 5> <_+>
    <6>2 <6>
    <9>4 <6> <5 4> <6>
    <6> <6> <9> <6>
    <4 5> <_+> <6> s
    s <6> <_+> <6>8 <6 5->
    s4 <6> <_+> <6>
    <6 5> <5 4>8 <_+>

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 45
    s1*26
    \bar "|."

}

IValto = {
    \new Voice = "rivulos2"
    <<\IValton \forma>>
}

IVtenore = {
    \new Voice = "rivulos3"
    <<\IVtenoren \forma>>
}


IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}




VvlIn = \relative do'' {

    r4 r8 do'4. re~re8 do sib
    do4.~do8 sib la sib4.~sib8 la sol
    la fa sol la fa sol la fa sol la sol fa

    %4
    mi r r r mi fa\mbreak sol fa mi re mi re
    do r r r4 r8 fa la, sib do sib la
    re fa mi re do sib do4. la8 la' sib

    %7
    do la sib do la sib\mbreak do la sib do la sib
    do sib la sol sol, sol' fa4. r8 la, sib
    do la sib  do la sib do la sib do la sib

    %10
    do sib la sol sol' sol,\mbreak fa4. r4 r8

}

VvlIIn = \relative do'' {

    fa8 la, sib do sib la fa' fa, mi re re' mi
    do re mi fa4.~fa8 mi re mi fa sol
    do, la' sib do la sib do la sib do sib la\mbreak

    %4
    sol mi fa sol4 r8 r r do do4 si8
    do mi, fa sol fa mi la r r  r4 r8
    fa4. sol~sol8 fa mi fa fa sol

    %7
    la fa sol la fa sol\mbreak la fa sol la fa sol
    la sol fa fa4 mi8 fa4. r8 fa, sol
    la fa sol la fa sol la fa sol la fa sol

    %10
    la sol fa fa4 mi8 fa4. r4 r8



}

Vbcn = \relative do {

    fa4 sol8 la sol fa sib re do sib la sol
    la sib do re, mi fa sol la sib do, re mi
    fa r r r4 r8 fa r r r4 r8\mbreak

    %4
    do' do, re mi do re mi re do sol'4 sol,8
    do4 do8 mi re do fa4 sol8 la sol fa
    sib re do sib la sol la sib do re r r

    %7
    la r r r4 r8\mbreak fa r r r4 r8
    r r fa do' sib do fa, fa mi re r r
    la r r r4 r8 fa r r r4 r8

    %10
    r r fa do' sib do fa,4. r4 r8

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    <6> s s
    <6> <7> <7> <7>
    s1.
    s4. <6> <6> <5 4>4 <_!>8
    s4. <6> s <6>
    s <6> <7> s
    s1.*3
    s4. <5 4>8 s <3>

}


forma = {

    \time 12/8
    \key fa\major
    \tempo 2. = 25
    s1.*10
    \bar "|."

}

VvlI = {
    <<\VvlIn \forma>>

}

VvlII = {
    <<\VvlIIn \forma>>

}

Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
}



%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


VIalton = \relative do' {

    \autoBeamOff

    R1.*3
    r2. r4 r8 sol'4.
    la~la8 sol fa sol4.~sol8 fa mi

    %6
    fa4.~fa8 mi re mi mi fa sol fa mi
    fa re mi fa[sol la]\mbreak sol8. la16 fa8 mi4.
    re re sol~sol8 fa mi]

    %9
    fa4.~fa8 [mi re] mi4. r4 r8
    fa4. sol~sol8 fa mi fa4.~
    fa8[mi re] mi4.\mbreak fa4 sol8 la fa sol

    %12
    la fa sol la fa sol la4. sol4 sol8
    fa8. sol16 mi8 re4. do r8 r la'\mbreak
    sol8. la16 fa8 mi4. re4 la'8 sib4.~

    %15
    sib8. do16 la8 sol4. fa r8 r re
    mi8. mi16 fa8 fa4(mi8) fa4. r4 r8
    fa4. sol~sol8[la sol] fa4.~\mbreak

    %18
    fa8[sol la] sol4. la8[sib la] sol4.
    fa r4 r8 r2.
    r r8 r la sib4.\mbreak

    %21
    la4 sib8 sol4. fa r4 r8
    r2. r4 r8 la4.
    sib sib4 sib8 sib[la sol] la4 la8

    %24
    sol4. fa4 la8 sol8. la16 fa8 mi4.
    re r4 r8 r2.\mbreak
    R1.

    %27
    r2. r4 r8 re4.
    fa fa4 fa8 fa[mi re] mi4.
    r2. r4 r8 r r la

    %30
    sib4. la4 sib8 sol4. fa
    r2. r4 r8 fa4 re8\mbreak
    mib8. fa16 re8 do4. sib sib'4 sol8

    %33
    r4 r8 la4 fa8 sol8. la16 fa8 mi4.
    re la'4 fa8 sol8. la16 fa8 mi4.
    re r4 r8 r2.\mbreak

    %36
    R1.*3
    r2. r4 r8 sol4.
    la~la8 sol fa sol4.~sol8 fa mi

    %41
    fa4.~fa8 mi re mi mi fa sol fa mi
    fa re mi fa[sol la]\mbreak sol8. la16 fa8 mi4.
    re re sol~sol8 fa mi

    %44
    fa4.~fa8 [mi  re] mi4. r4 r8
    fa4. sol~sol8 fa mi fa4.~
    fa8[mi re] mi4.\mbreak fa4 sol8 la fa sol

    %47
    la fa sol la fa sol la4. sol4 fa8
    fa8. sol16 mi8 re4. do r8 r la'\mbreak
    sol8. la16 fa8 mi4. re4 la'8 sib4.~

    %50
    sib8. do16 la8 sol4. fa r8 r re
    mi8. mi16 fa8 fa4(mi8) fa4. r4 r8
    fa4. sol~sol8[la sol] fa4.~\mbreak

    %53
    fa8[sol la] sol4. la8[sib la] sol4.
    fa r4 r8 r2.

}

VItestoII = \lyricmode {

    O flu -- ida _  vi -- ta, dul -- ce -- do_in -- fi -- nita, _  tu pec -- tora _ sanas, _ tu pec - tora _ sa -- nas,

    o flu -- ida _ vi -- ta, o flu -- ida _ vi - ta, dul -- ce -- do_in -- fi -- nita, _  tu pec -- tora _ sanas, _ tu pec -- tora _ sa -- nas,

    tu pec -- tora _ sanas, _  tu pec -- tora _ sanas, _  tu pec -- tora _ sa -- nas, sa - - - - - nas.

    Flu -- en -- ta sa -- lu -- tis, et vi -- vos vir -- tu -- tis, tu sem -- per, tu sem -- per e -- ma -- nas,

    et vi -- vos vir -- tu -- tis, flu -- en -- ta sa -- lu -- tis, sem -- per,  sem -- per e -- ma -- nas,

    sem -- per, sem -- per,  sem -- per e -- ma -- nas,, sem -- per,  sem -- per e -- ma -- nas.

    O flu -- ida _  vi -- ta, dul -- ce -- do_in -- fi -- nita, _  tu pec -- tora _ sanas, _ tu pec - tora _ sa -- nas,

    o flu -- ida _ vi -- ta, o flu -- ida _ vi - ta, dul -- ce -- do_in -- fi -- nita, _  tu pec -- tora _ sanas, _ tu pec -- tora _ sa -- nas,

    tu pec -- tora _ sanas, _  tu pec -- tora _ sanas, _  tu pec -- tora _ sa -- nas, sa - - - - - nas.

}

VItenoren = \relative do' {

    \autoBeamOff

    r4 r8 do4. re~re8 do sib
    do4.~do8 sib la sib4.~sib8 la sol
    la la sib do la sib do la sib do [re mi]\mbreak

    %4
    fa8. sol16 mi8 re4. do r4 r8
    R1.*3
    la4. re~re8 do si do4.~

    %9
    do8 si [la](si4.) r4 r8 do4.
    re~re8 do sib? do4.~do8[sib la]\mbreak
    sib4.~sib8[la] sol(la4) sib8 do la sib

    %12
    do la sib do la sib do la sib do [re mi]
    la, si do do4(si8) do4. la\mbreak
    si8. dod16 re8 re4(dod8) re4. r8 r re

    %15
    mi8. mi16 fa8 fa4 (mi8) fa4 la,8 sib4.~
    sib8. do16 la8 sol4. fa r4 r8
    r4 r8 re'4. mi8[fa mi] fa4.~\mbreak

    %18
    fa mi8[re mi] fa4.~fa4 \parenthesize (mi8)
    fa4. r4 r8 r2.
    R1.

    %21
    r2. r8 r re fa4.
    mi4 fa8 re4. do r4 r8
    R1.*2

    %25
    r4 r8 re4. mib mib4 mib8\mbreak
    mib re[do] re4 re8 do4. sib4 re8
    do8.[re16] sib8 la4. sol r4 r8

    %28
    r2. r4 r8 r r mi'
    fa4. mi4 fa8 re4. do
    r2. r4 r8 r r re\mbreak

    %31
    mib4. mib4 mib8 mib re[do](re4.)
    r2. fa4 re8 r4 r8
    fa4 re8 r4 r8 dod8. dod16 re8 re4(dod8)

    %34
    re4. r4 r8 dod8. dod16 re8 re4(dod8)\mbreak
    re4. r4 r8 r2.
    r4 r8 do4. re~re8 do sib

    %37
    do4.~do8 sib la sib4.~sib8 la sol
    la la sib do la sib do la sib do [re mi]\mbreak
    fa8. sol16 mi8 re4. do r4 r8

    %40
    R1.*3
    la4. re~re8 do si do4.~
    do8 si [la](si4.) r4 r8 do4.

    %45
    re~re8 do sib? do4.~do8[sib la]\mbreak
    sib4.~sib8[la] \once\stemDown sol(la4) sib8 do la sib
    do la sib do la sib do la sib do [re mi]

    %48
    la, si do do4(si8) do4. la\mbreak
    si8. dod16 re8 re4(dod8) re4. r8 r re
    mi8. mi16 fa8 fa4 (mi8) fa4 la,8 sib4.~

    %51
    sib8. do16 la8 sol4. fa r4 r8
    r4 r8 re'4. mi8[fa mi] fa4.~\mbreak
    fa mi8[re mi] fa4.~fa4 (mi8)

    %54
    fa4. r4 r8 r2.

}

VItestoIII = \lyricmode {

    O flu -- ida _  vi -- ta, dul -- ce -- do_in -- fi -- nita, _  tu pec -- tora _ sanas, _ tu pec - tora _ sa -- nas,

    o flu -- ida _ vi -- ta, o flu -- ida _ vi - ta, dul -- ce -- do_in -- fi -- nita, _  tu pec -- tora _ sanas, _ tu pec - tora _ sa -- nas,

    tu pec -- tora _ sa -- nas, tu pec -- tora _ sa -- nas,  tu pec -- tora _ sa -- nas, sa - - - - nas.

    Flu -- en -- ta sa -- lu -- tis, et vi -- vos vir -- tu -- tis, tu sem -- per, tu sem -- per e -- ma -- nas,

    flu -- en -- ta sa -- lu -- tis, et vi -- vos vir -- tu -- tis, sem -- per,  sem -- per, sem -- per e -- ma -- nas,

    sem -- per e -- ma -- nas.

    O flu -- ida _  vi -- ta, dul -- ce -- do_in -- fi -- nita, _  tu pec -- tora _ sanas, _ tu pec - tora _ sa -- nas,

    o flu -- ida _ vi -- ta, o flu -- ida _ vi - ta, dul -- ce -- do_in -- fi -- nita, _  tu pec -- tora _ sanas, _ tu pec - tora _ sa -- nas,

    tu pec -- tora _ sa -- nas, tu pec -- tora _ sa -- nas,  tu pec -- tora _ sa -- nas, sa - - - - nas.

}

VIbcn = \relative do {

    fa4 sol8 la sol fa sib re do sib la sol
    la sib do re, mi fa sol la sib do, re mi
    fa r r r4 r8 fa r r mi r r\mbreak

    %4
    re si do sol' fa sol do,4 re8 mi re do
    fa la sol fa mi re mi fa sol la, si do
    re mi fa sol, la si do r r dod r r\mbreak

    %7
    re r r re' r r mi dod re la sol la
    re, re do si do re mi fa sol la, si do
    re mi fa sol, la si do re mi fa sol la\mbreak

    %10
    sib re do sib la sol la, sib do re mi fa
    sol, la sib do re mi fa r r r4 r8
    fa r r r4 r8 fa r r mi r r

    %13
    re4 do8 sol' fa sol\mbreak do, re mi fa sol fa
    mi4 re8 la' sol la re, mi fa sol sib la
    sol4 fa8 do' sib do fa, mi fa sol sib la

    %16
    sol4 fa8 do sib do fa, fa' sol la sol fa\mbreak
    sib re do sib la sol do do, do' re do sib
    la sol fa do' sib do la sol fa do sib do

    %19
    fa,4 fa8 la sol fa sib sib' do re do sib
    la sol fa do' sib do \mbreak fa, mi re sol fa mi
    fa mi re mi re dod re mi fa la, la' si

    %22
    do si la si la  sold la la, si do si do
    re do re mi re mi\mbreak fa, fa' mi re mi fa
    mi re dod re mi fa mi dod re la' sol la

    %25
    re, re mi fad mi fad sol fad sol la sol la
    sib, sib' la sol la sib\mbreak la sol fad sol la sib
    la fad sol re do re sol, sol' la si la sol

    %28
    la sol la si la si do, do' si la si do\mbreak
    re do si do si la si la sold la sol? fa
    sol re mi fa mi re mi re dod re mi fa

    %31
    sol fa sol la sol la sib, sib' la sol la sib\mbreak
    do la sib fa mib fa sib, sib' la sol fa mi
    re mi fa dod la re mi4 fa8 sol mi la

    %34
    sib la sol fa mi re mi4 fa8 sol mi la\mbreak
    re, re' do sib re, mi fa la, sib do sib do
    fa, fa' sol la sol fa sib re do sib la sol

    %37
    la sib do re, mi fa sol la sib do, re mi
    fa r r r4 r8 fa r r mi r r\mbreak
    re si do sol' fa sol do,4 re8 mi re do

    %40
    fa la sol fa mi re mi fa sol la, si do
    re mi fa sol, la si do r r dod r r\mbreak
    re r r re' r r mi dod re la sol la

    %43
    re, re do si do re mi fa sol la, si do
    re mi fa sol, la si do re mi fa sol la\mbreak
    sib re do sib la sol la, sib do re mi fa

    %46
    sol, la sib do re mi fa r r r4 r8
    fa r r r4 r8 fa r r mi r r
    re4 do8 sol' fa sol\mbreak do, re mi fa sol fa

    %49
    mi4 re8 la' sol la re, mi fa sol sib la
    sol4 fa8 do' sib do fa, mi fa sol sib la
    sol4 fa8 do sib do fa, fa' sol la sol fa\mbreak

    %52
    sib re do sib la sol do do, do' re do sib
    la sol fa do' sib do la sol fa do sib do
    fa,4. r4 r8 r2.

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4. <6> s s
    s <7> <7> <7>
    s2. s4. <6>
    s2. s4. <6>
    s <6> <6> <7>
    <7> <7 _!> s <6>
    s2. s4. <_+>
    s <6> <7> <7>
    <7> <7 _!> s s
    s <6> <7> <7>
    <7> <7> s s
    s2. s4. <6>
    <5>8 <6!> s <5 4> s <_!> s2.
    <5!>4. <_+> s s
    <6>4. <5 4>4 <3>8 s2.
    <6>4. <5 4>4 <3>8 s4. <6>
    s1.
    <6>4. s <6> <5 4>4 <3>8

    s4. <6> s <6>
    <6> s s <6>
    <6>4 <6 4>8 <6+>4. s <6>
    s4 <6>8 s4. s <6>
    <6> <5-> s s
    <6+> s s <_+>
    <_+> <6> <6-> <5->
    <4->8 <3> s s4. s s
    s <_+> <_!> <6>
    <6> <6 5-> s s
    s1.
    s2. <6+>
    <6->4. <5-> <4>8 <3> s s4.
    s1.
    s4. <6> <6+>4 <6>8 <6 5>4 <_+>8
    s4. <6> <6+>4 <6>8 <6 5>4 <_+>8
    s1.

    s4. <6> s s
    s <7> <7> <7>
    s2. s4. <6>
    s2. s4. <6>
    s <6> <6> <7>
    <7> <7 _!> s <6>
    s2. s4. <_+>
    s <6> <7> <7>
    <7> <7 _!> s s
    s <6> <7> <7>
    <7> <7> s s
    s2. s4. <6>
    <5>8 <6!> s <5 4> s <_!> s2.
    <5!>4. <_+> s s
    <6>4. <5 4>4 <3>8 s2.
    <6>4. <5 4>4 <3>8 s4. <6>
    s1.
    <6>4. s <6> <5 4>4 <3>8

}


forma = {

    \time 12/8
    \key fa\major
    \tempo 2. = 25
    s1.*54
    \bar "|."

}

VIalto = {
    \new Voice = "fluida2"
    <<\VIalton \forma>>
}

VItenore = {
    \new Voice = "fluida3"
    <<\VItenoren \forma>>
}



VIbc = {
    \clef bass
    <<\VIbcn \forma \VIbfn>>
}



%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}



VIIvlIn = \relative do'' {

    r4 r8 do'4. re~re8 do sib
    do4.~do8 sib la sib4.~sib8 la sol
    la fa sol la fa sol la fa sol la sol fa

    %4
    mi r r r mi fa\mbreak sol fa mi re mi re
    do r r r4 r8 fa la, sib do sib la
    re fa mi re do sib do4. la8 la' sib

    %7
    do la sib do la sib\mbreak do la sib do la sib
    do sib la sol sol, sol' fa4. r8 la, sib
    do la sib  do la sib do la sib do la sib

    %10
    do sib la sol sol' sol,\mbreak fa4. r4 r8

}

VIIvlIIn = \relative do'' {

    fa8 la, sib do sib la fa' fa, mi re re' mi
    do re mi fa4.~fa8 mi re mi fa sol
    do, la' sib do la sib do la sib do sib la\mbreak

    %4
    sol mi fa sol4 r8 r r do do4 si8
    do mi, fa sol fa mi la r r  r4 r8
    fa4. sol~sol8 fa mi fa fa sol

    %7
    la fa sol la fa sol\mbreak la fa sol la fa sol
    la sol fa fa4 mi8 fa4. r8 fa, sol
    la fa sol la fa sol la fa sol la fa sol

    %10
    la sol fa fa4 mi8 fa4. r4 r8



}

VIIbcn = \relative do {

    fa4 sol8 la sol fa sib re do sib la sol
    la sib do re, mi fa sol la sib do, re mi
    fa r r r4 r8 fa r r r4 r8\mbreak

    %4
    do' do, re mi do re mi re do sol'4 sol,8
    do4 do8 mi re do fa4 sol8 la sol fa
    sib re do sib la sol la sib do re r r

    %7
    la r r r4 r8\mbreak fa r r r4 r8
    r r fa do' sib do fa, fa mi re r r
    la r r r4 r8 fa r r r4 r8

    %10
    r r fa do' sib do fa,4. r4 r8

}

VIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    <6> s s
    <6> <7> <7> <7>
    s1.
    s4. <6> <6> <5 4>4 <_!>8
    s4. <6> s <6>
    s <6> <7> s
    s1.*3
    s4. <5 4>8 s <3>

}


forma = {

    \time 12/8
    \key fa\major
    \tempo 2. = 25
    s1.*10
    \bar "|."

}

VIIvlI = {
    <<\VIIvlIn \forma>>

}

VIIvlII = {
    <<\VIIvlIIn \forma>>

}

VIIbc = {
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>
}



%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}



VIIIvlIn = \relative do'' {

    R1
    r16 re si sol mib'4 r16 do lab fa re'4
    r16 sol mib sib mib4 r16 re' re, re' do4

    %4
    r16 sol fa mib re do re mib do4 r\mbreak
    r16 re si sol mib'4 r16 sol fa mib re8. re16
    do4 r16 do' do, do' si4 r16 sol sol, mib'

    %7
    do4 r16 re re, re' sib4 r16 sol' mi! do\mbreak
    lab'4 r16 la fad re si'4 r16 sol fa? mib
    re8 do16 do' do8. si16 do4 r16 fa, mib fa

    %10
    re4 r16 mib re do do'8 do,16 do' do8. si16\mbreak
    do4 r16 do lab fa re'4 r16 sib? sol mib
    do'4 r16 fa, sol do, sol'8 do do8. si16

    %13
    do4 r r16 sib sol mib do'4
    r16 sib sol mib sib'4\mbreak sib, r
    r16 fa' re fa, sib4 r16 fa' do fa re4

    %16
    r16 do' la fa re4 r16 sib' sol sib, mib4
    r16 la fa re re,4 r16 sib'' sol mib sol,4\mbreak
    r16 la' fa re sib8 sib' sol16 mib sib sib' sib8. la16

    %19
    sib4 r16 sib la sol fa8 sib sib8. la16
    sib re, sib fa sib4 r16 sib' sol mi do4
    r16 sol' mi do sol'4\mbreak r16 la, fad re re'4

    %22
    r16 la' fad re sol4 r16 sol mi do sib'4
    r16 sib sol re re'4 r16 sib sol re fad4
    r16 sol mib do la re do re\mbreak sib sib' sol mib sib4

    %25
    r16 do' la fa do4 r16 sib' sol re fad4
    r16 sol mib do la re do re sib sib' sol re sol4\mbreak
    r16 re' do sib la sol la sib sol sib, sol re sol4

    %28
    R1
    r16 re' si sol mib'4 r16 do lab fa re'4
    r16 sol mib sib mib4 r16 re' re, re' do4

    %31
    r16 sol fa mib re do re mib do4 r\mbreak
    r16 re si sol mib'4 r16 sol fa mib re8. re16
    do4 r16 do' do, do' si4 r16 sol sol, mib'

    %34
    do4 r16 re re, re' sib4 r16 sol' mi! do\mbreak
    lab'4 r16 la fad re si'4 r16 sol fa? mib
    re8 do16 do' do8. si16 do4 r16 fa, mib fa

    %37
    re4 r16 mib re do do'8 do,16 do' do8. si16\mbreak
    do4 r16 do lab fa re'4 r16 sib? sol mib
    do'4 r16 fa, sol do, sol'8 do do8. si16

    %40
    do4 r r2

}

VIIIvlIIn = \relative do'' {

    R1
    r4 r16 sol' mi do lab'4 r16 fa re sib
    sol'4 r16 sol sol, do si4 r16 sol' fa mi

    %4
    re8 do16 do' do8. si16 do4 r
    r4 r16 sol mi do\mbreak re8 do16 do' do8. si16
    do4 r r16 re re, re' do4

    %7
    r16 fa, lab, do fa,4 r16 sol' sol, sol' do,4
    r16 lab' fa do re4 r16 re' re, re' do4\mbreak
    r16 sol fa mi re do re mi do mi do sol' do,4

    %10
    r16 re fa re sol,4 r16 do' lab fa re8. re16
    mi sol mi do lab'4 r16 fa re sib sol'4\mbreak
    r16 mi sol sol, do4 r16 sol' fa mi re do re mi

    %13
    do4 r r r16 do' lab fa
    sib4 r16 fa re sib sol'4 r
    r r16 sol re sol do,4 r16 re' re, sol\mbreak

    %16
    do,4 r16 sib' sol re sol4 r16 do la do,
    fa4 r16 re' sib re, sib4 r16 do' sol mi
    do8 la re16 fa re sib sib'8 sol16 fa do fa mi fa

    %19
    re re sib fa sib4\mbreak r16 fa' mi re do sib do re
    sib4 r16 fa' re sib do4 r16 la' fa do
    mi4 r16 sol mi do la'4 r16 sib sol re

    %22
    fad4 r16 re' sol, re\mbreak sol,4 r16 la' fad la,
    re4 r16 la' fad re re,4 r16 re' la fad
    re sib' sol sol' sol8. fad16 sol4 r16 fa? re sib

    %25
    do4 r16 sol' mi do\mbreak re4 r16 re' la fad
    re sib sol sol' sol8. fad16 sol4 r16 sol fa? mi
    re sib' la sol sol8. fad16 sol4 r

    %28
    R1
    r4 r16 sol mi do lab'4 r16 fa re sib
    sol'4 r16 sol sol, do si4 r16 sol' fa mi

    %31
    re8 do16 do' do8. si16 do4 r
    r4 r16 sol mi do\mbreak re8 do16 do' do8. si16
    do4 r r16 re re, re' do4

    %34
    r16 fa, lab, do fa,4 r16 sol' sol, sol' do,4
    r16 lab' fa do re4 r16 re' re, re' do4\mbreak
    r16 sol fa mi re do re mi do mi do sol' do,4

    %37
    r16 re fa re sol,4 r16 do' lab fa re8. re16
    mi sol mi do lab'4 r16 fa re sib sol'4\mbreak
    r16 mi sol sol, do4 r16 sol' fa mi re do re mi

    %40
    do4 r r

}

VIIIbasson = \relative do {

    \autoBeamOff

    R1*3
    r2 r8 do'16 sib lab8 sol16 fa
    sol8 sol r4 r2

    %6
    r8 do16 sib lab8 sol16 fa sol8 sol r do
    lab fa r sib16 lab\mbreak sol8 mib r do'
    do fa, r re' re sol, r4

    %9
    r8 do do sol r16 sol [lab sib] do [fa, sol lab]
    si, [sol' fa sol] mib [do' sib do] lab [sol fa lab] sol4\mbreak
    do, r r2

    %12
    R1
    r8 do' sib16 do sib lab sol8 mib  r4
    r2 r8 sol fa16 sol fa mib

    %15
    re8 sib r sib' la? la sib sib\mbreak
    la la r sib16 sib sol[sol sib sol] la[ la do la]
    fa[fa la fa] sib[sib re sib] sol[sol sib sol] do[do mi sol,]

    %18
    la[fa la fa] sib[re, fa re]\mbreak sol8 mib16 sol fa4
    sib, r r2
    r4 r8 sib' sib sib la la

    %21
    sol sol r do do do sib sib
    la la r sol16 sol\mbreak mi[mi sol mi] fad[fad la fad]
    sol[sol sib sol] la[la do la] sib[sol sib sol] re'[re, fad re]

    %24
    sol8 do,16 mib re4 sol,8 sol'16 la sib4
    r8 la16 [sib] do4\mbreak r8 sib16 [do] re[re, fad re]
    sol8 do,16 mib re4 sol, r

    %27
    r8 sol' re4 sol, r
    R1*3
    r2 r8 do'16 sib lab8 sol16 fa

    %32
    sol8 sol r4 r2
    r8 do16 sib lab8 sol16 fa sol8 sol r do
    lab fa r sib16 lab\mbreak sol8 mib r do'

    %35
    do fa, r re' re sol, r4
    r8 do do sol r16 sol [lab sib] do [fa, sol lab]
    si, [sol' fa sol] mib [do' sib do] lab [sol fa lab] sol4\mbreak

    %38
    do, r r2
    R1*2

}

VIIItestoIV = \lyricmode {

    Si -- ti -- entes _ ve -- ni -- te,  si -- ti -- entes _ ve -- ni -- te,  ve -- ni -- te,  si -- ti -- entes, _

    ve -- ni -- te,  ve -- ni -- te,  ve -- ni -- te, ve - - - - ni -- te.

    Hunc po -- tum glo -- ri -- osum, _ hunc po -- tum glo -- ri -- osum, _

    li -- quorem _ pre -- ti -- osum, _ fe -- sti -- nan - - - - - - - - tes hau -- ri -- te, hunc po -- tum glo -- ri -- osum, _

    li -- quorem _ pre -- ti -- osum, _ fe -- sti -- nan - - - - - - tes hau -- ri -- te, fe -- sti -- nan - - - - - tes hau -- ri -- te, hau -- ri -- te,

    si -- ti -- entes _ ve -- ni -- te,  si -- ti -- entes _ ve -- ni -- te,  ve -- ni -- te,  si -- ti -- entes, _

    ve -- ni -- te,  ve -- ni -- te,  ve -- ni -- te, ve - - - - ni -- te.

}

VIIIbcn = \relative do {

    do8 do'16 sib lab8 sol16 fa sol8 la?16 si do8 mib,16 fa
    sol4 do, fa sib,
    mib8 mib'16 re do8 sib?16 lab sol8 sol16 fa mib8 re16 do

    %4
    si8 do sol' sol,\mbreak do4 fa
    sol do, si8 do sol' sol,
    do4 fa r8 sol16 fa mib8 re16 do

    %7
    fa fa, fa' mib re8 sib mib mib, mi' do
    fa fa, fad' re\mbreak sol sol16 fa? mib8 re16 do
    si8 do sol' sol, do do16 sib? lab8 sol16 fa

    %10
    sol8 la16 si do8 re16 mib fa8 fa, sol' sol,
    do4 fa, sib? mib\mbreak
    lab8 do16 sib lab8 sol16 fa mib8 re16 do sol'8 sol,

    %13
    do4 re mib lab
    sol re mib la,!
    sib8 sib'16 la sol8 fa16 mib fa8 sol16 la sib8 re,16 mib

    %16
    fa4 sol mib do
    re sib mib do
    fa re mib fa

    %19
    sib,8 sib'16 la sol8 fa16 mib re8 sib fa' fa,
    sib4 re mi! fa
    do mi fad sol

    %22
    re8 re16 do sib8 sol\mbreak do4 la
    sib fad sol re'8 do
    sib do re re, sol mib' re sib

    %25
    fa fa' mib do sol' sol, re' do
    sib do re re, sol sol'16 fa mib8 re16 do
    sib8 do re re,\mbreak sol4 r

    %28
    do8 do'16 sib lab8 sol16 fa sol8 la?16 si do8 mib,16 fa
    sol4 do, fa sib,
    mib8 mib'16 re do8 sib?16 lab sol8 sol16 fa mib8 re16 do

    %31
    si8 do sol' sol,\mbreak do4 fa
    sol do, si8 do sol' sol,
    do4 fa r8 sol16 fa mib8 re16 do

    %34
    fa fa, fa' mib re8 sib mib mib, mi' do
    fa fa, fad' re\mbreak sol sol16 fa? mib8 re16 do
    si8 do sol' sol, do do16 sib? lab8 sol16 fa

    %37
    sol8 la16 si do8 re16 mib fa8 fa, sol' sol,
    do4 fa, sib? mib\mbreak
    lab8 do16 sib lab8 sol16 fa mib8 re16 do sol'8 sol,

    %40
    do4 r r2

}

VIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6> <_!> s
    <5 4!> <_-> <_-> s
    s <_-> <_!> <6>
    <6> <5 4>8 <_!> <_->4 <_->
    <5 4!> <_-> <6> <5 4>8 <_!>
    <_->4 <_-> s <6>
    <_-> <6> s <6>
    <_-> <6> <_!> <6>
    <6> <5 4>8 <_!> <_->4 <6>
    <_!> <_-> <_-> <5 4>8 <_!>
    <_->4 <_-> s s
    s s <6> <5 4>8 <_!>
    <_->4 <6> s <6> %%% b 13 OOKK
    s <6> s <6>
    s1
    s2 s4 <_->  %% OOKK b 16
    s2 s4 <_->
    s <6> s <5 4>8 <3>
    s2 <6>4 <5 4>8 <3>
    s4 <6> <6 5-> s
    s <6> <6> s
    <_+> <6> s <6+>
    <6> <6> s <_+>8 <4+ 2>
    <6>4 <5 4>8 <_+> s4 <6>
    s <6> s <_+>
    <6> <5 4>8 <_+> s4 <6>
    <6> <5 4>8 <_+> s2
    <_->4 <6> <_!> s

    <5 4!> <_-> <_-> s
    s <_-> <_!> <6>
    <6> <5 4>8 <_!> <_->4 <_->
    <5 4!> <_-> <6> <5 4>8 <_!>
    <_->4 <_-> s <6>
    <_-> <6> s <6>
    <_-> <6> <_!> <6>
    <6> <5 4>8 <_!> <_->4 <6>
    <_!> <_-> <_-> <5 4>8 <_!>
    <_->4 <_-> s s
    s s <6> <5 4>8 <_!>
    <_->4

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 65
    s1*40
    \bar "|."

}

VIIIvlI = {
    <<\VIIIvlIn \forma>>

}

VIIIvlII = {
    <<\VIIIvlIIn \forma>>

}

VIIIbasso = {
    \clef bass
    \new Voice = "sitientes"
    <<\VIIIbasson \forma>>
}



VIIIbc = {
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
}





IXvlIn = \relative do'' {

    R1*3
    r4 r8 re'16 do sib8 sib16 la sol sol do sib
    la8 sib4 la8 sib re16 do sib4

    %6
    R1*7
    r8 mi,,16 mi mi8 mi la,4 r\mbreak
    r8 fa'16 fa fa8 la sib4 r

    %15
    r8 sib16 sib sib8 re sol sib,16 sib sib8 sib
    mib4 la, re8 re,16 re la'8 la
    re4 re, la'2

    %18
    R1*12\mbreak
    r2 sib'
    do la4 sib8 la

    %32
    sol sol do sib la8 sol16 la fa8 sol16 la
    sib4. la16 sib sol8 la16 sib do8 sib16 do
    la8 do la4 sib16 sib, sib sib sib8 re\mbreak

    %35
    mib4 r re'16 re, re re re8 re'
    do4 r la16 la, la la fa8 sol
    la4 r mi'16 mi, mi mi mi8 la'

    %38
    fa4 r r la
    la si mi, r\mbreak
    do16 do, do do do8 do' sib4 r

    %41
    sol'16 sol, sol sol sol8 sol' fa4 r
    fa16 fa, fa fa fa8 fa' sib4 r
    sib16 sib, sib sib do8 sol' la4 r\mbreak

    %44
    sol16 sol, sol sol sol8 do re4 r
    re'16 re, re re re8 fad sol4 r
    do16 do, do do do8 mib fa4 r

    %47
    sol16 sol, sol sol sol8 sol' la4 r\mbreak
    fa16 fa, fa fa fa8 fa' mib4 r
    do'16 do, do do do8 do' sib4 r

    %50
    sol16 sol, sol sol sol8 sol' fa4 r
    re16 re, re re re8 re' la'4 r\mbreak
    re16 re, re re re8 fa sol4 r

    %53
    la16 la, la la la8 la'sib4 r
    fa16 fa, fa fa fa8 sib' do4 r
    fa,16 fa, fa fa fa8 fa' sol4 r

    %56
    do16 do, do do do8 do' sib4 r
    do16 do, do do do8 do' re4 r
    sib16 sib, sib sib sib8 sol' sol4 r

    %59
    fa16 fa, fa fa fa4 do''16 do, do do do'4\mbreak
    sib1

}

IXvlIIn = \relative do'' {

    R1*3
    r8 la'16 sol fad8 fad16 mi re re sol fa? mib8 mib16 re
    do8 re mib4 re8 fa16 mib re4

    %6
    R1*7
    r8 dod,16 dod dod8 si16 dod\mbreak re4 r
    r8 la' re, fa fa4 r

    %15
    r8 re' sol, sib sib mib sol, sol'
    sol16 fa mib re do4 fa8 fa,16 fa fa8 fa
    fa mi16 fa sol8 sol, do2

    %18
    R1*12\mbreak
    fa'2 sol
    do,4  fa8 mi re re sol fa

    %32
    mi re16 mi do8 re16 mi fa4. mib8
    re do16 re sib8 re mib4. re16 mib
    do8 la do4 re r

    %35
    do'16 do, do do do8 do'\mbreak si4 r
    do16 do, do do do8 sol' do,4 r
    re'16 re, re re re8 re' do4 r

    %38
    re16 re, re re re8 fa sib4 r
    r sol2 la4
    re, r\mbreak re16 re, re re re8 fa

    %41
    do'4 r la'16 la, la la la8 do
    fa4 r re16 re, re re re8 re'
    sol4 r la16 la, la la la8 la'

    %44
    sib4  r la16 la, la la la8 la'\mbreak
    sol4 r sib16 sib, sib sib sib8 sib'
    do4 r re16 re, re re re8 re'

    %47
    do4 r do16 do, do do do8 do'
    sib4 r sol16 sol, sol sol sol8 sol'
    fa4 r\mbreak re16 re, re re re8 re'

    %50
    do4 r do'16 do, do do do8 do'
    sib4 r mi,!16 mi, mi mi mi8 mi'
    fa4 r mi16 mi, mi mi mi8 mi'

    %53
    fa4 r sol16 sol, sol sol sol8 sol'\mbreak
    la4 r do16 do, do do do8 do'
    fa,4 r sol16 sol, sol sol sol8 sol'

    %56
    do4 r sib16 sib, sib sib sib8 re
    mib4 r fa16 fa, fa fa fa8 do'\mbreak
    re4 r\mbreak sol16 sol, sol sol sol8 sol'

    %59
    la4 fa16 fa, fa fa fa'2
    re1

}

IXsopranon = \relative do'' {

    \autoBeamOff

    r4 r8 re do do sib sib
    la2 sol4 sol8 sol
    fad sol16 la sib8 [la16 sol] do16[re do re] sib4

    %4
    la r r2
    r r4 r8 re\mbreak
    do8 do sib sib sib la la la

    %7
    la sol16 fa sol8[la16 sol] fa8[sol16 la] sib4~
    sib8[la] sib4 la r
    r8 re 16 re re8 do16 re sib2\mbreak

    %10
    la4 r r2
    R1*3
    r2 r8 re16 re re8 do16 re

    %15
    sib4~sib16[do la sib] sol4~sol16[la sib sol]
    do2 fa,4. fa8
    sol2 do,

    %18
    r sib'\mbreak
    do fa,4 sib8 la
    sol sol do sib la[sol16 la] fa8[sol16 la]

    %21
    sib2.(la4)
    sib2 r
    R1

    %24
    sib2 do
    fa,4 sib8 la sol sol do sib\mbreak
    la[sol16 la] fa8[sol16 la] sib4. la8

    %27
    sol sol do sib la sol fa la
    sib2 do4 fa8 mib
    re do sib re do2

    %30
    do4 r r2
    R1*3\mbreak
    r2 sib

    %35
    do fa,4 r
    r2 do'
    re sol,4 la

    %38
    fa'8 mi re re mi re dod[si16 dod]
    re[mi do? re] si8[la16 si] do4. sib?16 [do]\mbreak
    la8[sib] do[sib16 do] re2

    %41
    do do
    re1
    sol,2 r

    %44
    sol la
    re,4 re'8 do sib sib mib re
    do2~do4 si\mbreak

    %47
    do do8 sib la[sol16 la] fa8[sol16 la]
    sib8[do] re[mib16 fa] sib,8[do16 re] mib[fa re mib]
    do8[sib16 do] la8 [sib16 do] fa,8 fa sib la

    %50
    sol4 sol do8 sib la [sol]
    fa[sol16 la] sib4 la r
    r re mi2

    %53
    la,4 re8 do sib sib do sib
    la[sol16 la] sib2 la4
    sib2 r

    %56
    do re4 sol,\mbreak
    do8 sib la la la sol fa4~
    fa8[sol16 la] sib4~sib8[sol do sib]

    %59
    la16[sib sol la] sib2 la4
    sib1

}

IXtestoI = \lyricmode {

    Qui pu -- ro sem -- per cor -- de ex hoc fon -- te po -- ta - - bit,

    qui pu -- ro sem -- per cor -- de ex hoc fon -- te po -- ta - - - bit,

    su -- pe -- rabit _  A -- ver -- num, su -- pe -- rabit _ A -- ver - - num, A -- ver -- num,

    et mor -- tem non gus -- tabit _ in æ -- ter - - num, et mor -- tem non gus -- tabit _ in æ -- ter - - - - num,

    non gus -- tabit _ in æ -- ter -- num, non gus -- tabit _ in æ -- ter -- num,

    et mor -- tem, et mor -- tem non non gus -- tabit _ in æ -- ter - - - - - - - num,

    et mor -- tem, et mor -- tem non gus -- tabit _ in æ -- ter - num, in æ -- ter - - - - - - - - num,

    non gus -- ta -- bit in æ -- ter - - num, et mor -- tem non gus -- tabit _ in æ -- ter - - num,

    et mor -- tem non gus -- tabit _ in æ -- ter - - - - num.

}

IXalton = \relative do' {

    \autoBeamOff
    r4 r8 sib' la la sol sol
    sol fa fa fa fa mib16 re mib8[fa16 mib]
    re8[mi?16 fad] sol4. fad8 sol4

    %4
    fad r r2\mbreak
    R1*3
    r2 r8 la16 la la8 sol16 la

    %9
    fa2~fa4 mi
    fa r8 la sol sol fa fa
    mi2 re4 re8 re

    %12
    dod re16 mi fa8[mi16 re]\mbreak sol[la sol la] fa4
    mi r r8 la16 la la8 sol16 la
    fa4~fa16[sol mi fa] re4~re16[ mi fa re]

    %15
    sol[fad sol la] sib8 re, r sol16 sol sol8 fa?16 sol\mbreak
    mib[re do re] mib4 re do
    sib2~sib4 la

    %18
    fa'2 sol
    do,4 fa8 mib re re sol fa
    mib[re16 mib] do8[re16 mib] fa4. mib8\mbreak

    %21
    re [do16 re] sib8[do16 re] mib4 fa
    R1
    r2 fa

    %24
    sol do,4 fa8 mib
    re re sol fa mi![re16 mi] do8[re16 mi]
    fa4. mi16[fa] re8[mi] fa4~\mbreak

    %27
    fa mi fa2
    sib8 la sol fa mib re do[sib16 do]
    re8 [mi!] fa2 mi4

    %30
    fa r r2
    R1*3
    r4 fa8 mib re re sol fa\mbreak

    %35
    mib[re16 mib] do8[re16 mib] fa8[mib16 fa] sol8[fa]
    mi![fa] sol4. fa16[sol] la8[sol]
    fa[sol16 la] sib8[la] sol[fa16 sol] mi[fa re mi]

    %38
    fa4. fa8\mbreak sol fa mi mi
    fa mi mi[do16 re] mi8[re16 mi] do8[re16 mi]
    fa2 re4 fa~

    %41
    fa8 mi mi4 fa r
    fa4. mi8 re re sol fa\mbreak
    mib[re16 do] sol'2 fad8[mi?]

    %44
    re[mi16 fad] sol4. fad16[mi] fad4
    sol r sol4. fa?8
    mib mib lab sol fa[mib16 fa] re8[mib16 fa]

    %47
    sol2\mbreak fa4 r
    fa2 sol
    do,4 fa8 mi re re sol fa

    %50
    mi[re16 mi] do8[re16 mi] fa4. mi16[fa]
    re8[mi16 fa] sol8[fa] mi mi la sol\mbreak
    fa fa re4. re8 dod4

    %53
    re r r2
    r r4 mib
    fa2 sib,4 mib8 re

    %56
    do do fa mib re re sol fa
    mib[re16 mib] do8[re16 mib]\mbreak fa4. sol16[la]
    sib4. la8 sol2

    %59
    fa1
    fa

}

IXtestoII = \lyricmode {

    Qui pu -- ro sem -- per cor -- de ex hoc fon -- te po -- ta - - - - bit,

    su -- pe -- rabit _  A -- ver - num, qui pu -- ro sem -- per cor -- de ex hoc fon -- te po -- ta - - bit,

    su -- pe -- rabit _ A -- ver - -  - num, su -- pe -- rabit _ A -- ver - num, A -- ver -- num,

    et mor -- tem non gus -- tabit _ in æ -- ter - - - - - - num, et mor -- tem non gus -- tabit _ in æ -- ter - - - - - - num,

    non gus -- tabit _ in æ -- ter - - - num, non gus -- tabit _ in æ -- ter - - - - - - - - - - - - num,

    non gus -- tabit _ in æ -- ter - - - num, in æ -- ter -- num, non gus -- tabit _ in æ -- ter - - - - - - num,

    non gus -- tabit _ in æ -- ter - - num, et mor -- tem non gus -- tabit _ in æ -- ter - - - - - - num,

    non gus -- tabit _ in æ -- ter -- num, et mor -- tem non gus -- tabit, _ non gus -- tabit _

    in æ -- ter - - - - - - - num.

}

IXtenoren = \relative do' {

    \autoBeamOff

    R1*4
    r2 r4 r8 fa
    mib mib re re do2

    %7
    sib4 sib8 sib la sib16 do re8[do16 sib]
    mib [fa mib fa] re4 do r
    r8 sib16 sib sib8 la16 sib\mbreak sol2

    %10
    fa4 r8 fa' mi mi re re
    re do do do do sib16 la sib8[do16 sib]
    la8[si16 dod] re4. dod8 re4

    %13
    dod r r2\mbreak
    r8 re16 re re8 do16 re sib4~sib16[do la sib]
    sol[la sib do] re4 mib8[mib,] sib'4~

    %16
    sib la sib8[re,] fa4~
    fa mi fa2
    R1*3

    %21
    sib2 do\mbreak
    fa,4 sib8 la sol sol do sib
    la[sol16 la] fa8[sol16 la] sib4. la16[sib]

    %24
    sol8[la] sib2 la4
    sib8[la16 sib] sol8[la16 sib] do8[sib la sol]
    re'4. do8 sib4 re\mbreak

    %27
    r2 fa8 mi re do
    re4 sol, la8[sib] do4
    fa,4. sib16[la] sol2

    %30
    la4 r r2
    R1*2
    sib2 do

    %34
    fa, r
    do' re
    sol,4 do8 sib\mbreak la la r4

    %37
    r re mi2
    la,4 re8 do sib[re] la8[sol16 la]
    fa4 sol do8 sib la[sol]

    %40
    fa[sol] la[sol16 la] sib4. la8
    sol2 la4 fa'8 mi\mbreak
    re re r4 r2

    %43
    r4 mib8 re do4 la
    r2 r4 re8 do
    sib sib r4 r2

    %46
    r4 do re2
    sol,4 mib'8 re do do fa mib\mbreak
    re[do16 re] sib8[do16 re] mib8 mib, r4

    %49
    R1
    r4 do'8 sib la[sol16 la] fa8[sol16 la]
    sib8[la] sol re'4 dod16[sib] dod4

    %52
    re r r2\mbreak
    r4 fa8 mi re re mib re
    do[sib16 do] re8[sib] mib2~

    %55
    mib4 re r2
    r sib
    do fa,4 fa'8 mib

    %58
    re re re do\mbreak sib[do16 re] mib4~
    mib re do2
    re1

}

IXtestoIII = \lyricmode {

    Qui pu -- ro sem -- per cor -- de ex hoc fon -- te po -- ta - - bit, su -- pe -- rabit _  A -- ver -- num,

    qui pu -- ro sem -- per cor -- de ex hoc fon -- te po -- ta - - - - bit, su -- pe -- ra -- bit  A -- ver - - - - - - - - num,

    et mor -- tem non gus -- tabit _ in æ -- ter  - - - - - - - - - - - - num, non gus -- tabit _ in æ -- ter - - - - num,

    et mor -- tem, et mor -- tem non gus -- tabit, _ et mor -- tem non gus -- ta - - bit in æ -- ter  - - - - -  num,

    non gus -- tabit, _ non gus -- tabit, _ non gus -- tabit, _ et mor -- tem non gus -- tabit, _

    in æ -- ter  - - num, in æ -- ter  - - - - - - num, non gus -- ta -- bit in æ -- ter  - -  num,

    et mor -- tem non gus -- ta -- bit in æ -- ter  - - -  num.

}

IXbasson = \relative do {

    \autoBeamOff

    R1*12
    r8 la'16 la la8 sol16 la fa4~fa16[sol mi fa]
    re4 re r2

    %15
    r8 sol16 sol sol8 fa16 sol mib4~mib16[fa re mib]
    do2\mbreak sib4 la
    sol2 fa

    %18
    R1*2
    r2 fa'
    sol do,4 fa8 mib

    %22
    re re sol fa mib[re16 mib] do8[re16 mib]
    fa4. mib8 re[do16 re] sib8[do16 re]\mbreak
    mib8[fa] sol4 fa2

    %25
    R1
    r2 sib
    do fa,4 sib8 la

    %28
    sol fa mib re do[sib16 do] la8[sol16 la]
    sib8[do re sib]  do[sib] do4
    fa r r2\mbreak

    %31
    R1*2
    r2 r4 mib
    fa2 sib,4 mib8 re

    %35
    do do fa mib re[do16 re] si8[la16 si]
    do8[re] mi[re16 mi] fa8 fa, fa' mi\mbreak
    re re sol fa mi [re16 mi] dod8[si16 dod]

    %38
    re8[do!16 re] sib8[la] sol4 la
    R1
    r2 sib

    %41
    do fa,4 r
    r sib'4. la8 sol fa\mbreak
    r4 do8 sib la la re do

    %44
    sib[do16 re] mib4 re r
    r sib'8 la sol[fa16 sol] mib8[mib]
    lab[sol16 lab] fa8[mib] re re sol fa\mbreak

    %47
    mib[re16 mib] do8[re16 mib] fa8 fa, r4
    r2 r4 do''8 sib
    la[sol16 la] fa8[sol16 la] sib8[la16 sib] sol8[la16 sib]

    %50
    do8 do, r4 r2
    r4 sol' la2\mbreak
    re,4 sol8 fa mi mi la sol

    %53
    fa[mi16 fa] re8[mi16 fa] sol8 [fa16 sol] mib4~
    mib re do2
    sib4 sib'8 la sol sol do sib\mbreak

    %56
    la8[sol16 la] fa8[sol16 la] sib8[sib,] mib[re16 mib]
    do8 do fa mib re re re do
    sib4. do16[re] mib2

    %59
    fa1
    sib,

}

IXtestoIV = \lyricmode {

    su -- pe -- rabit _  A -- ver - num, su -- pe -- rabit _  A -- ver -. num, A -- ver -- num,

    et mor -- tem non gus -- tabit _ in æ -- ter  - - - - - - - num, et mor -- tem non gus -- tabit _ in æ -- ter  - - - - num,

    et mor -- tem non gus -- tabit _ in æ -- ter  - - - - num, non gus -- tabit _ in æ -- ter  - - - - num,

    et mor -- tem non gus -- tabit, _ non gus -- tabit _ in æ -- ter  - num, in æ -- ter  -  - - - num,  in æ -- ter  - - num,

    in æ -- ter  -  - - - num, et mor -- tem non gus -- tabit  _ in æ -- ter  - - - - - num, non gus -- tabit  _ in æ -- ter  - - - - num,

    non gus -- tabit _ in æ -- ter  - - - num.

}

IXbcn = \relative do {

    sol'4 sol, la sib
    do re si do\parenthesize ~
    do sib? la sol

    %4
    re' r sol do,
    fa8 re do4 sib r8 sib
    do4 re mib fa

    %7
    re mib2 re4\mbreak
    do sib fa' r
    r8 sib16 sib sib8 la16 sib sol2

    %10
    fa4 re mi fa
    sol la fad sol~
    sol fa mi re

    %13
    la8 la'16 la la8 sol16 la fa4. mi8\mbreak
    re4. do8 sib4. la8
    sol sol'16 sol sol8 fa16 sol mib4. re8

    %16
    do2 sib4 la
    sol2 fa
    r8 fa'8 sib la sol la sib sol

    %19
    la sol fa sol16 la sib8 la sol4\mbreak
    do8 sib la sol fa2
    sol do,4 fa8 mib

    %22
    re4 sol8 fa mib re16 mib do8 re16 mib
    fa4. mib8 re do16 re sib8 do16 re
    mib8 fa sol4 fa fa,

    %25
    sib8 la16 sib sol8 la16 sib do8 sib la sol
    re'4 re'8 do sib2
    do fa,4 sib8 la

    %28
    sol fa mib re do sib16 do la8 sol16 la
    sib8 do re sib do sib do do,\mbreak
    fa fa' re sib mib4 sib'~

    %31
    sib la sib8 la sol sol,
    do' sib la sol fa mib re do
    sib2 do4 mib

    %34
    fa2 sib,4 mib8 re
    do4 fa8 mib\mbreak re do si la16 si
    do8 re mi re16 mi fa8 fa, fa' mi

    %37
    re4 sol8 fa mi re dod si16 dod
    re8 do? sib la sol4 la
    fa sol\mbreak do'8 sib la sol

    %40
    fa sol la fa sib,2
    do fa,4 fa'8 mi
    re4 sib'4. la8 sol fa

    %43
    mib re do sib la la re do
    sib re mib4 re re'8 do\mbreak
    sib sib, sib' la sol fa mib4

    %46
    lab8 sol fa mib re re sol fa
    mib re16 mib do8 re16 mib fa4 \clef tenor \key fa\major fa'8 mib
    re do16 re sib8 do16 re\mbreak mib8 mib,  \clef bass \key fa\major do' sib

    %49
    la sol16 la fa8 sol16 la sib8 la16 sib sol8 la16 sib
    do8 do, do' sib la sol16 la fa8 sol16 la
    sib8 la sol4 la2\mbreak

    %52
    re,4 sol8 fa mi mi la sol
    fa mi16 fa re8 mi16 fa sol8 fa mib4~
    mib re do2

    %55
    sib4 sib'8 la sol sol do sib
    la8 sol16 la fa8 sol16 la\mbreak sib8 sib, mib re16 mib
    do8 do fa mib re re re do

    %58
    sib4. do16 re mib2
    fa1
    sib,\fermata

}

IXbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>4 <6>
    <6> s <6 5-> <_->
    <4+ 2> <6> <7>8 <6+> s4
    <_+> s <_-> <_->
    s <6 _-> s2
    <_->4 <6> <6 4> s
    <6 5> <5> <4 2> <6>
    <7 _->8 <6> s4 s2
    s <7>4 <6>
    s2 <6>4 <6>
    <6 5> s <6 5-> s
    <4+ 2> <6> <7>8 <6+> s4
    <_+>2 <6>
    s1
    s
    <_->2 s4 <6>
    <7> <6> <4> <3>
    s2 s4 <6>
    s s8 <6-> s2
    <_-> <8>4. <7- 5>8
    s2 <_->
    <6> <6>4 <_->
    s4. <4+ 2>8 <6>4 s
    s s <5 4> <3>
    s <6> s2
    s <8>4 <7->
    <5 4> <3> s2
    s <_->4 <6>
    s <6> s8 <7 5> <5 4> <3>
    s4 <6> s <6>
    <4- 2> <6> s2
    s4 <6> s2
    s <_->4 <6>
    s1
    <_->2 <6!>4 <6>
    <_!> <6> s2
    s <6>4 <6>
    s2 s4 <_+>
    <_-> <_!> s2
    <6>1
    <5 4>4 <3> s2
    s1
    s4 <_-> <7> <_+>
    <6> s <4> <_+>
    <6> s8 <6+> s2
    s4 <_-> <7> <_!>
    <6> <_-> <5> s
    <6>2 s4 <_->
    <6> s s2
    s <6>
    s4 <6 5> <5 4> <_+>
    s2 <7>4 <_+>
    <6> s s <6>
    <6 4 2> <6> <7 _-> <6>
    <5 4-> <3> s <_->
    <6>2 s
    <_->1
    s
    <5 4>2 <3>

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 63
    s1*60
    \bar "|."

}

IXvlI = {
    <<\IXvlIn \forma>>

}

IXvlII = {
    <<\IXvlIIn \forma>>

}

IXsoprano = {
    \new Voice = "corde1"
    <<\IXsopranon \forma>>
}

IXalto = {
    \new Voice = "corde2"
    <<\IXalton \forma>>
}

IXtenore = {
    \new Voice = "corde3"
    <<\IXtenoren \forma>>
}

IXbasso = {
    \clef bass
    \new Voice = "corde4"
    <<\IXbasson \forma>>
}



IXbc = {
    \clef bass
    <<\IXbcn \forma \IXbfn>>
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

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {

        systems-per-page = #2

    }


    \header {
        subtitle = \markup "Properate fideles - Concerto sacro a 4 Voci con Violini [Op. 2 n. VIII] "
        composer = \markup {"A. Scarlatti (1660-1725)"}
    }

    \markup \huge {[1.] Properate fideles}

    \score {
        <<

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key fa\major \time 4/4 r8 ^\markup\center-align "Canto" fa''16 mib''}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \Isoprano \global
                    \new Lyrics \lyricsto "fideles1" \ItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key fa\major \time 4/4 r2 r8^\markup\center-align "Alto" fa'16 fa'}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \Ialto \global
                    \new Lyrics \lyricsto "fideles2" \ItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key fa\major \time 4/4 r2 r8 la la^\markup\center-align"Tenore"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \Itenore \global
                    \new Lyrics \lyricsto "fideles3" \ItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"synth voice"
                    \Ibasso \global
                    \new Lyrics \lyricsto "fideles4" \ItestoIV
                >>
            >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                    \IvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                    \IvlII\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violoncello e"\vspace #-0.3"Basso continuo"}
                    \set Staff.midiInstrument = #"contrabass"
                    \Ibc\global
                >>
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #10
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

    \paper {

        systems-per-page = #6

    }

    \markup \huge {[2.] O quam dulces. Recitativo}

    \score {

        \new ChoirStaff  <<

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 4/4 r4 ^\markup\center-align "Canto" re''8 sib'}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \IIsoprano \global
                \new Lyrics \lyricsto "dulces" \IItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello e"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"contrabass"
                \IIbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
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

    \paper {

        systems-per-page = #4

    }

    \markup \huge {[3.] Quot odores. Andante}

    \score {

        \new ChoirStaff  <<

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 3/8\numericTimeSignature r4. r8 ^\markup\center-align "Canto" re'' sib'}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \IIIsoprano \global
                \new Lyrics \lyricsto "odores" \IIItestoI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \IIIvlI\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \IIIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello e"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

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

    \paper {

        systems-per-page = #5

    }

    \markup \huge {[4.] Ad rivulos amoris. Adagio}

    \score {

        \new ChoirStaff  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 4/4 r4 r8^\markup\center-align "Alto" la'8 sol'8. sol'16}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \IValto \global
                \new Lyrics \lyricsto "rivulos2" \IVtestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key fa\major \time 4/4 r4 r8 ^\markup\center-align"Tenore" fa'8 mi'8. mi'16}
                \clef "treble_8"
                \set Staff.midiInstrument = #"synth voice"
                \IVtenore \global
                \new Lyrics \lyricsto "rivulos3" \IVtestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello e"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"contrabass"
                \IVbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

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

    %\pageBreak

    \markup \huge {[5.] Ritornello. Adagio}

    \score {

        \new ChoirStaff  <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \VvlI\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \VvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello e"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"contrabass"
                \Vbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

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

    \pageBreak

    \markup \huge {[6.] O fluida vita}

    \score {

        \new ChoirStaff  <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 12/8\numericTimeSignature r2 r4 r8^\markup\center-align "Alto" sol'4.}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \VIalto \global
                \new Lyrics \lyricsto "fluida2" \VItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key fa\major \time 12/8\numericTimeSignature r4 r8 ^\markup\center-align"Tenore" do'4.}
                \clef "treble_8"
                \set Staff.midiInstrument = #"synth voice"
                \VItenore \global
                \new Lyrics \lyricsto "fluida3" \VItestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello e"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"contrabass"
                \VIbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

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

    %\pageBreak

    \markup \huge {[7.] Ritornello}

    \score {

        \new ChoirStaff  <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \VIIvlI\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \VIIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello e"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"contrabass"
                \VIIbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

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

    \paper {

        systems-per-page = #4

    }

    \markup \huge {[8.] Sitientes venite}

    \score {

        \new ChoirStaff  <<

            \new Staff  <<
                \clef bass
                \set Staff.midiInstrument = #"synth voice"
                \VIIIbasso \global
                \new Lyrics \lyricsto "sitientes" \VIIItestoIV
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                \VIIIvlI\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                \VIIIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello e"\vspace #-0.3"Basso continuo"}
                \set Staff.midiInstrument = #"contrabass"
                \VIIIbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

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

    \paper {

        systems-per-page = #2

    }

    \markup \huge {[9.] Qui puro semper corde}

    \score {
        <<

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key fa\major \time 4/4 r4 r8 ^\markup\center-align "Canto" re''16 do''}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \IXsoprano \global
                    \new Lyrics \lyricsto "corde1" \IXtestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key fa\major \time 4/4 r4 r8^\markup\center-align "Alto" sib'16 la'}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \IXalto \global
                    \new Lyrics \lyricsto "corde2" \IXtestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key fa\major \time 4/4 r1 r r r^\markup\center-align"Tenore"r2 r4 r8 fa'}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \IXtenore \global
                    \new Lyrics \lyricsto "corde3" \IXtestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"synth voice"
                    \IXbasso \global
                    \new Lyrics \lyricsto "corde4" \IXtestoIV
                >>
            >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Primo"}
                    \IXvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"Secondo"}
                    \IXvlII\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violoncello e"\vspace #-0.3"Basso continuo"}
                    \set Staff.midiInstrument = #"contrabass"
                    \IXbc\global
                >>
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #10
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



