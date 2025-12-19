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



IobIn = \relative do'' {

    do4 sol do, r8 do'16 re
    mi8[mi16 fa sol8 si,] do4 sol
    do, r8 do'16 re mi8[mi16 fa sol8 mi]

    %4
    re4 r r r8 si16 do
    re8 [re16 mi fa8 re] mi4 sol,
    do,4 r sol''2~

    %7
    sol8[la16 sib la8 sol] \once\stemDown fa re, fa'4~
    fa8[sol16 la sol8 fa]\mbreak \once\stemDown mi8 do, sol''4\p
    mib8[re16 do re8 si] do sol lab'4

    %10
    sol8[fa16 mib fa8 re] mib re do4~
    do8[re16 mib fa8 re] mib re do4~
    do8[re16 mib fa8 re] mib la(sol fad)

    %13
    sol si,4 do8 sol la'(sol fad)
    sol re(do si) do[mi!16\f fa sol8 mi16 fa]
    sol8 do, re si do [mi16 fa sol8 mi16 fa]\mbreak

    %16 OOKK
    sol8 do, re si do4 r
    r2 r8 sol'16 fa mi4
    r2 r8 sol16 fa mi4

    %19
    r2 r8 sol16 fa mi4
    R1\mbreak
    r2 r8 sol16 fa mi4

    %22
    r2 r8 sol16 fa mi4
    r2 r8 do16 sib la4
    r2 r8 sol'16 fa mi4

    %25
    r8 do16 si? la4 r8 la'16 sol fad4
    r8 re16 do si4\mbreak r8 si'16 la sold4
    r8 mi16 re do4 r8 la'16 sol fad4

    %28
    R1*2
    r8 re16 do si4 r2
    r8 re16 do si4 r2

    %32
    r8 re16 do si4\mbreak r8 re16 do si4
    r8 sol'16 fa mi4 r8 mi16 re dod4

    %34
    r8 la'16 sol fad4 r8 fad16 mi red4
    r16 si' la sol fad4 sol2~
    sol fad~

    %37
    fad mi~
    mi fad4. red8
    si4 r r2

    %40
    R1*2
    sol'8\f[fad16 mi fad8 red] mi si do'4
    si8[la16 sol la8 fad] sol fad mi4~

    %44
    mi8[fad16 sol la8 fad]\mbreak sol8[sol16 la si8 sol16 la]
    si8 sol la fad sol8[sol16 la si8 sol16 la]
    si8 sol la fad sol4 r

    %47
    R1*6
    r2 la,4 mi
    la r8 la16 si do8[do16 re mi8 sold,]

    %55
    la4 mi do'8. si16 la4

    %56
    si16[do re mi] fa8 re do si la4~\mbreak
    la8 si16 do re8 do16 si do8 si la4~
    la8 fa' mi16 re do si do si la8 r4

    %59
    do16 re mi fa sol8 sol,16 sol la8 fa la4~
    la8 si16 do re8 do si la16 sol si4~
    si8 do16 re mi8 re do si16 la do4~

    %62
    do8 re16 mi fa8 mi re8. sol,16 sol4\mbreak
    r8 sol do4~do8 re16 mib fa8 re
    mib re do4~do8 re16 mib fa8 re

    %65
    mib sol, lab4~lab8 sol16 fa re'8 do
    si la16 sol re'8 fa mib re16 do re8. do16
    do4 lab sol8 do si fa'

    %68
    mib[re16 do] re8.\tr do16  do4 sol
    do, r8 do'16 re\mbreak

    %70
    mi8[mi16 fa sol8 si,] do4 sol
    do, r8 do'16 re mi8[mi16 fa sol8 mi16 fa]
    sol8 mi fa re mi[mi16 fa sol8 mi16 fa]

    %73
    sol8 mi fa re do4 sol
    do,1\fermata

}

IobIIn = \relative do'' {

    do4 sol do, r8 do'16 si
    do8[do16 re mi8 re] do4 sol
    do, r8 do'16 si do8[do16 re mi8 do]

    %4
    si4 r r r8 sol16 la
    si8[si16 do re8 si] do4 sol
    do, r mi'2~

    %7
    mi8[fa16 sol fa8 mi] \once\stemDown re re, re'4~
    re8[mi16 fa mi8 re]\mbreak \once\stemDown do do, sol''4\p
    mib8[re16 do re8 si] do sol lab'4

    %10
    sol8[fa16 mib fa8 re] mib re do4~
    do8[re16 mib fa8 re] mib re do4~
    do8[re16 mib fa8 re] mib la(sol fad)

    %13
    sol si,4 do8 sol la'(sol fad)
    sol re(do si) do[ do16\f re mi8 do16 re]
    mi8 mi, fa re mi[do'16 re mi8 do16 re]\mbreak

    %16
    mi8 mi, fa re mi4 r
    r2 r8 mi'16 re do4
    r2 r8 mi16 re do4

    %19
    r2 r8 mi16 re do4
    R1
    r2\mbreak r8 mi16 re do4

    %22
    r2 r8 mi16 re do4
    r2 r8 la16 sol fa4
    r2 r8 mi'16 re do4

    %25
    r8 la16 si do4 r8 fad16 mi re4
    r8 si16 do re4\mbreak r8 sold16 fad mi4
    r8 do16 re mi4 r8 fad16 mi re4

    %28
    R1*2
    r8 si16\p la sol4 r2
    r8 si16 la sol4 r2

    %32
    r8 si16 la sol4\mbreak  r8 si16 la sol4
    r8 mi'16 re do4 r8 dod16 si la4
    r8 fad'16 mi re4 r8 red16 dod si4

    %35
    r16 sol' fad mi si4 r2
    do1
    si2~si

    %38
    la~la
    sol4 r r2
    R1*2

    %42
    sol'8\f[fad16 mi fad8 red] mi si do'4
    si8[la16 sol la8 fad] sol fad mi4~

    %44
    mi8[fad16 sol la8 fad]\mbreak  sol8[mi16 fad sol8 mi16 fad]
    sol8 mi fad red mi[mi16 fad sol8 mi16 fad]
    sol8 mi fad red mi4 r

    %47
    R1*6
    r2 la,4 mi
    la r8 la16 sold la8[la16 si do8 si]

    %55
    la4 mi do'8. si16 la4

    %56
    si16[do re mi] fa8 re do si la4~\mbreak
    la8 si16 do re8 do16 si do8 si la4~
    la8 fa' mi16 re do si do si la8 r4

    %59
    do16 re mi fa sol8 sol,16 sol la8 fa la4~
    la8 si16 do re8 do si la16 sol si4~
    si8 do16 re mi8 re do si16 la do4~

    %62
    do8 re16 mi fa8 mi re8. sol,16 sol4\mbreak
    r8 sol do4~do8 re16 mib fa8 re
    mib re do4~do8 re16 mib fa8 re

    %65
    mib sol, lab4~lab8 sol16 fa re'8 do
    si la16 sol re'8 fa mib re16 do re8. do16
    do4 lab sol8 do si fa'

    %68
    mib[re16 do] re8.\tr do16 do4 sol
    do, r8 do'16 si\mbreak

    %70
    do8[do16 re mi8 re] do4 sol
    do, r8 do'16 si do8[do16 re mi8 do16 re]
    mi8 do re si do8[do16 re mi8 do16 re]

    %73
    mi8 do re si  do4 sol
    do,1\fermata

}


IvlIn = \relative do'' {

    do4 sol do, r
    r2 do'4 sol
    do, r r2

    %4
    sol'4 re sol, r
    r2 do'4 sol
    do, r mi'2~

    %7
    mi8[fa16 sol fa8 mi] \once\stemDown re re, re'4~
    re8[mi16 fa mi8 re]\mbreak \once\stemDown do do, sol''4\p
    mib8[re16 do re8 si] do sol lab'4

    %10
    sol8[fa16 mib fa8 re] mib re do4~
    do8[re16 mib fa8 re] mib re do4~
    do8[re16 mib fa8 re] mib la(sol fad)

    %13
    sol si,4 do8 sol la'(sol fad)
    sol re(do si) do[ do16\f re mi8 do16 re]
    mi8 mi, fa re mi[do'16 re mi8 do16 re]\mbreak

    %16
    mi8 mi, fa re do'4 r
    do,8\p do' si sol do do, mi do
    fa mi fa si, do re mi do

    %19
    re do si sol do re mi do
    fa la sol fa mi fa si, sol
    do la' fa sol\mbreak do,4  mi'

    %22
    r2 r8 sol16 fa mi4
    r2 r8 do16 sib la4
    r2 r8 sol'16 fa mi4

    %25
    r8 do16 si? la4 r8 la'16 sol fad4
    r8 re16 do si4\mbreak r8 si'16 la sold4
    r8 mi16 re do4 r8 la'16 sol fad4

    %28
    R1*2
    sol,,8\p la si sol re' sol la re,
    sol,4 r r2

    %32
    sol8 la si la\mbreak sol la si sol
    do4 r8 do la si dod la

    %34
    re4 r8 re si dod red si
    mi mi red si mi fad sol mi
    la la, la' la re re, re re

    %37
    sol sol, sol' sol\mbreak do do, do do
    fad fad fad fad si si, si si
    mi fad sol mi la sol la la,

    %40
    si' la si si, mi la red, red
    mi la red, red mi mi si si
    sol''8\f[fad16 mi fad8 red] mi si do'4
    si8[la16 sol la8 fad] sol fad mi4~

    %44
    mi8[fad16 sol la8 fad]\mbreak sol8[sol16 la si8 sol16 la]
    si8 sol la fad sol8[sol16 la si8 sol16 la]
    si8 sol la fad sol4 r

    %47
    R1*6
    r2 la,4 mi
    la, r r2

    %55
    la'4 mi la,8\p si do la
    sold si re sold, la si do si\mbreak
    la la' si mi, la, si do si

    %58
    la re' sold, mi la la, si sol?
    do re mi do fa sol la sol
    fad mi fad re sol la si la

    %61
    sold fad sold mi la si do si
    la sol? la fad sol fad sol sol,\mbreak
    do re mib re do do' re sol,

    %64
    do, re mib re do do' re sol,
    do, mib fa mib re mi fad re
    sol,la si sol do lab' fa sol

    %67
    do, mib fa si, do mib re sol,
    do lab' sol sol, do'4 sol

    %69
    do, r\mbreak
    do r do' sol
    do, r do' do,

    %72
    \once\stemUp do8 mi' fa re mi[mi16 fa sol8 mi16 fa]
    sol8 mi fa re do4 sol
    do,1\fermata

}

IvlIIn = \relative do'' {

    do4 sol do, r
    r2 do'4 sol
    do, r r2

    %4
    sol'4 re sol, r
    r2 do'4 sol
    do, r mi'2~

    %7
    mi8[fa16 sol fa8 mi] \once\stemDown re re, re'4~
    re8[mi16 fa mi8 re]\mbreak \once\stemDown do do, sol''4\p
    mib8[re16 do re8 si] do sol lab'4

    %10
    sol8[fa16 mib fa8 re] mib re do4~
    do8[re16 mib fa8 re] mib re do4~
    do8[re16 mib fa8 re] mib la(sol fad)

    %13
    sol si,4 do8 sol la'(sol fad)
    sol re(do si) do[ do16\f re mi8 do16 re]
    mi8 mi, fa re mi[do'16 re mi8 do16 re]\mbreak

    %16
    mi8 mi, fa re mi4 r
    do8\p do' si sol do do, mi do
    fa mi fa si, do re mi do

    %19
    re do si sol do re mi do
    fa la sol fa mi fa si, sol
    do la' fa sol\mbreak do,4  do'

    %22
    r2\mbreak r8 mi16 re do4
    r2 r8 la16 sol fa4
    r2 r8 mi'16 re do4

    %25
    r8 la16 si do4 r8 fad16 mi re4
    r8 si16 do re4\mbreak r8 sold16 fad mi4
    r8 do16 re mi4 r8 fad16 mi re4

    %28
    R1*2
    sol,,8\p la si sol re' sol la re,
    sol,4 r r2

    %32
    sol8 la si la\mbreak sol la si sol
    do4 r8 do la si dod la

    %34
    re4 r8 re si dod red si
    mi mi red si mi fad sol mi
    la la, la' la re re, re re

    %37
    sol sol, sol' sol\mbreak do do, do do
    fad fad fad fad si si, si si
    mi fad sol mi la sol la la,

    %40
    si' la si si, mi la red, red
    mi la red, red mi mi si si

    %42
    sol''8\f[fad16 mi fad8 red] mi si do'4
    si8[la16 sol la8 fad] sol fad mi4~

    %44
    mi8[fad16 sol la8 fad]\mbreak  sol8[mi16 fad sol8 mi16 fad]
    sol8 mi fad red mi[mi16 fad sol8 mi16 fad]
    sol8 mi fad red mi4 r

    %47
    R1*6
    r2 la,4 mi
    la, r r2

    %55
    la'4 mi la,8\p si do la
    sold si re sold, la si do si\mbreak
    la la' si mi, la, si do si

    %58
    la re' sold, mi la la, si sol?
    do re mi do fa sol la sol
    fad mi fad re sol la si la

    %61
    sold fad sold mi la si do si
    la sol? la fad sol fad sol sol,\mbreak
    do re mib re do do' re sol,

    %64
    do, re mib re do do' re sol,
    do, mib fa mib re mi fad re
    sol,la si sol do lab' fa sol

    %67
    do, mib fa si, do mib re sol,
    do lab' sol sol, do'4 sol

    %69
    do, r\mbreak
    do r do' sol
    do, r do' do,

    %72
    do8 do' re si do8[do16 re mi8 do16 re]
    mi8 do re si  do4 sol
    do,1\fermata

}

Ivlan = \relative do' {

    do'4 sol do, r
    r2 do'4 sol
    do, r r2

    %4
    sol'4 re sol, r
    r2 do'4 sol
    do, r mi8[sol16 fa mi8 sol16 fa]

    %7
    mi4. dod8 la[fa'16 mi re8 fa16 mi]
    re4. si8\mbreak sol mi'\p re si
    sol' mib lab re, sol mib do re

    %10
    sol, sol' lab si,! sol fa' sol mib
    lab sol fa si sol fa sol mib
    do sol' fa si, sol mib' mib re

    %13
    re re fa sol si, mib mib re
    re si' la sol sol4\f sol
    sol8 sol, la sol sol4 sol'\mbreak

    %16
    sol8 sol, la sol sol4 r
    do8\p do' si sol do do, mi do
    fa mi fa si, do re mi do

    %19
    re do si sol do re mi do
    fa la sol fa mi fa si, sol
    do la' fa sol\mbreak do,4  do

    %22
    r2 r8 sol'16 fa mi4
    r2 r8 do16 sib la4
    r2 r8 sol'16 fa mi4

    %25
    r8 do16 si? la4 r8 la'16 sol fad4
    r8 re16 do si4\mbreak r8 si'16 la sold4
    r8 mi16 re do4 r8 la'16 sol fad4

    %28
    R1*2
    sol,8\p la si sol re' sol la re,
    sol,4 r r2

    %32
    sol8 la si la\mbreak sol la si sol
    do4 r8 do la si dod la

    %34
    re4 r8 re si dod red si
    mi mi red si mi fad sol mi
    la la, la' la re re, re re

    %37
    sol sol, sol' sol\mbreak do do, do do
    fad fad fad fad si si, si si
    mi fad sol mi la sol la la,

    %40
    si' la si si, mi la red, red
    mi la red, red mi mi si si

    %42
    si' \f si do fad, sol si mi, fad
    sol si do red, si la si sol
    fad'4. red8\mbreak si4 mi

    %45
    mi8 si' do si si4 si
    si8 si do si si4 r
    R1*6

    %53
    r2 la4 mi
    la, r r2

    %55
    la'4 mi la,8\p si do la
    sold si re sold, la si do si\mbreak
    la la' si mi, la, si do si

    %58
    la re' sold, mi la la, si sol?
    do re mi do fa sol la sol
    fad mi fad re sol la si la

    %61
    sold fad sold mi la si do si
    la sol? la fad sol fad sol sol,\mbreak
    do re mib re do do' re sol,

    %64
    do, re mib re do do' re sol,
    do, mib fa mib re mi fad re
    sol,la si sol do lab' fa sol

    %67
    do, mib fa si, do mib re sol,
    do lab' sol sol, do'4 sol

    %69
    do, r\mbreak
    do r do' sol
    do, r do' do,

    %72
    do8 sol' la sol sol sol sol sol
    sol sol la sol do4 sol
    do,1\fermata

}

Ialton = \relative do' {

    \autoBeamOff

    R1*15
    r2 r4 do8 do
    sol' sol sol16[fa] mi[re] do8. do16 do8 do

    %18
    la' la la la la sol sol do,
    fa fa fa la16[fa] fa8 mi r sol
    la[sol16 fa] si8[la16 sol] do8[si16 la sol8] fa

    %21
    mi[re16 do] re4\tr \mbreak do r
    R1*8
    re4 sol la8 si do si16[la]

    %31
    si8. la16 sol4 r2
    r4 r8 sol\mbreak sol fa! fa fa
    fa mi r la la sol sol sol

    %34
    sol fad r si si la la la
    la sol r4 r sol8 sol
    sol fad16[sol] la[sol] fad[mi] fad2~

    %37
    fad8[mi16 fad sol fad mi re]\mbreak mi2~
    mi8[fad16 sol la sol fad mi] red8 fad4 la8
    sol4 r r8 fad fad fad

    %40
    fad?4. fad8 sol mi r fad!
    sol mi fad fad mi4(red)
    mi r r2

    %43
    R1*4
    si'4. si8 sold[la] si la16[sold]
    la8. mi16 mi4 la fad

    %49
    re8 re r4 r8 mi la4~
    la8 la la la sold mi fa!4~\mbreak
    fa16[la sol fa] mi4~mi16[sol fa mi] re4~

    %52
    re16 [fa mi re] do8 mi mi mi mi la
    sold la sold4\tr la r
    R1*15

    %69
    sol4 sol16[fa] mi[re]\mbreak
    mi8. re16 do4 r2
    sol'4 sol16[fa] mi[re] mi8. fa16 sol8 sol

    %72
    sol fa16 mi fa8 re do4 r
    R1*2

}

ItestoI = \lyricmode {

    Con -- fi -- tebor _ ti -- bi Do -- mine, _  in to -- to cor -- de me -- o;

    in con -- si -- lio _ jus -- to -- rum, et con -- gre -- ga -- ti -- o - ne.

    Con -- fi -- tebor _ ti -- bi Do -- mine, _  in to -- to to -- to cor -- de  in to -- to cor -- de  me -- o, in to -- to cor -- de  me -- o;

    in con -- si -- li -- o jus -- to - - - - rum, et con -- gre -- ga -- ti -- o -- ne, et con -- gre -- ga -- ti -- o -- ne.

    Ma -- gna o -- pe -- ra Do -- mini, _ ex -- qui -- sita _ in om -- nes vo -- lun -- tates _ e - - jus,

    in om -- nes vo -- lun -- tates _ e -- jus. Ma -- net in sae -- culum _

    ma -- net in sae -- culum _  in sae -- culum _ sae -- culi. _

}

Itenoren = \relative do' {

    \autoBeamOff

    R1*21
    r4 sol8 sol do do do si16[la]
    sol8. sol16 sol8 sol la la la la

    %24
    la sol sol sol do do do16[si] la[sol]
    la8 la la la re re re16[do] si[la]
    si8 si r si\mbreak mi mi mi16[re] do[si]

    %27
    do8 do r la re re re16[do] si[la]
    si8 do4 si16[la] si8 do4 si16[la]
    si8 mi re16[do] si[la] si8 la16[sol] la4\tr

    %30
    sol r r2
    sol4 si la8 si do si16(la)
    si8. la16 sol4\mbreak r r8 si

    %33
    sol sol sol mi' dod dod r dod
    la la la fad' red red r red
    si si si la sol4 sol

    %36
    r do8 do do si16[do] re[do] si[la]
    si2~\mbreak si8[la16 si do si la sol]
    la2~la8[sol16 la si la sol fad]

    %39
    sol8 mi' mi mi mi2~
    mi4 red mi8[red16 do] si8 si
    mi8 red?16[do] si8 la sol[fad16 mi] fad4

    %42
    mi r r2
    R1*3
    r2 mi'4. mi8

    %47
    red8[mi] fad mi16[red] mi8. si16 si4
    mi dod la8 la r4
    re si sol8 sol r mi'

    %50
    fa fa si, si si si r do\mbreak
    si4~si16[re do si] la4~la16[do si la]
    sold4 la8 do do do do do

    %53
    si do si4 la r
    R1
    r4 r8 mi do'8. si16 la4

    %56
    si16[do] re[mi] fa8 re do si la4~\mbreak
    la8 si16[do re8] do16[si] do8 si la4~
    la8[fa' mi16 re] do[si] do[si] la8 r4

    %59
    do16[re] mi[fa] sol8 sol,16 sol la8 fa la4~
    la8[si16 do ]re8 do si[la16 sol] si4~
    si8[do16 re mi8 re] do[si16 la] do4~

    %62
    do8[re16 mi fa8 mi]re8. sol,16 sol4\mbreak
    r8 sol do4~do8[re16 mib] fa8 re
    mib[re] do4~do8[re16 mib fa8 re]

    %65
    mib[sol,] lab4~lab8[sol16 fa] re'8[do]
    si[la16 sol] re'8[fa] mib re16[do] re8. do16
    do4 lab sol8[do] si fa'

    %68
    mib[re16 do] re8.\tr do16 do4 r
    mi!4 mi16[re] do[si]\mbreak
    do8. sol16 sol4 r2

    %71
    mi'4 mi16[re] do[si] do8. re16 mi8 mi
    mi re16 do re8 si do4 r
    R1*2

}

ItestoII = \lyricmode {

    Con -- fi -- tebor _ ti -- bi Do -- mine, _  in to -- to cor -- de me -- o;

    in con -- si -- li -- o jus -- to -- rum,  in con -- si -- li -- o jus -- to -- rum,

    et con -- gre -- ga -- ti -- o -- ne, et con -- gre -- ga -- ti -- o - - - - - ne, et con -- gre -- ga -- ti -- o -- ne.

    Con -- fi -- tebor _ ti -- bi Do -- mine, _  in to -- to to -- to cor -- de, in to -- to cor -- de me -- o, in to -- to cor -- de me -- o;

    in con -- si -- li -- o jus -- to - rum, et con -- gre -- ga -- ti -- o -- ne, et con -- gre -- ga -- ti -- o - ne.

    Ma -- gna o -- pe -- ra Do -- mini, _ ex -- qui -- sita _  ex -- qui -- sita _ in om -- nes vo -- lun -- tates _

    in om - - nes in om -- nes vo -- lun -- tates _ e -- jus;

    con -- fes -- sio _ et ma  gni -- fi -- cen -- ti -- a o -- pus e -- jus o -- pus e -- jus;

    et jus -- ti -- tia _ ejus _ ma -- net In sae - - - - culum _ in sae -- culum _ sae - - - - - - culum _ sae -- cu -- li

    in sae -- culum _  sae - culi. _

    Ma -- net in sae -- culum _ ma -- net in sae -- culum _  in sae -- culum _ sae -- culi. _

}

Ibasson = \relative do {

    \autoBeamOff

    R1*20
    r2 r4 do8 do
    sol' sol sol16[fa] mi[re] do8. do16 do8 re

    %23
    mi mi mi mi fa4. fa8
    fa8 mi r4 r do8 do
    fa fa fa16[mi] re[do] re8 re re re

    %26
    sol sol sol16[fa] mi[re]\mbreak mi8 mi r mi
    la la la16[sol] fad[mi] fad8 la4 fad8
    sol la4 sol16[fad] sol8 la4 sol16[fad]

    %29
    sol8 do fad, re sol sol, re'4
    sol, r r2
    sol4 sol' fad8 sol la sol16(fad)

    %32
    sol8. sol,16 sol4\mbreak r r8 sol
    do do do do la la r la
    re re re re si si r si

    %35
    mi mi red red mi4 mi
    r la8 la la sol16[la] si[la] sol[fad]
    sol2~\mbreak sol8[fad16 sol la sol fad mi]

    %38
    fad2~fad8[mi16 fad sol fad mi red]
    mi4 r r2
    r8 si' si si mi, la red,4

    %41
    mi8 la red, red mi mi si4
    mi r r2
    R1*4

    %47
    r2 mi4. mi8
    dod[re] mi re16[dod] re8. re16 re4
    sol fa mi8 do8 r do

    %50
    re re red red mi mi r la\mbreak
    sold4 sol fad fa
    mi la,8 la' la la la la

    %53
    mi la mi4 la, r
    R1*15
    do4 do8 sol'\mbreak

    %70
    do8. do,16 do4 r2
    do4 do8 sol' do8. do,16 do8 do
    do do16 do fa8 sol do,4 r

    %73
    R1*2

}

ItestoIII = \lyricmode {

    Con -- fi -- tebor _ ti -- bi Do -- mine, _  in to -- to to -- to cor -- de me -- o;

    in con -- si -- li -- o jus -- to -- rum,  in con -- si -- li -- o jus -- to -- rum,

    et con -- gre -- ga -- ti -- o - - - - - - - - ne, et con -- gre -- ga -- ti -- o -- ne.

    Con -- fi -- tebor _ ti -- bi Do -- mine, _  in to -- to to -- to cor -- de, in to -- to cor -- de me -- o, in to -- to cor -- de me -- o;

    in con -- si -- li -- o jus -- to - rum, et con -- gre -- ga -- ti -- o -- ne, et con -- gre -- ga -- ti -- o -- ne.

    Ma -- gna o -- pe -- ra Do -- mini, _ ex -- qui -- sita _ in om -- nes vo -- lun -- tates _

    in om -- nes vo -- lun -- ta -- tes  in om -- nes vo -- lun -- tates _  e -- jus.

    Ma -- net in sae -- culum _ ma -- net in sae -- culum _  in sae -- culum _ sae -- culi. _

}

Ibcn = \relative do {

    do'4 sol do, r
    r2 do'4 sol
    do, r r2

    %4
    sol'4 re sol, r
    r2 do'4 sol
    do, r dod8[mi16 re dod8 mi16 re]

    %7
    dod4. la8 re[re16 do? si8 re16 do]
    si4. sol8\mbreak do do'^\p_\markup\italic "Senza Organi" si sol
    do do, fa sol mib do fa si,

    %10
    do do' fa, sol do, re mib do
    fa do re sol, do re mib do
    fa do re sol, do do' do, do'

    %13
    si sol re mib sol, do' do, do'
    \once\stemDown  si sol, la si do4\f\tu do
    do8 do fa sol do,4 do\mbreak

    %16
    do8 do fa sol do,4 r
    R1*4
    r2 do8 re mi do

    %22
    sol' sol, sol' mi do do, do' re
    mi re mi do fa mi fa si,
    do re mi re do re mi do

    %25
    fa sol fa mi re mi fad re
    sol la sol fa\mbreak mi fad sold mi
    la si la sol fad mi fad re

    %28
    sol do, re re, sol do re re,
    \once\stemUp sol do' fad, re sol sol, re' [re,]
    sol4 r r2

    %31
    r8 sol sol' sol, re' sol la re,
    sol, la si la\mbreak sol la si sol
    do4 r8 do la si dod la

    %34
    re4 r8 re si dod red si
    mi mi red si mi fad sol mi
    la la, la' la re re, re re

    %37
    sol sol, sol' sol\mbreak do do, do do
    fad fad, fad' fad si si, si si
    mi fad sol mi la sol la la,

    %40
    si' la si si, mi la red, red
    mi la red, red mi mi si si
    \once \stemUp mi, sol' la si mi, sol la red,

    %43
    mi mi' la, si mi, fad sol mi
    si' mi, si' si,\mbreak mi, mi' mi, mi'
    mi, mi' la, si mi, mi' mi, mi'

    %46
    mi, mi' la, si  mi, mi' sol mi
    si mi si' si, mi fad sold mi
    dod si la dod re dod re re,

    %49
    sol sol' sol, fa' mi re do la
    re re red red  mi mi, r la'\mbreak
    sold sold sol sol fad fad fa fa

    %52
    mi mi, la la' la, si do la
    mi' la mi mi, la'4 mi
    la, r r2

    %55
    la'4 mi la, r
    R1*12
    r2 do'4 sol

    %69
    do, r\mbreak
    do r do' sol
    do, r do' do,

    %72
    do8 do fa sol do, do do do
    do do fa sol do4 sol
    do,1\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*5
    s2 <6 5>
    s8 <7> s4 s2
    <6 5>4. <7>8 s2
    s1*14
    s2 s4 s8 <7>
    <6 4>1
    s1*3
    s4 s8 <7 _+> s4 s8 <7 _+>
    s1*2
    s2 s4 s8 <_+>
    s2 s4 s8 <7->
    s2 <_+>4 s8 <7>
    s2 <_+>4 s8 <7>
    s1
    <7>2 <7>
    <7> <7>
    <7> <7 _+>
    s <6+ 5>
    <5 4>4 <3+> s2
    s2 s4 <_+>
    s2 s4 s8 <7>
    s4 s8 <_+> s2
    <5+ 4>4 <7> s2
    s1*2
    <_+>2 <_+>
    s <_+>
    s4 <6 4> s2
    <5>4 <6 5> <_+> s8 <6->
    <7->4 <6> <7> <6>
    <7 _+>1
    <_+>4 <_+> s2

}


forma = {

    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key do\major
    \tempo 2 = 55
    s1*68
    \set Score.measureLength = #(ly:make-moment 2 4)
    s2
    \set Score.measureLength = #(ly:make-moment 4 4)
    s1*5
    \bar "|."
    %\mark\markup "D.C."

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

Ialto = {
    \new Voice = "confitebor1"
    <<\Ialton \forma>>
}

Itenore = {
    \new Voice = "confitebor2"
    <<\Itenoren \forma>>
}

Ibasso = {
    \new Voice = "confitebor3"
    \clef bass
    <<\Ibasson \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}





IIobIn = \relative do'' {

    do16 la mi' do la' r
    sold, mi la mi si' mi,
    do' la mi' do la' r

    %4
    sold, mi la mi si' mi,
    do' la mi' do la' r
    fa, re la' fa re' r

    %7
    si sol do sol re' sol,
    mi'8 fa re
    do4 r8

    %10
    la16 la' mi dod la mi
    fa re fa la re fa
    sol, sol' re si sol re

    %13
    mi do mi sol do mi\mbreak
    do la mi' do la' r
    sold, mi si' sold re' r

    %16
    do8 re si
    la4 r8
    R4.*31

    %49
    do16 \f sol mi' do sol' r
    dod, la mi' dod la' r

    %51
    re, la fa' re la' r\mbreak
    red, si mi si fad' si,
    sol'8 la fad

    %54
    mi4 r8
    R4.*28
    si16\f sol re' si sol' r

    %84
    fad re sol re la' re,
    si'8 do la
    sol si,16\tr la si do

    %87
    re8 la si
    do16 mi re8 do
    si16 la sol8 r

    %90
    re' re16 re re re
    fa!8 mi re\mbreak
    do la16 sold la8

    %93
    re16 si do8(si16\tr) la
    la4 r8
    mi' mi16 mi mi mi

    %96
    mi8 re dod
    re si16 lad si8
    mi16 dod re8(dod16\tr) si

    %99
    re16\f si fad' re si' r
    lad, fad si fad dod' fad,
    re'8 mi dod

    %102
    si4 r8\mbreak
    R4.*27
    dod16\p la mi' dod sol' r

    %131
    R4.
    si,16 sol re' si fa' r
    R4.

    %134
    la,16 fa do'? la fa' r
    R4.*7

    %142
    do16\p la mi' do la' r
    sold, mi la mi si' mi,
    do' la mi' do la' r

    %145
    sold, mi la mi si' mi,
    do'8 re si
    do16\f la do mi la mi

    %148
    do la do mi la mi
    do8 re si
    la4.\fermata

}

IIobIIn = \relative do'' {

    la4.(
    si)
    do(

    %4
    re)
    mi(
    fa)~

    %7
    fa8 mi re
    do re si
    do4 r8

    %10
    dod4.(
    re)
    si(

    %13
    do?)\mbreak
    mi8(do4)
    si4.
    la8 si sold

    %17
    la4 r8
    R4.*31

    %49
    sol16\f mi do' sol mi' r
    la, mi dod' la mi' r
    fa fa, re' la fa' r\mbreak

    %52
    la8 sol fad
    mi fad? red
    mi4 r8

    %55
    R4.*28
    sol,16\f re si' sol re' si

    %84
    la'8 sol fad
    sol la fad
    sol si,16\tr la si do

    %87
    re8 la si
    do16 mi re8 do
    si16 la sol8 r

    %90
    re' re16 re re re
    fa!8 mi re\mbreak
    do la16 sold la8

    %93
    re16 si do8(si16\tr) la
    la4 r8
    mi' mi16 mi mi mi

    %96
    mi8 re dod
    re si16 lad si8
    mi16 dod re8(dod16\tr) si

    %99
    re4.\f
    mi8 re dod
    si dod? lad

    %102
    si4 r8\mbreak
    R4.*27
    la16\p mi dod' la mi' r

    %131
    R4.
    sol,16 re si' sol re' r
    R4.

    %134
    fa,16 do la' fa do' r
    R4.*7

    %142
    la4.\p(
    re)
    do(

    %145
    re)
    la8 si sold
    la16\f mi la do mi do

    %148
    la mi la do mi do
    la8 si sold
    la4.\fermata

}


IIvlIn = \relative do'' {

    do16 la mi' do la' r
    sold, mi la mi si' mi,
    do' la mi' do la' r

    %4
    sold, mi la mi si' mi,
    do' la mi' do la' r
    fa, re la' fa re' r

    %7
    si sol do sol re' sol,
    mi'8 fa re
    do4 r8

    %10
    la16 la' mi dod la mi
    fa re fa la re fa
    sol, sol' re si sol re

    %13
    mi do mi sol do mi\mbreak
    do la mi' do la' r
    sold, mi si' sold re' r

    %16
    do8 re si
    la4 r8
    R4.*5

    %23
    sold16\p mi la mi si' mi,
    dod' la' mi dod la mi\mbreak
    fa re fa la re fa

    %26
    sol, sol' re si sol re
    mi do mi sol do mi
    do sol mi' do sol' r

    %29
    si, sol re' si sol' r
    re si sol' re si' r
    R4.

    %32
    la
    si,16 sol re' si sol' re
    mi4 r8

    %35
    R4.*14
    do16 \f sol mi' do sol' r
    dod, la mi' dod la' r

    %51
    re, la fa' re la' r\mbreak
    red, si mi si fad' si,
    sol'8 la fad

    %54
    mi4 r8
    R4.*2
    sol,16\p mi si' sol mi' r

    %58
    red, si mi si fad' si,
    sol' mi si' sol mi' r
    red, si mi si fad' si,

    %61
    sol' mi si' sol mi' r
    R4.*2
    do16 la mi' do la' r\mbreak %fine p. 17

    %65
    R4.*2
    si,16\p sol re' si sol' r
    r8 r si,

    %69
    mi4.
    fad~
    fad

    %72
    sol~
    sol
    la

    %75
    re,16 la fad' re la' r
    do,8 la fad
    sol re si

    %78
    do la re
    si16 re' sol re si' sol\mbreak
    do,8 si la

    %81
    si fad sol
    do, re re
    si'16\f sol re' si sol' r

    %84
    fad re sol re la' re,
    si'8 do la
    sol si,16\tr la si do

    %87
    re8 la si
    do16 mi re8 do
    si16 la sol8 r

    %90
    re' re16 re re re
    fa!8 mi re\mbreak
    do la16 sold la8

    %93
    re16 si do8(si16\tr) la
    la4 r8
    mi' mi16 mi mi mi

    %96
    mi8 re dod
    re si16 lad si8
    mi16 dod re8(dod16\tr) si

    %99
    re16\f si fad' re si' r
    lad, fad si fad dod' fad,
    re'8 mi dod

    %102
    si fad si,\mbreak
    si'' la16 sol fad mi
    red dod si8 fad'

    %105
    sol16 la si8 sol
    sol fad r
    si fad4\tr

    %108
    sol16 fad mi8 r
    la mi4\tr
    fad16 mi re8 fad

    %111
    sol4.~
    sol8 fa!16 mi fa8
    mi16 re do8 r

    %114
    sol' fa16 mi re do\mbreak
    la'8 sol16 fa mi re
    si'8  la16 sol fa mi

    %117
    do'8 si16 la sol8
    do, mi(re\tr)
    do16 sol mi' do sol' mi

    %120
    do'4 r8
    R4.*5\mbreak
    si,16\p sol do sol re' sol,

    %127
    mi' do fa do sol' do,
    la'4 r8
    mi16 do sol' mi do' r

    %130
    R4.
    re,16 la fa' re la' r
    R4.

    %133
    mi16 do sol' mi do' r
    R4.
    re,16 la fa' re la' r

    %136
    R4.\mbreak
    do,16 la mi' do la' r
    R4.*4

    %142
    do,16\p la mi' do la' r
    sold, mi la mi si' mi,
    do' la mi' do la' r

    %145
    sold, mi la mi si' mi,
    do'8 re si
    do16\f la do mi la mi

    %148
    do la do mi la mi
    do8 re si
    la4.\fermata

}

IIvlIIn = \relative do'' {

    la4.(
    si)
    do(

    %4
    re)
    mi(
    fa)~

    %7
    fa8 mi re
    do re si
    do4 r8

    %10
    dod4.(
    re)
    si(

    %13
    do?)\mbreak
    mi8(do4)
    si4.
    la8 si sold

    %17
    la4 r8
    R4.*5
    re4.\p(

    %24
    dod)\mbreak
    re
    si(

    %27
    do?)
    sol16 mi do' sol mi' r
    sol, re si' sol re' r

    %30
    si sol re' si sol' r
    R4.
    fad

    %33
    re16 si sol' re si' si,
    do4 r8
    R4.*14

    %49
    sol16\f mi do' sol mi' r
    la, mi dod' la mi' r
    fa fa, re' la fa' r\mbreak

    %52
    la8 sol fad
    mi fad? red
    mi4 r8

    %55
    R4.*2
    mi,16\p si sol' mi si' r
    la8 sol fad

    %59
    mi16 si sol' mi si' r
    la8 sol fad
    mi16 si sol' mi si' r

    %62
    R4.*2
    la16 mi do' la mi' r\mbreak
    R4.*2

    %67
    sol,16\p re si' sol re' r
    r8 r sol,
    do4.~

    %70
    do
    re~
    re

    %73
    mi~
    mi
    la,16 fad re' la fad' r

    %76
    do8 la fad
    sol re si

    %78
    do la re
    si16 si' re si sol' re\mbreak
    do8 si la

    %81
    si fad sol
    do, re re
    sol16\f re si' sol re' si

    %84
    la'8 sol fad
    sol la fad
    sol sol, la

    %87
    si fa? sol
    la fa re
    sol16 re si sol si re

    %90
    sol re si sol si re
    sold8 la si\mbreak
    la do, la

    %93
    fa' mi mi
    la16 mi do la do mi
    la mi do la do mi

    %96
    fad8 sold lad
    si re, si
    sol' fad fad

    %99
    re'4.\f
    mi8 re dod
    si dod? lad

    %102
    si fad si,\mbreak
    si'' la16 sol fad mi
    red dod si8 fad'

    %105
    sol16 la si8 sol
    sol fad r
    si fad4\tr

    %108
    sol16 fad mi8 r
    la mi4\tr
    fad16 mi re8 fad

    %111
    sol4.~
    sol8 fa!16 mi fa8
    mi16 re do8 r

    %114
    sol' fa16 mi re do\mbreak
    la'8 sol16 fa mi re
    si'8  la16 sol fa mi

    %117
    do'8 si16 la sol8
    do, mi(re\tr)
    sol,16 mi do' sol mi' do

    %120
    sol'4 r8
    R4.*5
    sol,8\p la si

    %127
    do re mi
    fa4 r8
    do16 sol mi' do sol' r

    %130
    R4.
    la,16 fa re' la fa' r
    R4.

    %133
    do16 sol mi' do sol' r
    R4.
    la,16 fa re' la fa' r

    %136
    R4.\mbreak
    la,16 mi do' la mi' r
    R4.*4

    %142
    la,4.\p(
    re)
    do(

    %145
    re)
    la8 si sold
    la16\f mi la do mi do

    %148
    la mi la do mi do
    la8 si sold
    la4.\fermata

}

IIvlan = \relative do' {

    mi4.~
    mi~
    mi4 do8

    %4
    si4.
    la~
    la4 fa'8

    %7
    re mi fa
    sol la sol
    mi16 re mi fa sol mi

    %10
    mi4 dod8
    la16 mi' fa sol la fa
    re4 si8

    %13
    sol16 re' mi fa sol mi\mbreak
    mi4.~
    mi

    %16
    mi8 fa mi
    mi4 r8
    R4.*5

    %23
    si8\p do re
    mi4 dod8\mbreak
    la16 mi' fa sol la fa

    %26
    re4 si8
    sol16 re' mi fa sol mi
    mi8 mi mi

    %29
    re re re
    re re re
    R4.

    %32
    do8 do do
    sol sol sol
    sol4 r8

    %35
    R4.*14
    mi'8\f mi mi
    mi mi dod

    %51
    la la re\mbreak
    fad mi red
    si' do si

    %54
    sol4 r8
    R4.*2
    si,8\p si si

    %58
    si4.
    si8 si si
    si4.

    %61
    si8 si si
    sold sold sold
    sold? sold sold

    %64
    mi mi mi\mbreak
    re re re
    re re re

    %67
    re\p re re
    R4.
    la'8 la la

    %70
    la4 r8
    si8 si si
    si4 r8

    %73
    do do do
    do4 r8
    re re re

    %76
    do' la fad
    sol re si
    do la re

    %79
    si sol sol\mbreak
    do' si la
    si fad sol

    %82
    do, re re,
    re'\f re re
    re4.

    %85
    re8 mi re
    re sol la

    %87
    si fa? sol
    la fa re
    sol16 re si sol si re

    %90
    sol re si sol si re
    sold8 la si\mbreak
    la do, la

    %93
    fa' mi mi
    la16 mi do la do mi
    la mi do la do mi

    %96
    fad8 sold lad
    si re, si
    sol' fad fad

    %99
    fad\f fad re
    dod si lad
    fad' sol fad

    %102
    re fad si,\mbreak
    si' la16 sol fad mi
    red dod si8 fad'

    %105
    sol16 la si8 sol
    sol fad r
    si fad4\tr

    %108
    sol16 fad mi8 r
    la mi4\tr
    fad16 mi re8 fad

    %111
    sol4.~
    sol8 fa!16 mi fa8
    mi16 re do8 r

    %114
    sol' fa16 mi re do\mbreak
    la'8 sol16 fa mi re
    si'8  la16 sol fa mi

    %117
    do'8 si16 la sol8
    do, mi(re\tr)
    mi sol do

    %120
    mi,4 r8
    R4.*8
    sol8 sol mi

    %130
    R4.
    fa8 fa fa
    R4.

    %133
    sol8 sol mi
    R4.
    fa8 fa fa

    %136
    R4.\mbreak
    mi8 mi mi
    R4.*4

    %142
    mi4.\p~
    mi~
    mi4 do8

    %145
    si4 mi8
    mi fa mi
    mi\f mi mi

    %148
    mi mi mi
    mi fa mi
    do4.\fermata

}

IIalton = \relative do' {

    \autoBeamOff
    R4.*16
    r8 r la'
    mi mi fa

    %19
    fa mi mi16 la
    sold la si8 do
    si mi, mi16 mi

    %22
    la8. la16 la la
    sold8 mi r
    sol!4.\mbreak

    %25
    fa16 mi fa8 r
    fa4.
    mi16 re mi8 r

    %28
    mi4.
    fa
    sol

    %31
    mi16[re mi fa] sol8
    mi mi4\tr
    re r8

    %34
    sol[(la16 sol)] fa[(mi)]
    fa4.~
    fa16[la sol fa mi re]

    %37
    mi4.~\mbreak
    mi16[fa sol la si do]
    re,4.~

    %40
    re16[mi fa sol la si]
    do8 do, sol'
    mi16[re mi fa sol8]

    %43
    re[mi fa]
    mi16[re mi fa sol8]
    re [mi fa]

    %46
    mi fa re
    do4 do'8
    mi, fa re

    %49
    do4 r8
    R4.*52
    r8 r fad\mbreak

    %103
    si la16[sol] fad[mi]
    red dod si8 fad'
    sol16[la si8] sol

    %106
    sol fad r
    si fad4\tr
    sol16[fad] mi8 r

    %109
    la mi4\tr
    fad16[mi] re8 fad
    sol4.~

    %112
    sol8 fa!16[mi] fa8
    mi16 re do8 r

    %114
    sol' fa16 mi re do\mbreak
    la'8 [sol16 fa mi re]
    si'8  [la16 sol fa mi]

    %117
    do'8 si16 la sol8
    do, mi[(re\tr)]
    do4 r8

    %120
    mi fa16 sol la si
    do8 si16 la sol8
    la8 re,4\tr

    %123
    do r8
    R4.
    do8 mi do\mbreak

    %126
    sol'4 sol8
    sol[fa] mi
    fa mi re

    %129
    mi16[re] do8 sol'
    mi16 re dod8 sol'
    fa re fa

    %132
    re16 do si8 fa'
    mi do r
    la'4 la8

    %135
    la4.~
    la8[sold16 fad sold8]\mbreak
    la4 mi8

    %138
    fa4.~
    fa8[mi] re
    do[mi la]

    %141
    si sold4\tr
    la r8
    sold4.

    %144
    la
    si
    la8 si[sold]

    %147
    la4 r8
    R4.*3

}

IItestoI = \lyricmode {

    Me -- mo -- riam _ fecit _ mi -- ra -- bilium _ _ su -- orum, _ mi -- ra -- bi -- lium _ su -- orum, _

    mi -- seri - cors mi -- seri - cors  et mi -- se -- ra -- tor et jus -- tus.

    Es -- cam de - - -  dit ti -- men - - - -  tibus _ se, ti -- men --  tibus _ se.

    Fi -- de -- li -- a om -- nia _ man -- da -- ta e -- jus, con -- fir -- mata _ con -- fir -- mata _ in sae -- culum _ sae -- culi, _

    fac -- ta in ve -- ri -- ta - - te et ae -- qui -- ta -- te,  fac -- ta in ve -- ri -- ta -- te et ae -- qui -- ta -- te.

    Re -- demp -- ti -- o -- nem  mi -- sit po -- pulo _  su -- o; man -- davit _ in ae -- ter -- num

    man -- davit _ in ae -- ter -- num tes -- ta -- men - tum tes -- ta -- men -- tum su -- um,

    tes -- ta -- men -- tum su -- um.

}

IItenoren = \relative do' {

    \autoBeamOff

    R4.*16
    r8 r mi
    do do re

    %19
    re do do16 do
    si do re8 la
    sold sold do16 do

    %22
    do8. do16 do do
    si8 sold r
    mi'4.\mbreak

    %25
    re16 do re8 r
    re4.
    do16 si do8 r

    %28
    do4.
    re
    si

    %31
    do16[si do re] mi8
    do do4\tr
    si r8

    %34
    R4.
    do8[(re16 do)] si[(la)]
    si4.~

    %37
    si16[re do si la sol]\mbreak
    la4.~
    la16[si do re mi fa]

    %40
    sol,8[la16 si do re]
    mi8 mi re
    do16[si do re mi8]

    %43
    si [do re]
    do16[si do re mi8]
    si[do re]

    %46
    do re si
    do4 mi8
    do re si

    %49
    do4 r8
    R4.*36
    si8 si16\tr[la si do]

    %87
    re8 la si
    do16 mi re8 do
    si16 la sol8 r

    %90
    re' re16 re re re
    fa!8  mi re\mbreak
    do la16 sold la8

    %93
    re16 [si] do8[(si16\tr)] la
    la4 r8
    mi' mi16 mi mi mi

    %96
    mi8 re dod
    re si16 lad si8
    mi16 [dod] re8[(dod16\tr)] si

    %99
    si4 r8
    R4.*24
    sol8 si sol

    %125
    do4 do8\mbreak
    re[do] si
    mi re do

    %128
    re do si
    do sol r
    r r la

    %131
    la16 la la8 la
    si16[la] sol8 sol
    sol16 sol sol8 sol

    %134
    la16[sol] fa8 r
    fa'4 fa8
    si,4.\mbreak

    %137
    mi8[re] do
    r re la
    si4.

    %140
    la8[do mi]
    fa si,4\tr
    la r8

    %143
    si4.
    do
    re

    %146
    do8 re[si]
    la4 r8
    R4.*3

}

IItestoII = \lyricmode {

    Me -- mo -- riam _ fecit _ mi -- ra -- bilium _ _ su -- orum, _ mi -- ra -- bi -- lium _ su -- orum, _

    mi -- seri - cors mi -- seri - cors  et mi -- se -- ra -- tor et jus -- tus.

    Es -- cam de - - -  dit ti -- men - - - -  tibus _ se, ti -- men --  tibus _ se.

    Ut det il -- lis he -- redi - tatem _ gen -- tium; _ o -- pera _ manu - um e -- jus ve -- ritas _ et ju -- di -- ci -- um,

    o -- pera _ manu - um e -- jus ve -- ritas _ et ju -- di -- ci -- um.

    Re -- demp -- ti -- o -- nem  mi -- sit po -- pulo _ po -- pulo _ su -- o; man -- davit _ in ae -- ter -- num

    man -- davit _ in ae -- ter -- num tes -- ta -- men - tum tes -- ta -- men - tum su -- um,

    tes -- ta -- men -- tum su -- um.

}

IIbasson = \relative do {

    \autoBeamOff

    R4.*53
    mi8 si'8[la]
    sol fad mi

    %56
    red8. dod16 si8
    mi4.
    fad

    %59
    sol
    la
    si8 si, r

    %62
    si' si16[la] sol[fad]
    mi re do8 si
    do la r\mbreak

    %65
    la' la16[sol] fad[mi]
    re do si8 la
    si sol r

    %68
    si'16[la sol fad] mi[re]
    do8[mi la]
    do16[si la sol fad mi]

    %71
    re8[fad si]
    re16[do si la sol fad]
    mi8[sol do]

    %74
    mi16[re do si la sol]
    fad[mi] re8 r
    do'[la] fad

    %77
    sol[re] si
    do la re
    si sol r\mbreak

    %80
    do'[si] la
    si fad sol
    do,16 mi re4\tr

    %83
    sol, r8
    R4.*39
    do8 mi do

    %124
    sol'4 fa8
    mi[re] do\mbreak
    si la sol

    %127
    do do 4
    fa8 sol sol,
    do do r

    %130
    r r dod
    re16 mi fa8 re
    sol sol, si

    %133
    do16 re mi8 do
    fa fa, r
    re'4 re8

    %136
    mi4 re8\mbreak
    do[si] la
    r fa' re

    %139
    sold4.
    la4 la,8
    re mi4

    %142
    la, r8
    mi'4.
    la,

    %145
    mi'
    la,8 re[mi]
    la,4 r8

    %148
    R4.*3

}

IItestoIII = \lyricmode {

    Me -- mor e -- rit in sae -- culum _ tes -- ta -- men -- ti su -- i.

    Vir -- tu -- tem o -- perum _ su -- orum, _ vir -- tu -- tem o -- perum _ su -- orum _

    annun -- ti -- a - - - - - - bit annun - tia -- bit po -- pulo _ su -- o, annun -- ti -- a -- bit po -- pulo _ su -- o.

    Re -- demp -- ti -- o -- nem  mi -- sit po -- pulo _ mi -- sit po -- pulo _ su -- o; man -- davit _ in ae -- ter -- num

    man -- davit _ in ae -- ter -- num tes -- ta -- men - - tum tes -- ta -- men - tum su - um,

    tes -- ta -- men -- tum su -- um.

}

IIbcn = \relative do {

    la8 r16 la' do, la
    mi'8 mi mi
    la, r16 la' do, la

    %4
    mi'8 mi mi
    la, r16 la' do, la
    re8 r16 re' fa, re

    %7
    sol8 sol sol
    do, fa sol
    do,16 si do re mi do

    %10
    la'8 la, la
    re16 dod re mi fa re
    sol8 sol, sol

    %13
    do16 si do re mi do\mbreak
    la8 r16 la' do, la
    mi'8 r16 mi' sold, mi

    %16
    la8 re, mi
    la, r16 la' mi do
    la8 la la

    %19
    la la la
    mi' mi mi
    mi mi16 re do si

    %22
    la8 red red
    mi mi mi
    la la, la\mbreak

    %25
    re16 dod re mi fa re
    sol8 sol, sol
    do16 si do re mi do

    %28
    do8 r16 do' mi, do
    sol'8 r16 sol si, sol
    sol'8 r16 sol si, sol

    %31
    do4 r8
    fad fad fad
    sol sol, sol

    %34
    do do do
    fa fa fa
    sol sol sol

    %37
    do, do do\mbreak
    fa fa fa
    si, si si

    %40
    si la sol
    do16 re mi8 si
    do4.

    %43
    si8 la sol
    do4.
    si8 la sol

    %46
    do fa sol
    do,16 re mi re do8
    do' fa, sol

    %49
    do, r16 do' mi, do
    la8 r16 la' dod, la
    re8 r16 re' fa, re\mbreak

    %52
    si8 si si
    mi la, si
    mi si' la

    %55
    sol fad mi
    red8. dod16 si8
    mi r16 mi' sol, mi

    %58
    si8 si si
    mi r16 mi' sol, mi
    si8 si si

    %61
    mi r16 mi' sol, mi
    mi,8 mi mi
    mi mi mi

    %64
    la la la\mbreak
    fad fad fad
    fad? fad fad

    %67
    sol sol sol
    sol sol sol
    la4 r8

    %70
    la la la
    si4 r8
    si si si

    %73
    do4 r8
    do do do
    re re re

    %76
    do' la fad
    sol re si
    do la re

    %79
    si sol sol\mbreak
    do' si la
    si fad sol

    %82
    do, re re,
    sol r16 sol' si, sol
    re'8 re re

    %85
    sol do, re
    sol,4 r8
    R4.*12

    %99
    si8 si si
    fad' fad fad
    si, mi fad

    %102
    si fad si,\mbreak
    r8 r fad'
    si16 fad red' si red, si

    %105
    mi si sol' mi lad, mi'
    re si fad' re si' fad
    red si red fad si red,

    %108
    mi si' mi si sol mi
    dod la dod mi la dod,
    re la' re la fad re

    %111
    si sol si re sol si,
    si sol si re sol si,
    do mi sol do sol mi

    %114
    do8 re mi\mbreak
    fa16 sol la8 si
    sol16 la si8 do

    %117
    la si do
    la sol sol,
    do do do

    %120
    do4 r8
    do re mi
    fa sol sol,

    %123
    do mi do
    sol sol' fa
    mi re do\mbreak

    %126
    si la sol
    do do, do'
    fa sol sol,

    %129
    do mi re
    dod la dod
    re fa re

    %132
    sol sol, si
    do mi do
    fa fa, fa'

    %135
    re re, re'
    mi, mi' re\mbreak
    do si la

    %138
    re fa re
    sold sold, sold'
    la, la' la,

    %141
    re mi mi,
    la r16 la' do, la
    mi'8 r16 mi' sold, mi

    %144
    la,8 r16 la' do, la
    mi8 r16 mi' sold, mi
    la8 re mi

    %147
    la, la la
    la la la
    la' re, mi

    %150
    la,4.\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    <_+>
    s
    <_+>
    s
    s
    <7>
    s
    s
    <_+>
    s4.*4
    <_+>4.
    s4 <_+>8
    s4.*2
    <6 4>8 <5 3>4
    <_+>4.
    s
    s8 <7 5>4
    <_+>4.
    <7 _+>
    s4.*7
    <7 5>4.
    s4.*3
    <7>4.
    <7>
    <7>
    <7>
    <6>
    s
    s
    s4 <7>8
    s4.
    s4 <7>8
    s4.*4
    <_+>4.
    s
    <_+>
    s4.*5
    <_+>4.
    s
    <_+>
    s
    <_+>
    s4.*7
    <6+>4.
    <5>
    <6>
    <5>
    <6>
    <_+>
    s4.*24
    <_+>4.
    s4.*3
    <_+>4.
    s4 <7>8
    s4.*6
    s4 <6 4->8
    s4.*11
    s4 <6 4>8
    <6>4.
    s
    s
    s8 <6 4> <5 3>
    s4.*7
    <5 4>8 <3+>4
    s4.
    s
    <7>
    s
    s8 <_+>4
    s4.
    <_+>
    s
    <_+>

}


forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key do\major
    \tempo 2 = 45
    s4.*150
    \bar "|."
    %\mark\markup "D.C."

}

IIobI = {
    <<\IIobIn \forma>>

}

IIobII = {
    <<\IIobIIn \forma>>

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
    \new Voice = "memoriam1"
    <<\IIalton \forma>>
}

IItenore = {
    \new Voice = "memoriam2"
    <<\IItenoren \forma>>
}

IIbasso = {
    \new Voice = "memoriam3"
    \clef bass
    <<\IIbasson \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}





IIIobIn = \relative do'' {

    R1*9
    fa,4 fa8. fa16 fa8.[fa16 fa8. fa16]
    fa8.[fa16 fa8. fa16] fa8.[fa16 fa8. fa16]

    %12
    la [la la la la la la la] sol[sol sol sol sol sol sol sol]
    sib[sib sib sib sib sib sib sib] la[la la la la la la la]
    la[la la la la la la la]\mbreak si[si si si si si si si]

    %15
    dod2\fermata r
    R1*3
    re,4 re8. re16 re8.[re16 re8. re16]
    re8.[re16 re8. re16] sib' [sib sib sib sib sib sib sib]\mbreak

    %21
    sib sib sib sib la la la la la[la la la la la la la]
    sol4\fermata r r2
    R1*10

}

IIIobIIn = \relative do'' {

    R1*9
    fa,4 fa8. fa16 fa8.[fa16 fa8. fa16]
    fa8.[fa16 fa8. fa16] fa8.[fa16 fa8. fa16]

    %12
    fa16[fa fa fa fa fa fa fa] fa fa fa fa mi mi mi mi
    sol[sol sol sol sol sol sol sol] sol sol sol sol fa fa fa fa
    fa [fa fa fa fa fa fa fa]\mbreak fa [fa fa fa fa fa fa fa]

    %15
    mi2\fermata r
    R1*3
    re4 re8. re16 re8.[re16 re8. re16]
    re8.[re16 re8. re16] fa fa fa fa sol sol sol sol\mbreak

    %21
    fa[fa fa fa fa fa fa fa] fa[fa fa fa fa fa fa fa]
    mi4\fermata r r2
    R1*10

}


IIIvlIn = \relative do'' {

    R1*6
    fa2\p sol
    sib la

    %9
    sol4 fa mi2\fermata
    fa,4 fa8. fa16 fa8.[fa16 fa8. fa16]
    fa8.[fa16 fa8. fa16] fa8.[fa16 fa8. fa16]

    %12
    la [la la la la la la la] sol[sol sol sol sol sol sol sol]
    sib[sib sib sib sib sib sib sib] la[la la la la la la la]
    la[la la la la la la la]\mbreak si[si si si si si si si]

    %15
    dod2\fermata re\p
    mi sol
    fa mib

    %18
    re4 sol dod,2\fermata
    re,4 re8. re16 re8.[re16 re8. re16]
    re8.[re16 re8. re16] sib' [sib sib sib sib sib sib sib]\mbreak

    %21
    sib sib sib sib la la la la la[la la la la la la la]
    sol4\fermata r8 fa' fa mi16 re mi8 sol
    sol fa16 mi fa8 la la sol16 fa sol8 sib

    %24
    sib[la16 sol la8 sol16 fa] do'8. do,16 do8 sol'
    mi re16 do re8.\tr do16 do4 r8 do
    fa mib16 re mib8 mib\mbreak mib re16 do re8 re

    %27
    sol fa16 mi? fa8 fa fa mi16 re mi8 do
    sib'4. la16 sol la4. sol16 fa
    sol4. fa16 mi fa8. do16 do8 do'

    %30
    la sol16 fa sol8.\tr fa16 fa4 r
    sib,4.\p la16 sol la4. sol16 fa
    sol8 sol sol sol la2\fermata

}

IIIvlIIn = \relative do'' {

    R1*6
    fa2\p~fa\mbreak
    sol fa

    %9
    re do\fermata
    fa,4 fa8. fa16 fa8.[fa16 fa8. fa16]
    fa8.[fa16 fa8. fa16] fa8.[fa16 fa8. fa16]

    %12
    fa16[fa fa fa fa fa fa fa] fa fa fa fa mi mi mi mi
    sol[sol sol sol sol sol sol sol] sol sol sol sol fa fa fa fa
    fa [fa fa fa fa fa fa fa]\mbreak fa [fa fa fa fa fa fa fa]

    %15
    mi2\fermata re'\p~
    re dod
    re sol,4 la

    %18
    fa sol la2\fermata
    re,4 re8. re16 re8.[re16 re8. re16]
    re8.[re16 re8. re16] fa fa fa fa sol sol sol sol\mbreak

    %21
    fa[fa fa fa fa fa fa fa] fa[fa fa fa fa fa fa fa]
    mi4\fermata r sol'2
    la sib

    %24
    sol8[fa16 mi fa8 la] sol4 r8 re
    do4 si do r
    do2\mbreak sib

    %27
    re do4. la'8
    la4 sol2 fa4~
    fa mi do4. sol'8

    %30
    fa4 mi fa la,\p~
    la8 sol16 fa sol4~sol8 fa16 mi fa4~
    fa8[mi16 re mi8 mi] fa2\fermata

}

IIIvlan = \relative do' {

    R1*6
    do2\p~do\mbreak
    mi do

    %9
    si sol\fermata
    fa'4 fa8. fa16 fa8.[fa16 fa8. fa16]
    fa8.[fa16 fa8. fa16] fa8.[fa16 fa8. fa16]

    %12
    re16[re re re re re re re] sol,[sol sol sol sol sol sol sol]
    mi'[mi mi mi mi mi mi mi] la,[la la la la la la la]
    re[re re re re re re re]\mbreak  re[re re re re re re re]

    %15
    la2\fermata la'\p~
    la4. mi8 mi4. dod8
    la2 sib4 do

    %18
    la sib mi,2\fermata
    re'4 re8. re16 re8.[re16 re8. re16]
    re8.[re16 re8. re16] re16 re re re do do do do\mbreak

    %21
    do[do do do do do do do] re[re re re re re re re]
    sol,4\fermata r8 fa' do do do do
    do do do do do do do do

    %24
    do do do do do do do si
    sol' sol sol sol mi4 r
    fa2~\mbreak fa

    %27
    sol~sol4. fa8
    do do do do do do do do
    do do do do fa fa fa mi

    %30
    do do do do do do do do
    do do do do do do do do
    do do do do fa,2\fermata

}

IIIalton = \relative do' {

    \autoBeamOff
    R1*6
    fa2 sol\mbreak
    sib la

    %9
    sol4 fa mi2\fermata
    r4 fa8. fa16 fa8. do16 do8. la'16
    la8. fa16 fa8. do'16 do8. fa,16 fa4

    %12
    la(sol8) fa fa4 mi8. mi16
    sib'8. sib16 la8. sol16 sol8. fa16 fa4
    la la\mbreak si2

    %15
    mi,\fermata re
    mi sol
    fa mib

    %18
    re4 sol dod,2\fermata
    r4 re8. re16 fa8. re16 re8. la'16
    la8. fa16 fa4 sib2~\mbreak

    %21
    sib4 la la2
    sol4\fermata  r8 fa fa mi16 [re] mi8 sol
    sol fa16 [mi] fa8 la la [sol16 fa] sol8[sib]

    %24
    sib[la16 sol la8 sol16 fa] do'8. do,16 do8 sol'
    mi re16 [do] re8.\tr do16 do4 r8 do
    fa mib16 [re] mib8 mib\mbreak mib re16 [do] re8 re

    %27
    sol fa16 [mi?] fa8 fa fa mi16 [re] mi8 do
    sib'4. la16 [sol] la4. sol16 [fa]
    sol4. fa16 [mi] fa8. do16 do8 do'

    %30
    la sol16 [fa] sol8.\tr fa16 fa4 r
    R1*2

}

IIItestoI = \lyricmode {

    Sanc - - - - - tum et ter -- ri -- bi -- le ter -- ri -- bi -- le ter -- ri -- bi -- le  no -- men e -- jus,

    ter -- ri -- bi -- le ter -- ri -- bi -- le  no -- men e -- jus.

    Sanc - - - - - - tum et ter -- ri -- bi -- le ter -- ri -- bi -- le  no -- men e -- jus.

    I -- ni -- ti -- um sa -- pien -- ti -- ae est ti -- mor Do - mini, _

    est ti -- mor Do -- mini, _  i -- ni -- ti -- um sa -- pien -- ti -- ae,

    i -- ni -- ti -- um sa -- pien -- ti -- ae est ti -- mor Do - - - - mini _ est ti -- mor Do -- mini. _

}

IIItenoren = \relative do' {

    \autoBeamOff

    R1*9
    r4 do8. do16 do8. la16 la8. fa'16
    fa8. do16 do8. fa16 fa8. la,16 la4

    %12
    re4. re8 sol,4 sol8. mi'16\mbreak
    mi8. mi16 mi8. mi16 la,8. la16 la4
    la re\mbreak re2

    %15
    dod\fermata r
    R1*3
    r4 la8. la16 re8. la16 la8. fa'16

    %20
    fa8. re16 re4 re sol,\mbreak
    do2 re
    mi4\fermata r r2

    %23
    R1*10

}

IIItestoII = \lyricmode {

    et ter -- ri -- bi -- le ter -- ri -- bi -- le ter -- ri -- bi -- le  no -- men e -- jus,

    ter -- ri -- bi -- le ter -- ri -- bi -- le  no -- men e -- jus.

    et ter -- ri -- bi -- le ter -- ri -- bi -- le  no - men e -- jus.

}

IIIbasson = \relative do {

    \autoBeamOff

    R1*9
    r4 fa8. fa16 la8. fa16 fa8. do'16
    do8. la16 la8. la16 la8. fa16 fa4

    %12
    si,4. si8 do4 do8. do16
    dod8. dod16 dod8. dod16 re8. re16 re4
    sib! sib\mbreak sold2

    %15
    la\fermata r
    R1*3
    r4 re8. re16 re8. re16 re8. re16

    %20
    re8. re16 re4 re mi\mbreak
    fa2 si,
    do4\fermata r r2

    %23
    R1*10

}

IIItestoIII = \lyricmode {

    et ter -- ri -- bi -- le ter -- ri -- bi -- le ter -- ri -- bi -- le  no -- men e -- jus,

    ter -- ri -- bi -- le ter -- ri -- bi -- le  no -- men e -- jus.

    et ter -- ri -- bi -- le ter -- ri -- bi -- le  no - men e -- jus.

}

IIIbcn = \relative do {

    fa4_\markup {\italic "Tutti gli Organi soli e" \dynamic f} fa8. fa16 fa4 r16 fa fa16. fa32
    mi8.[mi16 re8. re16] do4 r16 do do16. do32
    sib8.[sib16 la8. la16] sol4 r16 fa fa16. fa32

    %4
    mi8.[mi16 re8. re16] do2
    do''16[do do do do do do do] fa,[fa fa fa fa fa fa fa]
    si,[si si si si si si si] do2\fermata_\markup\column\italic { "2 Org[ani]"\vspace #-0.2"soli e Bassi" }^\p

    %7
    fa8 fa fa fa do do do do\mbreak
    do do do do fa fa fa fa
    si, si si si do2\fermata _\markup\column\italic { "Tutti gli"\italic \vspace #-0.2 "Org[ani]"}^\f

    %10
    fa4 fa8. fa16 fa8.[fa16 fa8. fa16]
    fa8.[fa16 fa8. fa16] fa8.[fa16 fa8. fa16]
    si,[si si si si si si si] do[do do do do do do do]

    %13
    dod[dod dod dod dod dod dod dod] re[re re re re re re re]
    sib![sib sib sib sib sib sib sib]\mbreak sold[sold sold sold sold sold sold sold]
    la2\fermata _\markup {\italic "1 Org[ano]  e Bas[si]"\dynamic p} re8 re re re

    %16
    la la la la la la la la
    re re re re re re do do
    do do sib sib la2\fermata_\markup\column\italic {\italic "Org[ani]"\vspace #-0.2"soli"}^\f

    %19
    re4 re8. re16 re8.[re16 re8. re16]
    re8.[re16 re8. re16] re16 re re re mi mi mi mi\mbreak
    fa[fa fa fa fa fa fa fa] si,[si si si si si si si]

    %22
    do4\fermata_\markup {\italic "Org[ano] solo e Bassi" \dynamic p} r8 fa do do do do
    do do do do do do do do
    do do do do do do do si

    %25
    do do sol sol do do sib? sib
    la la la la\mbreak sib sib sib sib
    si si si si do do do do

    %28
    do do do do do do do do
    do do do do fa fa fa mi
    fa fa do do fa fa fa fa

    %31
    do do do do do do do do
    do do do do fa,2\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*5
    <6 5>1
    s2 <5 4>
    <7 3> s
    <6>4 <6 5> s2
    s1
    s
    <7>2 <5 4>4 <3>
    <7>2 <5 4>4 <3>
    <7>2 <7 5>
    <_+>1
    <5 4>2 <7 _+>
    s <6 4 2->4 <6>
    <6 4 2> <6> <_+>2
    s1
    s2 s4 <6 5>
    s2 <7>
    s <6 4>
    <6 5>4 <6 4> <7 6> <7 5>
    s <6 4> <3>2
    s1
    <6>4 <6 5-> <5 4->4 <3>
    <6> <6 5> <5 4> <3>8 <6 4>
    <7 6> 4 <5> <6 5> <4>
    <5 4> <3> s2
    s1
    <7 6>4 <5> <6 5> <4>
    <5 4> <3>

}


forma = {

    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 2 = 35
    s1*21\break\once \override Score.RehearsalMark.extra-offset = #'(0 . -2)
    \mark\markup\larger "And[ant]e molto"
    \tempo 2 = 50
    s1*11
    \bar "|."
    %\mark\markup "D.C."

}

IIIobI = {
    <<\IIIobIn \forma>>

}

IIIobII = {
    <<\IIIobIIn \forma>>

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

IIIalto = {
    \new Voice = "sanctum1"
    <<\IIIalton \forma>>
}

IIItenore = {
    \new Voice = "sanctum2"
    <<\IIItenoren \forma>>
}

IIIbasso = {
    \new Voice = "sanctum3"
    \clef bass
    <<\IIIbasson \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}





IVvlIn = \relative do'' {

    r8 la re4~re8 fa, mi la
    fa re fa'4~fa8 la, sol do
    la fa fa'4~fa8 re mi si

    %4
    dod la la'4~la8 dod, re la
    sib sol sol'4~sol8 sib, do? sol
    la fa re'4~re8 mib dod sol'

    %7
    fad do? si fa'? mi? sib la mi'
    re la sold re' dod mi la4~
    la8 re, mi dod\mbreak re re, re'4~

    %10
    re8 fa, sol mi re4 r
    R1*14
    r8 mi' la4~la8 do, si mi

    %26
    do mi, la4~la8 do, si mi
    do la r4 r2\mbreak
    R1*16

    %44
    r8 la' re4~re8 mib dod sol'
    fad do si fa'? mi sib la mi'
    re la sold re' do mi la4~\mbreak

    %47
    la8 re, mi dod re re, re'4~
    re8 fa, mi dod' re2\fermata

}

IVvlan = \relative do' {

    fa4 r8 fa fa re dod dod
    la la r la' la fa mi mi
    do do r la' sib sib si si

    %4
    mi, dod r fad re re fad fad
    re sib r mi do? do mi mi
    do la r la' sib sib mi, dod'

    %7
    la fad re si la' mi do la
    fa' re si sold mi'4 r8 mi
    fa la sib mi,\mbreak fa4 r8 fa

    %10
    fa re mi dod re4 r
    R1*14
    do4 r8 do' do la sold sold

    %26
    mi4 r8 do do la sold sold
    mi4 r r2\mbreak
    R1*16

    %44
    fa'4 r8 la sib sib mi, dod'
    la fad re si sol' mi do la
    fa' ?re si sold mi'4 r8 mi\mbreak

    %47
    fa la sib mi, fa4 r8 fa
    fa re dod mi fa2\fermata

}

IValton = \relative do' {

    \autoBeamOff

    R1*11
    r2 mi4 sold
    la8 mi la4~la8 do, si mi

    %14
    do4 mi8 la la4 sol
    fa2 sol8 [fa sol mi]\mbreak
    fa [sol la fa] mi4 mi8 mi

    %17
    fa re la' la sib[la sol fa]
    mi4~mi16 [mi fa sol] la8[sol fa mi]
    re4~re16[re mi fa] sol8[fa mi re]

    %20
    do4~do16[do re mi] fa8[sol] la sib
    do8[sib16 la sol8] fa mi[re] do4
    r8 do fa4~\mbreak fa8 sol16 fa mi8 mi

    %23
    fa do sol'4~sol8 la16 sol fad8 fad
    sol re la'4~la8 si16 la sold8 sold
    la4 r r2

    %26
    R1
    mi4 sold la8 mi la4~\mbreak
    la8 do, si mi do4 mi8 la

    %29
    la4 sol fa2
    mi8[fa] sol mi la re, r4
    sold4 si mi,2

    %32
    sold8[la] si sold la mi r4
    r2 r4 la8 la\mbreak
    sib4 sib8 sib sib[la] sol[fa]

    %35
    mi8 mi sol sol la4 la8 la
    la[sol] fa[mi] re re sol4
    sol2. fa8[mi]

    %38
    fa[re] sib'4 sold la
    fad sol? mi fa?\mbreak
    re mi dod8[mi] la sol

    %41
    fa4 mi re8 re8
    sib'4~ sib la2 sol4~
    sol fa8 fa mi4. mi8

    %44
    re4 r r2
    R1*4

}

IVtestoI = \lyricmode {

    In -- tel -- lectus _ bo -- nus om -- ni -- bus fa -- ci -- en - - - - - tibus _ e -- um.

    Lau - da - - - - - - tio _ e -- jus ma -- net in sae -- culum _ sae -- cu -- li, in sae -- culum _ sae -- cu -- li,

    in sae -- culum _ sae -- cu -- li.

    In -- tel -- lectus _ bo -- nus om -- ni -- bus fa -- ci -- en - -  - tibus _ e -- um, fa -- ci -- en -  tibus _ e -- um.

    Lau - da -- tio _ e -- jus ma -- net, lau - da -- tio _ e -- jus ma -- net in sae - - - - - - - - - - - - culum _ sae -- cu -- li,

    in sae - - culum _ sae -- cu -- li.

}

IVtenoren = \relative do' {

    \autoBeamOff

    R1*9
    r2 la4 dod
    re8 la re4~re8 fa, mi la

    %12
    fa4 la8 re re2
    do si8 [la] sold4
    la8[si] do re mi4 mi

    %15
    r re8 fa mi[re] dod4\mbreak
    re8[mi fa re] dod4 dod8 dod
    re la r4 r re8 re

    %18
    mi[re do? sib] la4~la16[la sib do]
    re8[do sib la] sol4~sol16[sol la sib]
    do8[sib la sol] fa[do'] do sib

    %21
    la[sib] do[re] do4 do
    r r8 la\mbreak re re16 re sol,8 sol
    la4 r8 sib mib mib16 mib la,8 la

    %24
    sib4 r8 do fa fa16 fa si,8 si
    do4 r r2
    R1*3

    %29
    la4 dod re8 la re4~
    re8 fa, mi la fa4 la8 re
    re2 do?

    %32
    si8[do] re si do la dod re
    mi[re] dod mi la,4 la\mbreak
    r re8 re mi4 mi8 mi

    %35
    mi[re] do[sib] la la do do
    re4 re8 re re[do] sib[la]
    sol4 sol8 sol dod4. dod8

    %38
    la4 r8 re re4 do?~
    do sib2 la4~\mbreak
    la sol~sol8[dod] mi mi

    %41
    re4 dod re r8 fa
    mi2 re
    dod4 re8 re re4 dod

    %44
    re r r2
    R1*4

}

IVtestoII = \lyricmode {

    In -- tel -- lectus _ bo -- nus om -- ni -- bus fa -- ci -- en - - - - tibus _ e -- um, fa -- ci -- en - - - tibus _ e -- um.

    Lau - da - - - - - tio _ e -- jus ma -- net in sae -- culum _ sae -- cu -- li, in sae -- culum _ sae -- cu -- li,

    in sae -- culum _ sae -- cu -- li.

    In -- tel -- lectus _ bo -- nus om -- ni -- bus fa -- ci -- en - -  tibus _ e -- um, fa -- ci -- en -- tibus _ e -- um.

    Lau - da -- tio _ e -- jus ma -- net, lau - da -- tio _ e -- jus ma -- net in sae -- culum _ in sae - - - - culum _ sae -- cu -- li,

    in sae - - culum _ sae -- cu -- li.

}

IVbasson = \relative do {

    \autoBeamOff

    R1*13
    r2 la'4 dod
    re8 la re4~re8 fa, mi la\mbreak

    %16
    fa4 re8 re la'4 la,8 la
    re re r4 r sib'8 sib
    do[sib la sol] fa4~fa16[fa sol la]

    %19
    sib8[la sol fa] mi4~mi16[mi fa sol]
    la8[sol fa mi] re[mi] fa sol

    %21
    la[sol] la[si] do4 do,
    r r8 fa\mbreak sib, sib16 sib do8 do
    fa4 r8 sib, do do16 do re8 re

    %24
    sol,4 r8 do re re16 re mi8 mi
    la,4 r r2
    R1*5

    %31
    mi'4 sold la8 mi la4~
    la8 do, si mi do4 la'8 sib!
    dod,[re] mi dod re4 re\mbreak

    %34
    r sib'8 sib do4 do8 do
    do[sib] la[sol] fa fa la la
    sib4 sib8 sib sib[la] sol[fa]

    %37
    mi4 mi8 mi la,4 la8 la
    re8. re16 re8 re16 re mi8 mi16 mi la8 la
    re, re r sol16 sol do,8 do16 do fa8 fa\mbreak

    %40
    sib, sib r mi la,4 la8 la
    re4 la re r8 re'
    dod4 do si sib

    %43
    la re,8 re la'4 la,
    re r r2
    R1*4

}

IVtestoIII = \lyricmode {

    In -- tel -- lectus _ bo -- nus om -- ni -- bus fa -- ci -- en -- tibus _ e -- um.

    Lau - da - - - - - tio _ e -- jus ma -- net in sae -- culum _ sae -- cu -- li, in sae -- culum _ sae -- cu -- li,

    in sae -- culum _ sae -- cu -- li.

    In -- tel -- lectus _ bo -- nus om -- ni -- bus fa -- ci -- en --  tibus _ e -- um.

    Lau - da -- tio _ e -- jus ma -- net, lau - da -- tio _ e -- jus ma -- net in sae -- culum _  sae -- cu -- li,

    lau - da -- tio _ e -- jus ma -- net, lau - da -- tio _ e -- jus ma -- net

    in sae -- culum _ sae -- cu -- li, in sae - - - - culum _ sae -- cu -- li.

}

IVbcn = \relative do {

    re4 r8 re la'4 la,
    re8 re, r fa' do'4 do,
    fa8 fa, r re' sol4 sold

    %4
    la8 la, r re' fad,4 re
    sol8 sol, r do' mi,4 do
    fa8 fa, r re' sol4 la

    %7
    re sol, do fa,
    sib mi, la r8 dod
    re fa, sol la\mbreak re,4 r8 re

    %10
    la' re, sol, la re,4 r8 la''
    fa re r re la'4 la,
    re8 re, r re'' sold, mi r mi

    %13
    la la, r la mi' la, mi' mi,
    la4 r8 re la' la, r dod'
    re re, r re sol re la4\mbreak

    %16
    re8 re, r re' la' la, r la
    re mi fa re sol sol, r sol'
    do do, r do fa fa, r fa'

    %19
    sib sib, r sib mi mi, r mi'
    la la, r la re mi fa sol
    la sol la si do do, mi do

    %22
    fa fa, r fa'\mbreak sib, sib do do
    fa,4 r8 sib do do re re
    sol,4 r8 do re re mi mi

    %25
    la,4 r8 la mi'4 mi,
    la4 r8 la mi'4 mi,
    la r8 mi' la la, r la'\mbreak

    %28
    mi'4 mi, la8 la, r dod'
    re re, r la' fa re r re
    la'4 dod, re8 re, r re'

    %31
    mi mi, r sold' la la, r la'
    mi4 mi, la la'8 sib!
    la,4. la8 re mi fa re\mbreak

    %34
    sol sol, r sol' do do, r do
    do' do, r do fa fa, r fa'
    sib sib, r sib sib' sib, r sib

    %37
    mi mi, r mi' la, si dod la
    re mi fa re mi4 la
    re, sol do, fa\mbreak

    %40
    sib,4 mi la,8 si dod la
    re re la la re4 r8 re'
    dod4 do si sib

    %43
    la8 la,re re, la''4 la,
    re r8 re sol4 la
    re sol, do fa,

    %46
    sib mi, la r8 dod\mbreak
    re fa, sol la re,4 r8 re
    la' re, la' la,  re,2\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6 4>4 <3+>
    s2 <6 4>4 <5 3>
    s2 <7>4 <6>
    <_+>2 <6 5>4 <7>
    s2 <6 5>4 <7>
    s2 <5>8 <6-> <3+> <7>
    <7 _+>4 <7 _!> <7-> <7>
    <7> <7 _+> <_+> s
    <6 5>2 s
    <6 4>4 s8 <_+> s4 s8 <_+>
    s2 <6 4>4 <5 3+>
    s2 <6 5>8 <7> s4
    s2 <5! 4>4 <_+>
    s2 s4 s8 <6 5>
    s2 <6 5>4 <_+>
    s2 <_+>
    s1
    <7>2 <7>
    <7> <7>
    <7> s
    s4 s8 <6 5> s2
    s <6 5>
    s <6 5 _->4 <_+>
    s2 <6 5>4 <_+>
    s2 <6! 4>4 <3+>
    s2 <6 4>4 <3+>
    s4 s8 <_+> s2
    <6 4>4 <_+> s2
    s4 s8 <7 _+> s2
    <5 4>4 <6 5> s2
    <7 _+>4 s8 <6 5> s2
    <_+>2 s4 <_+>
    <7>1
    s2 <7>
    s <7>
    <7> s4 s8 <6>
    s2 <7 _+>
    s <7 _+>
    <7 _+> <7><7> <7 _+>
    s4 <_+> s2
    <7>4 <6> <7> <6>
    <7 _+>2 <6 4>4 <3+>
    s2 <5>8 <6-> <7_+>4
    <7 _+> <7 _!>  <7-> <7>
    <7> <7 _+> s2
    s1
    <5 4>4 <_+>

}


forma = {

    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 2 = 55
    s1*48
    \bar "|."
    %\mark\markup "D.C."

}

IVvlI = {
    <<\IVvlIn \forma>>

}

IVvla = {
    \clef alto
    <<\IVvlan \forma>>

}

IValto = {
    \new Voice = "intellectus1"
    <<\IValton \forma>>
}

IVtenore = {
    \new Voice = "intellectus2"
    <<\IVtenoren \forma>>
}

IVbasso = {
    \new Voice = "intellectus3"
    \clef bass
    <<\IVbasson \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}





VobIn = \relative do'' {

    la16 sib do4
    fa8 do sib
    la16 sib do4

    %4
    fa8 la fa
    mi16 fa sol8 do,
    sib' la4\tr

    %7
    sol r8
    do,8 do16\tr sib do re
    sib8 sib16\tr la sib sol'\mbreak

    %10
    la,8 la16\tr sol la sib
    sol la sib8 sol'
    la,16 sib do8 fa

    %13
    la,16 sib do8 fa
    la,8 sib sol
    fa4 r8

    %16
    la16\p sib do8 re
    do sib la
    fa' do sib\mbreak

    %19
    la16 sib do4
    do8 do16\tr sib do re
    sib8 sib16\tr la sib do

    %22
    la8 la16\tr sol la sib
    sol4 r8
    do16 re mi8 do

    %25
    si re fa
    mi do16 si do8
    fa16 re re4\tr

    %28
    mi16 fa sol4\mbreak
    si,8 re fa
    mi16 fa sol4

    %31
    si,8 re fa
    mi16 re mi fa sol8
    mi fa re

    %34
    do16 re mib8 mib
    mib? re do
    do sib la

    %37
    sib8. la16 sol8
    sib16 do re8 re
    re do sib

    %40
    sib la sol\mbreak
    la8. sol16 fa8
    do'16 sib do4

    %43
    re16 do re4
    mi16 re mi4
    fa8 mi16 re do sib

    %46
    la sib do4
    fa8 mi16 re do sib
    la sib do4

    %49
    fa8 mi16 re do sib\mbreak
    la fa' la,8(sol\tr)
    fa4 r8

    %52
    do' do16\tr sib do re
    sib8 sib16\tr la sib do
    la8 la16\tr sol la sib

    %55
    sol8 do mi
    fa mi16 re do sib
    la fa' la,8(sol\tr)

    %58
    la16 sib do4
    fa8 do sib
    la16 sib do4

    %61
    fa16 mi fa sol la8
    fa sol mi
    fa4.\fermata

}

VobIIn = \relative do'' {

    fa,16 sol la4
    do8 la sol
    fa16 sol la4

    %4
    do8 fa do
    do16 re mi8 sol
    sol fa4\tr

    %7
    mi r8
    la,8 la16\tr sol la sib
    sol8 sol16\tr fa sol la\mbreak

    %10
    fa8 fa16\tr mi fa sol
    mi fa sol8 mi'
    fa,16 sol la8 do

    %13
    fa,16 sol la8 do
    fa, sol mi
    fa4 r8

    %16
    fa16\p sol la8 sib
    la sol fa
    do' la sol\mbreak

    %19
    fa16 sol la4
    la8 la16\tr sol la sib
    sol8 sol16\tr fa sol la\mbreak

    %22
    fa8 fa16\tr mi fa sol
    mi 4 r8
    mi'16 fa sol8 mi

    %25
    re si re
    do mi16 re mi8
    do do si

    %28
    do16 re mi4\mbreak
    re8 si re
    do16 re mi4

    %31
    re8 si re
    do16 si do re mi8
    do re si

    %34
    do16 sib? do8 do
    do sib la
    la sol fad

    %37
    sol8. la16 sib8
    sol16 la sib8 sib
    sib la sol

    %40
    sol fa mi\mbreak
    fa8. sol16 la8
    la16 sol la4

    %43
    sib16 la sib4
    sib16 la sib4
    la8 sol mi

    %46
    fa16 sol la4~
    la8 sol mi
    fa16 sol la4~

    %49
    la8 sol mi\mbreak
    fa4 mi8
    fa4 r8

    %52
    la la16\tr sol la sib
    sol8 sol16\tr fa sol la
    fa8 fa16\tr mi fa sol

    %55
    mi8 sol do
    la sol mi
    fa fa mi

    %58
    fa16 sol la4
    do8 la sol
    fa16 sol la4

    %61
    la16 sol la sib do8
    la8 sib sol
    la4.\fermata

}

Vtenoren = \relative do' {

    \autoBeamOff

    R4.*15

    %16
    la16 [sib] do8 re
    do [sib] la
    fa' do sib\mbreak

    %19
    la16 sib do4
    do8 do16\tr [sib do re]
    sib8 sib16\tr [la sib do]

    %22
    la8 [la16\tr sol la sib]
    sol4 r8
    do16[ re mi8] do

    %25
    si re fa
    mi do16 si do8
    fa16 [re] re4\tr

    %28
    do4 r8
    R4.*5

    %34
    do16 [re mib8] mib
    mib? [re] do
    do [sib] la

    %37
    sib8. la16 sol8
    sib16 [do re8] re
    re [do] sib

    %40
    sib [la] sol\mbreak
    la8. sol16 fa8
    do'4.

    %43
    re
    mi
    fa8 mi16[ re] do sib

    %46
    la sib do4
    fa8 mi16 [re] do sib
    la sib do4

    %49
    fa8 mi16 [re] do [sib]\mbreak
    la fa' la,8[(sol\tr)]
    fa4 r8

    %52
    do' do16\tr [sib do re]
    sib8 [sib16\tr la sib do]
    la8 [la16\tr sol la sib]

    %55
    sol8 [do mi]
    fa [mi16 re do sib]
    la fa' la,8[(sol\tr)]

    %58
    fa4 r8
    R4.*5

}

VtestoII = \lyricmode {

    Glo -- ria _  Pa -- tri Pa -- tri et Fi -- lio _ et Spi -- ri -- tui Sanc -- to, et Spi -- ri -- tui _ Sanc -- to, Spi -- ri -- tui Sanc -- to.

    Si -- cut e -- rat in prin -- ci -- pio, _ si -- cut e -- rat in prin -- ci -- pio _ et nunc, et sem -- per

    et in sae -- cula _ sem -- per   et in sae -- cula _  sae - cu -- lorum _ a -- men

    sae -- cu -  - - - lorum _ a -- men.

}

Vbcn = \relative do {

    fa,8 fa'16 mi fa8
    fa, fa' do
    fa, fa'16 mi fa8

    %4
    fa,8 fa' fa,
    do' do' do,
    do fa si,

    %7
    do16 si do re mi do
    \once\stemUp fa,8 la' fa
    sol mi do\mbreak

    %10
    fa, fa' si,
    do do, do'
    fa \once\stemUp fa, la'

    %13
    fa \once\stemUp fa, la'
    fa sib, do
    fa,4 r8

    %16
    fa fa' mi
    fa do fa,
    fa' fa, do'\mbreak

    %19
    fa, fa'16 mi fa8
    \once\stemUp fa, la' fa
    sol mi do

    %22
    fa re si
    do16 si do re mi re
    do8 do' do,

    %25
    sol si sol
    do do' do,
    la' fa sol

    %28
    do, do'16 si do8\mbreak
    sol sol, sol'
    do, do'16 si do8

    %31
    sol sol, sol'
    do mi, do
    do' fa, sol

    %34
    do, do' do,
    fad sol la
    re, sol, re'

    %37
    sol re sol,
    sib sib' sib,
    mi fa sol

    %40
    do, fa, do'\mbreak
    fa do fa,
    fa' la fa

    %43
    sib, re sib
    do do' do,
    fa do' do,

    %46
    fa, fa'16 mi fa8
    fa, \once\stemDown do'' do,
    fa, fa'16 mi fa8

    %49
    fa, \once\stemDown do'' do,\mbreak
    fa, do' do,
    fa'16 mi fa sol la sol

    %52
    fa8 la fa
    sol mi do
    fa re si

    %55
    do mi do
    fa do' do,
    fa do do,

    %58
    fa fa'16 mi fa8
    fa, fa' do
    fa, fa'16 mi fa8

    %61
    fa, fa' fa,
    fa sib do
    fa,4.\fermata

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*5
    <7>4 <7>8
    s4.
    s
    s4 <7>8
    s4.
    s8 <7> s
    s4.*9
    s4 <7>8
    s4 <7>8
    s4.*2
    <_!>4.
    s4.*3
    <_!>4.
    s
    <_!>
    s4.*2
    s8 <_-> s
    <7>4.
    <7>
    s
    s
    <7>
    <7>
    s4.*3
    <7>4.
    s4.*5
    s8 <6 4> <5 3>
    s4.
    s
    s4 <7>8
    s4 <7>8
    s4.*2
    s8 <6 4> <5 3>
    s4.
    s4 <7>8

}


forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 4. = 63
    s4.*63
    \bar "|."
    %\mark\markup "D.C."

}

VobI = {
    <<\VobIn \forma>>

}

VobII = {
    <<\VobIIn \forma>>

}

Vtenore = {
    \new Voice = "gloria2"
    <<\Vtenoren \forma>>
}

Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
}





VIobIn = \relative do'' {

}

VIobIIn = \relative do'' {

}


VIvlIn = \relative do'' {

    sol'8 r sol\p r
    sol r sol r
    sol r sol r

    %4
    sol r sol r
    sol r sol r
    sol r sol r

    %7
    sol r sol r
    sol, r sol r
    sol r\mbreak fad r

    %10
    sol r sol' r
    sol r sol r
    sol r sol r

    %13
    sol r sol r
    sol r sol r
    sol r sol r

    %16
    fa r mi r
    re r sol r\mbreak
    fa r mi r

    %19
    re r sol sol
    fad[sol sol fad]
    si16\f do re do si do re si

    %22
    la8[fad fad fad]\mbreak
    la16 si do si la si do la
    si8[sol la fad]

    %25
    sol4 r
    re8\p r re r  %% fine p. 42
    re r re r

    %28
    re r re r
    re r re r
    re r sol r

    %31
    sol r sol r
    sol r sol r
    sol r sol r\mbreak

    %34
    sol r sol r
    sol r sol r
    sol r la r

    %37
    fa r fa r
    fa r fa r
    mi r mi r

    %40
    mi r mi r\mbreak
    re r sol r
    fa r fa r

    %43
    mi r sol r
    fa r fa r
    mi r sol r

    %46
    fa r mi r
    re r sol r
    fa r mi r

    %49
    re4 r8\fermata fa16 fa\mbreak
    mi8[mi re re]
    mi [sol\f la fa]

    %52
    sol[mi fa re]
    mi[sol la fa]
    sol[mi fa re]

    %55
    mi[do' re si]
    do2\fermata

}

VIvlIIn = \relative do'' {

    mi8 r mi\p r
    mi r mi r
    re r re r

    %4
    re r re r
    mi r mi r
    re r re r

    %7
    re r re r
    re r re r
    re r\mbreak re r

    %10
    re r re r
    mi r re r
    mi r mi r

    %13
    re r re r
    re r re r
    mi r mi r

    %16
    re r do r
    si r mi r\mbreak
    re r do r

    %19
    si r si si
    la[si la la]
    sol'16\f la si la sol la si sol

    %22
    fad8[re re re]
    fad16 sol la sol fad sol la fad
    sol8[si, do la]

    %25
    si4 r
    si8\p r si r\mbreak
    la r la r

    %28
    la r la r
    si r si r
    do r mi r

    %31
    mi r mi r
    re r re r
    re r re r\mbreak

    %34
    mi r mi r
    re r re r
    mi r do r

    %37
    do r do r
    si r si r
    si r si r

    %40
    la r la r\mbreak
    si r mi r
    re r re r

    %43
    do r mi r
    re r re r
    do r mi r

    %46
    re r do r
    si r mi r
    re r do r

    %49
    si4 r8\fermata re16 re\mbreak
    do8[do si si]
    do[mi\f fa re]

    %52
    mi [do re si]
    do[mi fa re]
    mi [do re si]

    %55
    do[mi fa re]
    mi2\fermata

}

VIvlan = \relative do' {

    do'8 r do\p r
    do r do r
    si r si r

    %4
    si r si r
    do r do r
    si r si r

    %7
    si r si r
    la r la r
    la r\mbreak la r

    %10
    si r si r
    do r si r
    do r do r

    %13
    do r do r
    do r si r
    do r sol r

    %16
    si r sol r
    sol r sol r\mbreak
    si r sol r

    %19
    sol r re re
    re[re re re]
    re\f[re re re]

    %22
    fad16 sol la sol fad sol la fad
    re8[re re re]
    re[re mi re]

    %25
    re4 r
    sol8\p r sol r\mbreak
    sol r sol r

    %28
    sol r fad r
    sol r sol r
    sol r sol r

    %31
    do r do, r
    do r do r
    do r si r\mbreak

    %34
    do r do' r
    si r si r
    do r do r

    %37
    la r fa r
    re r sol r
    sol r mi r

    %40
    do r fad r\mbreak
    re r mi r
    si' r si r

    %43
    sol r sol r
    si r si r
    sol r sol r

    %46
    si r sol r
    sol r sol r
    si r sol r

    %49
    sol4 r8\fermata si16 si\mbreak
    sol8[sol sol sol]
    sol[do\f la si]

    %52
    sol[sol la sol]
    sol[do la si]
    sol[sol la sol]

    %55
    sol[sol la sol]
    sol2\fermata

}

VIalton = \relative do' {

    \autoBeamOff

    R2*5
    r4 re8 re
    sol16[la] si la sol[la] si[sol]

    %8
    la8 re, re re
    la'16[si] do si\mbreak la[si] do[la]
    si8 la16[sol] re'8[do16 si]

    %11
    do8 sol r4
    r do~
    do do~

    %14
    do si
    do sol8[fa16 mi]
    fa8[mi16 re] mi8[re16 do]

    %17
    re4 sol8[fa16 mi]\mbreak
    fa8[mi16 re] mi8[re16 do]
    re4 sol8 sol

    %20
    fad sol sol[fad]
    sol4 r
    R2*4

    %26
    re4. re8\mbreak
    re' do16 si la[sol] fad[mi]
    re8 re r re

    %29
    re re16 re fa8 mi16[re]
    mi8 do re re
    mi16[fa] sol fa mi[fa] sol[mi]

    %32
    fa8 re re re
    fa16[sol] la sol fa16[sol] la[fa]\mbreak
    mi8 mi r4

    %35
    r sol8 sol
    mi16[fa] sol fa mi[fa] sol[mi]
    fa8 fa fa fa

    %38
    re16[mi] fa mi re[mi] fa[re]
    mi8 mi mi mi
    do16 [re mi re] do [re mi do]\mbreak

    %41
    si4 sol'8 mi
    re16[do si do re mi fa re]
    mi[re do re mi fa sol mi]

    %44
    re[do si do re mi fa re]
    mi4 sol8 [fa16 mi]
    fa8[mi16 re] mi8[re16 do]

    %47
    re4 sol8[fa16 mi]
    fa8[mi16 re] mi8[re16 do]
    re4 r8 \fermata fa16 fa\mbreak

    %50
    mi8 mi re4
    mi8 sol[la fa]
    sol[mi fa re]

    %53
    mi sol[la fa]
    sol[mi fa re]
    do4 r

    %56
    R2

}

VItestoI = \lyricmode {

    Et in sae -- cula _  sae -- cu -- lorum _ et in sae -- cula _  sae -- cu -- lorum _  a - men

    sae -- cu -- lo -- rum a - - men a - - men  sae -- cu -- lorum _  a -- men.

    Et in sae -- cula _  sae -- cu -- lorum _  in sae -- cula _  sae -- cu -- lorum _

    et in sae -- cula _  sae -- cu -- lorum _  et in sae -- cula _  sae -- cu -- lorum _

    et in sae -- cula _  sae -- cu -- lorum _  et in sae -- cula _  sae -- cu -- lorum _ a -- men a - men

    sae -- cu -- lo - - rum a - - men a - - men sae -- cu -- lorum _ a -- men a - men a - men.

}

VItenoren = \relative do' {

    \autoBeamOff

    r4 sol8 sol
    do16[re] mi re do[re] mi[do]
    re8 sol, sol sol

    %4
    re'16[mi] fa mi re[mi] fa[re]
    mi8 re16[do] sol'8 [fa16 mi]
    re8 sol, r4

    %7
    r sol~
    sol sol~
    sol\mbreak fad

    %10
    sol fa'8[mi16 re]
    mi8 do r4
    sol4. sol8

    %13
    sol' fa16 mi re[do] si[la]
    sol8 sol r4
    r mi'8[re16 do]

    %16
    re8[do16 si] do8[si16 la]
    si4 mi8[re16 do]\mbreak
    re8[do16 si] do8[si16 la]

    %19
    si4 si8 si
    la si la4
    sol r

    %22
    R2*4
    r4 sol~\mbreak
    sol sol~

    %28
    sol fad
    sol r
    r sol8 sol

    %31
    do16[re] mi re do[re] mi[do]
    re8 sol, sol sol
    re'16[mi] fa mi re[mi] fa[re]\mbreak

    %34
    mi8 re16[do] mi8[re16 do]
    re8 sol,  mi' mi
    do16[re] mi re do[re] mi[do]

    %37
    re8 re re re
    si16[do] re do si[do] re[si]
    do8 do do do

    %40
    la16 [si do si] la [si do la]\mbreak
    sol4 mi'8 do
    si16[la sol la si do re si]

    %43
    do[re mi re do re mi do]
    si[la sol la si do re si]
    do4 mi8 [re16 do]

    %46
    re8[do16 si] do8[si16 la]
    si4 mi8 [re16 do]
    re8[do16 si] do8[si16 la]

    %49
    si4 r8\fermata re16 re\mbreak
    do8 do si4
    do8 mi[fa re]

    %52
    mi[do re si]
    do mi[fa re]
    mi[do re si]

    %55
    do4 r
    R2

}

VItestoII = \lyricmode {

    Et in sae -- cula _  sae -- cu -- lorum _ et in sae -- cula _  sae -- cu -- lorum _  a - men

    sae -- cu -- lo -- rum a - men et in  sae -- cula _ sae -- cu -- lo -- rum a - - men a - - men sae -- cu -- lorum _ a -- men.

    Sae -- cu -- lo -- rum et in sae -- cula _  sae -- cu -- lorum _

    et in sae -- cula _  sae -- cu -- lo -- rum  a - men et in sae -- cula _  sae -- cu -- lorum _

    et in sae -- cula _  sae -- cu -- lorum _  a -- men a - men sae -- cu -- lo - - rum  a - - men a - - men

    sae -- cu -- lorum _  a -- men  a - men a - men.

}

VIbasson = \relative do {

    \autoBeamOff

    R2*10
    r4 sol8 sol
    do16[re] mi re do[re] mi[do]

    %13
    re8 sol, sol sol
    re'16[mi] fa mi re[mi] fa[re]
    mi8 do r4

    %16
    sol'2
    sol\mbreak
    sol

    %19
    sol4 sol8 sol
    re sol re4
    sol r

    %22
    R2*3
    r4 re8 re
    sol16[la] si la sol[la] si[sol]\mbreak

    %27
    la8 re, re re
    la'16[si] do si la[si] do[la]
    si8 la16[sol] re'8[do16 si]

    %30
    do8 do, r4
    r do'~
    do do~

    %33
    do si\mbreak
    do do8 do,
    sol' sol, r4

    %36
    r la8 la
    re16[mi] fa mi re[mi] fa[re]
    sol8 sol sol sol

    %39
    do,16[re] mi re do[re] mi[do]
    fa8 fa fad4\mbreak
    sol r

    %42
    sol2
    sol
    sol

    %45
    sol
    sol
    sol

    %48
    sol4 sol
    sol r8\fermata sol16 sol\mbreak
    do8 do, sol'4

    %51
    do,8 do'[fa, sol]
    do,8 do'[fa, sol]
    do,8 do'[fa, sol]

    %54
    do,8 do'[fa, sol]
    do,4 r
    R2

}

VItestoIII = \lyricmode {

    Et in sae -- cula _  sae -- cu -- lorum _ et in sae -- cula _  sae -- cu -- lorum _

    sae -- cu -- lo -- rum sae -- cu -- lorum _ a -- men.

    Et in sae -- cula _  sae -- cu -- lorum _ et in sae -- cula _  sae -- cu -- lorum _ a - men

    sae -- cu -- lo -- rum  a -- men a -- men et in sae -- cula _  sae -- cu -- lorum _ et in sae -- cula _  sae -- cu -- lorum _

    a -- men et in sae -- cu -- la  sae -- cu -- lo -- rum sae -- cu -- lo -- rum a -- men a -- men a -- men a -- men a -- men.

}

VIbcn = \relative do {

    do8 r do r
    do r do r
    sol r sol r

    %4
    sol r sol r
    do r do r
    sol' r sol, r

    %7
    sol r sol r
    re' r re r
    re r\mbreak re r

    %10
    sol, r sol r
    do r sol r
    do r do r

    %13
    sol r sol r
    sol r sol r
    do r do r

    %16
    sol r sol r
    sol r sol r\mbreak
    sol r sol r

    %19
    sol r sol sol
    re'[sol re re,]
    sol[sol sol sol]

    %22
    re'16 mi fad mi re mi fad re
    re8[re re re]
    sol[sol, do re]
    sol,4 r

    %26
    sol8 r sol r\mbreak
    re' r re r
    re r re r

    %29
    sol, r sol r
    do r do r
    do r do r

    %32
    do r do' r
    do r si r\mbreak
    do r do, r

    %35
    sol r sol r
    do r la r
    re r re r

    %38
    sol r sol r
    do, r do r
    fa r fad r\mbreak

    %41
    sol r sol, r
    sol r sol r
    sol r sol r

    %44
    sol r sol r
    sol r sol r
    sol r sol r

    %47
    sol r sol r
    sol r sol r
    sol4 r8\fermata sol\mbreak

    %50
    do do sol' sol,
    do[do' fa, sol]
    do,[do' fa, sol]

    %53
    do,[do' fa, sol]
    do,[do' fa, sol]
    do,[do' fa, sol]

    %56
    do,2\fermata

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2*7
    <5 4>2
    s4 <3+>
    s2*3
    <5 4>2
    s4 <3>
    s2
    <7 5>4 <6 4>
    <5 3> s
    <7 5> <6 4>
    <5 3> s
    <_+> <5 4>8 <3+>
    s2
    <_+>
    s
    s4 s8 <_+>
    s2
    s
    <5 4>
    s4 <3+>
    s2*3
    <5 4 2>2
    s4 <5 3>
    s2*3
    <7>2
    <7>
    <7>
    <7>
    s4 <6 4>
    <7 5>2
    <6 4>
    <7 5>
    <6 4>
    <7 5>4 <6 4>
    <5 3> <6 4>
    <7 5> <6 4>
    <5 3> s8 <7>

}


forma = {

    \time 2/4
    \key do\major
    \tempo 2 = 55
    s2*56
    \bar "|."

}

VIvlI = {
    <<\VIvlIn \forma>>

}

VIvlII = {
    <<\VIvlIIn \forma>>

}

VIvla = {
    \clef alto
    <<\VIvlan \forma>>

}

VIalto = {
    \new Voice = "saecula1"
    <<\VIalton \forma>>
}

VItenore = {
    \new Voice = "saecula2"
    <<\VItenoren \forma>>
}

VIbasso = {
    \new Voice = "saecula3"
    \clef bass
    <<\VIbasson \forma>>
}

VIbc = {
    \clef bass
    <<\VIbcn \forma \VIbfn>>
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

        systems-per-page = #2

    }

    \header {
        title = \markup\smaller\center-column {"Confitebor a 3 [RV 596]"}
        composer = \markup \center-column{"A. Vivaldi (1678 - 1741)"}
    }

    \markup \huge \column{"[1.] All[egr]o - Confitebor"}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oboè 1"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob1"
                    \IobI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oboè 2"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob2"
                    \IobII\global
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino I"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino II"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 r2 r4 do'8^\markup\center-align "Alto"  do'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \Ialto\global
                \new Lyrics \lyricsto "confitebor1" \ItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key do\major \time 4/4 r4^\markup\center-align "Tenore" sol8 sol}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \Itenore\global
                \new Lyrics \lyricsto "confitebor2" \ItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "Basso"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "bas"
                \Ibasso\global
                \new Lyrics \lyricsto "confitebor3" \ItestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Organo""[Basso continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Ibc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 16.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

    \pageBreak

    \markup \huge \column{"[2.] All[egr]o - Memoriam fecit"}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oboè 1"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob1"
                    \IIobI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oboè 2"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob2"
                    \IIobII\global
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino I"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIvlI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino II"}
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
                \incipit { \clef alto \key do\major \time 3/8\override Staff.TimeSignature.style = #'single-digit r8^\markup\center-align "Alto" r la'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIalto\global
                \new Lyrics \lyricsto "memoriam1" \IItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key do\major \time 3/8\override Staff.TimeSignature.style = #'single-digit r8^\markup\center-align "Tenore" r mi'}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \IItenore\global
                \new Lyrics \lyricsto "memoriam2" \IItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "Basso"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "bas"
                \IIbasso\global
                \new Lyrics \lyricsto "memoriam3" \IItestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Organo""[Basso continuo]"}
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
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

    \pageBreak

    \markup \huge \column{"[3.] And[ant]e - Sanctum"}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oboè 1"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob1"
                    \IIIobI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Oboè 2"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob2"
                    \IIIobII\global
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino I"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIIvlI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino II"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIIvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 4/4 sol'2^\markup\center-align "Alto" la'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IIIalto\global
                \new Lyrics \lyricsto "sanctum1" \IIItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key fa\major \time 4/4 r4^\markup\center-align "Tenore" do'8. do'16}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \IIItenore\global
                \new Lyrics \lyricsto "sanctum2" \IIItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "Basso"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "bas"
                \IIIbasso\global
                \new Lyrics \lyricsto "sanctum3" \IIItestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Organo""Bassi"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 16.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

        systems-per-page = #3

    }

    \markup \huge \column{"[4.] All[egr]o - Intellectus bonus"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violini e""Oboè unis[oni]"}
                \set Staff.midiInstrument = #"oboe"
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IVvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 4/4 r2^\markup\center-align "Alto"  mi'4 sold'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \IValto\global
                \new Lyrics \lyricsto "intellectus1" \IVtestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key fa\major \time 4/4 r2^\markup\center-align "Tenore" la4 dod'}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \IVtenore\global
                \new Lyrics \lyricsto "intellectus2" \IVtestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "Basso"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "bas"
                \IVbasso\global
                \new Lyrics \lyricsto "intellectus3" \IVtestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Organo""[Basso continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IVbc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 16.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

        systems-per-page = #4

    }

    \markup \huge \column{"[5.] All[egr]o - Gloria Patri"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup {"Oboè [1.]"}
                \set Staff.midiInstrument = #"oboe"
                \set Staff.shortInstrumentName = "ob1"
                \VobI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup {"Oboè [2.]"}
                \set Staff.midiInstrument = #"oboe"
                \set Staff.shortInstrumentName = "ob2"
                \VobII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key fa\major \time 4/4 la16^\markup\center-align "Tenore" [sib] do'8}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \Vtenore\global
                \new Lyrics \lyricsto "gloria2" \VtestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Organo""[Basso continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Vbc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 17.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

        systems-per-page = #3

    }

    \markup \huge \column{"[6.] All[egr]o - Et in saecula"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino [1.]"\vspace #-0.2"e Oboè [1.]"}
                \set Staff.midiInstrument = #"oboe"
                \set Staff.shortInstrumentName = "vl1"
                \VIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violino [2.]"\vspace #-0.2"e Oboè [2.]"}
                \set Staff.midiInstrument = #"oboe"
                \set Staff.shortInstrumentName = "vl2"
                \VIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \VIvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 2/4\numericTimeSignature r4^\markup\center-align "Alto"  re'8 re'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "alt"
                \VIalto\global
                \new Lyrics \lyricsto "saecula1" \VItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key do\major \time 2/4\numericTimeSignature r4^\markup\center-align "Tenore" sol8 sol}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ten"
                \VItenore\global
                \new Lyrics \lyricsto "saecula2" \VItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "Basso"
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "bas"
                \VIbasso\global
                \new Lyrics \lyricsto "saecula3" \VItestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Organo""[Basso continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \VIbc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 16)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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
