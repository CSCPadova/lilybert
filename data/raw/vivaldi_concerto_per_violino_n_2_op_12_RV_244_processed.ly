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

Iglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \tupletSpan 4 \con
}

Ivln = \relative do'' {

  r8 la' re,4~re8 la' re,4~
  re8 sib la16 sol fa mi \once\stemUp re8 la'' re,4~
  re8 la' re,4~re8 sib' la16 sol fa mi\mbreak

  %4
  fa8 re fad4\upl sol\upl sold\upl
  la8 mi la,4~la8 mib' re16 do sib la
  sib8 re sol,4~sol8 re' do16 sib la sol

  %7
  la8 do fa,4~fa8 fa' mi16 re dod si
  la4. sib?8 la4. sib8\mbreak
  la8 fa' mi16 re dod si la4 fad'\upl

  %10
  sol\upl sold\upl la8\upl fa? mi16 re dod si
  la4 la'\upl si\upl dod\upl
  re r la,8 sol16 fa la8 sol16 fa

  %13
  sol4 r sol8 fa16 mi sol8 fa16 mi\mbreak
  fa4 r re'\upl mi\upl
  dod\upl re\upl r8 sol fa[mi]

  %16
  re4 r fa sol
  sol fa r8 mi re[dod]
  re4 r4  la'8\solo re16(la) sib4\tr

  %19
  la4. sib8 la sol16(fa) \appoggiatura la8 sol fa16(mi)
  fa8 mi re4\mbreak la'8 re16(la) sib4
  la4. sol8 fa mi16(re) sib'8 sol

  %22
  mi16 re dod si la sol fa mi fa8 re r mi'
  fa32(sol la8.) fa32(sol la8.) sib,8 sib'(sol fa)
  mi32(fa sol8.) mi32(fa sol8.)\mbreak la,8 la'(fa mi)

  %25
  re32(mi fa8.) re32(mi fa8.) sol,8 sol'(mi re)
  dod la si\tr[la] r dod re\tr [dod]
  r mi fa\tr[mi]  \tuplet 3/2 {
    la8(sol fa mi[re do?)]

    %28
    sib(do re mi[fa sol)] \mbreak sol(fa mi re[do sib)]
    la(sib do re[mi fa)] fa(mi re do[sib la)]
    sol(la sib do[re mi)]
  } fa8 fa, r fa'

  %31
  \appoggiatura sol fa16(mi fa8) \appoggiatura sol fa16(mi fa8) mi16 re do8 r sib'\mbreak
  \appoggiatura la sol16(fa sol8) \appoggiatura la sol16(fa sol8) la16 sol fa8 r sib
  la32(sol fa8.) sol32(fa mi8.) fa8 do'\tu fa,4 ~

  %34
  fa8 do' fa,4~fa8 re do16 sib la sol
  la8 fa la4\upl sib\upl si\upl\mbreak
  do8 la' sol16 fa mi re do4 do\upl

  %37
  re\upl mi\upl fa8 la sol16 fa mi re
  do4 r fa sol
  mi fa r8 sib la[sol]

  %40
  fa4 r la sib
  sib la r8 sol fa[mi]\mbreak
  fa do4\solo reb8 reb do4 reb8

  %43
  sib lab16 sol do8 sib lab sol fa4
  fa'8 do4 reb8 reb do4 fa8
  lab sol16 fa sib8 sol \appoggiatura fa mi2

  %46
  mi16 do mi fa sol mi sol la\mbreak sib4. la16 sol
  la sol fa8 r4 la,16 fa la sib do la do re
  mib4. re16 do re do sib8 r4

  %49
  re16 si re mi ?fa re fa sol la4. sol16 fa
  mi re do8 r do\mbreak la'32(sol fa8.) la32(sol fa8.)
  mi32(re do8.) sib'32(la sol8.) la32(sol fa8.) la32(sol fa8.)

  %52
  mi32(re do8.) r8 sol' sib32(la sol8.) sib32(la sol8.)
  fa32(mi re8.) fa32(mi re8.) \mbreak sib'32(la sol8.) sib32(la sol8.) %% inizio seconda pag.
  fa32(mi re8.) r8 la' fad32(mi re8.) do'32(sib la8.)

  %55
  sib16(sol fad sol) sib(sol fad sol) la(fad mi fad) la(fad mi fad)\mbreak
  sol re sol sib fad re fad la sol8 fad16 mib re8 do
  sib'32(la sol8.) la32(sol fad8.) sol8 re\tu sol,4~

  %58
  sol8 re' sol,4~sol8 mib' re16 do sib la
  sol4 re'\upl mi?\upl fad\upl\mbreak
  sol\upl re\upl mi\upl fad\upl

  %61
  sol r re8 do16 sib re8 do16 sib
  do4 r do8 sib16 la do8 sib16 la
  sib4 r sol' la

  %64
  fad sol r8 do, sib[la]
  sol16\solo(la sib) do re  mi fad sol\mbreak la,8 do fad la
  la16(sol fad) mi re do sib la sib8 sol r re'

  %67
  mib16 do do sol' sol8(fa?16) mib re sib sib fa' fa8(mib16) re
  do la la mib' mib8(re16) do\mbreak sib sol sol sib' sib8(la16) sol
  fa re re fa fa8(mi?16) re dod la la sol' sol8(fa16) mi

  %70
  fa8 la\tu re,4~re8 la' re,4~
  re8 sib la16 sol fa mi \once\stemUp re8 la'' re,4~\mbreak
  re8 la' re,4~re8 sib' la16 sol fa  mi

  %73
  fa8 re r la'\solo \appoggiatura mi re16(dod re4) la'8
  \appoggiatura mi re16(dod re4) sib'8 \appoggiatura sib la16(sol la8) \appoggiatura la sol16(fa sol8)
  fa16 mi re8 r la'\mbreak do sib16(la sol fad sol la)

  %76
  sib la sol8 r sol sib la16(sol fa? mi fa sol)
  la sol fa8 r la   \appoggiatura mi re32(dod re8.) \appoggiatura mi re32(dod re8.)
  mib8 sol \appoggiatura fa mib re16 (dod)\mbreak re8 fa \appoggiatura mi? re dod16 si?

  %79
  la4 r8 mi' fa16(la fa re la8) sol'
  fa4\tr mi8 la, fa'16 la fa re la8 sol'
  fa4\tr mi8 la \appoggiatura la sold32(fad sold8.) \appoggiatura la sold32(fad sold8.)

  %82
  sold?4(la8) sol\mbreak  fa32(mi re8.) mi32(re dod8.)
  dod?4(re8) sold \appoggiatura la sold32(fad sold8.) \appoggiatura la sold32(fad sold8.)
  sold?4(la8) sol fa32(mi re8.) mi32(re dod8.)

  %85
  re4^\markup\italic"[Tutti]" re~re8 la' re,4~\mbreak
  re8 sib la16 sol fa mi \once\stemUp re8 la'' re,4~
  re8 la' re,4~re8 sib' la16 sol fa mi

  %88
  fa8 re fad4\upl sol\upl sold\upl
  la8 mi la,4~la8 mib' re16 do sib la
  sib8 re sol,4~\mbreak sol8 re' do16 sib la sol

  %91
  la8 do fa,4~fa8 fa' mi16 re dod si
  la4. sib?8 la4. sib8
  la fa' mi16 re dod si la4 fad'\upl

  %94
  sol\upl sold\upl la8 fa? mi16 re dod si
  la4 la'\upl\mbreak si\upl dod\upl
  re r la,8 sol16 fa la8 sol16 fa

  %97
  sol4 r sol8 fa16 mi sol8 fa16 mi
  fa4 r re'\upl mi\upl
  dod\upl re\upl r8 sol fa[mi]

  %100
  re4 r fa sol
  sol fa r8 mi re[dod]
  re1

}

IvlIn =  \relative do'' {

  r8 la' re,4~re8 la' re,4~
  re8 sib la16 sol fa mi \once\stemUp re8 la'' re,4~
  re8 la' re,4~re8 sib' la16 sol fa mi\mbreak

  %4
  fa8 re fad4\upl sol\upl sold\upl
  la8 mi la,4~la8 mib' re16 do sib la
  sib8 re sol,4~sol8 re' do16 sib la sol

  %7
  la8 do fa,4~fa8 fa' mi16 re dod si
  la4. sib?8 la4. sib8\mbreak
  la8 fa' mi16 re dod si la4 fad'\upl

  %10
  sol\upl sold\upl la8\upl fa? mi16 re dod si
  la4 la'\upl si\upl dod\upl
  re r la,8 sol16 fa la8 sol16 fa

  %13
  sol4 r sol8 fa16 mi sol8 fa16 mi\mbreak
  fa4 r re'\upl mi\upl
  dod\upl re\upl r8 sol fa[mi]

  %16
  re4 r fa sol
  sol fa r8 mi re[dod]
  re4 r r2

  %19
  R1*14
  r2 r8 do' fa,4~
  fa8 do' fa,4~fa8 re do16 sib la sol

  %35
  la8 fa la4\upl sib\upl si\upl\mbreak
  do8 la' sol16 fa mi re do4 do\upl

  %37
  re\upl mi\upl fa8 la sol16 fa mi re
  do4 r fa sol
  mi fa r8 sib la[sol]

  %40
  fa4 r la sib
  sib la r8 sol fa[mi]
  fa4 fa,\p fa fa

  %43
  sol8 fa mi do fa4 fa
  fa fa fa fa
  fa8 reb sib4 do8 re? mi do\mbreak

  %46
  do' do mi mi sol sol mi mi
  do do la[la] fa fa la la
  do do la[la] sib sib fa fa

  %49
  si si re re fa fa re re
  do do sol[sol]\mbreak fa' fa fa fa
  mi mi mi mi fa fa fa fa

  %52
  mi mi mi mi sol sol sol sol
  fa fa fa fa sol sol sol sol
  fa fa fa fa\mbreak fad fad fad fad

  %55
  sol sol sol sol fad fad fad fad
  re re re re re mib la,[la]
  sib sib la la sib re sol,4\f~

  %58
  sol8 re' sol,4~sol8 mib' re16 do sib la
  sol4 re'\upl mi?\upl fad\upl\mbreak
  sol\upl re\upl mi\upl fad\upl

  %61
  sol r re8 do16 sib re8 do16 sib
  do4 r do8 sib16 la do8 sib16 la
  sib4 r sol' la

  %64
  fad sol r8 do, sib[la]
  sol4 r r2
  R1*4

  %70
  r8 la' re,4~re8 la' re,4~
  re8 sib la16 sol fa mi \once\stemUp re8 la'' re,4~\mbreak
  re8 la' re,4~re8 sib' la16 sol fa  mi

  %73
  fa8 re r re,\p re mi fa mi
  re mi fa sol fa re mi la,
  re mi fa re re fad fad fad\mbreak

  %76
  sol la sib sol do, mi mi mi
  fa sol la fa re mi fa re
  sol2 fa4 sol

  %79
  dod,8 si dod la re re dod la\mbreak
  r re dod[la] r re dod[la]
  r re dod[la] sib4 sib

  %82
  la8 si dod la re fa sol la
  re, mi fa sib,?\mbreak sib4 sib
  la8 si dod la re fa sol la

  %85
  re,4 re'~re8 la' re,4~
  re8 sib la16 sol fa mi \once\stemUp re8 la'' re,4~
  re8 la' re,4~re8 sib' la16 sol fa mi

  %88
  fa8 re fad4\upl sol\upl sold\upl
  la8 mi la,4~la8 mib' re16 do sib la
  sib8 re sol,4~\mbreak sol8 re' do16 sib la sol

  %91
  la8 do fa,4~fa8 fa' mi16 re dod si
  la4. sib?8 la4. sib8
  la fa' mi16 re dod si la4 fad'\upl

  %94
  sol\upl sold\upl la8 fa? mi16 re dod si
  la4 la'\upl\mbreak si\upl dod\upl
  re r la,8 sol16 fa la8 sol16 fa

  %97
  sol4 r sol8 fa16 mi sol8 fa16 mi
  fa4 r re'\upl mi\upl
  dod\upl re\upl r8 sol fa[mi]

  %100
  re4 r fa sol
  sol fa r8 mi re[dod]
  re1

}

IvlIIn = \relative do'' {

  r4 r8 fa,16 sol la8 fa r fa16 sol
  la8 fa r fa16 sol la8 fa r fa16 sol\mbreak
  la8 fa r fa16 sol la8 fa r dod'

  %4
  re4\upl do?\upl si\upl mi\upl
  mi r re2~
  re do~

  %7
  do si4. sold8
  mi fa4 sol?8 fa4. sol8\mbreak
  fa8 la si sold mi re' do4\upl
  
  %10
  si\upl mi\upl mi8 si4 sold8
  \parenthesize mi4 la'2 sol?4
  fa r fa,8 mi16 re fa8 mi16 re
  
  %13
  mi4 r mi8 re16 dod mi8 re16 dod\mbreak
  re4 r fa'\upl sol\upl
  sol\parenthesize \upl fa\parenthesize \upl r8 mi re[dod]
  
  %16
  re4 r re mi
  dod re r8 sol fa[mi]
  re4 r r2
  
  %19
  R1*14
  r2 r4 r8 la16 sib\mbreak
  do8 la r la16 sib do8 la r mi
  
  %35
  fa4\upl mib\upl re\upl sol\upl
  sol8 do re[si] sol4 do'~
  do sib? do8 do, re si
  
  %38
  sol4 r la' sib?\mbreak
  sib la r8 sol fa[mi]
  fa4 r fa sol
  
  %41
  mi fa r8 sib la[sol]
  fa4 fa,\p fa fa
  sol8 fa mi do fa4 fa
  
  %44
  fa fa fa fa
  fa8 reb sib4 do8 re? mi do
  sol' sol do[sol'] mi mi do do
  
  %47
  la la fa[fa] la la do[mib]
  la, la fa fa fa fa re re\mbreak
  sol sol si[fa'] re re si si
  
  %50
  sol sol mi mi do' do do la
  sol sol sol do do do do la
  sol sol sol sol\mbreak mi' mi mi mi
  
  %53
  la, la la la mi' mi mi mi
  la, la la la la la la[re]
  re re re sib la la la la\mbreak
  
  %56
  sib sib la la sib sol re re
  re re fad fad re4 r8 sib'16\f do
  re8 sib r sib16 do re8 sib r fad'
  
  %59
  sol4 re2 do4\parenthesize \upl\mbreak
  sib\parenthesize \upl re2 do4\parenthesize \upl
  sib r sib8 la16 sol sib8 la16 sol
  
  %62
  la4 r la8 sol16 fad la8 sol16 fad
  sol4 r sib do
  do sib r8 la sol[fad]\mbreak
  
  %65
  sol4 r r2
  R1*4
  r4 r8 fa16 sol la8 fa r fa16 sol
  
  %71
  la8 fa r fa16 sol la8 fa r fa16 sol
  la8 fa r fa16 sol\mbreak la8 fa r dod'
  re la r re, re\p mi fa mi
  
  %74
  re mi fa sol fa re mi la,
  re mi fa re re fad fad fad\mbreak
  sol la sib sol do, mi mi mi
  
  %77
  fa sol la fa re mi fa re
  sol2 fa4 sol
  dod,8 si dod la re re dod la
  
  %80
  r re dod [la]\mbreak r re dod[la]
  r8 re dod [la] sib4 sib
  la8 si dod la re fa sol la
  
  %83
  re, mi fa sib,? sib4 sib
  la8 si dod la re fa sol la\mbreak
  re,4 r8 fa16 sol la8 fa r fa16 sol
  
  %86
  la8 fa r fa16 sol la8 fa r fa16 sol
  la8 fa r fa16 sol la8 fa r dod'
  re4\upl do\upl si\upl mi\upl\mbreak
  
  %89
  mi r re2~
  re do~
  do si4. sold8
  
  %92
  mi fa4 sol8 fa4. sol8
  fa la si sold mi re' do4\upl
  si\upl mi\upl mi8 si4 sold8
  
  %95
  mi4 la'2 sol?4\mbreak
  fa4 r fa,8 mi16 re fa8 mi16 re
  mi4 r mi8 re16 dod mi8 re16 dod
  
  %98
  re4 r fa'\upl sol\upl
  sol fa r8 mi re[dod]
  re4 r re mi\mbreak
  
  %101
  dod re r8 sol fa[mi]
  re1

}

Ivlan =  \relative do' {
  
  r4 r8 re16 mi fa8 re r re16 mi
  fa8 re r re16 mi fa8 re r re16 mi\mbreak
  fa8 re r re16 mi fa8 re r mi
  
  %4
  la fa la fad re2
  do4 r r8 do' la[fad]
  re4 r r8 sib' sol[mi]
  
  %7
  do4 r\mbreak  r8 re mi[mi]
  dod la16 sol fa8 mi fa la16 sol fa8 mi
  fa re' mi[mi] dod fa la fad
  
  %10
  re2 dod8 re mi mi\mbreak
  dod4 re re8 sib' \parenthesize mi, [dod']
  la4 r re, re
  
  %13
  si r dod dod
  la r la' sib
  mi, fa r8 sib la[la]
  
  %16
  fa4 r la sib\mbreak
  mi, fa r8 sib la[la]
  fa4 r r2
  
  %19
  R1*14
  r2 r4 r8 fa16 sol
  la8 fa r fa16 sol la8 fa r do
  
  %35
  do la do la\mbreak fa'2
  mi8 do si[re] mi do16 si do8 la
  fa re' sol,[mi'] do do si4
  
  %38
  mi r do' re
  sol, la r8 re do[do]\mbreak
  la4 r do re
  
  %41
  sol, la r8 re do[do]
  la4 r r2
  R1*3
  
  %46
  do,8\p do do do do do do do
  fa fa fa fa fa fa fa fa\mbreak
  fa fa fa fa sib, sib sib sib
  
  %49
  si si si si si si si si
  do do do do fa, fa fa fa
  do' do do do\mbreak fa fa fa fa
  
  %52
  do do do do dod dod dod dod
  re re re re dod dod dod dod
  re re re re re re re re\mbreak
  
  %55
  sol, sol sol sol re' re re re
  sol, sol re'[re] sol, do fad,[fad]
  sol sol re'[re] sol,4 r8 sol'16\f la
  
  %58
  sib8 sol r sol16 la\mbreak sib8 sol r re
  re sib'16 la sib8 sol sol mi la[fad]
  re sib'16 la sib8 sol sol mi la fad
  
  %61
  re4 r re re
  mib r \mbreak re re
  re r re mib
  
  %64
  la, sib r8 mib re[re]
  sib4 r r2
  R1*4
  
  %70
  r4 r8 re16 mi fa8 re r re16 mi\mbreak %%% fine pagina
  fa8 re r re16 mi fa8 re r re16 mi
  fa8 re r re16 mi fa8 re s la'
  
  %73
  la fa r4 r2
  R1*11
  r4 r8 re16 mi\mbreak fa8 re r re16 mi
  
  %86
  fa8 re r re16 mi fa8 re r re16 mi
  fa8 re r re16 mi fa8 re r mi
  la fa la fad re2\mbreak
  
  %89
  do4 r r8 do' la [fad]
  re4 r r8 sib' sol[mi]
  do4 r r8 re mi[mi]
  
  %92
  dod la16 sol fa8 mi fa la16 sol fa8 mi\mbreak
  fa re' mi[mi] dod fa la fad
  re2 dod8 re mi mi
  
  %95
  dod4 re re8 sib' \parenthesize mi,[dod']
  la4 r re, re
  si r \mbreak dod dod
  
  %98
  la r la' sib?
  mi, fa r8 sib la[la]
  fa4 r la sib
  
  %101
  mi, fa r8 sib la[la]
  fa1
  
}

Ibcn = \relative do {

  re8 re16 mi fa8 re r re16 mi fa8 re
  r re dod[la] r re16 mi fa8 re
  r re16 mi fa8 re\mbreak r re dod[la]
  r re'16 do? re8 re, \once\stemUp sol, mi''16 re mi8 mi,

  %5
  la,4 r8 do' fad,4. re8
  sol sol, r sib' mi,4. do8
  fa fa, r la' re, re' sold,[mi]\mbreak

  %8
  la fa16 mi re8 dod re fa16 mi re8 dod
  re re' sold,[mi] \once\stemUp la, re'16 do re8 re,
  \once\stemUp sol, mi''16 re mi8 mi, \once\stemUp la, re' sold,[mi]

  %11
  la fa16 mi fa8 re\mbreak sol4 la
  re, r re re
  sol, r la la

  %14
  re r re sol
  la re, r8 sol, la[la]
  re,4 r re' sol

  %17
  la re, r8 sol, la[la]\mbreak
  re,4 r re'8\solo fa sol [dod,]
  re la' fa[dod] re re' sol, la

  %20
  re, mi fa[mi] re fa sol[dod,]
  re mi fa[dod] re fa sol[sol,]\mbreak
  la si dod[la] re re' dod[la]

  %23
  re4 re sol,2
  do4 do fa,2
  sib4 sib mi,2

  %26
  la,4 r la r
  la r fa'2
  sol mi

  %29
  fa\mbreak re
  mi4 do fa8 sol la[sol]
  fa sol la[fa] do re mi[re]

  %32
  do re mi[do] fa sol la[ mi]
  fa fa, do''[do,] fa, fa'16\tu  sol la8 fa\mbreak
  r fa16 sol la8 fa r fa mi[do]

  %35
  r fa16 mi fa8 fa, sib sol'16 fa sol8 sol,
  do fa si,[sol] do la'16 sol la8 fa
  sib,4 do\mbreak fa,8 fa' si,[sol]

  %38
  do do' do16 sib? la sol fa4 sib,
  do fa r8 sib, do[do,]
  \once\stemUp fa la' do16 sib la sol fa4 sib,

  %41
  do fa\mbreak r8 sib, do[do,]
  fa4 r r2
  R1*14

  %57
  r2 r8 sol16\tu la sib8 sol
  r sol16 la sib8 sol r do fad,[re]
  sol sol'16 fad sol8 sol,\mbreak do4 re

  %60
  sol,8 sol'16 fad sol8 sol, do4 re
  \once\stemUp sol,8 sib' sib16 la sol fad sol4 sol,
  do8 do' do16 sib la sol fad4 re

  %63
  sol8 sib re16 do sib la\mbreak sol4 do,
  re sol, r8 do re[re,]
  sol4 sol'\solo~sol8 sol fad[mi]

  %66
  re4 mi8 fad sol re sib[sol]
  do' sib do[do,] sib' la sib[sib,]\mbreak
  la' sol la[fad] sol fad sol[dod,]

  %69
  re dod re[sold,] la' sol? la[dod,]
  re re16 mi fa8 re r re16 mi fa8 re
  r re dod[la]\mbreak r re16 mi fa8 re

  %72
  r re16 mi fa8 re r re dod[la]
  re mi fa[re] r2
  R1*11

  %85
  re8\tu re16 mi fa8 re\mbreak r re16 mi fa8 re
  r re dod[la] r re16 mi fa8 re
  r re16 mi fa8 re r re dod[la]

  %88
  r re'16 do? re8 re,\mbreak \once\stemUp sol, mi''16 re mi8 mi,
  la,4 r8 do' fad,4. re8
  sol sol, r sib' mi,4. do8

  %91
  fa fa, r la' re,[re'] sold, mi
  la fa16 mi re8 dod\mbreak re fa16 mi re8 dod
  re re' sold,[mi] \once\stemUp la, re'16 do? re8 re,

  %94
  \once\stemUp sol, mi''16 re mi8 mi, \once\stemUp la, re' sold,[mi]
  la fa16 mi fa8 re sol4 la\mbreak
  re, r re re

  %97
  sol, r la la
  re r re sol
  la re, r8 sol, la[la]

  %100
  re,4 r re' sol
  la re, r8 sol, la[la]
  re,1

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  
  s1
  s4 <6> s2
  s s4 <6>
  s <_+> s <7 _+>
  s1
  s2 <6>
  s4 s8 <6> <6!>4 <6 5>
  <_+>8 <6> s <6 5> s <6> s <6 5>
  s4 <6 5> <_+> <_+>
  <_!> <7 _+> <_+> <6>
  <_+> s <_!> <7 _+>
  s1
  <_!>2 <7 _+>
  s s4 <6>
  <7 _+>2 s8 <6 5> <_+>4
  s2 s4 <6>
  <7 _+>2 s8 <6> <4> <_+>
  s2 s4 s8 <7>
  s <_+> s <7> s4 <6 5>8 <_+>
  s2 s4 s8 <7>
  s1
  <_+>
  s1*3
  <_+>1
  <_+>
  s
  s
  <6>
  s
  s2 s4 s8 <6>
  s1
  s2 s4 <6>
  s <7-> s <7 _!>
  s <6 5> s2
  <9>4 <7> s <6 5>
  s2 s4 <6>
  <7>1
  s2 s4 <6>
  <7>1
  s1*16
  s2 s8 <_-> s4
  s2 <9>4 <7 _+>
  s2 <9>4 <7 _+>
  s1
  <_->2 <6 5>
  s4 <_+> s <6>
  <7 _+>2 s8 <6 5> <4> <_+>
  s2 <4 2>4 <6>
  <_+>1
  <_->
  s4 s8 <7-> <4>4 <3>
  s s8 <7> <_+>2
  s1
  s4 <6> s2
  s s4 <6>
  s1*13
  s4 <6> s2
  s s4 <6>
  s <_+> s <7 _+>
  s1
  s2 <6>
  s <6!>4 <6 5>
  <_+>8 <6> s <6 5> s <6> s <6 5>
  s4 <6 5> <_+> <_+>
  <_!> <7 _+> <_+> <6>
  <_+>2 <6 5 _!>4 <7 _+>
  s1
  <_!>2 <7 _+>
  s2 s4 <6>
  <7 _+>2 s8 <6 5> <4> <_+>
  s2 s4 <6>
  <_+>2 s8 <6 5> <4> <_+>
  
}

forma = {

  \key re\minor
  \time 4/4
  \tempo 2 = 60
  s1*102
  \bar"|."

}

Ivl = {
  \Iglobal
  \notypeset
  <<\Ivln \forma>>

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
  \typeset

}

IIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \con \terzine
}

IIvln = \relative do'' {

  fa8 fa r fa mi mi r mi
  sol sol r sol fa fa r la
  sold sold r si la la r la
  
  %4
  do,4 si la r
  re4.\solo fa8\tuplet 3/2 { mi16(fad sold la[sold la)] } la,4
  sol'~\tuplet 3/2 { sol16 sib(la sol[fa? mi)] } \mbreak fa mi re8 r la'
  
  %7
  \tuplet 3/2 { sold16(la si re,[mi fa)] si,(do re sold,[la si)] } \appoggiatura si8 do4. mi8
  \tuplet 3/2 { fa16(re dod re[dod re)] fa(re dod re[dod re)] sold(re dod re[dod re)] sold(re dod re[dod re)]\mbreak }
  la' mi la la, si8. la16 la4 r8 mi'
  
  %10
  \appoggiatura re dod4~dod16 dod re mi \tuplet 3/2 { fa(sol la la[sol fa)] fa(mi re fa[sol la)] }
  sib8 sib~sib16 la sol fa \tuplet 3/2 { mi(fa sol sol[fa mi)] mi(re do sol'[la sib)] }
  la8 la~la16 sol fa mi\mbreak \tuplet 3/2 { re(mi fa fa[sol la)] fa(mi re fa[sol la)] }
  
  %13
  sol8 sol~sol16 fa mi re do4 r8 do
  \tuplet 3/2 { fa16(do sib } do8\tr)\noBeam \tuplet 3/2 { la'16[(fa mi] } fa8\tr) \tuplet 3/2 { sol16[(fa mi] } mi8\tr) \tuplet 3/2 { sib'16[(la sol] } sol8\tr)
  \tuplet 3/2 { la16 sol fa } do'[fa,] mi8.\tr fa16 fa4 r8 si,
  
  %16
  do16 re mi fa sol8 mi\mbreak \appoggiatura re dod4. dod8
  re16 mi fa sol la8 re, sib'16 la sol fa mi8 re
  re dod r mi sol16 fa mi8 r sol
  
  %19
  dod,16 si la8 r sol' fa16(re) la'(re,) dod8.\tr re16
  re4. si'8 dod,16 si la4 sol'8
  fa16(re) la'(re,) dod8.\tr re16 re2\fermata

}

IIvlIn =  \relative do'' {
  
  fa8 fa r fa mi mi r mi
  sol sol r sol fa fa r la
  sold sold r si la la r la
  
  %4
  do,4 si la r
  re8\p re r re re dod r mi
  sol sol r sol fa fa r fa
  
  %7
  si, si r sold'\mbreak mi mi r mi
  fa la, r fa' si, si r si
  la la r sold' mi mi r mi
  
  %10
  mi mi r mi re re r la'
  sol sol r sol\mbreak sol sol r sol
  fa fa r fa fa fa r fa
  
  %13
  mi mi r mi do do r do
  do do r do mi mi r mi
  fa fa r sol\mbreak fa fa r re
  
  %16
  mi mi r mi mi mi r mi
  fa fa r fa re re r sol
  mi mi r mi mi mi r mi
  
  %19
  mi mi r mi\mbreak re re r dod
  re re r re dod dod r mi
  re re r mi fa2\fermata

}

IIvlIIn = \relative do'' {
  
  re8 re r re re dod r dod
  mi mi r mi re re r re
  re re r re do? do r do\mbreak
  
  %4
  la4 sold la r
  la8\p la r la la la r dod
  mi mi r dod la la r re
  
  %7
  re re r re do do r do
  la la r re\mbreak mi mi r mi
  mi do r mi do do r do
  
  %10
  dod dod r dod la la r fa'
  re re r re mi mi r mi\mbreak
  do do r do re re r re
  
  %13
  sib sib r sib la la r la
  la la r la sol sol r do
  la la r mi'\mbreak la, la r si
  
  %16
  sol sol r sol' sol sol r la,
  la la r la sib sib r re
  la la r dod dod dod r dod\mbreak
  
  %19
  dod? dod r dod la la r la'
  fa fa r si, mi, mi r dod'
  la la r dod la2\fermata

}

IIvlan =  \relative do' {
  
  la'8 la r la la la r dod
  dod?dod r dod la la r re
  si si r sold mi mi r mi
  
  %4
  mi fa si,[mi]\mbreak do4 r
  re8\p re re,[re'] la' la la,[la']
  la la la,[la'] re, re re,[re']
  
  %7
  mi mi mi,[mi'] la la la,[la']\mbreak
  re, re re,[re'] re re re,[re']
  do la mi'[mi,] la'[la] la, la'
  
  %10
  sol sol sol,[sol'] fa fa fa,[fa']\mbreak
  sol sol sol,[sol'] do do do,[do']
  fa, fa fa,[fa'] sib sib sib,[sib']
  
  %13
  mi, mi mi,[mi'] fa fa fa,[fa']\mbreak
  fa fa fa, [fa'] do do do,[do']
  fa fa do,[do'] fa fa fa,[fa']
  
  %16
  mi mi mi,[mi'] la la la,[la']\mbreak
  fa fa fa, [fa'] sol sol sol,[sol']
  la la la,[la'] la la la,[la']
  
  %19
  la la la,[la'] re, re la [la']\mbreak
  sold sold sold,[sold'] la la la,[la']
  re, re la[la'] re,2\fermata
  
}

IIbcn = \relative do {
  
  re8 re re,[re'] la' la la,[la']
  la  la la,[la'] re, re re,[re']
  mi mi mi,[mi'] la la la,[la']
  la re, mi[mi,] la4 r
  R1*17
  
}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  
  s2 <4>4 <_+>
  <7 _+>1
  <7 _+>
  s4 <7 _+>

}

forma = {

  \key re\minor
  \time 4/4
  \tempo 4 = 35
  s1*21
  \bar"|."

}

IIvl = {
  \IIglobal
  \notypeset
  <<\IIvln \forma>>

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
  \typeset

}

IIIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \terzine
}

IIIvln = \relative do'' {

    fa8. mi16 re8
    dod8. si16 la8
    sol8. fa16 mi8

    %4
    fa8. mi16 re8
    fa' la fa
    mi dod re

    %7
    fa, sol4\tr
    la r8
    la' la, la'
    sol la, sol'

    %11
    fa la, fa'
    mi16 re dod si la8
    re \parentSlur (sold,) la\mbreak

    %14
    la' sol?16 fa mi re
    dod8 la dod
    re4 r8

    %17
    la'\p la, la'
    sol la, sol'
    fa la, fa'

    %20
    mi16 re dod si la8
    re \parentSlur (sold,) la
    la' sol?16 fa mi re

    %23
    dod8 la dod
    <<la'\solo\\{\slurUp re,(re') la}>>\mbreak
    fa16(mi re8) mi

    %26
    fa(la) re
    fa,16(mi re8) mi
    fa16 re fa re fa la

    %29
    re8 do16 sib la sol
    fa8 mi re
    la'16 re re8. do16

    %32
    sib16 re sib la sol fa
    mi do' do8. sib16
    la do la sol fa mi\mbreak

    %35
    re sib' sib8. la16
    sol sib sol fa mi re
    mi re do8 r

    %38
    \tuplet 3/2 { do16(re mi } re8[do)]
    sol'(fa mi)
    \tuplet 3/2 { do16(re mi } re8[do)]

    %41
    sib'(la sol)
    la4 r8
    do do do

    %44
    \tuplet 3/2 { do16( sib la) } sib4
    \tuplet 3/2 { sib16(la sol) } la4\mbreak
    \tuplet 3/2 { la16(sol fa) } sol4

    %47
    \tuplet 3/2 { sol16(fa mi) } fa4
    sib16 sol sol4\tr
    fa r8

    %50
    do' do do
    do16(sib la sib) sib8
    sib16(la sol la) la8

    %53
    la16(sol fa sol) sol8
    sol16(fa mi fa) fa8
    \tuplet 3/2 { sib16(la sol) } sol4\tr

    %56
    fa8.\tu mi16 re8\mbreak
    do8. sib16 la8
    sib8. la16 sol8

    %59
    la8. sol16 fa8
    do'' do, do'
    sib do, sib'

    %62
    la do, la'
    sol16 fa mi re do8
    fa si, do

    %65
    do' sib?16 la sol fa
    mi8 do mi
    fa16\solo sol do, la' sol fa\mbreak

    %68
    mi fa do la' sol fa
    mi fa do sib' la sol
    fad sol re sib' la sol

    %71
    fad sol re sib' la sol
    fad8 re r
    sib'16 la(sol) fa?(mib) re(

    %74
    mib) re(do) si(do8)
    la'16 sol(fa) mib(re) do(\mbreak
    re) do(sib) la(sib8)

    %77
    \tuplet 3/2 { sib16 (do re) re[(mib fa)] lab(sol fad) }
    fad?4(sol8)
    \tuplet 3/2 { do,16(re mi?) mi[(fa? sol)] sib(la sold)}

    %80
    sold?4 la8
    \tuplet 3/2 { re,16(mi fad) fad[(sol? la)] do(sib la) }
    la4 sib8

    %83
    \tuplet 3/2 { re,16 (do sib)} sib'8.[fa16] \mbreak
    \tuplet 3/2 { re16 (do sib)} sib'8.[fa16]
    \tuplet 3/2 { re16(do sib) mib[(re do)] la'(sol fa) }

    %86
    sib sib, do4\tr
    sib\tu sol'8
    fa8. mib16 re8

    %89
    mib8. re16 do8
    re8. do16 sib8
    fa' fa, fa'

    %92
    mib fa, mib'
    re fa, re'\mbreak
    do fa, do'

    %95
    sib16 do re8 do
    sib4 r8
    fa'\p fa, fa'

    %98
    mib fa, mib'
    re fa, re'
    do fa, do'

    %101
    sib16 do re8 do
    \tuplet 3/2 { fa16 sib, fa' } fa8.\tr[(mi32 fa)]
    \tuplet 3/2 { sol16 sib, sol'} sol8.\tr[(fa32 sol)]

    %104
    \tuplet 3/2 { la16 do, la' } la8.\tr[(sol32 la)]\mbreak
    sib8 sib, r
    sib'16 sib,  sib sib' sib[lab32 sol]

    %107
    lab16 sib, sib lab' lab[sol32 fa]
    sol16 sib, mib,?8 r
    do''16 do, do do' do[sib32 la?]

    %110
    sib16 do, do sib' sib[la32 sol]
    la16 do, fa,8 r\mbreak
    re''16 re, re re' re[do32 sib]

    %113
    do16 re, re do' do[sib32 la]
    sib16 re, sol,8 r
    \tuplet 3/2 {
        sib'16(la sol) la[(sol fa)] sol(fa mi)

        %116
        fa(mi re) mi[(re dod)] re(dod si)
    }
    dod la mi dod la8\mbreak
    fa''8.\tu mi16 re8

    %119
    dod8. si16 la8
    sol8. fa16 mi8
    fa8. mi16 re8

    %122
    fa' la fa
    mi dod re
    fa, sol4\tr

    %125
    la r8
    fa'16\solo re fa la re la
    fa mi re8 mi

    %128
    fa16 re fa la re la\mbreak
    fa mi re8 mi
    fa16 re fa la re la

    %131
    fa re fa la re fa,
    mi8 la, r
    \tuplet 3/2 {
        fa'16(sol la) la[(sol fa)] fa(sol la)

        %134
        sib,(do re) re[(do sib)] sib(do re)\mbreak
        sol(la sib) sib[(la sol)] sol(la sib)
        do,(re mi) mi[(re do)] do(re mi)

        %137
        la(sib do) do[(sib la)] la(sib do)
        re,  mi fa fa[mi re] re mi fa
        sib do re re[do sib] sib do re

        %140
        sol, la sib sib[la sol] sol la sib
        mi, fa sol sol[fa mi] mi fa sol
    }
    la,4 r8

    %143
    la' sol16(fa) mi(re)
    mib8(re) mib\mbreak
    sol fa16(mib) re(dod)

    %146
    re8(dod) re
    fa mi?16(re) dod(si)
    la la32(si dod16)[dod32(re] mi16) mi32 (fa

    %149
    sol8) fa(mi)
    fa16 re32(mi fa16)[fa32(sol] la16) si32(dod)\mbreak
    re16 re, mi4\tr

    %152
    re4\tu re8
    dod8. si16 la8
    sol8. fa16 mi8

    %155
    fa8. mi16 re8
    la'' la, la'
    sol la, sol'

    %158
    fa la, fa'
    mi16 re dod si la8
    re(sold,) la

    %161
    la' sol?16 fa mi re\mbreak
    dod8 la dod
    re4 r8

    %164
    la'8\p la, la'
    sol la, sol'
    fa la, fa'

    %167
    mi16 re dod si la8
    re (sold,8) la
    la' sol?16 fa mi re

    %170
    dod8 la dod
    re4\fermata r8

}

IIIvlIn =  \relative do'' {

    fa8. mi16 re8
    dod8. si16 la8
    sol8. fa16 mi8

    %4
    fa8. mi16 re8
    fa' la fa
    mi dod re

    %7
    fa, sol4\tr
    la r8
    la' la, la'
    sol la, sol'

    %11
    fa la, fa'
    mi16 re dod si la8
    re \parentSlur (sold,) la\mbreak

    %14
    la' sol?16 fa mi re
    dod8 la dod
    re4 r8

    %17
    la'\p la, la'
    sol la, sol'
    fa la, fa'

    %20
    mi16 re dod si la8
    re \parentSlur (sold,) la
    la' sol?16 fa mi re

    %23
    dod8 la dod
    re4 r8
    R4.*18

    %43
    fa,8\p fa fa
    sol sol mi
    fa fa re

    %46
    mi mi do
    fa fa fa
    re'16 sib do8 do,

    %49
    fa4 r8
    fa'8 fa fa
    sol sol mi

    %52
    fa fa re
    mi mi do\mbreak
    fa, fa fa

    %55
    re'16 sib do8 do,
    fa'8.\f mi16 re8\mbreak
    do8. sib16 la8
    sib8. la16 sol8

    %59
    la8. sol16 fa8
    do'' do, do'
    sib do, sib'

    %62
    la do, la'
    sol16 fa mi re do8
    fa si, do

    %65
    do' sib?16 la sol fa
    mi8 do mi
    fa4 r8

    %68
    R4.*19
    sib8.\parenthesize \f la16 sol8
    fa8. mib16 re8

   %89
   mib8. re16 do8
    re8. do16 sib8
    fa' fa, fa'

    %92
    mib fa, mib'
    re fa, re'\mbreak
    do fa, do'

    %95
    sib16 do re8 do
    sib4 r8
    fa'\p fa, fa'

    %98
    mib fa, mib'
    re fa, re'
    do fa, do'

    %101
    sib16 do re8 do
    sib4 r8
    R4.*15
    fa'8.\parenthesize \f mi16 re8

    %119
    dod8. si16 la8
    sol8. fa16 mi8
    fa8. mi16 re8

    %122
    fa' la fa
    mi dod re
    fa, sol4\tr

    %125
    la r8
    R4.*26

    %152
    fa'8.\parenthesize \f  mi16 re8
    dod8. si16 la8
    sol8. fa16 mi8

    %155
    fa8. mi16 re8
    la'' la, la'
    sol la, sol'

    %158
    fa la, fa'
    mi16 re dod si la8
    re(sold,) la

    %161
    la' sol?16 fa mi re\mbreak
    dod8 la dod
    re4 r8

    %164
    la'8\p la, la'
    sol la, sol'
    fa la, fa'

    %167
    mi16 re dod si la8
    re (sold,8) la
    la' sol?16 fa mi re

    %170
    dod8 la dod
    re4\fermata r8

}

IIIvlIIn = \relative do'' {

    fa8. mi16 re8
    dod8. si16 la8
    sol8. fa16 mi8

    %4
    fa8. mi16 re8
    fa' la fa
    mi dod re

    %7
    fa, sol4\tr
    la r8
    fa'16 sol la8 r

    %10
    mi16 fa sol8 r
    re16 mi fa8 r
    dod16 re mi8 r
    re \parentSlur (sold,) la\mbreak

    %14
    la' sol?16 fa mi re
    dod8 la dod
    re4 r8

    %17
    fa16\p sol la8 r
    mi16 fa sol8 r
    re16 mi fa8 r

    %20
    dod16 re mi8 r
    re \parentSlur (sold,) la\mbreak
    la' sol?16 fa mi re

    %23
    dod8 la dod
    re4 r8
    R4.*18

    %43
    fa,8\p fa fa
    sol sol mi
    fa fa re

    %46
    mi mi do
    fa fa fa
    re'16 sib do8 do,

    %49
    fa4 r8
    fa'8 fa fa
    sol sol mi

    %52
    fa fa re
    mi mi do\mbreak
    fa, fa fa

    %55
    re'16 sib do8 do,
    fa'8.\f mi16 re8\mbreak
    do8. sib16 la8
    sib8. la16 sol8

    %59
    la8. sol16 fa8
    la'16 sib do8 r
    sol16 la sib8 r\mbreak

    %62
    fa16 sol la8 r
    mi16 fa sol8 r
    fa si, do

    %65
    do' sib?16 la sol fa
    mi8 do mi
    fa4 r8

    %68
    R4.*19
    sib8.\parenthesize \f la16 sol8
    fa8. mib16 re8

   %89
   mib8. re16 do8
   re8. do16 sib8
   re16 mib fa8 r

   %92
   do16 re mib8 r
   sib16 do re8 r
   la16 sib do8 r

   %95
   sib16 do re8 do
   sib4 r8
   re16\p mib fa8 r

   %98
   do16 re mib8 r
   sib16 do re8 r
   la16 sib do8 r

   %101
   sib16 do re8 do
   sib4 r8
   R4.*15
    fa'8.\parenthesize \f mi16 re8

    %119
    dod8. si16 la8
    sol8. fa16 mi8
    fa8. mi16 re8

    %122
    fa' la fa
    mi dod re
    fa, sol4\tr

    %125
    la r8
    R4.*26

    %152
    fa'8.\parenthesize \f  mi16 re8
    dod8. si16 la8
    sol8. fa16 mi8

    %155
    fa8. mi16 re8
    fa'16 sol la8 r
    mi16 fa sol8 r

    %158
    re16 mi fa8 r
    dod16 re mi8 r
    re  (sold,) la

    %161
    la' sol?16 fa mi re
    dod8 la dod
    re4 r8

    %164
    fa16\p sol la8 r
    mi16 fa sol8 r
    re16 mi fa8 r

    %167
    dod16 re mi8 r
    re  (sold,) la\mbreak
    la' sol?16 fa mi re

    %170
    dod8 la dod
    re4\fermata r8

}

IIIvlan =  \relative do' {

    fa8. sol16 la sib
    mi,4.
    dod8. re16 mi dod

    %4
    la4.
    la'4 la8
    sib la4

    %7
    la,8 re4
    dod r8
    r fa16 mi fa8

    %10
    r mi16 re mi8\mbreak
    r re16 dod re8
    r dod dod

    %13
    la si mi
    fa8. sol16 la sib?
    mi,4 mi8

    %16
    fa16 sol la8 fa
    r fa16\p mi fa8
    r mi16 re mi8\mbreak

    %19
    r re16 dod re8
    r dod dod
    la si mi

    %22
    fa8. sol16 la sib?
    mi,4 mi8
    fa4 r8

    %25
    R4.*31
    la8.\f do16 re sol,
    la4.
    mi8. mi16 fa sol\mbreak

    %59
    do,4.
    r8 la'16 sol la8
    r sol16 fa sol8

    %62
    r fa16 mi fa8
    r mi16 re mi8
    do re sol

    %65
    la8. sib16 do re
    sol,4 sol8
    la4 r8

    %68
    R4.*19
    fa8.\parenthesize \f fa16 sol mib
    re4.

    %89
    la'
    fa8 fa fa
    r re'16 do re8

    %92
    r do16 sib do8
    r sib16 la sib8
    r la16 sol la8

    %95
    fa4 fa8
    re4 r8
    r re'16\p do re8

    %98
    r do16 sib do8
    r sib16 la sib8
    r la16 sol la8

    %101
    fa4 fa8
    re4 r8
    R4.*15

    %118
    fa8.\parenthesize \f sol16 la sib
    mi,4.
    dod8. re16 mi dod

    %121
    la4.
    la'4 la8
    sib la4

    %124
    la,8 re4
    dod r8
    R4.*26

    %152
    fa8.\parenthesize \f sol16 la sib
    mi,4.
    dod8. re16 mi dod

    %155
    la4 la8
    r fa'16 mi fa8\mbreak
    r mi16 re mi8

    %158
    r re16 dod re8
    r dod16 si dod8
    la si mi

    %161
    fa8. sol16 la sib?
    mi,4 mi8
    fa16 sol la8 fa

    %164
    r fa16\p mi fa8
    r mi16 re mi8\mbreak
    r re16 dod re8

    %167
    r dod16 si dod8
    la si mi
    fa8. sol16 la sib?

    %170
    mi,4 mi8
    fa4\fermata r8

}

IIIbcn = \relative do {

    re8. mi16 fa sol
    la8 la, la
    la8. si16 dod la

    %4
    re8 re, re
    re'8. mi16 fa re
    sol4 fa8

    %7
    re sib4
    la8. si16 dod si\mbreak
    la8 la' la,

    %10
    r la' la,
    r la' la,
    r la' la,

    %13
    fa' mi16 re dod8
    re8. mi16 fa sol
    la8 la, la'

    %16
    re,16 mi fa8 re
    r la'\p la,\mbreak
    r la' la,

    %19
    r la' la,
    r la' la,
    fa' mi16 re dod8

    %22
    re8. mi16 fa sol
    la8 la, la'
    re,4\solo r8

    %25
    re4 la8
    re4 r8
    re4 la8

    %28
    re4 r8\mbreak
    re4 dod8
    re4 r8

    %31
    \clef tenor\key re\minor fa' fa fa
    sol sol sib,
    do mi mi

    %34
    fa fa la,
    sib re re
    mi mi si

    %37
    do16 re mi8 re\mbreak
    do4 r8
    \clef bass\key re\minor do,4 r8

    %40
    do4 r8
    do16 re mi8 do
    fa16 sol la8 fa

    %43
    R4.*6
    fa16 sol la8 fa
    R4.*6\mbreak

    %56
    fa8. la16 sib mi,
    fa8 fa, fa
    sol'8. do,16 re mi

    %59
    fa8 fa, fa
    r do'' do,
    r do' do,

    %62
    r do' do,
    r do' do,
    la' sol16 fa mi8

    %65
    fa8. sol16 la sib
    do8 do, do'\mbreak
    fa,4 r8

    %68
    do4\solo r8
    do4 r8
    re4 r8

    %71
    re4 r8
    re8. mi16 fad re
    sol8 sol sol

    %74
    do,4 r8
    fa fa fa
    sib,4 r8

    %77
    re re, r
    mib' mib mib
    mi! do r

    %80
    fa fa fa\mbreak
    fad re r
    sol sol sol

    %83
    sib,4 r8
    sib4 r8
    sib do fa

    %86
    re16 sib fa'8 fa,
    sib8.\tu re'16 mib la,
    sib8 sib, sib

    %89
    do8.\tr sib16 do la
    sib8 sib sib
    r fa' fa,

    %92
    r fa' fa,
    r fa' fa,
    r fa' fa,

    %95
    sib fa' fa,
    sib16 do re8 sib
    r fa'\p fa,

    %98
    r fa' fa,
    r fa' fa,
    r fa' fa,

    %101
    sib fa' fa,
    sib4 r8
    mib4\solo r8

    %104
    fa4 r8\mbreak
    sib,16 do re8 do
    sib4 r8

    %107
    sib4 r8
    mib?16 fa sol8 fa
    mi!4 r8

    %110
    do4 r8
    fa16 sol la8 sol
    fad4 r8

    %113
    re4 r8
    sol16 la sib8 la
    sol4 r8

    %116
    R4.
    la,4 r8
    re8.\tu mi16 fa sol\mbreak

    %119
    la8 la, la
    la8. si16 dod la
    re8 re, re

    %122
    re'8. mi16 fa re
    sol4 fa8
    re sib4

    %125
    la r8
    re4\solo r8
    re4 la'8

    %128
    re,4 r8
    re4 la'8
    re,4 r8

    %131
    re4 r8
    la' dod la\mbreak
    re, re re

    %134
    sol sol sol
    mi mi mi
    la la la

    %137
    fa fa fa
    sib sib sib
    sol sol sol

    %140
    sib sib sib
    sol sol sol
    dod, si la

    %143
    fa'4.
    sol
    mi?

    %146
    fa\mbreak
    re4 sol8
    dod,4.

    %149
    la
    re4 r8
    re la' la,

    %152
    re8.\tu mi16 fa sol
    la8 la, la
    la8. si16 dod la

    %155
    re4 re,8
    r la'' la,
    r la' la,

    %158
    r la' la,
    r la' la,
    fa' mi16 re dod8\mbreak

    %161
    re8. mi16 fa sol
    la8 la, la'
    re,16 mi fa8 re

    %164
    r la'\p la,
    r la' la,
    r la' la,

    %167
    r la' la,
    fa' mi16 re dod8
    re8. mi16 fa sol

    %170
    la8 la, la'
    re,4\fermata r8

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    <_+>
    <7 _+>
    s
    s
    <6>8 <4\+ 2> <6>
    s <6>4
    <_+>4.
    <6>
    s8 <7 5> s
    s <6 4> s
    s <_+> s
    <6> <_+> <6>
    s4.
    <_+>
    s
    s8 <6> s
    s <7 5> s
    s <6 4> s
    s <_+> s
    <6> <_+> <6>
    s4.
    <_+>
    s
    s4 <_+>8
    s4.
    s4 <_+>8
    s4.
    s4 <6 5>8
    s4.
    <6>
    s
    s8 <6>4
    s4.*2
    s4 <6>8
    s4.*21
    <6>4.
    s
    s8 <6> s
    s <7 5> s
    s <6 4> s
    s <5 3> s
    <6> <_!> <6>
    s4.*5
    <_+>4.
    s
    <_+>
    s
    <7 _->
    <7->
    s
    <6>
    s
    <6>
    s
    <6>
    s
    <5>
    s
    s8 <7 _-> s
    <6>4.
    s
    s
    <6 _->
    s
    s8 <6> s
    s <7- 5> s
    s <6 4> s
    s <5 3> s
    s <6 4> <5 3>
    s4.
    s8 <6> s
    s <7- 5> s
    s <6 4> s
    s <5 3> s
    s <6 4> <5 3>
    s4.
    s
    <7->
    s8 <6> s
    s4.
    <7->
    s
    <6 5>
    <7>
    s
    <6>
    <7 _+>
    s4.*3
    <_+>4.
    s
    <_+>
    <7 _+>
    s
    s
    <6>8 <4\+ 2> <6>
    s <6>4
    <_+>4.
    s
    s4 <_+>8
    s4.
    s4 <_+>8
    s4.*2
    <_+>4.
    s4.*9
    <6>4.
    <6>
    <6->
    <6\\>
    <6>
    s
    <6 5>
    <7>
    s
    s8 <4> <_+>
    s4.
    <_+>
    <_+>
    s
    s8 <6> s
    s <7 5> s
    s <6 4> s
    s <5 _+> s
    <6> <_+> <6>
    s4.
    <_+>
    s
     s8 <6> s
    s <7 5> s
    s <6 4> s
    s <5 3> s
    <6> <_+> <6>
    s4.
    <_+>

}

forma = {

    \key re\minor
    \time 3/8
    \tempo 4. = 60
    s4.*171
    \bar"|."

}

IIIvl = {
    \IIIglobal
    %\notypeset
    <<\IIIvln \forma>>

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
    \typeset

}
#(set-global-staff-size 15)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
  title = \markup\smaller {"Concerto II Op. 12 [RV 244]"}
  composer = \markup \center-column{"   ""A. Vivaldi (1678-1741)"}
}

\markup\huge "[1.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Principale"}
            \Ivl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \Ivla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.2"e Organo"}
            \Ibc
        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
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

\pageBreak

\markup\huge "[2.] Larghetto"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \IIvl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \IIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
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

\pageBreak

\markup\huge "[3.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \IIIvl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \IIIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
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

\pageBreak

