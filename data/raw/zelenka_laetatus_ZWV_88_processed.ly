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


IobIn = \relative do'' {
   
   r8 re^\markup\italic"staccato" dod re la re dod re
   la4 r r2
   r2 r4 r8 la\f
   
   %4
   sold la mi la sold la mi[mi']~
   mi re si'[re,] dod16 re dod si la8 mi'~
   mi16 dod re8~re16 sold si re, dod8 la' si, sold'\mbreak
   
   %7
   la4 r r2
   R1*2
   r2 r8 re, dod re
   
   %11
   la re dod re la re dod re
   sold,4-! sol-! fad8 re' mi, dod'\mbreak
   re4 r r2
   
   %14
   R1*2
   r2 r8 la sold la
   mi la sold la mi4 r
   
   %18
   r2 r8 la sold la
   mi la sold la mi4 r
   R1
   
   %21
   r2 r4 r8 si'
   si si si si si si r4
   R1*13
   
   %36
   r2 r4 r8 si
   si si si si si si r4  %%%Fin qui OK
   R1*6
   
   %44
   r2 r4 r8 si
   si si si si si si r4
   R1*4
   
   %50
   r2 r8 la8 mi'4~ 
   mi8 re si'[re,] dod16 re dod si la8 r
   r2 mi'2~
   
   %53
   mi2. mi4~
   mi mi~mi8 [re] dod[mi]\mbreak
   fad2. fad4~
   
   %56
   fad fad4. fad8 fad4~
   fad8 mi8 mi2 re4
   dod2 si
   
   %59
   R1*5
   r2 r8 si si si
   dod dod red red16 red mi4 mi8 fad~
   
   %66
   fad8 fad mi2 red4
   mi mi,8 fad sol la si dod!
   re4. do16[si] la8[si do re]
   
   %69
   mi[fad] sol4 sol, r
   R1\mbreak
   r4 sol8 la si do re mi
   fa4 mi re2~
   
   %73
   re8[do] si4 la4. la8
   si2 r
   R1*2
   
   %77
   r2 re4. re8
   dod si la dod re4 la8 fad'
   mi fad mi fad mi dod dod dod
   
   %80
   mi mi la,8. la16 re4 si8 si\mbreak
   dod dod re4. re8 dod[(re)]
   re2 r
   
   %83
   r4 r8 sol fad sol fad sol
   fad red red red fad fad si,8. si16
   mi4 fad8 mi red red mi4~
   
   %86
   mi8 mi red[mi] mi2
   r r4 si 
   do4. do8 do[si] la[sold]
   
   %89
   la8. si16 do8 do re8. re16 la4
   r8 re re re mi mi16 mi re4~\mbreak
   re8 re do4. si8 si4
   
   %92
   la2 r8 la'\f sold la
   mi la sold la mi la sold la
   red,4-! re-! do8 la' si,[sold']
   
   %95
   la4 r r2
   R1
   r8 sol, sol sol la la16 la si8 si
   
   %98
   dod! dod16 dod r8 re re mi mi8. mi16
   re4. re8 dod8. dod16 re4
   re (dod) re8 re, la'4~\mbreak  %%%fine p.13
   
   %101
   la8 sol mi' sol, fa16 sol fa mi re8 la'~
   la16 fad! sol8~sol16 dod! mi sol, fa8 re' mi, dod'
   re4 r r2
   
   %104
   R1*4
   r2 r8 re,\f re'4~
   re8 do la' [do,] si16 do si la sol8 re'~
   
   %110
   re16 si do8~do16 fad \parenthesize si do, si4. (la8)\mbreak
   la4 r r2
   R1*22
   
   %134
   r8 mi\f la4~la8 sol! mi' sol,
   fad16 sol fad mi re8 la'\parenthesize ~ la16 fad sol8~sol16 dod mi sol,\mbreak
   fad sol fad mi re4 r2
   
   %137
   R1*10
   r8 re' dod re la re dod re
   r la sold la mi la sold la
   
   %149
   mi4 r r2
   r8 dod' si dod si dod si dod\mbreak
   si4 r r2
   
   %152
   R1
   r4 r8 si si si si si
   si si r4 r2
   
   %155
   R1*8
   r2 mi~
   mi mi~
   
   %165
   mi8 mi mi4. re8 dod mi
   fad2 fad~
   fad4 fad fad2~
   
   %168
   fad8 mi mi4. mi8 re4~
   re8 dod dod4 si8 fad si4~
   si la sold2\mbreak
   
   %171
   fad r
   R1*2
   r4 r8 fad' mi fad mi fad 
   
   %175
   mi mi dod dod mi mi16 mi la,8 la
   re8 re16 dod si8 si dod dod re4~
   re dod re2
   
   %178
   r2 r4 r8 sol
   fad sol fad sol fad red red red
   fad fad16 fad si,8 si mi mi16 mi fad8 mi\mbreak
   
   %181
   red red mi2 (red4)
   mi mi,8[fad] sol[la si dod!]
   re4. do16[si]la8[si do re]
   
   %184
   mi[fad] sol4 sol, r
   R1\mbreak
   r4 sol8[la]si[do re mi]
   
   %187
   fa4 mi re2~
   re8[do] si4 la2
   R1
   
   %190
   re2. re4~\mbreak
   re re2 re4~
   re8 re re re do8. do16 do4~
   
   %193
   do? si8 do re2
   re r4 r8 mi
   re mi re mi re si r4
   
   %196
   r2 r4 r8 fad'
   mi fad mi fad mi dod! dod dod
   mi mi16 mi la,8 la re re16 do si8 si
   
   %199
   dod! dod re2 dod4
   r4 la4.\f sol8 mi' sol,
   fad16 sol fad mi re8 la'~la16 fad sol8~sol16 dod mi sol,
   
   %202
   fad8 re' mi, dod' re, re' dod re
   la re dod re la re dod re
   sold,4 sol fad8 re' mi, dod'
   
   %205
   re2 r

}

IobIIn = \relative do'' {
   
   r8 re^\markup\italic"staccato" dod re la re dod re
   la4 r r2
   r2 r4 r8 la\f
   
   %4
   sold la mi la sold la mi[mi']~
   mi re si'[re,] dod16 re dod si la8 mi'~
   mi16 dod re8~re16 sold si re, dod8 la' si, sold'\mbreak
   
   %7
   la4 r r2
   R1*2
   r2 r8 re, dod re
   
   %11
   la re dod re la re dod re
   sold,4-! sol-! fad8 re' mi, dod'\mbreak
   re4 r r2
   
   %14
   R1
   r2 r4 r8 la
   la la la la la la r4
   R1
   
   %18
   r2 r8 la sold la
   mi la sold la mi4 r
   R1*16
   
   %36
   r2 r4 r8 sold  %%% con l'alto
   fad sold fad sold fad fad r4 
   R1*6
   
   %44
   r2 r4 r8 si
   si si si si si si r4
   R1*4
   
   %50
   r2 r8 la8 mi'4~ 
   mi8 re si'[re,] dod16 re dod si la8 r
   r2 mi'2~
   
   %53
   mi2. mi4~
   mi mi~mi8 [re] dod[mi]\mbreak
   fad2. fad4~
   
   %56
   fad fad4. fad8 fad4~
   fad8 mi8 mi2 re4
   dod2 si
   
   %59
   R1*5
   r2 r8 si si si
   dod dod red red16 red mi4 mi8 fad~
   
   %66
   fad8 fad mi2 red4
   mi mi,8 fad sol la si dod!
   re4. do16[si] la8[si do re]
   
   %69
   mi[fad] sol4 sol, r
   R1\mbreak
   r4 sol8 la si do re mi
   fa4 mi re2~
   
   %73
   re8[do] si4 la4. la8
   si2 r
   R1*2
   
   %77
   r2 re4. re8
   dod si la dod re4 la8 fad'
   mi fad mi fad mi dod dod dod
   
   %80
   mi mi la,8. la16 re4 si8 si\mbreak
   dod dod re4. re8 dod[(re)]
   re2 r
   
   %83
   r4 r8 sol fad sol fad sol
   fad red red red fad fad si,8. si16
   mi4 fad8 mi red red mi4~
   
   %86
   mi8 mi red[mi] mi2
   r r4 si 
   do4. do8 do[si] la[sold]
   
   %89
   la8. si16 do8 do re8. re16 la4
   r8 re re re mi mi16 mi re4~\mbreak
   re8 re do4. si8 si4
   
   %92
   la2 r8 la'\f sold la
   mi la sold la mi la sold la
   red,4-! re-! do8 la' si,[sold']
   
   %95
   la4 r r2
   R1
   r8 sol, sol sol la la16 la si8 si
   
   %98
   dod! dod16 dod r8 re re mi mi8. mi16
   re4. re8 dod8. dod16 re4
   re (dod) re8 re, la'4~\mbreak  %%%fine p.13
   
   %101
   la8 sol mi' sol, fa16 sol fa mi re8 la'~
   la16 fad! sol8~sol16 dod! mi sol, fa8 re' mi, dod'
   re4 r r2
   
   %104
   R1*4
   r2 r8 re,\f re'4~
   re8 do la' [do,] si16 do si la sol8 re'~
   
   %110
   re16 si do8~do16 fad \parenthesize si do, si4. (la8)\mbreak
   la4 r r2
   R1*17
   
   %129
   r2 r8 la\f mi'4~
   mi8 re \parenthesize si' re, dod16 re dod si la4\mbreak
   R1*3
   
   %134
   r8 mi\f la4~la8 sol! mi'[sol,]
   fad16 sol fad mi re8 la'\parenthesize ~ la16 fad sol8~sol16 dod mi sol,\mbreak
   fad sol fad mi re4 r2
   
   %137
   R1*10
   r8 re' dod re la re dod re
   r la sold la mi la sold la
   
   %149
   mi4 r r2
   r8 dod' si dod si dod si dod\mbreak
   si4 r r2
   
   %152
   R1
   r4 r8 si si si si si
   si si r4 r2
   
   %155
   R1*8
   r2 mi~
   mi mi~
   
   %165
   mi8 mi mi4. re8 dod mi
   fad2 fad~
   fad4 fad fad2~
   
   %168
   fad8 mi mi4. mi8 re4~
   re8 dod dod4 si8 fad si4~
   si la sold2\mbreak
   
   %171
   fad r
   R1*2
   r4 r8 fad' mi fad mi fad 
   
   %175
   mi mi dod dod mi mi16 mi la,8 la
   re8 re16 dod si8 si dod dod re4~
   re dod re2
   
   %178
   r2 r4 r8 sol
   fad sol fad sol fad red red red
   fad fad16 fad si,8 si mi mi16 mi fad8 mi\mbreak
   
   %181
   red red mi2 (red4)
   mi mi,8[fad] sol[la si dod!]
   re4. do16[si]la8[si do re]
   
   %184
   mi[fad] sol4 sol, r
   R1\mbreak
   r4 sol8[la]si[do re mi]
   
   %187
   fa4 mi re2~
   re8[do] si4 la2
   R1
   
   %190
   re2. re4~\mbreak
   re re2 re4~
   re8 re re re do8. do16 do4~
   
   %193
   do? si8 do re2
   re r4 r8 mi
   re mi re mi re si r4
   
   %196
   r2 r4 r8 fad'
   mi fad mi fad mi dod! dod dod
   mi mi16 mi la,8 la re re16 do si8 si
   
   %199
   dod! dod re2 dod4
   r4 la4.\f sol8 mi' sol,
   fad16 sol fad mi re8 la'~la16 fad sol8~sol16 dod mi sol,
   
   %202
   fad8 re' mi, dod' re, re' dod re
   la re dod re la re dod re
   sold,4 sol fad8 re' mi, dod'
   
   %205
   re2 r

}

IvlIn = \relative do'' {
   
   r8 re^\markup\italic"staccato" dod re la re dod re
   la4 r8 mi'\p fad16 (mi) fad32[(sol la16)] sol8(fad16 mi)
   fad(mi) fad32[(sol la16)] sol8[(fad)] fad(mi) r8 la,\tu\f
   
   %4
   sold la mi la sold la mi[mi']~
   mi re si'[re,] dod16 re dod si la8 mi'~
   mi16 dod re8~re16 sold si re, dod8 la' si, sold'\mbreak
   
   %7
   la4 r8 la, sold la mi la
   sold la mi[la]~la sol mi'[sol,]
   fad16 sol fad mi re8 la'~la16 fad sol8~sol16 dod mi sol,
   
   %10
   fad8 re' mi,[dod'] re, re'\tu dod re
   la re dod re la re dod re
   sold,4-! sol-! fad8 re' mi, dod'\mbreak
   
   %13
   re4 r r2
   R1
   r2 r8 re, dod re
   
   %16
   la re dod re la la'\tu sold la
   mi la sold la mi4 r
   r2 r8 la sold la
   
   %19
   mi la sold la mi4 r
   R1
   r2 r8 mi red mi
   
   %22
   si mi red mi si4 r
   r2 r4 r8 red'
   mi16 red mi fad mi fad mi fad mi8(red) r4\mbreak
   
   %25
   r2 r4 r8 sold\p
   la16 sold la si la si la si la8 sold r4
   R1*3
   
   %30
   r4 r8 si,\p dod16 si dod32[(re mi16)] re8(dod16 si)]\mbreak
   dod16 si dod32[(re mi16)] re8 dod dod[(si)] r4
   r8 la\p re, fad r si mi, sold
   
   %33
   r dod fad, la r re mi, si'
   mi,4 r r2
   R1
   
   %36
   r2 r8 mi\f red mi\mbreak
   si mi red mi si4 r
   r2 r4 r8 fad''\f 
   
   %39
   sold16 fad sold la sold la sold la sold8[(fad)] r4
   R1*4
   r2 r8 mi, red mi
   
   %45
   si mi red mi si4 r
   r8 mi dod'4.\p si8 la16(sol fad8)
   r fad re'4. dod8 si16( la sold8)
   
   %48
   r sold? mi'4. re8 dod(si16 la)\mbreak
   sold16(la) la(si) si(la) la(sold) sold8 mi' mi,4
   r2 r8 la\f\tu mi'4~
   
   %51
   mi8 re si'[re,] dod16 re dod si la8 mi'~
   mi16 dod re8~re16 sold si re, dod8 la' si, sold'
   <la dod, mi, la,>4 r r la,8 sold
   
   %54
   la mi la sold la la, la' sol
   fad lad si[si,] fad'4 si8 lad
   si fad si[lad] si lad fad'4~
   
   %57
   fad8 mi mi2 re4
   dod2 si8 si' lad si
   fad si lad si fad si lad si
   
   %60
   mid,4-! mi-! re8 si' dod, lad'\mbreak
   re, si' dod, lad' si si, r4
   R1*2
   
   %64
   r2 r8 si si si 
   dod dod red red16 red mi4 mi8 fad~
   fad8 fad mi2 red4
   
   %67
   mi mi,8 fad sol la si dod!
   re4. do16[si] la8[si do re]
   mi[fad] sol4 sol, r
   
   %70
   R1
   r4 sol8 la si do re mi
   fa4 mi re2~
   
   %73
   re8[do] si4 la4. la8
   si2 r
   R1*2
   
   %77
   r2 re4. re8
   dod si la dod re re, dod re
   la re dod re la4 dod'8 dod 
   
   %80
   mi mi la,[la] re4 si8 si\mbreak
   dod dod re4. re8 dod[re]
   re2 r
   
   %83
   r8 mi, red mi si mi red mi   
   si4 red'8 red fad fad si,8. si16
   mi4 fad8 mi red red mi4~
   
   %86
   mi8 mi red[mi] mi2
   r r4 si 
   do4. do8 do[si] la[sold]
   
   %89
   la8. si16 do8 do re8. re16 la4
   r8 re re re mi mi16 mi re4~\mbreak
   re8 re do4. si8 si4
   
   %92
   la2 r8 la'8\tu\f sold la
   mi la sold la mi la sold la
   red,4-! re-! do8 la' si,[sold']
   
   %95
   la4 r r2
   R1
   r8 sol, sol sol la la si[si]
   
   %98
   dod! dod16 dod r8 re re mi mi8. mi16
   re4. re8 dod8. dod16 re4
   re dod re8 re, la'4~\mbreak
   
   %101
   la8 sol mi' sol, fa16 sol fa mi re8 la'~
   la16 fad! sol8~sol16 dod! mi sol, fa8 re' mi, dod'
   re4 r r r8 la\p 
   
   %104
   re, re' r re, la la' r4
   R1\mbreak
   r8 re la la' r la, sol re'
   
   %107
   r sol, la(sol) fad re r4
   r2 r8 re\f \tu re'4~
   re8 do la' [do,] si16 do si la sol8 re'~
   
   %110
   re16 si do8~do16 fad \parenthesize si do, si4. (la8)\mbreak
   la4 r r2
   R1*8
   
   %120
   r2 r8 si, fad'4~\mbreak
   fad8 mi dod'?[mi,] re16 mi re dod si8 fad'~
   fad8 mi dod'[mi,] re si' dod, lad'
   
   %123
   si4. la16 sold la8 fad' sold, mid'
   fad[fad,16\p sold la8 fad]si, dod red si
   mi fad sold mi la,16 la' sold fad mi re dod si
   
   %126
   la8 la' sold la si, si' la si
   dod, dod' si dod re, re' mi re16 dod
   si8 si, si' dod re dod16 si la8 dod
   
   %129
   red,4 r8 red mi la\f mi'4~
   mi8 re \parenthesize si' re, dod16 re dod si la4\mbreak
   R1
   
   %132
   r8 la,\p re mi r la, re mi
   la,4 r r2
   r8 mi'\f\tu la4~la8 sol! mi'[sol,]
   
   %135
   fad16 sol fad mi re8 la'\parenthesize ~ la16 fad sol8~sol16 dod mi sol,\mbreak
   fad sol fad mi re4 r2  %% inizio p 17 2do sistema
   r r8 re\p  sol la
   
   %138
   r re, sol la re,4 r
   R1*2\mbreak
   r8 re' dod re la re dod re
   
   %142
   la4 r8 la4 sol8\noBeam  mi'[sol,]
   fad16 sol fad mi re8 la'~la16 fad sol8~sol16 dod mi sol,
   fad8 re r4 r2
   
   %145
   R1*2
   r8 re'\tu dod re la re dod re
   r la sold la mi la sold la
   
   %149
   mi4 r r2
   r4 r8 la sold la mi la\mbreak
   la si r4 r2
   
   %152
   R1
   r8 mi, red mi si mi red mi
   si4 r r2
   
   %155
   r4 r8 fad'' sold16 fad sold la sold la sold la\mbreak
   sold?8 fad r4 r2
   r4 r8 sold\p la16 sold la si la si la si 
   
   %158
   la8 sold r4 r2
   R1*3
   r2 r8 la, mi'4~
   
   %163
   mi8 re si'[re,] dod16 re dod si la8 mi
   la, la' sold la mi la sold la
   mi4 mi'4. re8 dod mi\mbreak
   
   %166
   fad si, lad si fad si lad si
   fad4 fad'4. fad8 fad4~
   fad8 mi mi4. mi8 re4~
   
   %169
   re8 dod dod4 si8 fad si4~
   si la sold2\mbreak
   r8 fad8 dod'4 \parenthesize r8 si sold'[si,] 
   
   %172
   la16 si la sold fad8 dod'4 si8 sold'[si,] 
   la fad' sold, mid' fad,16 fad' mid re dod si la sold
   fad8 re dod re la re dod re
   
   %175
   la4 dod'8 dod mi mi16 mi r4
   re8 re16 dod si8 si dod dod re4~
   re dod re2
   
   %178
   r r8 mi, red mi
   si mi red mi si4 red'8 red
   fad fad16 fad si,8 si mi mi16 mi fad8 mi\mbreak
   
   %181
   red red mi2 (red4)
   mi mi,8[fad] sol[la si dod!]
   re4. do16[si]la8[si do re]
   
   %184
   mi[fad] sol4 sol, r
   R1\mbreak
   r4 sol8[la]si[do re mi]
   
   %187
   fa4 mi re2~
   re8[do] si4 la r8 fad' 
   sol16 [fad] sol32 [la si16] la8 sol16 fad sol16 [fad] sol32 [la si16] la8 sol16 fad
   
   %190
   sol8 si, la fad' sol sol, fad sol\mbreak
   re sol fad sol re4 re'~
   re re do2~
   
   %193
   do4 si8 do re2
   re r8 do, si do
   sol do si do sol4 sol'~
   
   %196
   sol8 fa mi sol la re, dod! re
   la re dod re la4 dod'8 dod
   mi mi16 mi la,8 la re re16 do si8 si
   
   %199
   dod! dod re2 dod4
   re8 re, la'4.\f\tu sol8 mi' sol,\mbreak
   fad16 sol fad mi re8 la'~la16 fad sol8~sol16 dod mi sol,
   
   %202
   fad8 re' mi, dod' re, re' dod re
   la re dod re la re dod re
   sold,4 sol fad8 re' mi, dod'
   
   %205
   re2 r
   
}

IvlIIn = \relative do'' {
   
   r8 re^\markup\italic"staccato" dod re la re dod re
   la4 r8 dod\p re16(dod) re32[(mi fad16)] mi8(re16 dod)
   re16(dod) re32[(mi fad16)] mi8(re) re[(dod)] r la\f
   
   %4
   sold la mi la sold la mi[mi']~
   mi re si'[re,] dod16 re dod si la8 mi'~
   mi16 dod re8~re16 sold si re, dod8 la' si, sold'\mbreak
   
   %7
   la4 r8 la, sold la mi la
   sold la mi[la]~la sol mi'[sol,]
   fad16 sol fad mi re8 la'~la16 fad sol8~sol16 dod mi sol,
   
   %10
   fad8 re' mi,[dod'] re, re' dod re
   la re dod re la re dod re
   sold,4-! sol-! fad8 re' mi, dod'\mbreak
   
   %13
   re4 r r2
   R1
   r2 r8 re, dod re
   
   %16
   la re dod re la la' sold la
   mi la sold la mi4 r
   r2 r8 la sold la
   
   %19
   mi la sold la mi4 r
   R1
   r2 r8 mi red mi
   
   %22
   si mi red mi si4 r
   r2 r4 r8 fad'
   sold16 fad sold la sold la sold la sold8(fad) r4\mbreak
   
   %25
   r2 r4 r8 si\p
   dod16 si dod re dod re dod re dod8 si r4
   R1*3
   
   %30
   r4 r8 sold\p la16[sold] la32(si dod16) si8(la16 sold)
   la16[sold] la32(si dod16) si8 la la[(sold)] r4
   r8 la\p re, fad r si mi, sold
   
   %33
   r dod fad, la r re mi, si'
   mi,4 r r2
   R1
   
   %36
   r2 r8 mi\f red mi\mbreak
   si mi red mi si4 r
   r2 r4 r8 red'\f 
   
   %39
   mi16 red mi  fad mi fad mi fad mi8(red) r4
   R1*4
   r2 r8 mi, red mi
   
   %45
   si mi red mi si4 r
   r8 mi dod'4.\p si8 la16(sol fad8)
   r fad re'4. dod8 si16( la sold8)
   
   %48
   r sold? mi'4. re8 dod(si16 la)\mbreak
   sold16(la) la(si) si(la) la(sold) sold8 mi' mi,4
   r2 r8 la\f mi'4~
   
   %51
   mi8 re si'[re,] dod16 re dod si la8 mi'~
   mi16 dod re8~re16 sold si re, dod8 la' si, sold'
   <la dod, mi, la,>4 r r la,8 sold
   
   %54
   la mi la sold la la, la' sol
   fad lad si[si,] fad'4 si8 lad
   si fad si[lad] si lad r fad
   
   %57
   si8. si16 sold4 lad8 lad si4~
   si lad8. lad16 si8 si' lad si
   fad si lad si fad si lad si
   
   %60
   mid,4-! mi-! re8 si' dod, lad'\mbreak
   re, si' dod, lad' si si, r4
   r2 r4 fad
   
   %63
   fad8. fad16 sol8 sol4 fad8 mi red
   mi8[mi mi8. mi16] fad4 r8 sol
   sol la la la si si16 si la4~\mbreak
   
   %66
   la8 la sol sol fad2
   mi r
   r4 re8 mi fad sol la si

   %69
   do4 si re,8 mi fa sol
   la4. la8 la2\mbreak
   sol re8 mi fa sol

   %72
   la si dod4 la sol
   fad sol2 fad4
   sol2 r

   %75
   R1*2
   sol4. sol8 fad mi re fad
   la1~

   %79
   la~
   la8 sol fad4 sol2~\mbreak
   sol4 fad8 sol la2~
   
   %82
   la8 sol fad la si2~
   si8 mi, red mi si mi red mi
   si4 si' si2~
   
   %85
   si8 la la4. la8 sol la\mbreak
   si2 si4 mi,
   sol4. sol8 sol fad mi red

   %88
   mi[fad16 sol] la4. sold8 la si
   do8. si16 la8 la sold8. fad16 mi8 la
   la la sold si~si si16 si la8 la\mbreak

   %91
   sold4 la4. la8 sold4
   la2 r8 la'\f sold la
   mi la sold la mi la sold la
   red,4-! re-! do8 la' si,[sold']
   
   %95
   la4 r r2
   R1
   r8 sol, sol sol la la si[si]

   %98
   r8 la la la si si16 si dod!8 dod
   re8. dod16 sib8 sol sol8. sol16 fad4
   mi2 r8 re la'4~\mbreak
   
   %101
   la8 sol mi' sol, fa16 sol fa mi re8 la'~
   la16 fad! sol8~sol16 dod! mi sol, fa8 re' mi, dod'
   re4 r r r8 la\p 
   
   %104
   re, re' r re, la la' r4
   R1\mbreak
   r8 re la la' r la, sol re'
   
   %107
   r sol, la(sol) fad re r4
   r2 r8 re\f  re'4~
   re8 do la' [do,] si16 do si la sol8 re'~
   
   %110
   re16 si do8~do16 fad \parenthesize si do, si4. (la8)\mbreak
   la4 r r2
   R1*8
   
   %120
   r2 r8 si, fad'4~\mbreak
   fad8 mi dod'?[mi,] re16 mi re dod si8 fad'~
   fad8 mi dod'[mi,] re si' dod, lad'
   
   %123
   si4. la16 sold la8 fad' sold, mid'
   fad[fad,16\p sold la8 fad]si, dod red si
   mi fad sold mi la,16 la' sold fad mi re dod si
   
   %126
   la8 la' sold la si, si' la si
   dod, dod' si dod re, re' mi re16 dod
   si8 si, si' dod re dod16 si la8 dod
   
   %129
   red,4 r8 red mi la\f mi'4~
   mi8 re \parenthesize si' re, dod16 re dod si la4\mbreak
   R1
   
   %132
   r8 la,\p re mi r la, re mi
   la,4 r r2
   r8 mi'\f la4~la8 sol! mi'[sol,]
   
   %135
   fad16 sol fad mi re8 la'\parenthesize ~ la16 fad sol8~sol16 dod mi sol,\mbreak
   fad sol fad mi re4 r2  %% inizio p 17 2do sistema
   r r8 re\p  sol la
   
   %138
   r re, sol la re,4 r
   R1*2\mbreak
   r8 re' dod re la re dod re
   
   %142
   la4 r8 la4 sol8\noBeam  mi'[sol,]
   fad16 sol fad mi re8 la'~la16 fad sol8~sol16 dod mi sol,
   fad8 re r4 r2
   
   %145
   R1*2
   r8 re' dod re la re dod re
   r la sold la mi la sold la
   
   %149
   mi4 r r2
   r4 r8 la sold la mi la\mbreak
   la si r4 r2
   
   %152
   R1
   r8 mi, red mi si mi red mi
   si4 r r2
   
   %155
   r4 r8  red'8 mi16 red mi fad mi fad mi fad\mbreak
   mi8 red r4 r2
   r4 r8 si\p dod16 si dod re dod re dod re 
   
   %158
   dod8 si r4 r2
   R1*3
   r2 r8 la mi'4~
   
   %163
   mi8 re si'[re,] dod16 re dod si la8 mi
   la, la' sold la mi la sold la
   mi4 mi'4. re8 dod mi\mbreak
   
   %166
   fad si, lad si fad si lad si
   fad4 lad8 lad dod dod16 dod fad,8 fad
   si4 si16 la sold sold lad8 lad si4~
   
   %169
   si la2 sold8[fad]
   mid4 fad2 mid4\mbreak
   fad2 r8 si sold'[si,]
   
   %172
   la16 si la sold fad8 dod'4 si8 sold'[si,] 
   la fad' sold, mid' fad,16 fad' mid re dod si la sold
   fad8 re dod re la re dod re
   
   %175
   la4 r la'2
   sol2. fad8[sol]
   la2~la8[sol] fad la
   
   %178
   si2 si8 mi, red mi
   si mi red mi si4 si'~
   si8 si si4. la8 la4~
   
   %181
   la8 la sol la si2
   si r
   r4 re,8[mi] fad[sol la si]
   
   %184
   do4 si re,8[mi fa sol]
   la4 la la2\mbreak
   sol re8[mi fa sol]
   
   %187
   la[si] dod4 la sol
   fad sol~sol fad8 la
   si16 [la] si32 do re16 do8[si16 la] si16 [la] si32 do re16 do8[si16 la]
      
   %190
   sol'8 si, la fad' sol sol, fad sol\mbreak
   re sol fad sol re4 fad8 fad
   la la16 la re,8 re sol sol16 fad mi8 mi
   
   %193
   fad fad sol2 fad4
   sol4. sol8 r do, si do
   sol do si do sol4 sol'~
   
   %196
   sol8 fa mi sol la re, dod! re
   la re dod re la4 dod'8 dod
   mi mi16 mi la,4. sol8 sol4~
   
   %199
   sol fad8 sol la2
   la8 re, la'4.\f sol8 mi' sol,
   fad16 sol fad mi re8 la'~la16 fad sol8~sol16 dod mi sol,
   
   %202
   fad8 re' mi, dod' re, re' dod re
   la re dod re la re dod re
   sold,4 sol fad8 re' mi, dod'
   
   %205
   re2 r

}

Ivlan = \relative do'{
   
   <<la'4\\fad>> r8 fad mi fad mi fad
   mi fad dod[la] r dod sol' la
   r dod, sol' dod, la' la, r dod
   
   %4
   si dod si dod si la si[sold']
   la4 r8 si mi,16 fad mi re dod8 dod'
   la la, r mi' mi4 fad8 si,\mbreak
   
   %7
   dod4r8 dod si dod si dod
   si dod si[dod] re4 r8 mi~
   mi re16 mi fad sol fad mi re4 r8 la
   
   %10
   la4 si8 dod re4 r8 fad
   mi fad mi fad mi fad mi fad
   re  mi~mi re16 dod re8 la' sol mi\mbreak
   
   %13
   fad4 r r2
   R1
   r2 r8 re dod re 
   
   %16
   la re dod re la4 r8 dod
   si dod si dod si dod r4
   r2 r8 dod si dod\mbreak
   
   %19
   si dod si dod si dod r4
   R1
   r2 r8 mi red mi
   
   %22
   si mi red mi si4 r
   R1
   r8 mi mi, mi' la la, r4\mbreak
   
   %25
   r2 r8 mi'16[fad sold8 mi]
   la,8 la' la, la' mi mi, r4
   R1*3
   
   %30
   r2 r8 la re mi\mbreak 
   r la, re la mi' mi, r4
   R1*4
   
   %36
   r2 r8 mi' red mi\mbreak
   si mi red mi si4 r
   r2 r8 si16 dod red8 si
   
   %39
   mi, mi' mi, mi' si si' r4
   R1*4
   r2 r8 mi, red mi
   
   %45
   si mi red mi si4 r
   R1*4
   r4 r8 sold'\f dod4 la8 dod16 si
   
   %51
   la8 fad r si mi,16 fad mi re dod8 dod'
   la4 si8 mi, mi4 r8 si
   dod4 r r la'8 sold
   
   %54
   la mi la sold la la, la' sol\mbreak
   fad lad si [si,] fad'4 si8 lad
   si fad si lad si fad r4
   
   %57
   r8 si,[mi8. mi16] dod8 dod re mi
   fad4. fad8 re4 r8 re'
   dod re dod re dod re dod re
   
   %60
   si lad16 si dod8 lad si fad sol[dod,]\mbreak
   si re mi dod re4 r
   R1
   r2 r8 la la la
   
   %64
   si si dod dod16 dod red8 red mi4~
   mi8 fad fad4 mi8 mi dod dod
   red dod red16 mi si8 si si si4
   
   %67
   si2 r
   R1
   r4  sol8 la si dod re mi
   
   %70
   fa4 fa,8 sol la si do re\mbreak
   mi4 re re2
   re4 do2 si8[do]
   
   %73
   re8. re16 re,4 r re'~
   re8 re si si do4re8 do
   si4 dod! re8 re mi4~\mbreak
   
   %76
   mi8 mi dod si16 dod re8[la] re4~
   re dod8. dod16 re2
   r r8 re dod re
   
   %79
   la re dod re la4 r
   dod8 dod fad fad re8. re16 sol4\mbreak
   mi8 mi fad fad mi la, mi'[fad]
   
   %82 OOKK
   fad2 r
   r8 mi red mi si mi red mi
   si4 r red8 red sol sol
   
   %85
   mi8. mi16 do4 si8 fad' sol mi
   fad si, fad'4 mi2
   R1*2
   
   %89
   r8 la, la la si si16 si do8 do
   re8. re16 re4 do fa8 re\mbreak
   si4 do8[re] mi4 mi8 mi
   
   %92
   mi4 r8 la\f sold la mi la
   si do si do si do si do
   la fad si sold mi mi fa si,
   
   %95
   do4 r r2
   R1*4
   la4 r8 la fa'8. mi16 re mi fa mi\mbreak %% fine p. 13
   
   %101 OOKK
   re8 re, r mi' la,4 r8 fa'16 mi
   re8 si mi [la,]~la la' sol[mi]
   fa4 r r2
   
   %104
   R1*4
   r4 r8 mi\f la4. sol16 fad
   sol8 mi r la re,16 mi re dod si8 si'16 la
   
   %110
   sol8. sol16 la8 re,~re sol4(fad8)\mbreak
   fad4 r r2
   R1*8
   
   %120
   r4 r8 fad, re'4~re16 si re dod\mbreak %% fine p. 17
   si4 r8 dod4 si16 dod re mi re dod
   si4 r8 dod si8 fad' mi dod
   
   %123
   si8 re dod4. dod'8 si[sold]
   la fad16\p sold la8 fad si, dod red si
   mi fad sold mi la,16 la' sold fad mi re dod si
   
   %126
   la8 la' sold la si, si' la si
   dod, dod' si dod re, re' mi re16 dod
   si8 si, si' dod re dod16 si la8 dod
   
   %129
   r4 r8 fad, si4.\f la16 sold
   la8 la, r si' mi,2\mbreak
   R1
   
   %132
   r8 la,\p re mi r la, re mi
   la,4 r r r8 mi'
   dod'4\f r8 la re,4 r8 mi~
   
   %135
   mi re16 mi fad sol fad mi re4 r8 la'\mbreak
   la2 r
   r r8 re,\p sol la
   
   %138
   r re, sol la re,4 r
   R1*2\mbreak
   r4 r8 fad mi fad  mi fad
   
   %142
   mi fad dod8. dod16 re4 r8 mi~
   mi re16 mi fad sol fad mi re4 r8 mi
   la4 r r2
   
   %145
   R1*2
   r8 re dod re la re dod re
   r la sold la fad la sold la
   
   %149
   mi4 r r2
   r4 r8 la sold la mi la\mbreak
   sol mi r4 r2
   
   %152
   R1
   r8 mi red mi si mi red mi
   si4 r r2
   
   %155
   r8 si16 dod red8 si mi, mi' mi, mi'\mbreak
   si si' r4 r2
   r8 mi,16\p fad sold8 mi la, la' la, la'
   
   %158
   mi mi, r4 r2
   R1*3
   
   %162 inizio p. 20
   r4 r8 mi' dod'4 la8 dod16 si
   la4 r8 si mi,4 r
   r8 la sold la mi la sold la
   
   %165
   mi4 r r2\mbreak
   r8 si' lad si mi, si' lad si
   fad4 r r2
   
   %168
   si,8 si mi mi16 re dod8 dod re mi
   fad[fad, fad' mi]re[dod si la]
   sol4 la8[si] dod2\mbreak
   
   %171
   dod4 r8 la fad'4 r8 sold
   dod,4 r8 la fad'4 r8 sold
   dod, dod' si sold la8. si16 dod si la sold
   
   %174
   fad8 re dod re la re dod re
   la4 r dod8 dod fad fad16 mi
   re8 re sol sol16 fad mi8 mi fad fad
   mi2 fad
   
   %178
   r r8 mi red mi
   si mi red [mi] si4 r
   red8 red sol sol16 fad mi8 re do4\mbreak
   
   %181
   si8[fad'] sol mi fad2
   mi r
   R1
   
   %184
   r4 sol,8 [la] si [do re mi]
   fa4 fa,8 [sol] la [si do re]\mbreak
   mi4 re4. re8 re4~
   
   %187
   re do2 si4
   la si8[do] re4 re,
   r8 sol do? re r sol, do re
   
   %190
   si sol mi'[la,] si sol' fad sol\mbreak
   re sol fad sol re4 r
   fad,8 fad si si16 la sol8 sol do do16 si
   
   %193
   la8 la si si la2
   si r8 do si do
   sol do si do sol4 sol'~
   
   %196
   sol8 fa mi sol la re, dod! re
   la re dod re la4 r
   dod8 dod fad fad16 mi re8 re sol sol16 fad
   
   %199
   mi4 fad mi2
   fad4 r8 re re4 r8 mi\mbreak
   re4 r8 re re4 r8 la'
   
   %202
   la4 sol8 mi fad4 r8 fad
   mi fad mi fad mi fad mi fad
   re mi4 mi8 re la' sol mi
   
   %205
   fad2 r
   
}

Isopranon = \relative do'' {

   \autoBeamOff
   R1*14
   r2 r4 r8 la
   la  la la la la la r4
   
   %17
   R1*4
   r2 r4 r8 si
   si si si si si si r4
   
   %23
   R1*13
   r2 r4 r8 si\mbreak
   si si si si si si r4
   
   %%38
   R1*6
   r2 r4 r8 si
   si si si si si si r4
   
   %46
   R1*6
   r2 mi~
   mi2. mi4~
   
   %54
   mi mi~mi8 [re] dod[mi]\mbreak
   fad2. fad4~
   fad fad4. fad8 fad4~
   
   %57
   fad8 mi8 mi2 re4
   dod2 si
   R1*5
   
   %64
   r2 r8 si\tu si si
   dod dod red red16 red mi4 mi8 fad~
   fad8 fad mi2 red4
   
   %67
   mi mi,8 fad sol la si dod!
   re4. do16[si] la8[si do re]
   mi[fad] sol4 sol, r
   
   %70
   R1
   r4 sol8 la si do re mi
   fa4 mi re2~
   
   %73
   re8[do] si4 la4. la8
   si2 r
   R1*2
   
   %77
   r2 re4. re8
   dod[si] la dod re4 la8 fad'
   mi fad mi fad mi dod dod dod
   
   %80
   mi mi la,8. la16 re4 si8 si\mbreak
   dod dod re4. re8 dod[(re)]
   re2 r
   
   %83
   r4 r8 sol fad sol fad sol
   fad red red red fad fad si,8. si16
   mi4 fad8 mi red red mi4~
   
   %86
   mi8 mi red[mi] mi2
   r r4 si 
   do4. do8 do[si] la[sold]
   
   %89
   la8. si16 do8 do re8. re16 la4
   r8 re re re mi mi16 mi re4~\mbreak
   re8 re do4. si8 si4
   
   %92
   la2 r
   R1*4
   r8 sol sol sol la la16 la si8 si
   
   %98
   dod! dod16 dod r8 re re mi mi8. mi16
   re4. re8 dod8. dod16 re4
   re (dod) re2\mbreak  %%%fine p.13
   
   %101
   R1*2
   r4 re4.\solo do8 do do
   do?8[si] si4 r la8[si]
   
   %105
   do4 do8 do si2\mbreak
   la8 la re do si[la] si4
   r8 sol do si la4 si~
   
   %108
   si8 sol16[la] si4 la2
   R1*2
   r4 re8 do si[(la)] si4
   
   %112
   dod!8 dod16 re mi8 re dod[(si)] dod4
   r re2 dod4~
   dod si lad8[sol] lad4
   
   %115
   sol'2 fad4. mi8\mbreak 
   re[dod] re[mi] do2
   si~si8 si si4
   
   %118
   lad r8 lad si[(re)] dod?[(si)]
   lad16[si] dod4 si16[lad] si8[dod] re4~
   re8 dod dod4 si2\mbreak  %% fine p. 15
   
   %121
   R1*3
   dod4. si16 dod re8[mi] re[dod]
   si4. la16 si dod8. dod16 dod8[re]\mbreak
   
   %126
   mi2 re
   dod~dod8 dod si[dod]
   re[mi] fad4. mi16[re] dod8[la]
   
   %129
   dod2 si
   R1\mbreak 
   r4 la8 re si8. la16 si4
   
   %132
   dod16[(si)] dod32[(re mi16)] re8[(dod16 si)] dod[(si)] dod32[(re mi16)] re8[dod16 si]
   dod8[fad mi re] dod4 re8[si]
   la2 r
   
   %135
   R1\mbreak
   r4 la8 re si8. la16 si4
   dod~dod16[re si dod] re[dod] re32[(mi fad16)] mi8[(re16 dod)]
   
   %138
   re[dod] re32[(mi fad16)] mi8[(re16 dod)] re8[la re do]
   si4. la16[si] dod!4 re~
   re8 [dod16 si] dod4 re r\mbreak
   
   %141
   R1*6
   r8 re dod re la re dod[re]
   la4 r4 r2
   
   %149
   R1
   r8 dod si dod si dod si [dod]\mbreak
   si4 r r2
   
   %152
   R1
   r4 r8 si si si si si
   si si r4 r2
   
   %155
   R1*8
   r2 mi~
   mi mi~
   
   %165
   mi8 mi mi4. re8 dod mi
   fad2 fad~
   fad4 fad fad2~
   
   %168
   fad8 mi mi4. mi8 re4~
   re8 dod dod4 si8 fad si4~
   si la sold2\mbreak
   
   %171
   fad r
   R1*2
   r4 r8 fad' mi fad mi fad 
   
   %175
   mi mi dod dod mi mi16 mi la,8 la
   re8 re16 dod si8 si dod dod re4~
   re dod re2
   
   %178
   r2 r4 r8 sol
   fad sol fad sol fad red red red
   fad fad16 fad si,8 si mi mi16 mi fad8 mi\mbreak
   
   %181
   red red mi2 (red4)
   mi mi,8[fad] sol[la si dod!]
   re4. do16[si]la8[si do re]
   
   %184
   mi[fad] sol4 sol, r
   R1\mbreak
   r4 sol8[la]si[do re mi]
   
   %187
   fa4 mi re2~
   re8[do] si4 la2
   R1
   
   %190
   re2. re4~\mbreak
   re re2 re4~
   re8 re re re do8. do16 do4~
   
   %193
   do? si8 do re2
   re r4 r8 mi
   re mi re mi re si r4
   
   %196
   r2 r4 r8 fad'
   mi fad mi fad mi dod! dod dod
   mi mi16 mi la,8 la re re16 do si8 si
   
   %199
   dod! dod re2 dod4
   r8 re fad4 r8 re dod4\mbreak
   r8 la fad'4 r8 re mi4~
   
   %202
   mi8 re re[dod] re4 r
   R1
   r4 r8 dod(re) re re[dod]
   
   %205
   re2 r
 
}

ItestoI = \lyricmode {
   
   Lae -- ta -- tus sum  lae -- tatus _  lae -- ta -- tus sum  lae -- tatus _ 
   
   lae -- ta -- tus sum  lae -- tatus _ lae -- ta -- tus sum  lae -- tatus _  
   
   Stan -- tes e -- rant stan -- tes e -- rant e -- rant  pe -- des

   no -- stri  Cu -- jus par -- te -- ci -- pa -- tio _ e -- ius in

   id i - psum.
   
   Il -- luc e -- nim a -- scen -- de - - - - runt Il -- luc e -- nim

   a -- scen -- de -- runt 

   tri -- bus Do -- mi -- ni: qui -- a il -- lic se -- de -- runt  
   
   qui -- a il -- lic se -- de -- runt  se --  des 
   
   in ju -- di -- cio, _ se -- des su -- per do -- mum Da -- vid,
   
   qui -- a il -- lic se -- de -- runt  se --  des 
   
   in ju -- di -- ci -- o, se -- des su -- per do -- mum Da -- vid.
   
   Ro -- ga -- te quae ad pa -- cem  sunt

   Je -- ru -- salem: _ et a -- bun -- dan -- tia _ 
   
   di -- li -- gen -- tibus  _ te: et a -- bun -- dan -- tia _  
   
   a -- bun -- dan -- tia _  et a -- bun -- dan -- ti -- a 
   
   in tur -- ribus _ tu -- is.
   
   Prop -- ter fra -- tres me -- os et pro -- ximos _  me -- os

   lo -- que --  bar pa -- cem   lo -- que --  bar pa - cem de te.
   
   Prop -- ter do -- mum Do -- mini _ Dei _ no -- stri quae -- si -- vi

   bo -- na, quae -- si -- vi bo -- na, quae -- si -- vi bo -- na 
   
   quae -- si -- vi bo - - - - na ti -- bi.
   
   Glo -- ria _ Pa -- tri glo -- ria _  Fi -- li -- o et Spi -- ri -- tu -- i

   San - - - - cto et Spi -- ri -- tui _ San - - - - - - - - cto,
   
   et Spi -- ri -- tui _ San - - - - - - - - - - - - cto. et nunc et nunc

   et sem -- per et nunc  et nunc et sem -- per 
   
   et nunc et nunc  et sem -- per et nunc  et sem - - per
   
   et nunc  et sem -- per et in sae -- cula _  sae -- cu -- lo -- rum 
   
   a -- men, et nunc  et nunc et sem -- per et in sae -- cula _  
   
   et in sae -- cula _   sae -- cu -- lo -- rum  a - men, 
   
   et nunc et nunc  et sem -- per et in sae -- cula _  
   
   et in sae -- cula _   sae -- cu -- lo -- rum  a -- men, 
   
   a - - - - - - men  a - - - - - men
   
   et nunc   et sem -- per et in sae -- cula _ sae -- cu -- lo -- rum,
   
   et nunc et nunc  et sem -- per et nunc et nunc  et sem -- per
   
   et in sae -- cula _  
   
   et in sae -- cula _   sae -- cu -- lo -- rum  a -- men, a -- men a -- men
   
   a -- men a - men a -- men a -- men a -- men.

}

Ialton = \relative do' {

   \autoBeamOff
   R1*12
   r8 re la'4. fad16[sol] la [si la si]
   la[re dod si] la8[fad16 sol] la[si la si] la[re dod si]

   %15
   la4 sol8. fad16 fad4 r8 fad
   mi fad mi fad mi mi r4
   r2 r4 r8 la\solo

   %18
   sold la si la16[sold] la4 r\mbreak
   r2 r4 r8 la8
   sold la si(la16)[sold] la4. si8

   %21
   dod2 si4 r8 sold
   fad sold fad sold fad fad r fad
   sold16[fad mi fad] sold[la sold la] sold8 fad r4

   %24
   r2 r4 si
   dod16[si la si] dod[re dod re] dod8 si r4
   r2 r4 r8 si

   %27
   dod dod dod dod dod[(si)] r dod
   re4 dod si8 la16[(sold] la8) dod
   re4 dod si8 la16[sold] la8 si

   %30
   sold8. fad16 mi4 r2\mbreak
   r2 r4 r8 mi
   fad16[mi fad sold]fad[sold la fad] sold[fad sold  la]sold[la si sold]

   %33
   la[sold la si] la [si dod la] si[la si dod] si[dod re si]
   dod[si dod re]dod[re si dod]re8 dod si la
   re dod si4 la16[(sold]  la8) si4

   %36
   dod2 si4 r8 sold\mbreak
   fad sold fad sold fad fad r fad
   sold sold sold sold sold[(fad)] r4

   %39
   r2 r4 r8 sold
   la4 sold fad8 mi16[(red] mi8) sold
   la4 sold8 la fad4 mi8 dod'

   %42
   si4. la8 sold16[la sold fad] mi8[dod']\mbreak
   si4. la8 sold8. la16 si8 [dod]
   sold4(la8) fad mi4 r8 sold

   %45
   fad sold fad sold fad fad r mi
   la4. sol!8 fad16[mi] fad4 sold16[la]
   si4. la8 sold16 [fad] sold4 la16[si]

   %48
   dod4. si8 la16[sold] la4 si16[dod]\mbreak
   re2~re8 si dod([la)]
   si4. la8 la2

   %51
   R1*2
   r2 r4 la8 sold
   la mi [la] sold la4. sol8\mbreak %da p. 6 seconda riga

   %55
   fad8[(lad)] si4 fad si8 lad
   si fad si lad si lad r fad
   si8. si16 sold4 lad8 lad si4~

   %58
   si lad8. lad16 si2
   R1*3
   r2 r4 fad4\tu
   
   %63
   fad8. fad16 sol8 sol4 fad8 mi red
   mi mi16 mi mi8. mi16 fad4 r8 sol
   sol la la la si si16 si la4~\mbreak
   
   %66
   la8 la sol sol fad2
   mi r
   r4 re8 mi fad sol la si

   %69
   do4 si re,8 mi fa sol
   la4. la8 la2\mbreak
   sol re8 mi fa sol

   %72
   la si dod4 la sol
   fad sol2 fad4
   sol2 r

   %75
   R1*2
   sol4. sol8 fad[mi] re fad
   la1~

   %79
   la~
   la2 sol~\mbreak
   sol4 fad8 sol la2~

   %82
   la8 [sol fad la] si2~
   si si~
   si si~

   %85
   si8 la la4. la8 sol la\mbreak
   si2 si4 mi,
   sol4. sol8 sol[fad] mi[red]

   %88
   mi[fad16 sol] la4. sold8 la si
   do8. si16 la8 la sold8. fad16 mi8 la
   la la sold[si]~si si16 si la8 la\mbreak

   %91
   sold4 la4. la8 sold4
   la2 r
   R1*5

   %98
   r8 la la la si si16 si dod!8 dod
   re8. dod16 sib8 sol sol8. sol16 fad4
   mi2 re\mbreak

   %101
   R1*2
   r2 r4 la'\solo~
   la8 sol sol sol sol[fad] fad4

   %105
   r mi8[fad] sol4 sol8 sol
   sol4 fad r8 re sol fad
   mi[re] mi4 fad sol~

   %108
   sol8 mi16[fad] sol4 fad2
   R1*2\mbreak
   r2 r4 sol8 fad

   %112
   mi4. mi8 fad fad16 sol la8 sol
   fad2 mi
   sol2. fad4~

   %115
   fad mi re8[mi fad sold16 lad]\mbreak
   si8 lad si2 la?4~
   la sol?4. fad8 mi[re]

   %118
   dod4 r8 dod fad4 mi~
   mi re8 [mi] fad sold16[lad] si4~
   si8 sold lad4 si2\mbreak

   %121
   R1*3
   la4. sold16 lad si4. la?8
   sold4. fad16 sold la8. la16 la8[si]\mbreak

   %126
   dod2. si4~
   si la4. la8 sold[la]
   si4. la16[sold] fad8 [sold] la4~

   %129
   la8[fad] la4 sold2
   r r4 mi8 la\mbreak
   fad8. fad16 fad4 sold~sold16[la fad sold]

   %132
   la[(sold)] la32[(si dod16)] si8[(la16 sold)] la[(sold)] la32[(si dod16)] si8[la16 sold]
   la8[re dod si] la4 si8[sold]
   la2 r

   %135
   R1 \mbreak
   r2 r4 re,8 sol
   mi4. re16 mi fad[mi] fad32[(sol la16)] sol8[(fad16 mi)]

   %138
   fad[mi] fad32[(sol la16)] sol8[(fad16 mi)] fad4. mi16[fad]
   sol8[re sol fad] mi4 fad
   mi2 re4 r\mbreak

   %141 p.18
   R1*3
   re8\solo  fad la4. fad16[sol] la[si la si]
   la[re dod si] la8[fad16 sol] la[si la si] la[re dod si]\mbreak

   %146
   la8 fad16[sol] la8 fad sol4. fad8
   fad4 r8 la\tu la la la la
   la la r4 r2

   %149
   r4 r8 la\solo sold la si la16[sold]
   la8 mi r8 la\tu sold la mi la\mbreak
   sold sold r la sold la si la16[sold]

   %152
   la4. si8 dod4. dod8
   si4 r8 sold\tu  fad sold fad sold
   fad fad fad\solo fad sold16[fad mi fad] sold[la sold la]

   %155
   sold8. fad16 fad4 r2
   r4 si8\solo si dod16[si la si] dod[re dod re]
   dod8. si16 si4 r2

   %158
   r4 r8 si dod dod16 dod dod8 dod
   dod si r dod re4 dod
   si8 la16[sold] la4 re dod

   %161 fine p 19
   si8 si16 dod si8 la sold[mi] la4~
   la8[fad] sold4 la2
   R1

   %164
   r8 la sold la mi la sold[la]
   mi4 r r2
   r8 si' lad si fad si lad[si]

   %167
   fad4 lad8 lad dod dod16 dod fad,8 fad
   si4 si16 la sold sold lad8 lad si4~
   si la2 sold8[fad]

   %170
   mid4 fad2 mid4\mbreak
   fad2 r
   R1

   %173
   r2 la\tu~
   la la~
   la la\mbreak

   %176
   sol2. fad8[sol]
   la2~la8[sol] fad la
   si2. si4~

   %179
   si si si2~
   si8 si si4. la8 la4~
   la8 la sol la si2

   %182
   si r
   r4 re,8[mi] fad[sol la si]
   do4 si re,8[mi fa sol]

   %185
   la4 la la2\mbreak
   sol re8[mi fa sol]
   la[si] dod4 la sol

   %188
   fad sol2 fad4
   R1
   r2 r8 sol fad sol\mbreak

   %191
   re  sol fad sol re fad fad fad
   la la16 la re,8 re sol sol16 fad mi8 mi
   fad fad sol2 fad4

   %194
   sol2~sol4 sol~
   sol sol sol2~
   sol8[fa] mi sol la2~

   %197
   la4 la2 la4~
   la la4. sol8 sol sol
   sol8. sol16 fad8[sol] la la la4

   %200
   la r8 la si4 r8 sol\mbreak
   fad4 r8 la si4 r8 la
   la4 sol8[mi] fad4 r

   %203
   R1
   r4 r8 mi re[la'] sol[mi]
   fad2 r

}

ItestoII = \lyricmode {

   Lae -- ta - - - - - - -  - tus sum  lae -- tatus _  sum lae -- tatus _

   lae -- tatus _ sum in his in his quae dic -- ta sunt mi -- hi

   lae -- tatus _  sum lae -- tatus _ lae -- ta - - tus lae -- ta - - tus

   lae -- tatus _ sum in his in his quae dic -- ta

   lae -- ta - - - - - - tus sum lae -- ta - - - - - - - - - - tus sum

   lae -- ta - - - - - tus lae -- tatus _ sum lae -- tatus _

   lae -- tatus _ sum in his in his quae dic -- ta

   quae dic -- ta sunt mi -- hi: in do -- mum

   Do - - - - mi -- ni i -- bi -- mus.

   Lae -- tatus _ sum lae -- tatus _ in do -- mum

   Do - - - - - - - - - - - - - mi -- ni i -- bi -- mus.

   Stan -- tes e -- rant pe -- des pe -- des

   no -- stri stan -- tes e -- rant pe -- des no -- stri in a - tris tu -- is,

   Je -- ru -- sa -- lem Je -- ru -- salem, _ quae e -- di -- fi -- catur _

   ut ci -- vitas: _  cu -- jus par -- te -- ci -- pa -- tio _ e -- ius in

   id i -- psum.

   Il -- luc e -- nim a -- scen -- de -- runt Il -- luc e -- nim

   a -- scen -- de -- runt il -- luc e -- nim a -- scen -- de -- runt

   tri -- bus Do -- mi -- ni: qui -- a il -- ic se -- de - runt  se -- de - runt

   se -- des su -- per do -- mum Da -- vid.

   Ro -- gate _ quae ad pa - cem quae ad pa -- cem sunt

   Je -- ru -- salem: _ et a -- bun -- dan -- tia _ di -- li --

   gen - tibus  _ te: et a -- bun -- dan -- tia _ a -- bun -- dan -- tia _

   in tur -- ribus _ tu -- is.

   Prop -- ter fra -- tres me -- os et pro -- ximos _  me -- os

   lo -- que - -  bar pa - cem de te.

   Prop -- ter do -- mum Do -- mini _ Dei _ no -- stri quae -- si -- vi

   bo - na, quae -- si - vi bo -- na, quae -- si - vi bo - - na ti -- bi.

   Glo -- ria _ Pa -- tri glo -- ria _  Fi -- li -- o et Spi -- ri -- tu -- i

   San - - - - cto et Spi -- ri -- tui _ San - - - - - - - - - cto,

   et Spi -- ri -- tui _ San - - - - - - - - - - - cto.

   Si -- cut e - - - - - - - rat in prin -- ci -- pi -- o et nunc et nunc

   et sem -- per et nunc  et sem - - per et nunc et nunc  et sem -- per

   et nunc  et sem -- per et in sae -- cu -- la

   et nunc  et nunc et sem -- per et in sae - - cula _

   et in sae - - cula _ in sae -- cula _ sae -- cu -- lorum _

   et nunc et sem - per et in sae -- cula _ sae -- cu -- lo - - rum

   et nunc  et nunc et sem -- per et nunc  et nunc et sem -- per

   et in sae -- cula _  et in sae -- cula _ sae -- cu -- lo -- rum

   a - - - - - men, et nunc et sem - - - per  et nunc et sem -- per

   et in sae -- cu -- lorum _ a -- men, a - - men a - men a -- men

   a - - - men a - men et nunc et nunc et nunc et sem -- per et in sae -- cula _

   et in sae -- cula _ sae -- cu -- lorum _ a -- men et nunc et sem - per

   et nunc et sem -- per et in sae -- cula _ sae -- cu -- lo  -- rum

   a -- men a -- men a -- men a -- men a -- men a - - men.

}

Itenoren = \relative do' {

   \autoBeamOff
   R1*14
   r2 r8 re dod re
   la re dod re la4 r
   
   %17
   R1*4
   r2 r8 mi' red mi
   si mi red mi si4 r
   
   %23
   R1*13
   r2 r8 mi red mi\mbreak % fine p. 7
   si mi red mi si4 r
   
   %38
   R1*6
   r2 r8 mi red mi
   si mi red mi si4 r
   
   %46
   R1*7
   r2 dod8 si dod si
   dod si dod si r2\mbreak
   
   %55
   r2 re8 dod re dod
   re dod re dod r2
   r8 si mi8. mi16 dod8 dod re mi
   
   %58
   fad4. fad8 re2
   R1*4
   r2 r8 la la la
   
   %64
   si si dod dod16 dod red8 red mi4~
   mi8 fad fad4 mi8 mi dod dod
   red dod red16 mi si8 si si si4
   
   %67
   si2 r
   R1
   r4  sol8 la si dod re mi
   
   %70
   fa4 fa,8 [sol] la [si do re]\mbreak
   mi4 re re2
   re4 do2 si8[do]
   
   %73
   re8. re16 re,4 r re'~
   re8 re si si do4re8 do
   si4 dod! re8 re mi4~\mbreak
   
   %76
   mi8 mi dod si16 dod re8[la] re4~
   re dod8. dod16 re2
   r r8 re dod re
   
   %79
   la re dod re la4 r
   dod8 dod fad fad re8. re16 sol4\mbreak
   mi8 mi fad fad mi la, mi'[fad]
   
   %82
   fad2 r
   r8 mi red mi si mi red[mi]
   si4 r red8 red sol sol
   
   %85
   mi8. mi16 do4 si8 fad' sol mi
   fad si, fad'4 mi2
   R1*2
   
   %89
   r8 la, la la si si16 si do8 do
   re8. re16 re4 do fa8 re\mbreak
   si4 do8[re] mi4 mi8 mi
   
   %92
   mi2 r
   R1*3\mbreak
   mi4. mi8 mi4 fa~
   
   %97
   fa8 mi re dod! re4 re8 re
   mi mi re re16 re r8 sol, sol sol
   la la re sib la4 la8 la
   
   %100
   la2 la\mbreak
   R1*46
   r4 r8 fad' mi fad mi fad
   
   %148
   mi dod r4 r2
   R1
   r8 mi mi mi mi mi mi4\mbreak
   
   %151
   mi8 mi r4 r2
   R1
   r8 mi red mi si mi red [mi]
   
   %154
   si4 r r2
   R1*9
   r4 r8 dod si dod si dod
   
   %165
   si dod si sold r2\mbreak
   r4 r8 re' dod re dod re
   dod lad r4 r2
   
   %168
   si8 si mi mi16 re dod8 dod re mi
   fad[fad, fad' mi]re[dod si la]
   sol4 la8[si] dod2\mbreak
   
   %171
   dod r
   R1*2
   r8 re dod re la re dod[re]
   
   %175
   la4 r dod8 dod fad fad16 mi
   re8 re sol sol16 fad mi8 mi fad fad
   mi2 fad
   
   %178
   r r8 mi red mi
   si mi red [mi] si4 r
   red8 red sol sol16 fad mi8 re do4\mbreak
   
   %181
   si8[fad'] sol mi fad2
   mi r
   R1
   
   %184
   r4 sol,8 [la] si [do re mi]
   fa4 fa,8 [sol] la [si do re]\mbreak
   mi4 re4. re8 re4~
   
   %187
   re do2 si4
   la si8[do] re4 re,
   R1
   
   %190
   r2 r4 r8 si'   
   la si la si la fad r4
   fad8 fad si si16 la sol8 sol do do16 si
   
   %193
   la8 la si si la2
   si r8 do si do
   sol do si[do] sol4 r\mbreak
   
   %196
   r2 r8 re' dod! re
   la re dod[re] la4 r
   dod8 dod fad fad16 mi re8 re sol sol16 fad
   
   %199
   mi4 fad mi2
   fad4 r8 re re4 r8 mi\mbreak
   re4 r8 re re4 r8 dod
   
   %202
   la4 si8[la] la4 r
   R1
   r4 r8 la (re) re, si'[la]
   
   %205
   la2 r
   
}

ItestoIII = \lyricmode {
   
   Lae -- ta -- tus sum  lae -- tatus _ sum 
   
   Lae -- ta -- tus sum  lae -- tatus _ sum 
   
   Lae -- ta -- tus sum  lae -- tatus _ sum 
   
   Lae -- ta -- tus sum  lae -- tatus _ sum 
   
   Stan -- tes e -- rant pe -- des no -- stri
   
   stan -- tes e -- rant pe -- des no -- stri
   
   in a - tris tu -- is, Je -- ru -- sa -- lem
   
   Cu -- jus par -- te -- ci -- pa -- tio _ e -- ius in

   id i -- psum, par -- te -- ci -- pa -- tio _ e -- ius in

   id i -- psum. Il -- luc e -- nim a -- scen -- de - - - runt

   tri -- bus tri -- bus Do -- mi -- ni: 
   
   te -- sti -- mo -- nium _ Is -- ra -- el, ad con -- fi -- ten -- dum  
   
   no -- mini _ Do - - mini. _ 
   
   qui -- a il -- ic se -- de - runt  se --  des 
   
   in ju -- di -- cio, _  se -- des su -- per do -- mum Da -- vid,
   
   qui -- a il -- ic se -- de -- runt  se --  des 
   
   in ju -- di -- cio, _  se -- des su -- per do -- mum Da -- vid.
   
   et a -- bun -- dan -- tia _  di -- li -- gen -- tibus  _ te, 
   
   di -- li -- gen - - tibus  _ te:  %% Fine bar 92 inizio 2do sist p. 12
   
   Fi -- at pax in vir -- tute _ tu -- a; et a -- bun -- dan -- tia _ 
   
   et a -- bun -- dan -- tia _ in tur -- ribus _ tu -- is.
   
   et nunc et nunc et sem -- per, et nunc et nunc et sem - per,
   
   et nunc et nunc et sem -- per, et nunc et nunc 
   
   et nunc et sem -- per, et nunc et nunc et sem -- per, 
   
   et in sae -- cula _  sae -- cu -- lo -- rum

   a - - - - men, et nunc et nunc et sem -- per, 
   
   et in sae -- cula _ et in sae -- cula _ sae -- cu -- lo -- rum a -- men,
   
   et nunc et nunc et sem -- per, 
   
   et in sae -- cula _  sae -- cu -- lo - - rum a -- men, a - - - - - - men
   
   a - - - - - men
   
   et nunc et nunc et sem -- per et in sae -- cula _

   et in sae -- cula _ sae -- cu -- lorum _ a -- men
   
   et nunc et nunc et sem -- per et nunc et nunc et sem -- per
   
   et in sae -- cula _ et in sae -- cula _ sae -- cu -- lo -- rum a -- men
   
   a -- men a -- men a -- men a -- men a - - men.

}

Ibasson = \relative do {

   \autoBeamOff
   R1*14
   r2 r4 r8 re'

   %16
   dod re la re dod la r4
   R1*4
   r2 r4 r8 mi'

   %22
   red mi si mi red si r4
   R1*13
   r2 r4 r8 mi\mbreak

   %37
   red mi si mi red si r4
   R1*6
   r2 r4 r8 mi
   
   %45
   red mi si mi red si r4
   R1*7
   r2 la8 sold la mi
   
   %54
   la sold la mi r2\mbreak
   r si'8 lad si fad
   si lad si fad r fad si8. si16
   
   %57
   sol4 mi fad si
   fad4. fad8 si, r r4
   R1*2 %% fine p.9
   
   %61
   r2 r4 si'
   si8. si16 dod8 re4 dod8\noBeam si8 lad
   si4 mi,8 mi fad4. fad8

   %64
   sol mi la4. la8 sol4
   r8 fad fad fad sol sol la la16 la\mbreak  %ok fine 1mo sist. p 10
   si8 si mi, mi si'4 (si,)

   %67
   mi2 r
   R1*2
   r4 re8 mi fa sol la si
   
   %71
   do4 si8 [(la)] sol4 fa8 [mi]
   re4 la' fad! sol

   %73
   re2 r
   r8 sol4 sol8 mi mi fad4
   sol8 fad mi fad4 sol mi8\mbreak

   %76
   la4. sol8 fad4 mi8 re
   mi4. mi8 re2
   r  r4 r8 re'

   %79
   dod re la re dod la r4
   la8 la re re si si16 la sol8 sol\mbreak
   la8 la re re la2

   %82
   re, r
   r4 r8 mi'\noBeam  red mi red mi 
   red si r4 si8 si mi mi

   %85
   do do16 si la8 la si si mi mi\mbreak
   si2 mi,
   R1*3
   
   %90
   r8 si si si do do16 do re8 re\mbreak
   mi4 la mi2
   la, r
   
   %93
   R1*2
   la'4. la8 la4 do~
   do8 si la sold la4 re,
   
   %97
   mi4. mi8 fa re sol4~
   sol fa r8 mi mi mi
   fa8. fa16 sol8 sol la8. la16 re,4

   %100
   la2 re
   R1*46
   r4 r8 re' dod re la re

   %148
   dod la r4 r2
   R1
   r8 la sold la mi la sold [la]\mbreak

   %151
   mi'8 mi, r4 r2
   R1
   r4 r8 mi' red mi si mi

   %154
   red si r4 r2
   R1*9
   r4 r8 la sold la mi la
   sold [la] sold [mi] r2\mbreak

   %166
   r4 r8 si' lad si fad si
   lad fad r4 fad8 fad si si16 la?
   sol4 mi fad si

   %169
   fad2 si,
   dod1\mbreak
   fad,2 r
   
   %172
   R1*2
   r4 r8 re'' dod re la re

   %175
   dod la r4 la8 la re re16 do\mbreak
   si8 la sol sol la4 re
   la2 re,

   %178
   r2 r4 r8  mi'
   red mi si mi red si r4
   si8 si mi mi16 re? do8 do la la\mbreak
   
   %181
   si4 mi si2
   mi, r
   R1*2
   
   %185
   r4 re8 [mi] fa [sol la si]\mbreak
   do4 si8[la]sol4 fa8[mi]
   re4 la' fa? sol
   
   %188
   re1
   R
   r2 r4 r8 sol\mbreak
   
   %191
   fad sol re sol fad re r4
   re8 re sol sol16 fad mi8 re do do

   %193
   re4 (sol) re2
   sol,  r4 r8 do'
   si do sol do si sol r4\mbreak

   %196
   r2 r4 r8 re'
   dod! re la re dod la r4
   la8 la re re16 do si8 si sol sol

   %199
   la4 re la2
   re,4 r8 re' si4 r8 dod\mbreak
   re4 r8 re, si4 r8 dod

   %202
   re [fad sol la] re,4 r
   R1
   r4 r8 la' si[fad sol la]
   
   %205
   re,2 r

}

ItestoIV = \lyricmode {
   
   Lae -- ta -- tus sum  lae -- tatus _ Lae -- ta -- tus sum  lae -- tatus _
   
   Lae -- ta -- tus sum  lae -- tatus _ Lae -- ta -- tus sum  lae -- tatus _ 
   
   Stan -- tes e -- rant pe -- des no -- stri 
   
   stan -- tes e -- rant pe -- des no -- stri
   
   in a - tris tu -- is, Je -- ru -- sa -- lem
   
   Je -- ru -- salem, _ quae e -- di -- fi -- ca -- tur

   ut ci -- vi -- tas ut ci -- vi -- tas: 
   
   Cu -- jus par -- te -- ci -- pa -- tio _ e -- ius in

   id i -- psum. Il -- luc e -- nim a -- scen -- de -- runt 
   
   tri -- bus tri -- bus Do -- mi -- ni: 
   
   te -- sti -- mo -- nium _ Is -- ra -- el, ad con -- fi -- ten -- dum  
   
   no -- mini _ Do -- mini. _  qui -- a il -- ic se -- de -- runt  se --  des 
   
   in ju -- di -- cio, _ se -- des su -- per do -- mum Da -- vid,
   
   qui -- a il -- ic se -- de -- runt  se --  des 
   
   in ju -- di -- cio, _  se -- des su -- per do -- mum Da -- vid.
   
   et a -- bun -- dan -- tia _  di -- li -- gen -- ti -- bus te:
   
   Fi -- at pax in vir -- tute _ tu -- a in vir -- tute _ tu -- a; 
   
   et a -- bun -- dan -- tia _ in tur -- ribus _ tu -- is.
   
   et nunc et nunc et sem -- per, et nunc et nunc et sem - per,
   
    et nunc et nunc et sem -- per, et nunc et nunc et sem -- per,
    
    et nunc et nunc et sem -- per,
    
    et in sae -- cula _  sae -- cu -- lo -- rum

   a -- men a -- men et nunc et nunc et sem -- per, 
   
   et in sae -- cula _ sae -- cu -- lo -- rum a - - men,
   
   et nunc et nunc et sem -- per, 
   
   et in sae -- cula _ sae -- cu -- lo -- rum a - - men,
   
   a - - - - - - - - - men et nunc et nunc et sem -- per et in sae -- cula _
   
   sae -- cu -- lorum _ a - men et nunc et nunc et sem -- per
   
   et nunc et nunc et sem -- per et in sae -- cula _
   
   sae -- cu -- lorum _ a - - men a -- men a -- men  
   
   a -- men a - men a - men.
   
}

Ibcn = \relative do {

   re'8 re, r re' dod re la re
   dod re la4 r2
   r r8 la sold la

   %4
   mi la sold la mi fad sold mi
   fad4 r8 sold la4 r8 la
   fad4 r8 sold la dod, re mi\mbreak

   %7
   la,8 la' sold la mi la sold la
   mi la sold la si4 r8 dod
   re4 r8 re, si4 r8 dod

   %10
   re fad sol? la re,4 r8 re'
   dod re la re dod re la re
   si mi dod la si fad sol la\mbreak

   %13
   re,4 r8 re re'4 r8 re,
   re'4 r8 re, re'4 r8 re,
   fad re si dod re4 r8 re'\tu

   %16
   dod re la re dod la r la\solo
   sold la mi la sold la mi[dod]
   si\p la re[mi] dod la r la'\f\mbreak

   %19
   sold8 la mi la sold la mi [dod\p]
   si la re[mi] fad mi16 re dod8 si
   la la'16 sold la8 la, mi'4 r8 mi'\tu

   %22
   red mi si [mi] red si16 dod red8 si\p
   mi4 r8 mi, si' si,16 dod red8 si
   mi,4 r r8 si''16 la sold8 mi\mbreak

   %25
   la, la' la, la' mi4 r
   r2 r8 mi16 fad sold8[mi]
   la4 r8 la, mi mi'16 fad sold8 la

   %28
   fad fad' mi mi, re [re' dod la16 sold]
   fad8 fad' mi mi, re re' dod re
   mi mi, mi' re dod la r4\mbreak

   %31
   r2 r8 mi mi' mi,
   re re, r re' mi mi, r8 mi'
   fad fad, r fad' sold sold, r sold'

   %34
   la la, r sold'fad mi re dod
   fad mi re4 dod r8 si
   la la'16 sold la8 la, mi'4 r8 mi'\tu \mbreak

   %37
   red mi si mi red si16 dod red8 si
   mi\solo \p mi, mi' mi, si' si, r4
   r2 r8 si'16 dod red8 si

   %40
   dod dod, si si' la4 sol?8 mi16 red
   dod8 dod' si[si,] la la' sold[la]
   red, si16 dod red8 si mi fad sold la\mbreak

   %43
   red, la16 dod red8 la mi' fad sold la
   si dod la si mi,4 r8 mi'\tu
   red mi si [mi] red[si] mi re?

   %46
   dod\solo\p si la si16 dod re8 re, r re'~
   re dod si dod16 re mi8 mi, r mi'~
   mi re dod re16 mi fad8 fad, r fad\mbreak

   %49
   si  la sold fad mi sold la[dod]
   re si mi mi, la, la'16 re dod8 la
   fad4 r8 sol la la, r la'

   %52
   fad4 r8 sold la dod,16 re mi8 mi,
   la4 r la'8\tu sold la mi
   la sold la mi r2\mbreak

   %55
   r si'8 lad si fad
   si lad si fad r fad si8. si16
   sol4 mi fad si

   %58
   fad fad, si r8 si'\solo
   lad si fad si lad si fad si
   sold dod lad fad si re, mi fad\mbreak  %% fine p. 6

   %61
   sol?4 mi8 fad si,4 si'\tu
   si8.-! si16-! dod8 -! re4-! dod8-!\noBeam si8-! lad-!
   si4 mi,8 mi fad4. fad8

   %64
   sol mi la4. la8 sol4
   r8 fad fad fad sol sol la la16 la\mbreak  %ok fine 1mo sist. p 10
   si8 si mi, mi si'4 si,

   %67
   mi4\clef violin \key re\major mi'8 fad sol la si dod!
   <<
      {
         re4. do16 si la8 si do re
         mi [fad]
      }\\{
         r4 re,8 mi fad sol la si
         do?4
      }
   >> \clef  tenor \key re\major sol,8 la si do re mi

   %70
   fa4\clef bass \key re\major re,8 mi fa sol la si\mbreak
   do4 si8 la sol4 fa8 mi
   re4 la' fad! sol

   %73
   re2 re'
   sol,4~sol8-! sol-! mi-! mi-! fad4
   sol8-! fad-! mi-!\noBeam fad4-! sol-! mi8-!\mbreak

   %76
   la4.-! sol8-! fad4-! mi8-! re-!
   mi4. mi8 re2
   r  r8 re'\noBeam dod re\tu

   %79
   dod re la re dod la r4
   la8 la re re si4 sol\mbreak
   la8 la re[re] la2

   %82
   re, r
   \clef tenor \key re\major r8  mi'\noBeam  red \clef bass \key re\major mi red mi si mi
   red si r4 si8[si] mi mi

   %85
   do do16 si la8 la si si mi mi\mbreak
   si2 mi,4 \clef violin\key re\major mi'-!
   sol4.-! sol8-!<<
      {
         s4 si
         
         %88
         do?4. do8 do8 si la si
         do?
      }\\{
         sol8^! fad^! mi red
         mi fad16 sol s4la8 sold la sold
         la[ \clef tenor\key re\major la, la la]
      }
   >> si si16 si do8 do
   re[\clef bass\key re\major si,] si si do do16 do re8 re\mbreak

   %91 in linea con alto
   mi4 la mi2
   la,8[la'16 si do8 la] mi la r la
   sold la mi la sold la mi la

   %94
   fad si sold mi la do, re mi
   la,8 la'4 la8 la4-! do-!~
   do8-! si la-![sold] la4 re,

   %97
   mi4. mi8 fa re sol4~
   sol fa r8 mi mi mi
   fa8. fa16 sol8 sol la4 re,

   %100
   la2 re,8[re'16 mi fa8 re]\mbreak
   si4 dod! re8 re, r re'
   si4 r8 dod re fa  sol la

   %103
   re,\p mi fa re mi4 fad!
   sol8 [sol, sol' si,16 do] re8 re, re' do16 si
   la8 si do re mi fad sol sol,

   %106
   re'4 r8 re [sol fad] mi[re]
   do si la si16 do re8[re'16 do si8 sol]
   dod,!4 r8 dod re mi fad re

   %109
   mi4 fad sol8 sol, r sol'
   mi4 fad sol8 sol,16 la si8 do\mbreak
   re mi fad re sol fad mi fad16 sol

   %112
   la4 r r2
   re,8 re16 mi fad8 re la' la, la' sol16 fad
   mi8 fad sol mi fad4. mi16 red

   %115
   mi8 fad sol la si dod re dod
   si fad si si, mi4 fad
   sol8 sol, sol' fad mi4 r8 fad

   %118
   sol4 fad8 mi re4 r8 mi
   fad fad, si dod re4. mi8
   fad mi fad fad, si si'16\f  dod re8 si\mbreak

   %121 fine p 15
   sold4 r8 lad si si, r si'
   sold4 r8 lad si re, mi fad
   sold fad mid dod fad la? si dod

   %124
   fad, sold la fad si, dod red si
   mi fad sold? mi la,16 la' sold! fad mi re dod si\mbreak
   la8 la' sold la si, si' la si

   %127
   dod, dod' si dod re, re' mi re16 dod
   si8 si, si' [dod] re dod16 si la8 dod
   red,?4 r8 red\f mi fad sold mi

   %130
   fad4 sold la8\p si dod la\mbreak
   re dod re si mi mi, r mi'
   la, la, r4 r2

   %133
   r8 re la' sold la fad re mi
   la, la'16\f si dod8 la  si4 r8 dod
   re re, r re' si4 dod\mbreak

   %136
   re8 re,16\p mi fad8 re sol fad sol mi
   la la, r la' re, re, r4
   R1

   %139
   r2 r8 la'' fad re
   la'4 la, re8 re'\f dod re\mbreak
   re,4 r8 re'dod re la re

   %142
   dod re la4 si r8 dod
   re re, r re' si4 dod
   re\p r8 re, re'4 r8 re,

   %145
   re'4 r8 re, re'4 r8 re,\mbreak
   re'4 dod8 re si mi si dod
   re re, r8 re'\tu dod re la re

   %148
   dod la r la sold la mi la
   sold la mi dod si la re mi
   dod la'sold la mi la sold la\mbreak

   %151
   mi'8 mi,16 re dod8 la si[la] re mi
   fad mi16 re dod8 si la la'16 sold la8 la,
   mi' mi, r mi''\tu red mi si mi

   %154
   red si16 dod red8 si  mi4 r8 mi,\p
   si' si, r4 r2
   r8 si'16 la sold8 mi la, la' la, la'

   %157
   mi mi, r4 r2
   r8 mi'16 fad sold8 mi la, la' la, la'
   mi, mi'16 fad sold8 la fad fad' mi mi,

   %160
   re [re' dod la16 sold] fad8 fad' mi mi,\mbreak
   re' re, r red mi4. dod8
   si re? mi mi, la[la'16\f si dod8 la]

   %163
   fad4 r8 sold la4 r
   r r8 la\tu sold la mi la
   sold la sold mi r2\mbreak

   %166
   r4 r8 si' lad si fad[si]
   lad fad r4 fad8 fad si si16 la?
   sol4 mi fad si

   %169
   fad2 si,
   dod1\mbreak
   fad,8[fad'16\solo sold la8 fad] red4 r8 mid

   %172
   fad fad, r fad' red4r8 mid
   fad la, si dod fad,2
   r8 re'' dod re\noBeam\tu dod re la re

   %175
   dod la r4 la8 la re re16 do\mbreak
   si8 la sol4 la re
   la2 re,

   %178
   r2 r8 mi'\noBeam red[mi]
   red mi si mi red si r4
   si8 si mi mi16 re? do8 do la4\mbreak

   %181
   si4 mi si2
   mi,4 \clef violin \key re\major mi'8 fad sol la si dod!
   <<
      {
         re4. do16 si la8 si do re

         %184
         mi [fad]
      }\\{
         r4 re,8 mi fad sol la si
         do4
      }
   >>\clef tenor\key re\major sol,8 la si do re mi
   fa4\clef bass \key re\major re,8 mi fa sol la si
   do4 si8 la sol4 fa8 mi

   %187
   re4 la' fa? sol
   re2~re8 re, re' dod
   si8\solo sol r4 r2

   %190
   r8 sol' do, re sol,4 r8 sol'\tu \mbreak
   fad sol re sol fad re r4
   re8 re sol sol16 fad mi8 re do4

   %193
   re sol re2
   sol,  r8 do' si[ do]
   si do sol do si sol r4\mbreak

   %196
   r2 r8 re' dod![re]\tu
   dod re la re dod la r4
   la8 la re re16 do si8 si sol4

   %199
   la re la2
   re,4 r8 re' si4 r8 dod\mbreak
   re4 r8 re, si4 r8 dod

   %202
   re fad sol la re,4 r8 re'\solo
   dod re la re dod re la re
   si mi dod la \tu si fad sol la

   %205
   re,2 r

}

Ibfn = \figures {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s2 <6>
   s1
   s2 s4 <6>
   <_+>2 <_+>
   <7>8 <6> s4 s2
   <7>8 <6> s4 s s8 <_+>
   s2 <_+>
   <_+> <7>8 <6!> s4
   <9>8 <8> s4 <7>8 <6> s4
   s1*2
   <6\\>4 <6 5-> <5> s
   s1*2
   s4 \bassFigureExtendersOn <6>8 <6> s2
   s1\bassFigureExtendersOff
   s4 <_+> s <_+>
   <6\\> <6>8 <_+> s2
   s4 <_+> s <_+>
   <6\\> <6>8 <_+> s4 <6\\>
   s2 <_+>
   s1*2
   s2 s8 <5 _+> <6> <_+>
   s2 <6 4>8 <5 _+> s4
   s1
   s2 s8 <_+> s4
   <6> <6> <6> <6>
   <6> <6> s2
   s1
   s2 s8 <_+> s4
   <5> s8 <6> <5 _+>2
   <5> <6>
   s <6>8 <6> <6> <6>
   <6> <6> <7> <6> <7> <6> s <6\\>
   s1
   s4 <_+> s2
   s <6 4>8 <5 _+> s4
   s2 s8 <_+> s4
   <6> <6> <6> <_+>
   <6> <6> <6> <6>8 <5>
   <6>4\bassFigureExtendersOn <6> <_+>2
   <6> <_+>
   <6>8 <6> s <_+> s2
   
   %45
   s2 s4 <_+>
   <6>2 <7>8 <6> s <5 3>
   <6>2 <7>8 <6 _+> s <_+>16 s
   <6 _+>8 <6 _+>\bassFigureExtendersOff <6>4 <7>8 <6> s8 <5>\mbreak
   <6\\>2 <_+>
   <6>4 <_+> s2
   <7>8 <6> s4 s2
   <7>8 <6> s4 s <_+>
   s2 s4 s8 <_+>
   s4 s8 <_+> s2
   s2 <5 _!>8 <6> s <_+>
   s4 s8 <_+> s <_+> s4
   <7>8 <6> <5 _+>4 <7 _+> s
   <5 4> <7 _+> s2
   s1
   \bassFigureExtendersOn <6\\>8 <6\\> <_!> <7> s <6> <5> <_+>
   
   %61 inizio p. 10
   \bassFigureExtendersOff s1*2
   <5 3>4 <5> <9 3>8 <8>8 <7> <6\\>
   <6> <6\\> <5>4. <6 4\+ 2>8 <6>4
   s8 <5> <6\\>4 <6> <5>8 <6>
   <7 _+>2 <4>4 <_+>
   s1*2
   s4 <5> <6> <_->8 <3>
   <3>4 <_->4 <6> <_->
   <5> <6> <5> \bassFigureExtendersOn <6>8 <6>
   \bassFigureExtendersOff <_->4 <5 _-> <6 5->2
   <5 3>4 <6 4> <5 4> <5 3>
   s1*3
   <7>4 <6> s2
   s1*2
   
   %80
   s2 <6>\mbreak  %% Fine p 11
   <7>2 <4>4 <3>
   s1
   s8 <_-> <6>4<6> <_+>
   s2 <_+>
   <7>8 <6> s4 <7 _+>2
   <4+>1
   s1*2
   s8 <5> s4 <6\\>\bassFigureExtendersOn <6>8 <6>
   s8 <7> <6\\>4<7> <5 _->\bassFigureExtendersOff
   <7+> <_-> <4+>2
   <_->4 <_-> <_+>8 <_-> s <_->
   <6> <_-> <_+> <_-> s <_-> <_+> <_->
   \bassFigureExtendersOn <6\\>8 <6\\> <5-> <_+> <_-> s <6> <_+>
   \bassFigureExtendersOff s1
   s2 <5>4 <_->
   <9 3>8 <8> <7> <6\\> <6>4 s
   <6 4\+ 2> <6> s8 <5> <6\\>4
   <6> <_-> <7 _+> <6 4>
   
   %100
   s1   %%% fine p. 13
   <6>8 <5> s4 <_-> s8 <_->
   <7 5+> <6> s  <6> <_-> s <_-> <_+>
   s2 <7>8 <6> s4
   <9 4>8 <8 3> s4 <4>8 <3> s4
   <_-> <6> <5>2
   <4>4 s8 <3>\bassFigureExtendersOn <5> <5>16 s <5>8 <5>16 s
   <5>8 <6> <5 _->8 s <5 _+>4 <6>
   <7 5>4 <7 5>8 <7 5>16 s <5 4>4 <6>
   <7>8 <6-> <6>4 s2
   <7>8 <6-> <6->4 s <6>
   s1
   <_+>
   s2 <4>4 <3>8 s
   <6 3>2 <9 _+>8 <8> <8> <8>
   <9 3>4 <6> <5> <6>8 <6\\>
   s8 <_+> s4 <6- 5> <5- 3>8 s 
   <9 3>4 <8>8 <8>
   <5 3>4 s8 <6 4>16 s
   <6 4 2+>4 <4 2+> <6> s8 <6 _->
   <7 _+> 4 <9 3> <6>4 <6>8 <_-> 
   <6 4>16 s <6 _+> s <5 _+>4 s8 <_+> s4 %% fine p. 15
   
   %121
   <7>8 <6> s <6 5> s2
   \bassFigureExtendersOff <7>8 <6> s <6> s <6> <6> <_+>
   <5 3>4 <6 5> s8 <6> <6> <_+>
   s4 <6>8 <5 _+> s2
   <_+> s8 <_+> <6 4>4
   s2 <9>8 <8> s4
   \bassFigureExtendersOn <7>8 <6> s4 <7>8 <7> <5 _+>16 s <7 5>16 s 
   <5 3>1
   \bassFigureExtendersOff <7 5>4 s8 <7 5> <_+>2
   <7>8 <6> s4 s2 
   
   %131
   s4 s8 <5> <_+>2
   s1
   s4 s8 <5> s4 <6>8 <_+>
   s8 <7> s4 <7>8 <6-> s4
   s2 <7>8 <6> s4
   s2 <5>4 s8 <5>
   s1*2
   s2 s4 <6>
   <4>4 <3> s2  %% fine p.17
   
   %141
   s2 <6>
   s <7>8 <6> s4
   s4 s8 <5> <7> <6> s4
   s1*2
   s4 <6>8 s \bassFigureExtendersOn <6> <6>16 s <6>8 <6>
   s1
   s2 <6>4 <_+>
   s <_+>8 <6> <6\\>4 <6>8 <_+>
   s2 <_+>4 s
   <_+>4 <6> <6\\> <6>8 <_+>
   <5>4 <6>8 <6\\> s2
   <_+>4 s s <_+>
   s8 <_+> s <_+> s2
   <6+ 4>8 <5 _+> s4 s2
   s8 <_+> <6>4 s2
   <6 4>8 <5 _+> s4 s2
   s8 <_+> s4 s2
   <6 4>8 <5 _+> s4 \bassFigureExtendersOff <6> <6>
   <6>8 <6> <5>4 <6> <6>
   s2 <_+>4. <6>8
   <7> <5> <_+> s s2
   <7>8 <6> s4 s2
   s2 s4 <_+>
   s4 s8 <_+> s2
   s4 s8 <_->\bassFigureExtendersOn <6> <6> <_+>4
   \bassFigureExtendersOff s8 <_+> s4 <_+> <_->
   <7>8 <6> s4 <7 _+>2
   <6 4>4 <5-><7 3> <6>8 <5>
   <7 _+>4 <6 4> <5 4> <_+>
   s4 <6> <7>8 <6> s <6 _+>
   s2 <7>8 <6> s <6 5 _+>
   s8 <6> <6\\> <_+> s2
   s8 <5> <6> s s2
   s1
   <6>2 <7>
   <4>4 <3> s2
   s s8 <_-> <6> <_->
   <6>4 <_+> s8 <_+> s4
   <_+> s <7>8 <6> <6> <5>
   <7+>2 <4>4 <_+>
   s1*2
   s4 <3>8 <3> <3> <3> s <3>
   <3>4 <_-> s2
   <5>4 <6> <5>\bassFigureExtendersOn <6>8 <6>
   \bassFigureExtendersOff <_->4 <_-> <6 5> s
   <5 3>4 <6 4>8 s \bassFigureExtendersOn <5 4>8 <5 3> s4
   s1
   s4 <6> s2\bassFigureExtendersOff
   <6> <6>
   s <6 ->
   <7-> <4>4 <3>
   s2 s8 <5 3> <6> <5 _->
   \bassFigureExtendersOn <6> <6> s4 s2
   s s8 <5 _+> <6>4\bassFigureExtendersOff
   s2 <6>
   s <7>8 <6> s4
   <7>2 <4>4 <3>
   s2 <7>8 <6> s <6 5>
   s2 <7>8 <6> s <6 5>
   <9> <6> <6>4 s2
   s1
   \bassFigureExtendersOn <6\\>8 <6\\> <6>4\bassFigureExtendersOff <5>8 <6> <6>4

}


forma = {

   \time 4/4
   \key re\major
   \tempo 2 = 50
   s1*205
   \bar "|."

}

IobI = {
   <<\IobIn \forma>>

}

IobII = {
   <<\IobIIn \forma>>

}

IvlI = {
   <<\IvlIn \forma>>

}

IvlII = {
   <<\IvlIIn \forma>>

}

Ivla = {
   \clef alto
   <<\Ivlan \forma>>

}

Isoprano = {
   \new Voice = "laetatus1"
   <<\Isopranon \forma>>
}

Ialto = {
   \new Voice = "laetatus2"
   <<\Ialton \forma>>
}

Itenore = {
   \new Voice = "laetatus3"
   <<\Itenoren \forma>>
}

Ibasso = {
   \clef bass
   \new Voice = "laetatus4"
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
#(set-global-staff-size 16.5)


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
        title = \markup "Laetatus sum a 4 voci [ZWV 88]"
        composer = \markup {"J. D. Zelenka (1660-1725)"}
    }

    \markup \huge {Laetatus sum - Allegro}

    \score {
        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup {"Oboe 1."}
                    \set Staff.shortInstrumentName = "ob1"
                    \IobI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup {"Oboe 2."}
                    \set Staff.shortInstrumentName = "ob2"
                    \IobII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup {"Violino 1."}
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup {"Violino 2."}
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup {"Viola"}
                    \set Staff.shortInstrumentName = "vla"
                    \Ivla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r2 ^\markup\center-align "Soprano" r4 r8 la' la' la'}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop"
                    \Isoprano \global
                    \new Lyrics \lyricsto "laetatus1" \ItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 4/4 r2 r8^\markup\center-align "Contralto" re' la'4.}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt"
                    \Ialto \global
                    \new Lyrics \lyricsto "laetatus2" \ItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \time 4/4 r2 ^\markup\center-align"Tenore" r8 re' dod' re'}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten"
                    \Itenore \global
                    \new Lyrics \lyricsto "laetatus3" \ItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas"
                    \Ibasso \global
                    \new Lyrics \lyricsto "laetatus4" \ItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc"
                \Ibc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

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