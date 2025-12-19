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



Ifln = \relative do'' {
   
   r4 
   R1
   sol'4 r8 sol sol4 r8 do
   do2~do
   
   %4
   fa,4 sol sol r
   sol r sol r
   la r re r\mbreak
   
   %7
   re r r2
   R1*2
   r2 la4 si
   
   %11
   mi, fa8 mi mi4 r
   sol la si re\mbreak
   re r8 sol, la4 r8 sol
   
   %14
   la4 do do2~
   do~do
   fa,4 sol sol r
   
   %17
   do r si sol
   si sol si sol
   sol r r2\fermata
   
}


IvlIn = \relative do'' {
   
   do16 re mi fa
   sol8 do, sol' do, sol'16[do, re mi fa sol la si]
   do8 sol do sol do do, do' do,
   la'16[la, la la la la la la] sol'[sol, sol sol sol sol sol sol]
   
   %4
   fa'[fa, fa fa fa fa fa fa] mi8 do do'16 re mi fa
   sol8 sol, r4 r16 sol[sol la si do re mi]
   fad8 la, r4 r16 re[mi fad sol la si do]\mbreak
   
   %7
   re8 sol, re' sol, re'16[re, re re re re re re]
   do'[do, do do do do do do] si'[si, si si si si si si]
   do re  mi fa sol do, re mi fa[mi re mi fa sol la si]
   
   %10
   do8 mi, do' mi, do'16 mi, mi mi si' mi, mi mi
   la4 r do16 mi, mi mi la re, re re
   sol4 r si16 re, re re la' re, re re\mbreak
   
   %13
   sol4 r la16 do, do do sol' do, do do
   la'[la, la la la la la la] sol' sol, sol sol sol8 sol'
   sol fa fa16 fa fa fa fa8 mi mi16 mi mi mi
   
   %16
   mi8 la, re16 re re re do re mi fa sol8 sol,
   r16 sol[la si do re mi fa] re si' si si do si do re
   si si, si si do si do re si si' si si do si do re
   
   %19
   si4 r r2\fermata

}

IvlIIn = \relative do'' {
   
   r4 
   R1
   mi4 r8 re do16 re mi fa sol sol sol sol
   sol8 fa fa16 fa fa fa fa8 mi mi16 mi mi mi
   
   %4
   mi8 la, re16 re re re do re mi fa sol8 sol,
   r16 sol[la si do re mi fad] sol8 re r4
   r16 la[la si do re mi fad] sol8 sol, r16 fad' sol la\mbreak
   
   %7
   si8 si, si'[si,] si' si, si'16 si si si
   si8 la la16 la la la la8 sol re16 re re re
   sol,8 do mi[sol] si,16[do si do re mi fa re]
   
   %10
   mi8 do mi[do] mi4 r
   do'16 mi, mi mi si' mi, mi mi la4 r
   si16 re, re re la' re, re re sol4 r\mbreak
   
   %13
   si16 re, re re sol do, do do fa4 r8 sol
   sol fa fa16 fa fa fa fa8 mi mi16 mi mi mi
   la[la, la la la la la la] sol' [sol, sol sol sol sol sol sol] 
   
   %16
   fa'[fa, fa fa fa fa fa fa] mi8 do do'16 re mi fa
   sol8 sol, mi'16 fa sol la si re, re re mi re mi fa
   re re, re re mi re mi fa re re' re re mi re mi fa
   
   %19
   re4 r r2\fermata

}

Ivlan = \relative do' {
   
   r4
   R1
   sol'4 r8 sol sol4 r8 do
   do8 do do16 do do do do8 do do16 do do do
   
   %4
   la8 la sol16 sol sol sol sol8 sol mi[do]
   mi4 r re r
   do r si r\mbreak
   
   %7
   re r sol8 sol re sol
   mi mi la[fad] re re sol sol
   sol4 r fa? r
   
   %10
   sol r do, si
   do re do re
   re8 si re4 re8 si re4\mbreak
   
   %13
   re8 si' do4 la do
   do do,8 do do do do'[do]
   la la do[do] do do do[do]
   
   %16
   la la sol[sol] sol4 r
   mi r sol16 sol sol sol sol4
   sol16 sol sol sol sol4 sol16 sol sol sol sol8 sol
   
   %19
   sol4 r r2\fermata

}

Ivcn = \relative do' {
   
   r4 
   R1
   do4 r8 si mi4 r8 mi
   fa16 fa, fa fa la8 fa do16 do' do do mi8 do
   
   %4
   re do si sol do4 r
   do r si r
   la r sol r\mbreak
   
   %7
   sol' r sol8 sol, si sol
   la la fad re sol sol' sol[fa]
   mi4 r re r
   
   %10
   do r la sold
   la sold la fad
   sol? fad sol fad\mbreak
   
   %13
   sol mi' fa? mi
   fa8 fa, la fa do do' mi do
   fa fa, la fa do do' mi do
   
   %16
   re do si sol do4 r
   do r sol do8 do,
   sol'4 do8 do, sol'16 sol sol sol do8 do,
   
   %19
   sol'4 r r2\fermata

}

Ibcn = \relative do {
   
   r4 
   R1
   do'4 r8 si mi,4 r8 mi
   fa fa, la fa do' do mi do
   
   %4
   re do si sol do4 r
   do r si r
   la r sol r\mbreak
   
   %7
   sol' r sol8 sol, si sol
   la la' fad re sol sol, sol' fa?
   mi4 r re r
   
   %10
   do r la' sold
   la sold la fad
   sol? fad sol fad\mbreak
   
   %13
   sol mi fa? mi
   fa8 fa, la fa do' do mi do
   fa fa, la fa do' do mi do
   
   %16
   re do si sol do4 r
   do r sol' do,
   sol' do, sol' do,
   
   %19
   sol r r2\fermata

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s4 
    s1
    s4 s8 <6> <6>4 s8 <6>
    <9> <8> <6>4 <4>8 <3> <6>4
    <9>4 <6> s2
    s <6>
    <6+>1
    s
    <9>8 <8> s s <9> <8> s4
    <6>2 <6>
    s1
    s4 <7 5> s2
    s1
    s4 <6> s <6>
    <9>8 <8> s s <4> <3> s s
    <9>8 <8> s s <4> <3> s s
    <9>4 <6 5>8 <7> 
    
}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 60
    \partial 4 s4
    s1*19
    \bar "||"

}

Ifl = {
    %\notypeset
    <<\Ifln \forma>>

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
Ivc = {
    \clef tenor
    <<\Ivcn \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IIfln = \relative do'' {
   
   si'4. do8 si4. do8
   si16. la32 si16. do32 si16. do32 si16. la32 sol8.\tr fad16 mi4
   la4. sib8 la4. sib8
   
   %4
   la16.[sol32 la16. sib32 la16. sib32 la16. sol32] fa?8.\tr mi16 re4
   la'8 si16. do32 re8 fa, mi re' do[fa,]
   mi re' do[la] sib la16. sold32 la8 si16. do32
   
   %7
   la4 sold8.\tr la16\mbreak la8 la16. si32 do4
   r8 la16. si32 do8 mib, re do' sib[mib,]
   re do' sib[sol] lab sol16. fad32 sol8 la16. sib32
   
   %10
   sol4 fad8. sol16 sol8 sol16. la32 sib4
   r8 sol16. la32 sib16. la32 sib16. do32 la8 fa16. sol32 la4
   r8fa16. sol32 la8 fa re mi16. fa32 sol16. la32 sol16. fa32
   
   %13
   mi8 mi16. fa32 sol4 r8 sol16. la32 si8 sol
   do la16. si32 do16. si32 do16. re32\mbreak si16. la32 sol16. fad32 sol4~
   sol16. fad32 sol16. la32 fad8.\tr sol16 sol4 r
   
   %16
   R1*3

}


IIvlIn = \relative do'' {
   
   r8 fad, sol4 r8 fad sol4
   R1
   r8 mi fa?4 r8 mi fa4
   
   %4
   R1
   r4 r8 la si4 r8 do,
   si4 la8 mi' fa4 r8 fad
   
   %7
   mi2\mbreak la,4 r8 do16. re32
   mi4 r8 do' do la re,[sib']
   la4 sol8 re mib4 r8 sol
   
   %10
   sib4 la sol r8 sol16. la32
   sib8 sib  sol[mi!] fa4 r8 fa16. sol32
   la4 r8 la sol4 r8 si,
   
   %13
   do4 r8 mi16. fa32 sol8 re r re
   fad fad16. sol32 la8 fad\mbreak re4 r8 re
   do2 si8 si'\p si si
   
   %16
   do do re[re] re do do do
   do si si si do2
   si8 sol re[re] re4 r

}

IIvlIIn = \relative do'' {
   
   r8 red, mi4 r8 red mi4
   R1
   r8 dod re4 r8 dod re4
   
   %4
   R1
   r4 r8 re sold,4 r8 la
   sold4 la8 do? re4 r8 red
   
   %7
   mi2\mbreak la,4 r8 la16. si32
   do4 la'8 sol fad4 r8 sol
   fad4 sol8 sib, do4 r8 dod
   
   %10
   re re re do? sib sol r4
   r8 sol' mi do fa4 r8 la16. sib32
   do4 r8 la, si!4 r8 sol
   
   %13
   do4 r si r8 si
   la la' fad re\mbreak sol,4 r8 si
   la2 sol8 re'\p re re
   
   %16
   mi mi sol[sol] sol sol la[la]
   re, re sol2 fad4
   sol8 re si[si] si4 r

}

IIvlan = \relative do' {
   
   r8 red mi4 r8 red mi4
   R1
   r8 dod re?4 r8 dod re4
   
   %4
   R1
   r4 r8 re sold,4 r8 la
   sold4 la8 do re4 r8 red
   
   %7
   mi4 mi,\mbreak la4 r
   la la'8 sol fad4 r8 sol 
   fad4 sol8 sib, do4 r8 dod
   
   %10
   re re, re' do? sib sol r4
   r8 sol' mi do fa,4 r
   fa' r8 la, si!4 r8 sol
   
   %13
   do4 r si r8 si
   la la' fad[re]\mbreak sol,4 r8 si
   la2 sol8 sol'\p sol sol
   
   %16
   sol sol re[re] mi mi re[re]
   re re re re do2
   re8 si sol[sol] sol4 r

}

IIvcn = \relative do' {
   
   R1*14
   r2 r8 sol\p sol fa
   mi mi si'[si] do do, fad[fad]
   sol sol sol sol la2
   sol4 sol8 sol sol4 r

}

IIbcn = \relative do {
   
   R1*14
   r2 r8 sol'\p sol fa
   mi mi si[si] do do fad,[fad]
   sol sol' sol sol la2
   sol4 sol,8 sol sol4 r

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s1*15
    <6>4 <6> <9>8 <8> <6 5>4
    <4>8 <3> <6>4 <7> <6+>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 45
    s1*18
    \bar "||"

}

IIfl = {
    %\notypeset
    <<\IIfln \forma>>

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
IIvc = {
    \clef tenor
    <<\IIvcn \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IIIfln = \relative do'' {
   
   R1*23
   r4 sol' sol sol
   do,8 re mi fa sol4 mi
   
   %26
   la2 si
   do4 mi, do' mi,
   si' re, si' re,
   
   %29
   do do' do do
   do si8 la si4 si
   si la8 sol la4 sol
   
   %32
   fad sol8 fad sol2~
   sol fad
   sol r
   
   %35
   R1*10 
   r4 la la la
   mi8 fad sol la si4 mi,
   
   %47
   fad2 fad
   sol8 la si do re4 sol,
   la re, la' re,
   
   %50
   si' mi, si' mi,
   do'8 si do si la4 do
   sol2 fad
   
   %53
   mi r
   r4 la la la
   mi8 fad sol fad mi2\mbreak
   
   %56 OOKK
   r4 re' re re
   la8 si do si la2 
   R1*3
   
   %61
   si8 la si la sold la si sold
   la2 r
   dod8 si dod si lad si dod lad
   
   %64
   si2 r\mbreak
   si8 la? si la sold la si sold
   la2 r
   
   %67
   la8 sol? la sol fad sol la fad
   sol4 re' re re
   sol,2 r
   
   %70
   r4 do do do
   fa,2 r
   r4 re' re re
   
   %73
   re8 do re do si do re si
   do4 do do do\mbreak
   do8 si do si la si do la
   
   %76
   si2 r
   r4 sol sol sol
   sol1
   
   %79
   r4 sol sol sol
   sol1
   R
   
   %82
   r4 do do do
   do1
   r4 do fa, do'\mbreak
   
   %85
   re1
   do2 r
   r4 do do do
   
   %88
   do1
   r4 do fa, do'
   re1
   
   %91
   do2 r4 sol
   sol sol sol sol
   sol2 r\fermata

}


IIIvlIn = \relative do'' {
   
   r4 sol' sol sol
   do,8 re mi fa sol4 mi
   la2 si
   
   %4
   do4 mi, do' mi,
   si' re, si' re,
   sol la8 sol la4 si8 la
   
   %7
   si4 re, si' re,
   do8 si do re si4 do
   fa la sol re'
   
   %10
   sol,8 fa sol fa sol fa sol la
   si4 sol fad sol\mbreak
   r do, do do
   
   %13
   sol8 la si do re4 si
   mi2 fad
   sol4 re mi8 re do si
   
   %16
   la si do re mi4 sol~
   sol fa8 mi fa4 fa,
   sol do do do
   
   %19
   sol8 la si do re4 si
   mi2 re4 mi
   fa2. mi8 re\mbreak
   
   %22
   mi4 sol fa8 re mi fa
   mi2 re
   mi r
   
   %25
   R1*8
   r4 do do do
   sol8 la si do re4 si\mbreak
   
   %35
   do2 r
   R1
   r4 do' do do
   
   %38
   sol8 la si do re4 si
   do8 si do si la4 do
   do1
   
   %41
   si4 sol mi2~
   mi4 re re'2~
   re do
   
   %44
   si1\mbreak %%fine p 11
   do2 r
   R1*7
   
   %53
   r4 si si si
   dod2 r
   r4 dod dod dod\mbreak
   
   %56
   re2 r
   r4 fad, fad fad
   sol re' re re
   
   %59
   sol,8 la si do re4 re,
   si' re re re
   re2 r4 re
   
   %62
   do8 si do re si lad si dod
   lad2 r4 lad
   fad fad fad fad\mbreak
   
   %65
   sold2 r4 sold
   la do do do
   do2 r4 do
   
   %68
   si8 la si la sol4 si
   do8 si do si do si la sol
   la4 la, la' fa?
   
   %71
   r fa fa fa
   re8 do re do si la si la
   sold la si la sold la si sold
   
   %74
   la si do si la4 mi'\mbreak
   fa8 sol la sol fa sol la fa
   re mi fa mi fa re mi fa
   
   %77
   mi2 r8 mi fa mi
   re mi fa mi fa re mi fa
   mi2 r8 mi fa mi
   
   %80
   re mi fa mi fa re mi fa
   mi4 sol sol sol
   la2 r8 sol la sol
   
   %83
   la sol la sol la sol la sol
   la4 do si do\mbreak
   do2 si
   
   %86
   do4 sol sol sol
   la2 r8 sol la sol 
   la sol la sol la sol la sol
   
   %89
   la4 do si do
   do2 si
   do r8 mi, fa mi
   
   %92
   re4 si' si si
   do2 r\fermata
   
}

IIIvlIIn = \relative do'' {
   
   R1*3
   r4 do do do
   sol8 la si do re4 si
   
   %6
   mi2 fad
   sol4 sol, sol' sol,
   mi' sol, mi' sol,
   
   %9
   do re8 do re4 mi8 re
   mi re mi re mi re mi fa
   re2 re\mbreak
   
   %12
   sol4 sol, la re,
   si re si' sol
   sol8 fad sol mi la si do la
   
   %15
   re4 sol sol sol
   do,8 re mi fa sol4 mi
   la2 si
   
   %18
   do4 mi, la la,
   si re, si' re,
   do'2 si4 do
   
   %21
   do la re, re'~\mbreak
   re do8 si la si do4
   do2 si
   
   %24
   do r4 re,\p
   sol2 r4 sol
   la sol fa sol
   
   %27
   sol2 mi
   re2. sol4
   sol la8 sol la4 si8 la
   
   %30
   sol4 re re' re,
   mi mi mi' mi,
   la2 re,4 si
   
   %33
   do1
   re2 r\mbreak
   r4 sol' sol sol
   
   %36
   do,8 re mi fa sol4 re
   mi2 fad
   sol8 fad sol la si2~
   
   %39
   si4 la mi la
   fad8 mi fad sol la4 fad
   re si' la do
   
   %42
   sol fad8 mi fad mi fad sol
   mi4 sold la2~
   la sold\mbreak
   
   %45
   la r4 red,,\p
   si' mi, r mi
   mi2 red
   
   %48
   mi8 fad sol la si4 do
   la2 la
   sol mi
   
   %51
   mi8 red mi red mi2~
   mi red
   r4 sold' sold sold
   
   %54
   la2 r
   r4 mi mi mi\mbreak
   fad2 r
   
   %57
   r4 la, la la
   si sol' fad si~
   si sol la8 sol fad mi
   
   %60
   re4 si' la8 sold la si
   sold2 r4 sold
   mi mi mi mi
   
   %63
   mi2 r4 mi
   re re' re re\mbreak
   re2 r4 re
   
   %66
   do mi, mi mi
   fad2 r4 fad
   re8 do re do si4 sol
   
   %69
   r sol' sol sol
   fa?8 mi fa mi fa sol la sol
   la sol la sol la la, si do
   
   %72
   si la si la sol2
   r4 mi' mi mi
   mi8 re mi re do si do si\mbreak
   
   %75
   la4 fa r fa'
   fa re8 do re si do re
   do2 r8 do' re do
   
   %78
   si do re do re si do re
   do2 r8 do, re do
   si do re do re si do re
   
   %81
   do4 mi mi mi
   do2 r8 mi fa mi
   fa mi fa mi fa mi fa mi
   
   %84
   fa4 sol fa mi\mbreak
   re2 re
   mi4 mi mi mi
   
   %87
   fa2 r8 mi fa mi
   fa mi fa mi fa mi fa mi
   fa4 sol fa mi
   
   %90
   re2 re
   mi r8 do' re do
   si4 re, re re
   
   %93
   mi2 r\fermata

}

IIIvlan = \relative do' {
   
   R1*6
   r4 sol' sol sol
   do,8 re mi fa sol4 mi
   
   %9
   la2 si
   do4 mi, do' mi,
   si' re, si' re,\mbreak
   
   %12
   do mi la, la'
   re,2 r
   r4 do' do do
   
   %15
   sol8 la si la sol4 sol
   fa do do do
   do2 re
   
   %18
   do4 sol' fa8 mi re do
   si4 sol sol'2
   r4 sol sol sol
   
   %21
   do,8 re mi fa sol4 sol\mbreak
   sol2 la4 sol
   sol2 sol
   
   %24
   sol r4 si,\p
   mi2 r4 do
   fa mi re sol
   
   %27
   mi do do do
   sol8 la si do re4 si
   mi2 fad
   
   %30
   sol4 sol, sol sol
   do, do' do do
   do si8 la si4 sol
   
   %33
   la1
   si4 re\f si re\mbreak
   mi8 fa sol la si4 sol
   
   %36
   fa2 re4 sol
   sol8 fa mi re do4 la'
   re,2. sol4
   
   %39
   mi2. mi4
   re2 re
   re mi4 do
   
   %42
   si2 si'~
   si la4 mi
   fa2 mi\mbreak
   
   %45
   mi r4 fad,\p 
   sol2 r4 sol
   la2 si
   
   %48
   mi, r4 mi'
   fad2 fad,
   sol sold
   
   %51
   la4. si8 do4 la
   si2 si
   mi,4 mi' mi mi
   
   %54
   mi2 r
   r4 la la la\mbreak
   la2 r
   
   %57
   r4 re, re re
   re si' la sol~
   sol mi re2~
   
   %60
   re4 re re2
   si' r4 mi,
   mi do mi si
   
   %63
   dod2 r4 fad
   fad? re si si'\mbreak
   si2 r4 mi,
   
   %66
   mi do la la'
   la2 r4 la
   si sol sol,2
   
   %69
   sol' mi4 do'
   do do fa,2
   r4 la la la
   
   %72
   sol2 r
   si r
   do r\mbreak
   
   %75
   do r
   r4 si si sol
   sol mi8 re mi2
   
   %78
   r4 si' si sol
   sol mi8 re mi2
   r4 si' si sol
   
   %81
   sol mi8 re mi4 do'
   do la8 sol la4 do
   do2 r4 do
   
   %84
   do do, re sol\mbreak
   la2 sol
   sol4 mi do' do
   
   %87
   do2 r4 do
   do2 r4 do
   do do, re sol
   
   %90
   la2 sol
   sol r4 sol
   sol sol sol sol
   
   %93
   sol2 r\fermata

}

IIIvcn = \relative do' {
   
   R1*9
   r4 do do do
   sol8 la si do re4 si\mbreak
   
   %12
   mi2 fad
   sol4 sol, si sol
   do2 la
   
   %15
   si mi,
   fa mi4 do
   fa2 re
   
   %18
   mi fa
   r4 sol sol sol
   do,8 re mi fa sol4 mi
   
   %21
   la2 si\mbreak
   do4 mi fa do
   sol'2 sol,
   
   %24
   do r4 si\p 
   mi2 r4 do
   fa mi re sol
   
   %27
   mi do do do
   sol8 la si do re4 si
   mi2 fad
   
   %30
   sol4 sol, sol sol
   do, do' do do
   do si8 la si4 sol
   
   %33
   la1
   si4 sol\parenthesize \f sol sol\mbreak
   
   %35
   do,8 re mi fa sol4 mi
   la2 si
   do la
   
   %38
   si2. sol4
   la8 sold la si do4 la
   re, re' fad re
   
   %41
   sol,8 la si sol do4 la
   si2. la4
   sold mi la do
   
   %44
   re2 mi\mbreak
   la, r4 fad\p
   sol2 r4 sol
   
   %47
   la2 si
   mi, r4 mi'
   fad2 fad,
   
   %50
   sol sold
   la4. si8 do4 la
   si2 si, 
   
   %53
   mi4 mi' mi mi
   la,2 r
   r4 la la la\mbreak
   
   %56
   re,2 r
   r4 re' re re
   sol,8 la si do re4 si
   
   %59
   mi,2 fad
   sol4 sol' fa fa,
   mi2 r4 mi
   
   %62
   la2 sol
   fad r4 fad
   si, si' si si\mbreak
   
   %65
   mi2 r4 mi,
   la la la la
   re2 r4 re,
   
   %68
   sol2 r
   mi'8 re mi re do4 mi
   fa fa, r2
   
   %71
   fa'8 mi fa mi re4 fa
   sol sol, r2
   mi' r
   
   %74
   la, r\mbreak
   fa' r
   r4 sol sol sol
   
   %77
   do,8 si do si do4 do,
   r4 sol'' sol sol
   do,8 si do si do4 do,
   
   %80
   r4 sol'' sol sol
   do,8 si do si do4 do
   fa8 mi fa mi fa4 do
   
   %83
   fa fa, r4 do'
   fa8 sol mi fa re4 do\mbreak
   fa,2 sol
   
   %86
   do,4 do' do do
   fa4 fa, r4 do'
   fa4 fa, r4 do'
   
   %89
   fa8 sol mi fa re4 do
   fa,2 sol
   do r4 do
   
   %92
   sol' sol ,sol sol
   do2 r\fermata

}

IIIbcn = \relative do {
   
   R1*9
   r4 do do do
   sol8 la si do re4 si\mbreak
   
   %12
   mi2 fad
   sol4 sol, si sol
   do2 la
   
   %15
   si mi
   fa mi4 do
   fa2 re
   
   %18
   mi fa
   r4 sol sol sol
   do,8 re mi fa sol4 mi
   
   %21
   la2 si\mbreak
   do4 mi, fa do
   sol'2 sol,
   
   %24
   do r
   R1*9
   r4 sol'\parenthesize \f sol sol\mbreak
   
   %35
   do,8 re mi fa sol4 mi
   la2 si
   do la
   
   %38
   si2. sol4
   la la, do la
   re, re' fad re
   
   %41
   sol8 la si sol do4 la
   si2. la4
   sold mi la do,
   
   %44
   re2 mi\mbreak
   la, r
   R1*7
   
   %53
   r4 mi' mi mi
   la,2 r
   r4 la' la la\mbreak
   
   %56
   re,2 r
   r4 re re re
   sol,8 la si do re4 si
   
   %59
   mi2 fad
   sol fa!
   mi r4 mi
   
   %62
   la2 sol
   fad r4 fad
   si, si' si si\mbreak
   
   %65
   mi,2 r4 mi
   la, la' la la
   re,2 r4 re
   
   %68
   sol,2 r
   mi' r
   fa r
   
   %71
   re r
   sol r
   mi r
   
   %74
   la r\mbreak
   fa r
   r4 sol sol sol
   
   %77
   do,2 r
   r4 sol' sol sol
   do,2 r
   
   %80
   r4 sol' sol sol
   do, do' do do
   fa,2 r4 do
   
   %83
   fa2 r4 do
   fa mi re do\mbreak
   fa2 sol
   
   %86
   do,4 do' do do
   fa,2 r4 do
   fa2 r4 do
   
   %89
   fa mi re do
   fa2 sol
   do, r4 do
   
   %92
   sol sol' sol sol
   do,2 r\fermata
   
}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s1*10
    s2 <_+>4 <6>
    <6>1
    s
    s2 <6+>
    <6> <6>
    s <6>
    <9>4 <8> <6>2
    <6>1
    s
    s2 s4 <6>
    <6>2 <6 5>
    <9>4 <6> s2
    <6 4> <3>
    s1*12
    <6>2 <6>
    s <6+>
    <6>1
    <9>2 <6>
    <_+ 7>1
    s2 <6>
    <6 4>4 <[5+] 3> s2
    <6 5>2 s4 <6>
    <6 5>2 <_+>
    s1*8
    s4 <_+> s2
    <_+>1
    s4 <_+> s2
    <_+>1
    s4 <_+> s2
    s <_+>4 <6>
    <6 5>2 <6 5>
    s <6>
    <_+ 7> s4 <_+ 7>
    s2 <6>
    <_+ 7> s4 <_+ 7>
    s1
    <_+ 7>2 s4 <_+ 7>
    s1
    <_+ 7>2 s4 <_+ 7>
    s1
    <6>
    s
    <_->
    s
    <_+ 7>
    s
    <5>
    s2 <7>
    s1
    s2 <7>
    s1
    s2 <7>
    s1*3
    s2 <6>
    <6 5>1
    s1*3
    s2 <6>
    <6 5>1

}


forma = {

    \time 2/2
    \key do\major
    \tempo 1 = 60
    s1*93
    \bar "||"

}

IIIfl = {
    %\notypeset
    <<\IIIfln \forma>>

}

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    <<\IIIvlIIn \forma>>

}


IIIvla = {
    \clef alto
    <<\IIIvlan \forma>>

}
IIIvc = {
    \clef tenor
    <<\IIIvcn \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IVfln = \relative do'' {

    do'4 si
    r8 r16 mi,
    do'4 si r8 r16 si

    %4
    dod4 re r8 r16 la
    sib4 la r8 r16 re,
    sib'4 la r8 r16 la

    %7
    si!4 do8.[sol16 la8. mi16]
    fa4 fa8.[mi16 fa8. sol16]
    mi8. re16 do4 r8 r16 mi

    %10
    fad4 sol r8 r16 sol
    do8.[si16 la8. si16 do8. re16]
    si8. la16 sol4 re'\mbreak

    %13
    re8.[do16 si8. do16 re8. si16]
    do8. si16 la4~la8. do16
    si8. la16 la4 sold

    %16
    la mi r8 r16 mi
    fad8. [sol16 la8. do16 si8. la16]
    sol8. fad16 mi4 r8 r16 sol

    %19
    la8.[si16 do8. mi16 re8. do16]
    si8. la16 sol4 sol
    sol fad4.\tr sol8

    %22
    sol4 sol4. sol8
    sol4 sol4. sol8
    sol2.

}


IVvlIn = \relative do'' {

    R2.*2
    r4 r8 r16 la re8. la16
    re,4 r8 r16 la' re8. la16

    %5
    re,4 r r
    r r8 r16 mi do'8. sol16
    si8. do16 re4 si

    %8
    do r r
    r8 r16 la sol8.[la16 si8. si16]
    fad8. sol16 la4 r

    %11
    r8 r16 re, si'8. si16 la8. la16\mbreak
    sold4 r r
    la r r

    %14
    r r si
    do r do
    do r r

    %17
    si r r
    la r r
    re8. do16 si4 si

    %20
    do do,2
    re8. si'16 do4 mi
    re8. re,16 mi4 mi

    %23
    re2.

}

IVvlIIn = \relative do'' {

    r4 r8 r16 si mi8. si16
    mi,4 r8 r16 si' mi8. si16
    mi,4 r r

    %4
    R2.
    r4 r8 r16 re la'8. re16
    re,4 mi r

    %7
    R2.
    r8 r16 sol mi8.[fa16 sol8. la16]
    la4 re, r

    %10
    r r8 r16 re la'8. fad16
    sol4 sol, r\mbreak
    si' r r

    %13
    do r r
    r r sold
    mi r8 r16 mi la4

    %16
    la r r
    sol r r
    re r r

    %19
    si' re, si
    la la2
    si8. re16 sol4 sol

    %22
    sol do, do
    si2.

}

IVvlan = \relative do' {

    la4 sold r8 r16 sold
    la4 sold r
    sol! fad r

    %4
    sol fad r
    sol fad r
    fa! mi r

    %7
    re'8. do16 si4 sol
    do~do8.[re16 mi8. do16]
    do4 si r

    %10
    la fad re
    sol r8 r16 sol fa!8. fa'16\mbreak
    mi4 r r

    %13
    mi r r
    r r mi
    mi r8 r16 mi la4

    %16
    fad r r
    mi r r
    re r r

    %19
    re r si
    la la2
    sol4 sol' mi

    %22
    sol mi do
    re2.

}

IVvcn = \relative do' {

   la4 sold r8 r16 sold
   la4 sold r
   sol! fad r

   %4
   sol fad r8 r16 fad
   sol4 fad r
   fa! mi r

   %7
   re'8. do16 si4 sol
   do~do8.[re16 mi8. do16]
   do4 si r

   %10
   la fad re
   sol r8 s16 sol fa!8. fa16\mbreak
   mi8.[fad16 sold8. la16 si8. sold16]

   %13
   la4~la8.[sol?16 fa?8. mi16]
   re8. re'16 mi4 mi,
   la r r

   %16
   red r r
   mi r8 r16 mi sol8. mi16
   fad4 r r

   %19
   sol r r
   R2.
   sol4 mi do

   %22
   si do do,
   sol'2.

}

IVbcn = \relative do {

   R2.*11
   mi4 r r
   la, r r

   %14
   r r mi'
   la, r r
   R2.

   %17
   mi'4 r r
   fad r r
   sol r r

   %20
   R2.
   sol4 mi do
   si do do,

   %23
   sol'2.

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*11
    <_+ 7>2.
    s
    s4 s <_+>
    s2.*3
    <6>2.
    s
    s
    s4 <6> s
    <6>

}


forma = {

    \time 3/4
    \key do\major
    \tempo 4 = 55
    s2.*23
    \bar "||"

}

IVfl = {
    %\notypeset
    <<\IVfln \forma>>

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
IVvc = {
    \clef tenor
    <<\IVvcn \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



Vfln = \relative do'' {

    R4.*7
    r16 re' si re si re
    la8 r r

    %10
    r16 re si re si re
    la8 r r
    r16 sol do si do re

    %13
    si8 r r
    r16 mi, la sol la si\mbreak
    sol8 sol sol

    %16
    sol do do
    do r16 la si8\noBeam
    sol la fad

    %19
    sol r r
    sol la fad
    sol r r

    %22
    R4.*4
    si4 lad8
    si4 lad8

    %28
    si r r
    la r r\mbreak
    R4.

    %31
    r8 si16 dod re si
    dod8 r r
    r8 la16 si do? la

    %34
    si8 r r
    R4.*2
    r16 sol la si do8\noBeam

    %38
    re si8. do16
    do8 r r
    R4.

    %41
    r16 sol la si do8\noBeam
    re si8. do16
    do8 r r

    %44
    R4.
    mi,8 sol do
    sol r r

}


VvlIn = \relative do'' {

    do16 do mi[mi] sol sol
    do8 do, do'
    r si16 la sol fa

    %4
    mi do mi sol la8\noBeam
    r16 si, re fad sol8\noBeam
    r16 fad la si do8\noBeam

    %7
    re,16 re fad[fad] la la
    si8 r r
    re,16 re fad[fad] la la

    %10
    si8 r r
    r16 re do re la re
    do8 r r

    %13
    r16 si la si fad sol
    la8 r r\mbreak
    r16 re, mi re mi re

    %16
    mi8 la la
    la r16 la sol8\noBeam
    R4.

    %19
    sol8 la fad
    sol mi la,
    si r r

    %22
    sol16 sol si[si] re re
    sol8.\noBeam fa16 mi re
    do do mi[mi] la la

    %25
    do8.\noBeam si16 la sol
    fad sol la fad sol mi
    fad sol la fad sol mi

    %28
    red mi fad sol la si
    do8 r16 la si fad\mbreak
    sol mi fad8[red]

    %31
    mi sol r
    r16 re dod re mi dod
    re8 fa r

    %34
    r16 re si do? re si
    do re mi fa sol mi
    la sol la do si la

    %37
    si8 r r
    R4.
    r16 do, mi fa sol mi

    %40
    la sol la do si la
    si8 r r
    R4.

    %43
    r16 mi, fa8[re]
    mi16 do re8[si]
    do16 do mi[mi] sol sol

    %46
    do8 r r

}

VvlIIn = \relative do'' {

    sol4 re'8
    mi4 fad8
    sol4 re8

    %4
    do4 mi8
    re4 re8
    do4 mi8

    %7
    la, r r
    re r r
    la r r

    %10
    re r r
    la' r r
    sol r r

    %13
    fad r r
    mi r r\mbreak
    sol r r

    %16
    do, mi mi
    re r16 re re8\noBeam
    re, mi re

    %19
    re' mi la,
    re do fad,
    re r r

    %22
    re4 la'8
    si4 si8
    mi, r r

    %25
    mi'8.\noBeam mi16 fad mi
    red mi fad red mi dod
    red mi fad red mi dod

    %28
    si dod red mi fad sol
    la8 r r\mbreak
    si, do si

    %31
    si r r
    dod r r
    la r r

    %34
    si r r
    sol r r
    fa'16 mi fa mi re mi

    %37
    re4 sol,8
    la sol re'
    mi r r

    %40
    do8. do16\noBeam re8
    re sol,\noBeam r
    R4.

    %43
    r16 do re8[si]
    do la sol
    sol16 sol do[do] mi mi

    %46
    mi8 r r\mbreak

}

Vvlan = \relative do' {

    mi4 re8
    sol4 la8
    si4 si8

    %4
    sol4 mi8
    sol4 re8
    fad4 sol8

    %7
    la r r
    sol r r
    re r r

    %10
    sol r r
    re r r
    sol r r

    %13
    si r r
    mi, r r\mbreak
    re r r

    %16
    sol mi la
    la r16 fad si8\noBeam
    si mi, la

    %19
    sol mi re
    re mi re
    re r r

    %22
    si4 la8
    re4 mi8
    la r r

    %25
    la mi la
    la fad r
    si r r

    %28
    fad r r
    fad r r\mbreak
    sol la fad

    %31
    sol r r
    sol r r
    fa? r r

    %34
    re r r
    mi r r
    do4 re8

    %37
    sol4 mi8
    fa sol sol,
    sol' r r

    %40
    fa8. mi16 re8
    sol r r
    R4.

    %43
    r16 sol la8[sol]
    sol fa re
    mi16 mi sol[sol] do do

    %46
    sol8 r r

}

Vvcn = \relative do' {

    do8. do16 si si
    mi8 mi, la
    sol8. la16 si8

    %4
    do16 mi do mi do8\noBeam
    si16 re si re si8\noBeam
    la do sol'

    %7
    fad r r
    sol r r
    fad  re16[re] fad fad

    %10
    sol8 r r
    r16 fad mi fad fad,8\noBeam
    mi r r

    %13
    r16 re' do re re,8\noBeam
    do r r\mbreak
    si'\noBeam do16 si do si

    %16
    do8 do la
    fad r sol
    si do re

    %19
    si do re
    si do re
    sol, r r

    %22
    sol4 fad8
    sol4 sold8
    la r r

    %25
    la4 la8
    si r r
    si r r

    %28
    si r r
    red r r\mbreak
    mi la, si

    %31
    mi mi, mi'
    la,8. si16 dod la
    re8 re, re'

    %34
    sol,8. la16 si sol
    do8 r r
    fa,4 fad8

    %37
    sol r r
    R4.
    do8.\noBeam re16 mi do

    %40
    fa mi fa8[fad]
    sol16 sol, fa? sol mi[mi']
    fa fa, sol8[sol']

    %43
    do, fa, sol
    do fa, sol
    do,\noBeam do'16 do do do

    %46
    do,8 r r

}

Vbcn = \relative do {

    do'4 si8
    mi,4 la8
    sol4 si,8

    %4
    do4 do'8
    si4 si,8
    la4 sol8

    %7
    fad r r
    sol r r
    fad r r

    %10
    sol r r
    fad' r r
    mi r r

    %13
    re r r
    do r r\mbreak
    si r r

    %16
    do4 la'8
    fad r sol
    si, do re

    %19
    si do re
    si do re
    sol, r r

    %22
    sol'4 fad8
    sol4 sold8
    la r r

    %25
    la4 la,8
    si r r
    si r r

    %28
    si' r r
    red, r r\mbreak
    mi la si

    %31
    mi, r r
    la r r
    re, r r

    %34
    sol r r
    do, r r
    fa4 fad8

    %37
    sol r r
    R4.
    do,8 r r

    %40
    fa4 fad8
    sol r r
    R4.

    %43
    do8 fa, sol
    do, fa, sol
    do\noBeam do16 do do do

    %46
    do8 r r

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6>8
    <6>4 <6+>8
    s4 <6>8
    s4 <6>8
    <6>4.
    <6+>4 <6 4>8
    <6 5>4.
    s4.*4
    <6>4.
    <6 _+>
    <6>
    <6>
    s4 <5>8
    <6 5>4.
    <6>8 <6> <_+>
    <6> <6> <_+>
    <6> <6> <_+>
    s4.*4
    <5>4 <6+>8
    <_+ 7>4.
    <_+>
    <_+>
    <7 5>
    s8 <6+ 5> <_+>
    s4.
    <7 _+>
    <_->
    <7>
    s4.*8
    s8 <6>4
    s8 <6>4
}


forma = {

    \time 3/8
    \key do\major
    \tempo 4. = 68
    s4.*21
    \bar ":..:"\break
    s4.*25
    \bar":|."

}

Vfl = {
    %\notypeset
    <<\Vfln \forma>>

}

VvlI = {
    <<\VvlIn \forma>>

}

VvlII = {
    <<\VvlIIn \forma>>

}


Vvla = {
    \clef alto
    <<\Vvlan \forma>>

}
Vvc = {
    \clef tenor
    <<\Vvcn \forma>>
}

Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 17)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.7
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \con

}

\paper {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

    \header {
        subtitle = \markup \larger "Sinfonia Undecima [autografo 1715]"
        composer = \markup {"A. Scarlatti (1660-1725)"}
    }

    \markup \huge {[1.] Spiritoso}

    \score {

        <<
            \new Staff  <<
                \set Staff.midiInstrument = #"recorder"
                \set Staff.instrumentName = \markup {Flauto}
                \Ifl \global
            >>

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.3"Primo]"}
                        \IvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.3"Secondo]"}
                        \IvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                    \Ivla\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                    \set Staff.midiInstrument = #"cello"
                    \Ivc\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso"\vspace #-0.3"continuo]"}
                    \set Staff.midiInstrument = #"harpsichord"
                    \Ibc\global
                >>
            >>

        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

    %\pageBreak

    \markup \huge {[2.] Lento}

    \score {

        <<
            \new Staff  <<
                \set Staff.midiInstrument = #"recorder"
                \IIfl \global
            >>

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IIvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IIvc\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"harpsichord"
                    \IIbc\global
                >>
            >>

        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

    %\pageBreak

    \markup \huge {[3.] All[egr]o}

    \score {

        <<
            \new Staff  <<
                \set Staff.midiInstrument = #"recorder"
                \IIIfl \global
            >>

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIIvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIIvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IIIvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IIIvc\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"harpsichord"
                    \IIIbc\global
                >>
            >>

        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

    %\pageBreak

    \markup \huge {[4.] Adagio}

    \score {

        <<
            \new Staff  <<
                \set Staff.midiInstrument = #"recorder"
                \IVfl \global
            >>

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IVvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IVvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IVvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IVvc\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"harpsichord"
                    \IVbc\global
                >>
            >>

        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

    %\pageBreak

    \markup \huge {[5.] All[egr]o}

    \score {

        <<
            \new Staff  <<
                \set Staff.midiInstrument = #"recorder"
                \Vfl \global
            >>

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \Vvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \Vvc\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"harpsichord"
                    \Vbc\global
                >>
            >>

        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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



