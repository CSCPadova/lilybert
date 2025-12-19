\language "italiano"
	%********************************** VARIABILI
\version "2.18.2"
	
su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

tr = \trill

solo = ^\markup \italic { solo }

soli = ^\markup \italic { soli }

trio = ^\markup \italic {trio}

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinesedici = \tupletSpan 16

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

terzinesenza = \override TupletNumber.transparent = ##f

terzinecon = \override TupletNumber.transparent = ##f

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


Iglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletNumber.transparent = ##t
		\override TupletBracket.bracket-visibility = ##f
		\terzinequarto \terzinesenza
			}

IvlIn = \relative do'' {

fa4 re do8(sib)
fa'2 mib4
re8 mib fa4. fa8

%4
mib re do2
sib r4
r8 sib' la sol la sol16(fa)\mbreak

%7
sib2.~
sib16 la(sib do) la4. sib8
sib4 fa8.(sol16) fa8.(sol16)

%10
fa4 la8.(sib16) la8.(sib16)
sol4 sib8.(do16) sib8.(do16)\mbreak
sib8 mib,16(re) do4.\tr sib16 (do)

%13
sib4 r r
r la'8(sol) la(sib)
sol4. fa8 sol la

%16
sib2 la4~
la sol4. sol8\mbreak
fa4 la8(sol) la4

%19
r sol8(fa) sol4
r fa8(mi) fa4~
fa mi2

%22
fa16(fa mi re) do(sib la sol) fa8 fa'\mbreak
fa8 mi16(re) mi4 r
r16 fa(mi? re do sib la sol) fa8 fa'

%25
fa4 mib!8 re mib4~
mib re8(do) re4
sib' la r

%28
sol4 fa r
mib8 re  do4. fa8
re8 fa sib fa re sib

%31
fa'4 r r
r8 sib fa re fa, fa'
sol4 fa mib~\mbreak

%34
mib8 fa16(mib) re(do sib do) re4~
re8 mib16(re) do(sib la sib) do4~
do8 re16(do) sib(la sol la) sib4~

%37
sib8 do16(sib) la(sol fad sol) la4~\mbreak
la8 sib16(la) sol(fad sol fad) sol4~
sol16 fad(sol la) fad4. mib16(fad)

%40
sol4 sol, sol''~
sol fad8 la, re(do)\mbreak %%%%%5 fine pagina
do4 sib4. sib8

%43
la2.
sol4 r r
r16 la' sol la fa la sol la fa  sol mi fa

%46
re4 r16 la' sol fa mi4\mbreak
r16 re do re la4 r16 re do re
mi,4 r16 la' sol la mi4

%49
r16 la sol la fa la sol la fa sol mi fa
re2.~\mbreak
re~

%52
re4 re4. dod8
re4 fa8(mib) fa(sol)
fa4 fad r8 fad

%55
sol4 re'2~
re4 do4. do8
do4 sib8(la) sib4~\mbreak

%58
sib si8(do) la(si)
do4 sol2~
sol4 fa4. fa8

%61
fa4 mib8(re) mib4~
mib8 fa re(do) re(sol)
mib!4. sol8 fa mib

%64
re4 re4.\tr do16(re)
do4 r \mbreak r8 sol'  %%fine seconda pagina
lab4(sol) r8 sol

%67
fa4(mib) r8 mib
reb8(do) si4. sol'8
mib do sol mib do4

%70
r8 do' si sol sol,4\mbreak
r8 do' sol mib do sol''
fa(mib) re4. re8

%73
mi4 fa8(mi) fa4~
fa fa4. mi8
fa fa do lab fa4

%76
r8 fa' mi do do,4\mbreak
r8 fa' do lab fa do'
sib(lab) sol4. do8

%79
la! sib16(do) sib sib'(la sol) fa(mib) re(fa)
sol(fa) mib(re) do4. sib16(do)\mbreak
sib sib re fa sib,4 r16 sib re fa

%82
sib,4 r16 la do fa la,4
r16 re sol sib fa4 r16 re fa sib
do,4 r16 do fa la do,4\mbreak

%85
r16 sib re fa sib,4 r16 sib re fa
sib,(re) fa(sib) la,(do) fa(la) la,(do) fa(la)
sib,(re) sol(sib) sib,(re) fa(sib) sib,(re) fa(sib)\mbreak

%88
do,(mib) sol(sib) do,(fa) sib(fa) do sib' do, la'
sib,8 fa' re(do) re4
r8 re do(sib) do4

%91
r8 sol' fa(mib) fa4\mbreak
r8 mib do(sib) do fa
re16 fa sib fa re8 sib r16 fa' sib fa

%94
re8 sib r16 do fa do la8 fa
r16 sol' sib sol fa8 re r16 fa re sib\mbreak
sol'8 sol, r16 fa' do la fa8 la

%97
re2 r8 fa
sol4(fa) r8 fa
mib4(re) r8 fa

%100
mib(re) do4. sib16(do)
sib4 r sib'~\mbreak  %%%%%fine pagina
sib lab8(sol) lab(sib)

%103
sol sib16(lab?) sib(lab!) sib(lab) sib4~
sib lab16(sol) fa sol lab4\mbreak
lab?8 sib16(lab!) sol(fa) mib(fa) sol8 lab16(sol)

%106
sol8 fa16(mib) fa8 fa sol(fa)
mib16(re do re) mib(re) mib(re) mib4~\mbreak
mib reb4. reb8

%109
reb?4 do8(si) do4~
do16 si(do re) si4. la16(si)
do4 sol'2~

%112
sol4. lab8 sol16(fa mib re)\mbreak
do4. sol'16(fa mib re do sib)
lab(sol fa mib) re8 sol' si, sol'16 fa

%115
mib4. re8 do4
mib re r\mbreak
fa mib r

%118
r r re~
re8 sol, do4. re8
mib4 mi4. mi8

%121
fa do mib re do sib
lab4 sol8.(lab16) sol8.(fa16)\mbreak
mi4 fa8 sol la! sib

%124
do re mi fa sol la
sib2 la4~
la8. sol16 sol4.\tr fa16(sol)

%127
fa4 r r
r16 la sol fa mi8 re mi do\mbreak
fa2 r4

%130
r16 la sol fa mi8 re mi do
la'4 la8(sol) la(sib)
la4 sol8(fa) sol(la)

%133
fa4 mi4. fa8
re mi16(fa) fa4. mi8\mbreak
fa16(sol fa) mib re(do sib) do re(do re) sib

%136
fa'4 r r
r16 sib(la sol) fa(mib re) mib fa(mib fa) re
sol2 fa8. mib16\mbreak   %%%% fine pagina

%139
re8 sib' sib sib sib sib
sib la16(sol) la8 la la sib16(la)
sol8 la16(sol) fa8 fa fa sol16(fa)

%142
mib(fa) re(mib) do2\mbreak
sib8 fa re fa sib,4
r8 re'16(mib) fa4 r8 fa16(la)

%145
sib4 r8 re,16(mib) fa4
r8 mib16(re) do4 r8 fa16(mib)\mbreak
re sib' la sol fa mib re do sib4

%148
r16 fa' mib re do sib la sol fa4
r16 sib la sol fa mib re do sib8 re'
do(sib) sib4. la8\mbreak

%151
sib4 r r8 sib'\p
sib(sol) la4 r8 fa
mib4(re) r8 fa

%154
mib(re) do4.\tr sib16(do)
sib fa' sol la sib\f fa re fa sib,4\mbreak
re'4 do r

%157
sib la r
sol fa4. mib8
re do re mib re4

%160
fa8 sol la sol la sol16(fa)
sib2.~\mbreak
sib16 (la) sib(do) la4. sib8

%163
sib4 re,8(do) re(re,)
r4 do'8(sib) do(do,)
r4 re'8(do) re(re,)

%166
mib'(re) do4.\tr sib16(do)\mbreak
sib8 sib' la sol fa mib
re4. mib8 re do

%169
sib la sib do sib4~
sib16 la sib (do) la4.\tr sib8
sib2.\fermata

}

IvlIIn = \relative do'' {

R2.
sib4 la sol8 fa
sib2.~

%4
sib4 sib4. la8
sib fa' re do re do16(sib)
fa'4 fa4. mib8\mbreak

%7
re4. mib8 fa(sib,)
sol'4 do,4. sib8
sib4 re8.(mib16) re8.(mib16)

%10
re4 do8.(re16) do8.(re16)
sib4 re8.(mib16) re8.(mib16)
re8 do16(sib) la4. la8\mbreak

%13
sib4 re8(do) re(mib)
do4. sib8 do re
sib4 do8 re mi4

%16
fa do fa~
fa fa4. mi8
fa4 fa8(mi) fa4\mbreak

%19
r mi8(re) mi4
r do8(sib) la(do)
re(sol,) sol4.\tr fa16(sol)

%22
fa4 r r
r16 do'(sib la) sol(fa mi re) do8 do'\mbreak
la8(sol) la4 r16 do(sib la)

%25
re(do sib la) sol4. do8
la4 sib8(la) sib4
re do r

%28
sib la r
sol8 sib sib4. la8
sib4 r r

%31
r8 re fa do la fa
sib4 r r  %%%% fin qui corretto
r8 mib do la do, la'

%34
sib4 fa sib'8. sib16
sib4 la4. la8
la4 sol4. sol8\mbreak

%37
sol4 fad8 la, re do
do4 sib4. sib8
la4 re do~

%40
do8 re16(do) sib(la sol la) sib4~
sib8 do16(sib) la(sol fad sol) la4~
la8 sib16(la) sol(fad sol fad) sol4~

%43
sol16 fad(sol la) fad4.\tr mib16(fad)
sol sol' fa sol re sol fa sol mi fa re mi
dod4 r r

%46
r16 fa mi re dod4 r16 la' sol la
fa4 r16 re do re fa,4
r16 mi' re mi dod4 r16 la' sol la\mbreak

%49
fa4 r r
r16 la sol la fa sol mi fa re mi do re
sib sib' la sol la sib sol la fa sol mi fa\mbreak

%52
re mi fa sol mi2
re4 re8(dod) re8.(mib16)
re4 do r8 do

%55
sib4 r re
mi4. mi8 la sol
fad4 sol8(fad) sol4\mbreak

%58
re8. mi16 fa2
mib!4 re8(do) re(mib)
do sib la4 re8 do

%61
si4 do8(si) do4~
do8 re si la si4\mbreak
do sol do~

%64
do si2
do8 do sol mib do4
r8 do' si sol sol,4

%67
r8 do' sol mib do4\mbreak
r8 fa' re si sol4
r r r8\mbreak sol'  %%%% fine pagina

%70
lab4(sol) r8 sol
fa4 mib r8 mib
reb(do) si4. la16 si

%73
do4. do8 sib lab
red16(do sib lab) sol4. sol8
fa4 r r8 mib'\mbreak

%76
reb4(do) r8 do
sib4 lab r8 lab
solb(fa) mi2

%79
fa sib4~
sib sib4. la8
sib4 r16 re do sib fa'8 fa,

%82
r16 re' do sib do8 do, r16 do' sib la\mbreak
sib8 sib, r16 la' sol fa sib8 sib,
r16 sol' do mib la,8 la, r16 do' sib la

%85
re8 re, r16 sib re fa sib,4
r8 re' do(sib) do4
r8 sol' fa(mib) fa4\mbreak

%88
r8 mib do(sib) do8.(fa16)
re(sib re fa) sib sib,(re fa) sib(sib,) re(fa)
sib,(re) fa(sib) la,(do) fa(la) la,(do) fa(la)\mbreak

%91
sib,(re) fa(sib) sib,(re) fa(sib) sib,(re) fa sib
do,(mib) sol(sib) do,(fa) sib(fa) do sib' do,(la')
sib,4 r8 fa' fa4

%94
r8 fa fa4 r8 fa\mbreak
re4 r8 fa fa4
r8 mib do(fa,) do'4~

%97
do sib8(la) sib4
r8 sib re4(do)
r8 sol sib!4(lab)

%100
sol8(sib) sib4. la8
sib fa re fa sib,4\mbreak
re'4 re4.\tr do16(re)

%103
mib4 fa mib8 re
do4. do8 fa mib
re4\tr re8. sib16 mib8 fa16 mib~

%106
mib8 re16(do) re8 re mib(re)
do4 sib4. sib8\mbreak
lab(sol) fa4. fa8

%109
sib4. sol'8 fa mib
re4 re4.\tr do16 re
mib4. re8 do4

%112
mib re r
fa mib r
R2.

%115
r4 sol2~\mbreak
sol4. lab8 sol16(fa mib re)
do4. sol'16(fa mib re do sib)

%118
lab(sol) fa(mib) re8 sol' si, sol'16(fa)
mib4. do8 sol'4~
sol8 lab sib (lab) sib(do)\mbreak %%%%% fine pagina  fin qui corretto

%121
lab4 sol8(fa) mib(re)
do8. re16 sib4. sib8
sib4(la) fa8 sol

%124
la sib do re mi4
fa do'2
fa,4 fa4. mi8\mbreak

%127
fa16 re do sib la8 sol la fa
do'2 r4
r16 re do sib la8 sol la fa

%130
re'4 r sol~
sol fa8 mi fa(sol)
fa4 mi8(re) mi(fa)\mbreak

%133
re2 do4
sib8 la sol4. do16(sib)
fa4 r r

%136
r16 re'(do sib) la (sol fa sol) la(sol) la(fa)
sib4 r r
r16 mib(re mib) do(sib) la(sib)\mbreak do(sib) do(la)

%139
sib8 re re re re re
re do16(sib) do8 do do re16(do)
sib8 do16(sib) la8 la la sib16(la)

%142
sol8 sib sib4. la8\mbreak
sib4 r r8 re16(mib)
fa4 r8 fa16(sol) la4

%145
r8 re,16 mib fa4 r8 re16(do)
sib4 r8 la16(sol) fa4
r r r8 sib'

%148
sib sol la4 r8 fa\mbreak
mib4(re) r8 fa
mib(re) do4. sib16(do)

%151
sib sib'\p la sol fa mib re do sib4
r16 fa' mib re do sib la sol fa4
r16 sib la sol fa mib re do sib8 sib'\mbreak

%154
do(sib) sib4. la8
sib4 r r16 fa'\f sol la
sib4(la) r

%157
sol fa r
mib8 re do sib la4
sib8 la sib do sib4

%160
R2.\mbreak
re8 mib fa mib fa mib16(re)
sol8. do,16 do4. sib8

%163
sib4 sib8(la) sib(sib,)
r4 la'8(sol) la(la,)
r4 sib'8(la) sib(sib,)\mbreak

%166
sib'4 sib4. la8
sib4 r r
r8 sib' la sol fa mib

%169
re do re mib re4
do do4.\tr sib16(do)
sib2.\fermata

}


Icbn = \relative do {

sib4  sib'4. sib8
sib4 fa4. fa8
sol4 re4. re8

%4
mib4 fa4. fa8
sib,4 sib'4. sib8
sib4 fa4. fa8\mbreak

%7
sol4 re4. re8
mib4 fa4. fa8
sib,4 sib'4. sib8

%10
sib4 fa4. fa8
sol4 re4. re8
mib4 fa4. fa8

%13
sib,4 sib'4. sib8
sib4 fa4. fa8\mbreak
fa4 do4. do8

%16
re4 la4. la8
sib4 do4. do8
fa,4 fa'4. fa8

%19
fa4 do4. do8
re4 la4. la8
sib4 do4. do8

%22
fa,4 fa'4. fa8\mbreak
fa4 do4. do8
re4 la4. la8

%25
sib4 do4. do8
fa,4 sib'4. sib8
sib4 fa4. fa8

%28
sol4 re4. re8
mib4 fa4. fa8
sib,4 sib'4. sib8\mbreak  %%%%%%%% fine prima pagina

%31
sib4 fa4. fa8
sol4 re4. re8
mib4 fa4. fa8

%34
sib,4 sib'4. sib8
sib4 fad4. fad8
sol4 sol4. sol8

%37
sol4 re4. re8\mbreak
mib4 sib4. sib8
do4 re4. re8

%40
sol,4 sol'4. sol8
sol4 re4. re8
mib!4 sib4. sib8

%43
do4 re4.  re8
sol,4 sol'4.sol8\mbreak
sol4 re4. re8

%46
re4 la4. la8
sib4 fa4. fa8
sol4 la4. la8

%49
re,4 re'4. re8
re4 la4. la8
sib4 fa4. fa8\mbreak

%52
sol4 la4. la8
re4 re'4. re8
re4 la4. la8

%55
sib4 fa4. fa8
sol4 la4. la8
re,4 sol4. sol8

%58
sol4 re4. re8\mbreak
mib4 sib4. sib8
do4 re4. re8

%61
sol,4 do'4. do8
do4 sol4. sol8
lab4 mib4. mib8

%64
fa4 sol4. sol8
do,4 do'4. do8\mbreak
do4 sol4. sol8

%67
lab4 mib4. mib8
fa4 sol4. sol8
do,4 do'4. do8

%70
do4 sol4. sol8
lab4 mib4. mib8
fa4 sol4. sol8\mbreak

%73
do,4 lab4. lab8
sib4 do4. do8
fa,4 fa'4. fa8

%76
fa4 do4. do8
re4 lab4. lab8
sib4 do4. do8

%79
fa4 re4. re8\mbreak
mib4 fa4. fa8
sib,4 sib'4. sib8

%82
sib4 fa4. fa8
sol4 re4. re8
mib4 fa4. fa8

%85
sib,4 sib'4. sib8
sib4 fa4. fa8
sol4 re4. re8\mbreak  %%% fine seconda pagina

%88
mib4 fa4. fa8
sib,4 sib'4. sib8
sib4 fa4. fa8

%91
sol4 re4. re8
mib4 fa4. fa8
sib,4 sib'4. sib8

%94
sib4 fa4. fa8
sol4 re4. re8\mbreak %%% fine prima riga

%96
mib4 fa4. fa8
sib,4 sib'4. sib8
sib4 fa4. fa8

%99
sol4 re4. re8
mib4 fa4. fa8
sib,4 sib'4. sib8

%102
sib4 fa4. fa8
sol4 re4. re8\mbreak % seconda riga
mib4 fa4. fa8

%105
sib,4 mib4. mib8
mib4 sib4. sib8
do4 sol4. sol8

%108
lab4 sib4. sib8
mib,4 mib'4. mib8
fa4 sol4. sol8

%111
do,4 do'4. do8
do4 sol4. sol8
lab4 mib4. mib8

%114
fa4 sol4. sol8
do,4 do'4. do8
do4 sol4. sol8

%117
lab4 mib4. mib8
fa4 sol4. sol8
do,4 do'4. do8

%120
do4 sol4. sol8
lab4 mib4. mib8
fa4 sol4. sol8

%123
do,4 fa4. fa8
fa4 do4. do8\mbreak %%%%quart'ultima
re4 la4. la8

%126
sib4 do4. do8
fa,4 fa'4. fa8
fa4 do4. do8

%129
re4 la4. la8
sib4 do4. do8
fa,4 fa'4. fa8\mbreak %% terz'ultima

%132
fa4 do4. do8
re4 la4. la8
sib4 do4. do8

%135
fa4 sib4. sib8
sib4 fa4. fa8
sol4 re4. re8

%138
mib4 fa4. fa8
sib,4 sib'4. sib8  \mbreak %% fine penultima
sib4 fa4. fa8

%141
sol4 re4. re8
mib4 fa4. fa8
sib,4 sib'4. sib8

%144
sib4 fa4. fa8
sol4 re4. re8
mib4 fa4. fa8

%147
sib,4 sib'4. sib8\mbreak %%%%%%fine pagina
sib4 fa4. fa8
sol4 re4. re8

%150
mib4 fa4. fa8
sib,4 sib'4. sib8
sib4 fa4. fa8

%153
sol4 re4. re8
mib4 fa4. fa8
sib,4 sib'4. sib8\mbreak %prima riga

%156
sib4 fa4. fa8
sol4 re4. re8
mib4 fa4. fa8

%159
sib,4 sib'4. sib8
sib4 fa4. fa8
sol4 re4. re8

%162
mib4 fa4. fa8
sib,4 sib'4. sib8 \mbreak %%%%seconda
sib4 fa4. fa8

%165
sol4 re4. re8
mib4 fa4. fa8
sib,4 sib'4. sib8

%168
sib4 fa4. fa8
sol4 re4. re8
mib4 fa4. fa8

%171
sib,2.\fermata


}

Ibcn = \relative do {

sib4  sib'4. sib8
sib4 fa4. fa8
sol4 re4. re8

%4
mib4 fa4. fa8
sib,4 sib'4. sib8
sib4 fa4. fa8\mbreak

%7
sol4 re4. re8
mib4 fa4. fa8
sib,4 sib'4. sib8

%10
sib4 fa4. fa8
sol4 re4. re8
mib4 fa4. fa8

%13
sib,4 sib'4. sib8
sib4 fa4. fa8\mbreak
fa4 do4. do8

%16
re4 la4. la8
sib4 do4. do8
fa,4 fa'4. fa8

%19
fa4 do4. do8
re4 la4. la8
sib4 do4. do8

%22
fa,4 fa'4. fa8\mbreak
fa4 do4. do8
re4 la4. la8

%25
sib4 do4. do8
fa,4 sib'4. sib8
sib4 fa4. fa8

%28
sol4 re4. re8
mib4 fa4. fa8
sib,4 sib'4. sib8\mbreak  %%%%%%%% fine prima pagina

%31
sib4 fa4. fa8
sol4 re4. re8
mib4 fa4. fa8

%34
sib,4 sib'4. sib8
sib4 fad4. fad8
sol4 sol4. sol8

%37
sol4 re4. re8\mbreak
mib4 sib4. sib8
do4 re4. re8

%40
sol,4 sol'4. sol8
sol4 re4. re8
mib!4 sib4. sib8

%43
do4 re4.  re8
sol,4 sol'4.sol8\mbreak
sol4 re4. re8

%46
re4 la4. la8
sib4 fa4. fa8
sol4 la4. la8

%49
re,4 re'4. re8
re4 la4. la8
sib4 fa4. fa8\mbreak

%52
sol4 la4. la8
re4 re'4. re8
re4 la4. la8

%55
sib4 fa4. fa8
sol4 la4. la8
re,4 sol4. sol8

%58
sol4 re4. re8\mbreak
mib4 sib4. sib8
do4 re4. re8

%61
sol,4 do'4. do8
do4 sol4. sol8
lab4 mib4. mib8

%64
fa4 sol4. sol8
do,4 do'4. do8\mbreak
do4 sol4. sol8

%67
lab4 mib4. mib8
fa4 sol4. sol8
do,4 do'4. do8

%70
do4 sol4. sol8
lab4 mib4. mib8
fa4 sol4. sol8\mbreak

%73
do,4 lab4. lab8
sib4 do4. do8
fa,4 fa'4. fa8

%76
fa4 do4. do8
re4 lab4. lab8
sib4 do4. do8

%79
fa4 re4. re8\mbreak
mib4 fa4. fa8
sib,4 sib'4. sib8

%82
sib4 fa4. fa8
sol4 re4. re8
mib4 fa4. fa8

%85
sib,4 sib'4. sib8
sib4 fa4. fa8
sol4 re4. re8\mbreak  %%% fine seconda pagina

%88
mib4 fa4. fa8
sib,4 sib'4. sib8
sib4 fa4. fa8

%91
sol4 re4. re8
mib4 fa4. fa8
sib,4 sib'4. sib8

%94
sib4 fa4. fa8
sol4 re4. re8\mbreak %%% fine prima riga

%96
mib4 fa4. fa8
sib,4 sib'4. sib8
sib4 fa4. fa8

%99
sol4 re4. re8
mib4 fa4. fa8
sib,4 sib'4. sib8

%102
sib4 fa4. fa8
sol4 re4. re8\mbreak % seconda riga
mib4 fa4. fa8

%105
sib,4 mib4. mib8
mib4 sib4. sib8
do4 sol4. sol8

%108
lab4 sib4. sib8
mib,4 mib'4. mib8
fa4 sol4. sol8

%111
do,4 do'4. do8
do4 sol4. sol8
lab4 mib4. mib8

%114
fa4 sol4. sol8
do,4 do'4. do8
do4 sol4. sol8

%117
lab4 mib4. mib8
fa4 sol4. sol8
do,4 do'4. do8

%120
do4 sol4. sol8
lab4 mib4. mib8
fa4 sol4. sol8

%123
do,4 fa4. fa8
fa4 do4. do8\mbreak %%%%quart'ultima
re4 la4. la8

%126
sib4 do4. do8
fa,4 fa'4. fa8
fa4 do4. do8

%129
re4 la4. la8
sib4 do4. do8
fa,4 fa'4. fa8\mbreak %% terz'ultima

%132
fa4 do4. do8
re4 la4. la8
sib4 do4. do8

%135
fa4 sib4. sib8
sib4 fa4. fa8
sol4 re4. re8

%138
mib4 fa4. fa8
sib,4 sib'4. sib8  \mbreak %% fine penultima
sib4 fa4. fa8

%141
sol4 re4. re8
mib4 fa4. fa8
sib,4 sib'4. sib8

%144
sib4 fa4. fa8
sol4 re4. re8
mib4 fa4. fa8

%147
sib,4 sib'4. sib8\mbreak %%%%%%fine pagina
sib4 fa4. fa8
sol4 re4. re8

%150
mib4 fa4. fa8
sib,4 sib'4. sib8
sib4 fa4. fa8

%153
sol4 re4. re8
mib4 fa4. fa8
sib,4 sib'4. sib8\mbreak %prima riga

%156
sib4 fa4. fa8
sol4 re4. re8
mib4 fa4. fa8

%159
sib,4 sib'4. sib8
sib4 fa4. fa8
sol4 re4. re8

%162
mib4 fa4. fa8
sib,4 sib'4. sib8 \mbreak %%%%seconda
sib4 fa4. fa8

%165
sol4 re4. re8
mib4 fa4. fa8
sib,4 sib'4. sib8

%168
sib4 fa4. fa8
sol4 re4. re8
mib4 fa4. fa8

%171
sib,2.\fermata

}

Ibfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

s2.
s2 <8>8 <7>
s2.
<6 5>4 <5 4>4. <3>8
s2.*3
<6 5>2.
s2.*3
<6>2.
s
<4! 2>
<4 2>4 <5>4. <6>8
<6>4 <9 3>4. <8 6>8
<7 5>4 <4>4. <3>8
s2.*3
<6 5>2.
s2.*3
<6 5>2.
<7>
s2.*6
s4 <8>4. <7>8
<5 4>4 <3>2
s4 <5->2
<4 9>4 <3 8>2
s4 <8 _+>4. <7>8
<6 4>4 <6>2
s4 <8>4. <7>8
<4>4 <3>2
s4 <8 _+>4. <7>8
<6 4>4 <6>2
<6 5>2.
s4 <5>4. <6>8
<4+ 2>4 <_->2
s2.*2
<6 5>4 <_+>2
s2.*4
<_->2.
s4 <6+>2
s2.
<6 5>4 <3->2

%57
<7 _+>4 <_->2
s4 <6!>2
<6>2.
<6 5 _->4 <_->2
<7 _!>2.
s4 <_!>2
s2.*3
<6->2.
<6>
<6->
s
<6->4 <_!>2
<6>4 <6>2
<[6-]>4 <[_!]>2
<_!>4 <6>2
<6 5>4 <4>4. <3>8
s2.
<5->4 <_!>2
<6 _->4 <6>2

%78
<6->4 <5>2
s4 <6>2
<6 5>2.
s
s
s4 <5>4. <6>8
<6 5>2.
s2.*3
<6 5>4 <4>4. <3>8
s2.*2
s4 <6>2
<6 5>4 <4>4. <3>8
s2.*4

%97
<10 9>4 <8>2
<6>4 <6>4. <5>8
<6>4 <6>4. <5->8
<6 5>4 <4>4. <3>8
s2.
s4 <6>2
<6>2.
<6 5>4 <_->2
<7->2.
s
s4 <6>2

%108
<6 5>4 <_->2
<7->4 <6>2
<6 5>4 <_!>2
s2.*2
<6>2.
<6 5>4 <_!>2
s2.*2
<6>4 <6>2
<6>4 <_!>2
<10 9>4 <8>2

%120
<_->4 <6!>2
<6>4 <6>2
<6 5 _->4 <_->2
<7 _!>4 <_!>2
s4 <5 _!>4. <6>8
<6>4 <10 9>4. <8>8
<7>4 <4>4. <3>8
s2.*3
<7>2.
<10 9>4 <8>2
s2.
<5>4 <5 4>4. <3>8
s4 <4>4. <3>8
s2.*3
s4 <3 9>4. <8>8
s2.
s
<6>
s4 <4>4. <3>8
s2.*6 %%%% ultima pagina
<6>4 <6>2
<6>8 <5> <4>4. <3>8
s2.
s
<6>
s4 <4>4. <3>8
s2.*11
<6 5>4 <4>4. <3>8
s2.
s
s
<6 5>

}


forma = {

\key sib\major
\time 3/4
\tempo 2 = 50
s2.*171
\bar"|."

}


IvlI = {
	\Iglobal
	\notypeset
	<<\IvlIn \forma>>

}

IvlII = {
	\Iglobal
	<<\IvlIIn \forma>>

}

Icb = {
	\Iglobal
	\clef bass
	<<\Icbn \forma>>

}


Ibc = {
	\Iglobal
	\clef bass
	<<\Ibcn \forma \Ibfn>>
	\typeset

}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

	systems-per-page = #4
   	print-first-page-number = ##t
	first-page-number = #2

		}

\markup \huge {Chiacona - Largo}

	\score {
		{ <<

			\new ChoirStaff <<
					\new Staff
							<<
					\set Staff.midiInstrument = #"violin"
					\set Staff.instrumentName = \markup  \center-column{"Violino""Primo"}
					\IvlI
							>>

				\new Staff
							<<
					\set Staff.midiInstrument = #"violin"
					\set Staff.instrumentName = \markup  \center-column{"Violino""Secondo"}
					\IvlII
							>>

					\new Staff
							<<
					\set Staff.midiInstrument = #"contrabass"
					\set Staff.instrumentName = \markup  \center-column{"Violone""o Tiorba"}
					\Icb
							>>

				\new Staff  \with {fontSize = #+1
 				\override StaffSymbol.staff-space = #(magstep +1)}
							<<
					\set Staff.midiInstrument = #"cello"
					\set Staff.instrumentName = \markup  \center-column{"Basso""Continuo"}
					\Ibc

							>> >>

		>> }

\layout {

	indent = 1.5\cm

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
			} }


}
