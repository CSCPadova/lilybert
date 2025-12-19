\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

vlIn = \relative do'' {

    la'4 mi2~mi16 mi fad sold
    la4 \appoggiatura si8 la2 si8(dod)
    si4 \appoggiatura dod8 si2 dod8(re)

    %4
    dod(si) la2~la16 la si dod
    si4\appoggiatura dod8 si2 dod8(re)
    dod(si) la2~la16 si dod re

    %7
    mi4\staccatissimo re\staccatissimo dod16(si la4.)\mbreak
    \appoggiatura {si16[dod]} re2\staccatissimo\appoggiatura {la16[si]} dod2\staccatissimo
    \appoggiatura dod16 si4\staccatissimo mi,\p dod16(si la4.)

    %10
    \appoggiatura {si16[dod]} re2\staccatissimo \appoggiatura {la16[si]} dod2\staccatissimo
    \appoggiatura dod8 si2~si16 la\f si dod re mi fad sold
    la2 la\tr

    %13
    la la\tr
    la la\tr
    la~la16 si, dod red mi fad sold la\mbreak

    %16
    si4\staccatissimo la\staccatissimo sold16(fad mi4.)
    \appoggiatura {red16[mi]} fad2\staccatissimo \appoggiatura mi8 red2\tr
    mi4 si'\p sold16 (fad mi4.)

    %19
    \appoggiatura {red16[mi]} fad2\staccatissimo \appoggiatura mi8 red2\tr
    mi,8\f mi' red mi red mi red mi
    mi,\p mi' red mi red mi red mi

    %22
    mi,\f mi' red mi red mi red mi
    mi,2~mi8\tr fad16 sold la si dod re?\mbreak
    mi4.\tr re16 dod si4 la

    %25
    sold16(fad mi4.) fad4.\tr mi8
    mi8\p mi'-. red-. mi-. red mi red mi
    mi,\f mi' red mi red mi red mi

    %28
    mi,\p mi' red mi red mi red mi
    red\f si dod red mi fad sold la
    si4. la16 sold fad8 mi red? dod\mbreak

    %31
    si4.\tr la16 sold fad8 mi red dod
    si4 mi' fad, red'
    mi4. red16 dod si8 la sold fad

    %34
    mi4. mi'8 \appoggiatura sold fad4.\tr mi8
    mi2 r
    la,4\p mi2 sold4

    %37
    la la2(dod4)
    si si2(re4)
    dod8(si) la2 si8(dod)\mbreak

    %40
    si4 \appoggiatura dod8 si2 dod8 re
    dod\f la' sold la sold la sold la
    mi4.\p re8 dod16(si la4.)

    %43
    \appoggiatura {si16[dod]} re2\staccatissimo dod\staccatissimo
    \appoggiatura dod16 si4 mi dod16(si la4.)
    \appoggiatura {si16[dod]} re2\staccatissimo dod\staccatissimo

    %46
    si8\f mi red mi red mi red mi
    si4\p dod2(red4)\mbreak %% fine p. 5
    mi,8 mi' red mi red mi red mi

    %49
    dod4 red2 \parentSlur (mi4)
    mi,8\f mi' red mi red mi red mi
    fad,4\mp la red, fad

    %52
    si, red fad la
    fad la red, fad
    fad'2\fermata\f_\tenuto r2

    %55
    mi4.\tr\p red16 dod si4 la
    sold16(si mi4.) fad,4 red'\mbreak
    mi,8\f mi'-. red-. mi-. red mi red mi

    %58
    mi,4\p fad sold fad
    mi8\f mi'-. red-. mi-. red mi red mi
    mi,2\p fad

    %61
    mi8\ff mi'-. red-. mi-. red mi red mi
    mi,2\staccatissimo \once\stemUp <sold' si, mi,>\f\staccatissimo
    mi4.\p\tr red16 dod si4. la'8

    %64
    sold(fad) mi4 \appoggiatura {red?16[mi]} fad2\mbreak
    mi4.\tr red16 dod si4 la
    sold4. mi8 fad4 red

    %67
    mi4\mf fad8 sold la si dod red
    mi\ff mi mi mi mi  mi mi mi
    \once\stemUp <sold si, mi,>2 r4 mi\mp

    %70
    dod4. sold8 la4 si
    mi,8\f mi' red mi red mi red mi
    mi,\p mi' red mi red mi red mi

    %73
    mi,\f mi' red mi red mi red mi\mbreak
    red si dod red mi fad sold la
    si4 la8 sold fad mi red dod

    %76
    si4.\tr la16 sold fad8 mi red dod
    si4 mi' fad, red'
    mi4.\tr red16 dod si8 la sold fad

    %79
    mi16(si' mi4.) si,4 red'
    mi,8\p mi' red mi red\f mi red mi
    sold,4 mi'2\p(dod4)

    %82
    lad \appoggiatura si8 lad2 fad'16(lad,8.)\mbreak
    si4.\tr(dod8) dod4.\tr si16 dod
    re?8\f si' lad si lad si lad si

    %85
    si,4\staccatissimo\mp re\staccatissimo sold,\staccatissimo si\staccatissimo
    mi,8-. mi-. sold-. sold-. si si re re
    si4\staccatissimo re\staccatissimo sold,\staccatissimo si\staccatissimo

    %88
    re2\f\fermata r
    <la' dod, mi, la,>4. sold16\mp fad mi4\staccatissimo re\staccatissimo
    dod16(mi la4.) si,4\staccatissimo sold'\staccatissimo

    %91
    la,8\f la' sold la sold la sold la\mbreak
    mi,4\mp la' la, la'
    r la\staccatissimo la,\staccatissimo la'\staccatissimo

    %94
    r la la, la'
    la,8\ff la la la la la la la
    \once\stemUp <sold' si, mi,>2\staccatissimo si,4\p\staccatissimo re\staccatissimo

    %97
    dod16(mi la4.) si,4\staccatissimo sold'\staccatissimo
    la8 la, si dod re mi fad sold
    la,\f la' sold la sold la sold la

    %100
    la,,4\p si dod si\mbreak
    la'8\ff la' sold la sold la sold la
    \once\stemUp <sold si, mi,>2 r4 si,

    %103
    dod16(mi la4.) si,4\staccatissimo_\markup {[\musicglyph #"p"]}  sold'\staccatissimo
    la,,8_\markup {[\musicglyph #"f"]} la' sold la sold la sold la
    si4\p dod2 red4

    %106
    mi,8\f mi' red mi red mi red mi
    dod4\p red2 mi4
    sold,2\fermata\f\tenuto r

    %109
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}
    <la' dod, mi, la,>4.\mf sold16 fad mi4 re
    dod16(si la4.) si2\tr\mbreak

    %112
    la8\f la' sold la sold la sold la
    dod,\mf la si dod re mi fad sold
    la4. la,8 la4 mi'

    %115
    la,8\ff la' sold la sold la sold la
    <re, mi,>2 r4 \once\stemUp <sold re mi,>
    <la dod, mi, la,> la,4 mi' mi,

    %118
    la'4\f mi2~mi16 mi fad sold
    la4 \appoggiatura si8 la2 si8\parentSlur (dod)
    si4 \appoggiatura dod8 si2 dod8\parentSlur(re)

    %121
    dod\parentSlur (si) la2~la16 la si dod
    si4\appoggiatura dod8 si2 dod8\parentSlur (re)
    dod\parentSlur (si) la2~la16 si dod re

    %124
    mi4\staccatissimo re\staccatissimo dod16(si la4.)\mbreak
    \appoggiatura {si16[dod]} re2-\parenthesize\staccatissimo\appoggiatura {la16[si]} dod2-\parenthesize \staccatissimo
    si4\p mi, dod16(si la4.)

    %127
    \appoggiatura {si16[dod]} re2\staccatissimo \appoggiatura {la16[si]} dod2\staccatissimo
    \appoggiatura dod8 si2 r
    la8\f  la' sold la sold la sold la

    %130
    la,\p  la' sold la sold la sold la
    la,\f  la' sold la sold la sold la\mbreak
    la,2\tr~la8 si16 dod re mi fad sold

    %133
    la4.\tr sold16 fad mi4 re
    dod8 si la4 si4.\tr la8
    la\p  la' sold la sold la sold la

    %136
    la,\f  la' sold la sold la sold la
    la,\p  la' sold la sold la sold la
    sold\f mi fad sold la si dod re

    %139
    mi4 re8 dod si la sold fad
    mi4 re8 dod si la sold fad\mbreak
    mi4 la' si, sold'

    %142
    la4.\tr sold16 fad mi8 re dod si
    la4 dod, re mi
    la,2_\fermata^\markup\center-align" Fine" r

    %145
    dod'4\p dod2\tr si8 dod  %%% OK
    fad4 mi8 re dod4 si
    la8\f fad' mid fad mid fad mid fad

    %148
    fad4\p fad,2 mi'?4
    re,8\f re' dod re dod re dod red
    mi4\p mi,2 re'?4\mbreak

    %151
    dod,8\f dod' si dod si dod si dod
    si,4\staccatissimo si'\staccatissimo mid,\staccatissimo sold\staccatissimo
    dod,8 dod mid mid sold sold si si

    %154
    sold4\staccatissimo si\staccatissimo mid,\staccatissimo sold\staccatissimo
    sold2\fermata r
    fad'4\p mi8 re dod16(si lad4.)

    %157
    sid8\f fad' mid fad mid fad mid fad
    dod,4\p dod' la fad
    si8(sold) la(fad) sold[(mid)] fad16 sold la si\mbreak

    %160
    dod16(la8.) si16([sold8.)] la4\staccatissimo fad'\staccatissimo
    la,16(sold fad4.) sold4 mid'
    fad,8 fad' mi? re dod si la sold

    %163
    la16(dod fad4.) sold,4.\tr fad8
    fad2 r
    \appoggiatura {red'16\p[mi]} fad4 mi2.

    %166
    red8(sid) \appoggiatura sid dod2.
    la4 sold2 red'4
    mi8 dod \appoggiatura dod red?2.

    %169
    dod4 dod2\tr sid8 dod\mbreak
    dod4 dod2\tr sid8 dod
    dod4 dod2\tr sid8 dod

    %172
    sid16(red8.)sold,4 sid16(sold8.) sid16[(red8.)]
    sold2_\markup {[\musicglyph #"f"]}\staccatissimo la,16(fad8.) la16[(dod8.)]
    fad2-\parenthesize \staccatissimo  sold,16(mi8.) sold16[(si8.)]

    %175
    mi2-\parenthesize \staccatissimo  fad,16(red8.) fad16[(lad8.)]
    red4 fad8(mid) fad4\staccatissimo fad\staccatissimo
    fad2\fermata r

    %178
    mi4\p red16(si8.) dod4\staccatissimo lad\staccatissimo\mbreak %% fine p. 12
    sid8 sold' fad sold sold, sold' fad sold
    dod,\f sold' fad sold sold, sold' fad sold

    %181
    fad4\p fad, sold dod
    fad,2 sold
    la\fermata r

    %184
    r sold4 \staccatissimo sid \staccatissimo
    dod \staccatissimo mi,\staccatissimo fad \staccatissimo sold\staccatissimo
    dod,2 r

    %187
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}
    la''4\f mi2~mi16 mi fad sold
    la4 \appoggiatura si8 la2 si8(dod)

    %190
    si4 \appoggiatura dod8 si2 dod8(re)
    dod(si) la2~la16 la si dod
    si4\appoggiatura dod8 si2 dod8(re)

    %193
    dod(si) la2~la16 si dod re
    mi4\staccatissimo re\staccatissimo dod16(si la4.)\mbreak
    \appoggiatura {si16[dod]} re2\staccatissimo\appoggiatura {la16[si]} dod2\staccatissimo

    %196
    \appoggiatura dod16 si4\staccatissimo mi, dod16\p(si la4.)
    \appoggiatura {si16[dod]} re2\staccatissimo \appoggiatura {la16[si]} dod2\staccatissimo
    \appoggiatura dod8 si2~si16 la\f si dod re mi fad sold

    %199
    la2 la\tr
    la la\tr
    la la\tr

    %202
    la~la16 si, dod red mi fad sold la\mbreak
    si4\staccatissimo la\staccatissimo sold16(fad mi4.)
    \appoggiatura {red16[mi]} fad2\staccatissimo \appoggiatura mi8 red2\tr

    %204
    si4\p la sold16(fad mi4.)
    \appoggiatura {red16[mi]} fad2\staccatissimo \appoggiatura mi8 red2\tr
    mi8\f mi' red mi red mi red mi

    %207
    mi,\p mi' red mi red mi red mi
    mi,\f mi' red mi red mi red mi
    mi,2~mi8\tr fad16 sold la si dod red

    %210
    mi4 sold, la si
    dod\p sold la si
    dod\f sold la si

    %214
    mi,2 r

}

vlIIn = \relative do'' {

    la'4 mi2~mi16 mi fad sold
    la4 \appoggiatura si8 la2 si8(dod)
    si4 \appoggiatura dod8 si2 dod8(re)

    %4
    dod(si) la2~la16 la si dod
    si4\appoggiatura dod8 si2 dod8(re)
    dod(si) la2~la16 si dod re

    %7
    mi4\staccatissimo re\staccatissimo dod16(si la4.)\mbreak
    \appoggiatura {si16[dod]} re2\staccatissimo\appoggiatura {la16[si]} dod2\staccatissimo
    \appoggiatura dod16 si4\staccatissimo mi,\p dod16(si la4.)

    %10
    \appoggiatura {si16[dod]} re2\staccatissimo \appoggiatura {la16[si]} dod2\staccatissimo
    \appoggiatura dod8 si2~si16 la\f si dod re mi fad sold
    la2 la\tr

    %13
    la la\tr
    la la\tr
    la~la16 si, dod red mi fad sold la\mbreak

    %16
    si4\staccatissimo la\staccatissimo sold16(fad mi4.)
    \appoggiatura {red16[mi]} fad2\staccatissimo \appoggiatura mi8 red2\tr
    mi4 si'\p sold16 (fad mi4.)

    %19
    \appoggiatura {red16[mi]} fad2\staccatissimo \appoggiatura mi8 red2\tr
    mi,8\f mi' red mi red mi red mi
    mi,\p mi' red mi red mi red mi

    %22
    mi,\f mi' red mi red mi red mi
    mi,2~mi8\tr fad16 sold la si dod re?\mbreak
    mi4.\tr re16 dod si4 la

    %25
    sold16(fad mi4.) fad4.\tr mi8
    mi8\p mi'-. red-. mi-. red mi red mi
    mi,\f mi' red mi red mi red mi

    %28
    mi,\p mi' red mi red mi red mi
    red\f si dod red mi fad sold la
    si4. la16 sold fad8 mi red? dod\mbreak

    %31
    si4.\tr la16 sold fad8 mi red dod
    si4 mi' fad, red'
    mi4. red16 dod si8 la sold fad

    %34
    mi4. mi'8 \appoggiatura sold fad4.\tr mi8
    mi2 r
    la,4\p mi2 sold4

    %37
    la la2(dod4)
    si si2(re4)
    dod8(si) la2 si8(dod)\mbreak

    %40
    si4 \appoggiatura dod8 si2 dod8 re
    dod\f la' sold la sold la sold la
    mi4.\p re8 dod16(si la4.)

    %43
    \appoggiatura {si16[dod]} re2\staccatissimo dod\staccatissimo
    \appoggiatura dod16 si4 mi dod16(si la4.)
    \appoggiatura {si16[dod]} re2\staccatissimo dod\staccatissimo

    %46
    si8\f mi red mi red mi red mi
    sold,4\p la la la
    sold si si si

    %49
    la la la si
    si8\f mi red mi red mi red mi
    fad,4\mp la red, fad

    %52
    si, red fad la
    fad la red, fad
    red'2\fermata\f_\tenuto r2

    %55
    mi4.\tr\p red16 dod si4 la
    sold16(si mi4.) fad,4 red'
    mi,2 r4 si'

    %58
    mi8-.\f red-. mi-. red mi red mi red
    mi4.\p mi, 8 mi4 si'
    mi8-.\f red-. mi-. red mi red mi red

    %61
    mi4\ff mi, mi2
    si'\staccatissimo \once\stemUp <sold' si, mi,>\f\staccatissimo
    mi4.\p\tr red16 dod si4. la'8

    %64
    sold(fad) mi4 \appoggiatura {red?16[mi]} fad2\mbreak
    mi4.\tr red16 dod si4 la
    sold4. mi8 fad4 red

    %67
    mi4\mf fad8 sold la si dod si
    si\ff si si si si si si si
    \once\stemUp <sold' si, mi,>2 r4 mi\mp

    %70
    dod4. sold8 la4 si
    mi,8\f mi' red mi red mi red mi
    mi,\p mi' red mi red mi red mi

    %73
    mi,\f mi' red mi red mi red mi\mbreak
    red si dod red mi fad sold la
    si4 la8 sold fad mi red dod

    %76
    si4.\tr la16 sold fad8 mi red dod
    si4 mi' fad, red'
    mi4.\tr red16 dod si8 la sold fad

    %79
    mi16(si' mi4.) si,4 red'
    mi,8\p mi' red mi red\f mi red mi
    sold,4 mi'2\p(dod4)

    %82
    lad \appoggiatura si8 lad2 fad'16(lad,8.)\mbreak
    si4.\tr(dod8) dod4.\tr si16 dod
    re?8\f si' lad si lad si lad si

    %85
    si,4\staccatissimo\mp re\staccatissimo sold,\staccatissimo si\staccatissimo
    mi,8-. mi-. sold-. sold-. si si re re
    si4\staccatissimo re\staccatissimo sold,\staccatissimo si\staccatissimo

    %88
    si2\f\fermata r
    <la' dod, mi, la,>4. sold16\mp fad mi4\staccatissimo re\staccatissimo
    dod16(mi la4.) si,4\staccatissimo sold'\staccatissimo

    %91
    la,8\f la' sold la sold la sold la\mbreak
    mi,2\mp r4 mi'
    la,2\tr r4 mi'

    %94
    la,2\tr r4 fad'
    la,8\ff la la la la la la la
    \once\stemUp <sold' si, mi,>2\staccatissimo si,4\p\staccatissimo re\staccatissimo

    %97
    dod16(mi la4.) si,4\staccatissimo sold'\staccatissimo
    la8 la, si dod re mi fad sold
    la4.\f la,8 la4 mi

    %100
    la8\p sold la sold la sold la sold
    la4.\ff mi8 mi2
    \once\stemUp <sold' si, mi,>2 r4 si,

    %103
    dod16(mi la4.) si,4_\markup {[\musicglyph #"p"]}\staccatissimo sold'\staccatissimo
    la,,8_\markup {[\musicglyph #"f"]} la' sold la sold la sold la
    sold4\p la la la

    %106
    sold\f si si si
    la\p  la la si
    si2\tenuto \f\fermata r

    %109
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}
    mi4\mf la, la' re,
    dod16(si la4.) sold4.\tr la8

    %112
    la8\f la' sold la sold la sold la
    dod,\mf la si dod re mi fad sold
    la la, sold la sold la sold la

    %115
    la'4.\ff la,8 la2
    <<si\\sold>> r4 \once\stemUp <sold' re mi,>
    <la dod, mi, la,> la,4 mi' mi,

    %118
    la'4\f mi2~mi16 mi fad sold
    la4 \appoggiatura si8 la2 si8\parentSlur (dod)
    si4 \appoggiatura dod8 si2 dod8\parentSlur(re)

    %121
    dod\parentSlur (si) la2~la16 la si dod
    si4\appoggiatura dod8 si2 dod8\parentSlur (re)
    dod\parentSlur (si) la2~la16 si dod re

    %124
    mi4\staccatissimo re\staccatissimo dod16(si la4.)\mbreak
    \appoggiatura {si16[dod]} re2-\parenthesize\staccatissimo\appoggiatura {la16[si]} dod2-\parenthesize \staccatissimo
    si4\p mi, dod16(si la4.)

    %127
    \appoggiatura {si16[dod]} re2\staccatissimo \appoggiatura {la16[si]} dod2\staccatissimo
    \appoggiatura dod8 si2 r
    la8\f  la' sold la sold la sold la

    %130
    la,\p  la' sold la sold la sold la
    la,\f  la' sold la sold la sold la\mbreak
    la,2\tr~la8 si16 dod re mi fad sold

    %133
    la4.\tr sold16 fad mi4 re
    dod8 si la4 si4.\tr la8
    la\p  la' sold la sold la sold la

    %136
    la,\f  la' sold la sold la sold la
    la,\p  la' sold la sold la sold la
    sold\f mi fad sold la si dod re

    %139
    mi4 re8 dod si la sold fad
    mi4 re8 dod si la sold fad\mbreak
    mi4 la' si, sold'

    %142
    la4.\tr sold16 fad mi8 re dod si
    la4 dod, re mi
    la,2_\fermata^\markup\center-align" Fine" r

    %145
    la'4\p sold fad sold
    la sold8 fad mid4 sold
    la8\f fad' mid fad mid fad mid fad

    %148
    fad4\p fad,2 mi'?4
    re,8\f re' dod re dod re dod red
    mi4\p mi,2 re'?4\mbreak

    %151
    dod,8\f dod' si dod si dod si dod
    si,4\staccatissimo si'\staccatissimo mid,\staccatissimo sold\staccatissimo
    dod,8 dod mid mid sold sold si si

    %154
    sold4\staccatissimo si\staccatissimo mid,\staccatissimo sold\staccatissimo
    mid2\fermata r
    fad'4\p mi8 re dod16(si lad4.)

    %157
    sid8\f fad' mid fad mid fad mid fad
    dod,4\p dod' la fad
    si8(sold) la(fad) sold[(mid)] fad16 sold la si\mbreak

    %160
    dod16(la8.) si16([sold8.)] la4\staccatissimo fad'\staccatissimo
    la,16(sold fad4.) sold4 mid'
    fad,8 fad' mi? re dod si la sold

    %163
    la16(dod fad4.) sold,4.\tr fad8
    fad2 r
    \appoggiatura {red'16\p[mi]} fad4 mi2.

    %166
    red8(sid) \appoggiatura sid dod2.
    la4 sold2 red'4
    mi8 dod \appoggiatura dod red?2.

    %169
    dod4 dod2\tr sid8 dod\mbreak
    dod4 dod2\tr sid8 dod
    dod4 dod2\tr sid8 dod

    %172
    sid16(red8.)sold,4 sid16(sold8.) sid16[(red8.)]
    dod4\staccatissimo\f sold'\staccatissimo la,16(fad8.) la16[(dod8.)]
    si4\staccatissimo fad'\staccatissimo sold,16(mi8.) sold16[(si8.)]

    %175
    la4\staccatissimo mi'\staccatissimo fad,16[(red8.)] fad16(lad8.)
    red4 fad8 (mid) red4-\parenthesize \staccatissimo dod-\parenthesize \staccatissimo
    sid2\fermata r

    %178
    mi4\p red16(si8.) dod4\staccatissimo lad\staccatissimo\mbreak %% fine p. 12
    sid8 sold' fad sold sold, sold' fad sold
    dod,\f sold' fad sold sold, sold' fad sold

    %181
    fad4\p fad, sold dod
    fad,2 sold
    la\fermata r

    %184
    r sold4 \staccatissimo sid \staccatissimo
    dod \staccatissimo mi,\staccatissimo fad \staccatissimo sold\staccatissimo
    dod,2 r

    %187
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}
    la''4\f mi2~mi16 mi fad sold
    la4 \appoggiatura si8 la2 si8(dod)

    %190
    si4 \appoggiatura dod8 si2 dod8(re)
    dod(si) la2~la16 la si dod
    si4\appoggiatura dod8 si2 dod8(re)

    %193
    dod(si) la2~la16 si dod re
    mi4\staccatissimo re\staccatissimo dod16(si la4.)\mbreak
    \appoggiatura {si16[dod]} re2\staccatissimo\appoggiatura {la16[si]} dod2\staccatissimo

    %196
    \appoggiatura dod16 si4\staccatissimo mi, dod16\p(si la4.)
    \appoggiatura {si16[dod]} re2\staccatissimo \appoggiatura {la16[si]} dod2\staccatissimo
    \appoggiatura dod8 si2~si16 la\f si dod re mi fad sold

    %199
    la2 la\tr
    la la\tr
    la la\tr

    %202
    la~la16 si, dod red mi fad sold la\mbreak
    si4\staccatissimo la\staccatissimo sold16(fad mi4.)
    \appoggiatura {red16[mi]} fad2\staccatissimo \appoggiatura mi8 red2\tr

    %204
    si4\p la sold16(fad mi4.)
    \appoggiatura {red16[mi]} fad2\staccatissimo \appoggiatura mi8 red2\tr
    mi8\f mi' red mi red mi red mi

    %207
    mi,\p mi' red mi red mi red mi
    mi,\f mi' red mi red mi red mi
    mi,2~mi8\tr fad16 sold la si dod red

    %210
    mi4 sold, la si
    dod\p sold la si
    dod\f sold la si

    %214
    mi,2 r

}

vlan = \relative do' {

    dod'2\staccatissimo si\staccatissimo
    la\staccatissimo mi\staccatissimo
    fad r4 sold

    %4
    la8(si dod2) la4
    fad2 r4 sold
    la2\staccatissimo mi\staccatissimo

    %7
    si'\staccatissimo la~
    la4 si mi,2\staccatissimo
    sold\staccatissimo la\p~

    %10
    la4 si mi, la
    \appoggiatura la8 sold4. fad8\f mi4 re
    \appoggiatura re8 dod4 dod'\staccatissimo fad,\staccatissimo la

    %13
    red,8 red fad fad si, si red red
    fad4 la red ,fad
    red2\staccatissimo fad\staccatissimo

    %16
    mi2. sold4
    la2 fad
    sold8(fad) mi2\p sold4

    %19
    la2 fad
    si,4\f si' si, si'
    dod,\p dod' dod, dod'

    %22
    fad,\f si si, la'
    sold4. la8 si4 la
    si la sold fad

    %25
    mi2 red4.\tr mi8
    mi4\p si' si, si'
    dod,\f dod' dod, dod'

    %28
    si,\p si' fad fad
    fad2\f r4 fad
    mi2 r4 la

    %31
    si la8 sold fad mi red dod
    si16(la sold4.) dod4 fad,
    fad'' red8 dod si la sold fad

    %34
    sold16(fad mi4.) dod4 red
    mi re! dod si
    la4\p dod si mi

    %37
    fad re dod la
    re si mi mi,
    la'2 fad

    %40
    re4 si mi mi,
    la'\f si dod la
    sold2\p r4 mi\mbreak

    %43
    la si mi, r
    sold2 r4 mi
    la si mi, r

    %46
    sold\staccatissimo\f la\staccatissimo sold fad
    mi\p mi mi fad
    sold sold sold sold

    %49
    mi fad fad sold
    sold\f la si sold
    fad\staccatissimo\mp la\staccatissimo  red, fad

    %52
    si, red fad la
    fad la red, la'
    la2\fermata\f_\tenuto r

    %55
    sold2.\p fad4\mbreak %% fine p. 1 parte separata
    mi4 sold red16(mi fad4.)

    %57
    sold4\f la si la
    sold\p la si la
    sold\f la si la

    %60
    sold\p la si la
    sold8\ff sold la la si si la la
    sold2\staccatissimo mi\f\staccatissimo

    %63
    sold\p r4 dod
    si2\staccatissimo si,\staccatissimo
    dod\staccatissimo red\staccatissimo

    %66
    mi4 dod' la si
    sold, \mf la8 si dod re mi fad
    <<{si8\ff[si si si] si[si si si]

       %69
       si2}\\{sold8[sold sold sold] sold[sold sold sold]
              sold2}>> r
    R1
    si,4\f si' si, si'

    %72
    dod,\p dod' dod, dod'
    si,\f si' fad fad
    fad2\staccatissimo fad\staccatissimo

    %75
    mi r4 la
    si4.\tr la16 sold fad8 mi red dod
    si4 sold dod fad,

    %78
    mi''4. red16 dod si8 la sold fad
    sold2 r4 fad
    mi\p fad sold\f fad

    %81
    mi\p re? dod mi
    fad fad, mi mi'
    re si lad fad'

    %84
    re\f mi fad mi
    si'\mp re sold, si
    mi, sold si re

    %87
    si re sold, si
    sold2\fermata \f r
    mi4\mp la dod si

    %90
    la2 sold16 la si4.
    do4\f si la si
    do?_\markup {[\musicglyph #"p"]} la sol2

    %93
    fa mi
    re re
    fad!8\ff fad fad fad fad fad fad fad

    %96
    mi2\staccatissimo r4 si'_\markup {[\musicglyph #"p"]}
    la dod, fad si,
    dod re8 mi fad sold la si

    %99
    dod,4\f re mi re
    dod\p re mi re
    dod\ff re r mi

    %102
    mi,2 sold'
    la4 dod, fad_\markup {[\musicglyph #"p"]} si,
    dod_\markup {[\musicglyph #"f"]} re mi mi

    %105
    mi\p mi mi fad
    sold\f sold sold sold
    mi\p fad fad sold

    %108
    sold2\fermata\f_\tenuto r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}  % fine p. 2 parte sep.
    mi2\p r4 fad

    %111
    mi2 mi
    fad4\f re dod mi
    dod \mf re8 mi fad sold la si

    %114
    dod,4 re mi re
    dod\ff re r mi
    mi,2 si''

    %117
    la4 fad mi sold
    dod2\staccatissimo si\staccatissimo
    la\staccatissimo mi\staccatissimo

    %120
    fad r4 sold
    la8(si dod2) la4
    fad2 r4 sold

    %123
    la2\staccatissimo mi\staccatissimo
    si'\staccatissimo la\staccatissimo ~
    la4 si mi,2\staccatissimo

    %126
    sold\staccatissimo\p la~
    la4 si mi,2
    sold,8 sold' fad sold sold, sold' fad sold

    %129
    la4\f mi mi' mi,
    fad\p fad, fad' fad,
    si'\f mi, mi' re

    %132
    dod dod,8 re mi4 re
    mi mi'8 re dod4 si
    la2 sold4.\tr la8

    %135
    la4\p mi mi' mi,
    fad\f fad, fad' fad,
    mi' \p mi, si'' si

    %138
    si2\staccatissimo\f si\staccatissimo
    la r4 re
    mi re8 dod si la sold fad

    %141
    mi4 mi fad si,
    dod8 la' sold fad mi re dod si
    la4 dod re mi

    %144
    la,2_\fermata^\markup\center-align "Fine" r
    fad'4\p sold la sold
    fad2 r4 dod'

    %147
    fad,\f sold la si
    dod\p si lad dod
    fad,\f la, sold fad

    %150
    si'\p la sold si
    mi,\f sold, fad la
    sold si' mid, sold

    %153
    dod, mid sold si
    sold si mid, sold
    dod,2\fermata r

    %156
    dod\p r4 mi
    fad2\f fad
    mid4\p dod' la fad

    %159
    si la sold fad
    sold2\staccatissimo fad~
    fad mid4 sold

    %162
    la sold8 fad mi re dod si
    dod4 la si mid
    fad\p sold la si

    %165
    la la, sold' mi %%%% fine p- 3 parte sep.
    fad fad, mi' dod
    dod' sid sold sid

    %168
    dod sold sid sold
    lad dod fadd, lad
    red, fadd lad dod

    %171
    lad dod fadd, lad
    sold sold, sold' fad?
    r mi\f fad dod

    %174
    r red mi si
    r dod red red8 dod
    sid2. dod4

    %177
    red2\fermata r
    dod4\p red mi fad
    sold2 fad

    %180
    mid4 red dod mid
    r fad mi? dod
    fad2 sold

    %183
    la\fermata r
    r sold4 sid
    dod mi, fad sold

    %186
    dod, dod' mi, sold
    dod,2\fermata r
    dod'\f\staccatissimo si\staccatissimo

    %189
    la mi
    fad r4 sold
    la8(si dod2) la4

    %192
    \appoggiatura sold8 fad2 r4 sold
    la2\staccatissimo mi\staccatissimo

    %194
    si'\staccatissimo la\staccatissimo~
    la4 si mi,2\staccatissimo
    sold\staccatissimo la2~

    %197
    la4 si mi, la
    \appoggiatura la8 sold4. fad8 mi4 re
    \appoggiatura re8 dod4 dod' fad,\staccatissimo la\staccatissimo

    %200
    red,8 red fad fad si, si red red
    fad4\staccatissimo la\staccatissimo red,\staccatissimo fad\staccatissimo
    red?2\staccatissimo  fad

    %203
    mi r4 sold
    la2 fad
    mi\p r4 sold

    %206
    la2 fad
    si,4\f si' si, si'
    dod,\p dod' dod, dod'

    %209
    fad,\f si si, la'
    sold4. la8 si4 la
    si mi, la si

    %212
    dod\p sold la si
    dod\f sold la si
    mi,4 re dod si

}

vocen = \relative do'' {

    \autoBeamOff
    R1*35
    la4^\markup\italic "Sempre fiero"  mi2(sold4)
    la la2(dod4)

    %38
    si si2(re4)
    dod8[(si] la2.)\mbreak
    si4 si2(re4)

    %41
    dod8[(si] la2.)
    mi'4. re8 dod4 la
    re2 dod

    %44
    \appoggiatura dod16 si4 mi dod4. la8
    re2 dod
    \appoggiatura dod8 si2 r

    %47
    si4 dod2(red4)\mbreak
    mi4 mi,2.
    dod'4 red2(mi4)

    %50
    mi,2 r
    la\staccatissimo  la\staccatissimo
    la4. la8 la4 la

    %53
    la4. la8 la4 la
    fad'2\fermata r
    mi4.\tr red16[dod] si4 la

    %56
    sold8[fad] mi4 fad2\tr \mbreak
    mi r4 si'
    mi8-.[red-. mi-. red] mi[red mi red]

    %59
    mi4. mi,8 mi4 si'^\mf
    mi8[red mi red] mi[red mi red]
    mi4. mi,8 mi2

    %62
    R1
    mi'4. red16 [dod] si4. la'8
    sold[(fad] mi4) \appoggiatura {re16[mi]} fad2

    %65
    mi4.\tr red16[dod] si4 la
    sold4. mi8 fad4 red
    mi fad8[sold] la[si dod red]

    %68
    mi4.mi,8 mi2
    r r4 mi'
    dod4. sold8 la4 si

    %71
    mi,2 r
    R1*8
    si'2 r

    %81
    r4 mi2 dod4
    lad lad2.\mbreak %%%5 Fine p 7
    si2 dod

    %84
    re8\parentSlur ([dod] si2) r4
    re2\staccatissimo re\staccatissimo
    re4. re8 re4 re

    %87
    re4. re8 re4 re
    re2\fermata r
    la'4. sold16[fad] mi4. re8

    %90
    dod[(si] la4) \appoggiatura {sold16[ la]} si2\tr
    la r\mbreak
    do4 do2 \parentSlur (si8[do])

    %93
    do4 do2 \parentSlur (si8[do])
    do?4 do2 \parentSlur (si8[do])
    \appoggiatura si8 do?2\tr r

    %96
    r si4 re
    dod?4. la8 si4 sold
    la si8[dod] re[mi fad sold]

    %99
    la4. la,8 la4 mi
    la8^\mf [sold la sold] la [sold la sold]\mbreak
    la4. mi8 mi2

    %102
    re' r4 si
    dod4. la8 si4 sold
    la2 r

    %105
    si4 dod2(red4)
    mi mi,2.
    dod'4 red2 \parentSlur(mi4)

    %108
    \parenthesize sold,2\fermata  r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}
    la'4. sold16[fad] mi4. re8

    %111
    dod[\parentSlur (si] la4) \appoggiatura {sold16[ la]} si2\tr
    la2 r4 si
    dod8[la si dod] re[mi fad sold]

    %114
    la4. la,8 la4 mi'
    la4. la,8 la2
    r r4 re

    %117
    dod4. la8 mi'4 mi,
    la2\tr r
    R1*25

    %144
    R1_\markup\center-align {\musicglyph #"scripts.dfermata"}^\markup\center-align "Fine"
    dod4 dod2 \parentSlur (si8[dod])
    fad4 mi8[re] dod4 si

    %147
    la8[(sold)] fad4 r2
    fad'4 fad,2(mi'4)
    re8[(dod)] re2(red4)

    %150
    mi mi,2(re'4)\mbreak
    dod8[si] \appoggiatura si dod2 r4
    si2 si

    %153
    sold' si,
    si si
    si\fermata r

    %156
    fad'4 mi8[re] dod4 lad
    sid2 sid
    dod1(

    %159
    re)\mbreak
    dod4 si la fad'
    la,8[(sold] fad4) \appoggiatura {mid16[fad]} sold2

    %162
    fad r
    R1
    \appoggiatura sid8 dod2\tr r

    %165
    \appoggiatura {red16[mi]} fad4 mi2.
    red8[(sid)] \appoggiatura sid dod2.
    la4 sold2 (red'4)
    mi8 [(dod)] \appoggiatura dod red?2 r4

    %169
    dod4 dod2\tr (sid8 [dod)]\mbreak
    dod4 dod2\tr (sid8 [dod)]
    dod4 dod2\tr (sid8 [dod)]

    %172
    sid[lad] \appoggiatura lad sid2 r4
    sold'2\staccatissimo la,\staccatissimo
    fad' sold,

    %175
    mi' fad,
    fad'1~
    fad2\fermata r

    %178
    mi4 red dod lad\mbreak
    \appoggiatura lad8 sid2 sid
    si! r

    %181
    la4 fad sold dod
    fad,2 sold
    la\fermata r

    %184
    r sold4 sid
    dod mi, fad sold
    dod,2 sold''4 sold,

    %187
    \appoggiatura sid8 dod2\tr\fermata r
    R1*27

}

testo = \lyricmode {

    Non si trova _ né si da né si da uom più _ per -- fi -- do_di te più bar --  baro _ di te.

    Non si trova _ né si da uom più per -- fido _ più bar -- baro _ di te uom _ più bar -- baro _ di te

    più pe - - rfido _ più ba -  - rbaro _ uom _ più bar -- baro di te - - più per -- fido _ più ba - - - rbaro _

    più bar -- baro _ di te.

    Non non si trova _ né si da uom più per -- fido _ più bar -- baro _ di te uom _ più bar -- baro di te

    non si  trova _ né si da uom più per -- fido _ più ba - - - rbaro _ più ba - - rbaro _ non più bar -- baro _ di te.

    Non si trova _ né si da uom _ più bar -- baro di te più ba - - rbaro _  più per -- fido _ più per -- fido _ di te.

    Sei d'un an -- gue più spie -- tato _ d'un Ma -- cigno _ più insen -- sato _ da te bando _ a_la pie -- tà.

    E'_un in -- ganno _  la tua fe' è_un in -- ganno _ la tua fe'.

    Sei sei d'un an -- gue più spie -- tato _ d'un Ma -- cigno _ più insen -- sato _ da te bando _ a_la pie -- tà.

    E'_un in -- ganno _  la tua fe', è_un in -- ganno _ la tua fe', è_un in -- ganno _  la tua fe'  la tua fe'.

}


bcn = \relative do {

    la4 la' sold mi
    fad re dod la
    re si mi mi,

    %4
    la'2 \staccatissimo fad\staccatissimo
    re4 si mi mi,
    la' si dod la

    %7
    sold2 r4 la\mbreak
    fad sold la la,
    mi'2 r4 dod'\p

    %10
    fad, sold la la,
    mi' mi'8\f re dod4 si
    la\staccatissimo dod\staccatissimo fad, la

    %13
    red, fad si, red
    fad la red, fad
    si, si' la, la'\mbreak

    %16
    sold2\staccatissimo dod\staccatissimo
    la4 fad si la
    sold2\staccatissimo dod\p

    %19
    la4 fad si la
    sold\f sold, sold' sold,
    la'\p la, la' la,

    %22
    si'\f si, si' si,
    dod' si8 la sold4 fad\mbreak
    sold2 r4 la

    %25
    si si, si' la
    sold\p sold, sold' sold,
    la'\f la, la' la,

    %28
    sold'\p  sold, la la'
    si2\f r4 la
    sold mi r la\mbreak

    %31
    si4 la8 sold fad mi red dod
    si4 dod la si
    mi'4 red8 dod si la sold fad

    %34
    mi4 dod' la si
    mi, re? dod si
    la\p la' sold mi

    %37
    fad re dod la
    re si mi mi,
    la'2 fad\mbreak

    %40
    re4 si mi mi,
    la'\f si dod la
    sold2\p r4 la

    %43
    fad sold la la,
    mi'2 r4 la
    fad sold la la,

    %46
    mi'\f fad sold fad
    mi\p mi mi mi\mbreak %% fine p. 5 OK
    mi mi mi mi

    %49
    mi mi mi mi
    mi\f fad sold mi
    fad\mp la red, fad,

    %52
    si red fad la
    fad la red, fad
    si,2\f_\tenuto \fermata r

    %55
    dod\p r4 red
    mi2 si'\mbreak
    mi,4\f fad sold fad

    %58
    mi\p fad sold fad
    mi\f fad sold fad
    mi\p fad sold fad

    %61
    mi\ff fad sold fad
    mi2 r
    sold_\markup {[\musicglyph #"p"]} r4 dod

    %64
    si2\staccatissimo si,\staccatissimo\mbreak
    dod\staccatissimo red\staccatissimo
    mi4 dod' la si

    %67
    mi,\mf fad8 sold la si dod red
    mi4.\ff mi,8 mi2
    r4 mi'\p sold,2

    %70
    r4 dod la si
    sold\f sold, sold' sold,
    la'\p la, la' la,

    %73
    sold'\f sold, la' la,\mbreak
    si'2 la
    sold4 mi r la

    %76
    si la8 sold fad mi red dod
    si4 dod la si
    mi' red8 dod si la sold fad

    %79
    mi2 r4 si'
    mi,\p fad sold\f fad
    mi\p re? dod mi

    %82
    fad fad, mi mi'\mbreak  %% fine p. 7
    re si lad fad'
    si\f dod re dod

    %85
    si\mp re sold, si
    mi, sold si re
    si re sold, si

    %88
    mi,2\fermata\f r
    dod\mp r4 re
    mi2 mi,

    %91
    la'4_\markup {[\musicglyph #"f"]} si do si\mbreak
    la2\p sol
    fa mi

    %94
    re re
    red\f\tenuto r
    r4 mi mi,2

    %97
    r4 fad'\p re mi
    la, si8 dod re mi fad sold
    la4\f si dod si

    %100
    la\p si dod si\mbreak
    la\ff si dod la
    r mi' mi,2

    %103
    r4 la re,\p mi
    la\f si dod la
    mi\p mi mi mi

    %106
    mi\f mi mi mi
    mi\p mi mi mi
    re2\fermata \f \tenuto r

    %109
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}
    dod2\p r4 re
    mi2 mi,\mbreak

    %112
    fad'4\f re dod mi
    la8\mf la, si dod re mi fad sold
    la4 si dod si

    %115
    la\ff si dod la
    r mi' mi,2
    r4 fad re mi

    %118
    la, la' sold mi
    fad re dod la
    re si mi mi,

    %121
    la'2 fad\mbreak
    re4 si mi mi,
    la' si dod la

    %124
    sold2 r4 la
    fad sold la la,
    mi'2 r4 dod'\p

    %127
    fad, sold la la,
    mi' mi, mi' re
    dod\f dod' dod, dod'

    %130
    re,\p re' re, re'
    mi,\f mi' mi, mi'\mbreak
    fad mi8 re dod4 si

    %133
    dod2 r4 re
    mi mi, mi' re
    dod\p dod, dod' dod,

    %136
    re'\f re, re' re,
    dod'\p dod, re' re,
    mi\f mi' re, re'

    %139
    dod la r re
    mi re8 dod si la sold fad\mbreak
    mi4 dod re mi

    %142
    la sold8 fad mi re dod si
    la4 dod re mi
    la,2_\fermata^\markup\center-align" Fine" r

    %145
    fad'4\p sold la sold
    fad2 r4 dod'
    fad,\f sold la si

    %148
    la\p sold fad lad
    si\f la? sold fad
    sold\p fad mi sold\mbreak

    %151
    la\f sold fad la
    sold si mid, sold
    dod, mid sold si

    %154
    sold si mid, sold
    dod,2\fermata r
    la\p r4 dod

    %157
    re2\f re
    dod4\p dod' la fad
    si la sold fad\mbreak

    %160
    mid2 fad
    dod' dod,
    fad,8 fad' mi re dod si la sold

    %163
    fad4 la si dod
    fad\p sold la si
    la la, sold' mi

    %166
    fad fad, mi' dod
    dod' sid sold sid
    dod sold sid sold

    %169
    lad dod fadd, lad
    red, fadd lad dod
    lad dod fadd, lad

    %172
    sold sold, sold' fad?
    mi_\markup {[\musicglyph #"f"]} dod r fad
    red si r mi

    %175
    dod la r red'
    sid red8 dod sid4 lad
    sold2\fermata r

    %178
    dod,4 red mi fad\mbreak
    sold2 fad
    mid4 red dod mid

    %181
    r fad mi? dod
    fad2 sold
    la\fermata r

    %184
    r sold4 sid
    dod mi, fad sold
    dod, dod' mi, sold

    %187
    dod,2\fermata r
    la4 la' sold mi
    fad re dod la\mbreak

    %190
    re si mi mi,
    la'2 fad
    re4 si mi mi,

    %193
    la' si dod la
    sold2 r4 la
    fad sold la la,

    %196
    mi'2 r4 dod'
    fad, sold la la,
    mi' mi'8 re dod4 si\mbreak

    %199
    la\staccatissimo dod\staccatissimo fad,\staccatissimo la\staccatissimo
    red, fad si, red
    fad la red, fad

    %202
    si, si' la, la'
    sold2 dod
    la4 fad si la

    %205
    sold2\p dod
    la4 fad si la
    sold\f sold, sold' sold,\mbreak

    %208
    la'\p la, la' la,
    si'\f si, si' si,
    dod' si8 la sold4 fad

    %211
    sold mi la si
    dod\p  sold la si
    dod\f sold la si

    %214
    mi, re dod si

}

bfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 2/2
    \key la\major
    \tempo 2 = 77
    s1*35
    \bar "S-S" \break
    s1*109\break
    s1*70
    \bar"||"
    \mark\markup\smaller\center-column{"D. S."\vspace #+0.1"[al Fine]"}

}



vlI = {
    \global
    %\notypeset
    <<\vlIn \forma>>

}

vlII = {
    \global
    <<\vlIIn \forma>>

}

vla = {
    \global
    \clef alto
    <<\vlan \forma>>

}


voce = {
    \new Voice = "non"
    \global
    <<\vocen \forma>>

}

bc = {
    \global
    \clef bass
    <<\bcn \forma \bfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 18.5)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\markup \huge {Allegro assai}

\score {

    \new ChoirStaff <<

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"[Violino""Primo]"}
            \vlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"Violino""Secondo"}
            \vlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  \center-column{"Viola"}
            \vla
        >>

        \new Staff
        <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key la\major\time 2/2  r1^\markup \right-align"[Soprano]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \voce
                \new Lyrics \lyricsto "non" \testo
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
            \bc
        >>
    >>

    \layout {

            indent = 2\cm
            incipit-width = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner
            #'base-shortest-duration = #(ly:make-moment 1 8)  %aumenta lo spazio orizzontale
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

