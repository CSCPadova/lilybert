\version "@TOPLEVEL_VERSION@"
% automatically converted by musicxml2ly from /nfsd/voce/machine_learning/datasets/pdmx/PDMX/mxl/0a0f75da-57ab-4c26-98e2-a556f5c8e56a.mxl
\pointAndClickOff

%% additional definitions required by the score:
hideNote =
  \tweak Dots.transparent ##t
  \tweak NoteHead.transparent ##t
  \tweak NoteHead.no-ledgers ##t
  \tweak Stem.transparent ##t
  \tweak Accidental.transparent ##t
  \tweak Rest.transparent ##t
  \tweak TabNoteHead.transparent ##t \etc

% Change the number of staff lines to `num-lines`.
%
% The argument `clef` makes the function emit a clef with the given
% name.  If `clef` contains the substring `"percussion"` or `"tab"`,
% use both even and odd staff line positions.  If set to `""`, do the
% same but don't set `Staff.clefPosition` (which means that no clef
% gets triggered).  If `clef` is set to any other value, use even
% staff line positions only and set `Staff.clefPosition`, which
% triggers a clef if its value changes.
%
% The optional argument `properties` is an alist of properties to
% control the appearance of both the staff and the clef:
%
% * `details` is a list of staff line numbers that should be
%   displayed.  An empty list suppresses any display of staff lines;
%   omitting the argument means to display all lines.
% * `staff-color` holds the color of the staff.
% * `clef-font-size` holds the font size of the clef
% * `clef-color` holds the color of the clef.
%
% \staffLines [<properties>] <clef> <num-lines>

staffLines =
#(define-music-function (properties clef num-lines)
                        ((alist? '()) string? index?)
   (let* ((details (assoc-get 'details properties #f))
          (staff-color (assoc-get 'staff-color properties #f))
          (clef-color (assoc-get 'clef-color properties #f))
          (clef-font-size (assoc-get 'clef-font-size properties #f))
          (lines (or details (iota num-lines 1)))
          (only-even-pos (not (or (equal? clef "")
                                  (string-contains clef "percussion")
                                  (string-contains clef "tab"))))
          (offset (if only-even-pos
                      (if (even? num-lines) 1 0)
                      0))
          ;; MusicXML counts staff lines from the bottom.
          (delta (- -1 num-lines offset))
          (positions (filter (lambda (x) (<= x num-lines))
                             lines))
          (positions (map (lambda (x) (+ delta (* x 2)))
                      positions)))
     #{
       \stopStaff

       #(if staff-color
            #{
              \once \override Staff.StaffSymbol.color = #staff-color
            #})
       #(if clef-color
            #{
              \once \override Staff.Clef.color = #clef-color
            #})
       #(if clef-font-size
            #{
              \once \override Staff.Clef.font-size = #clef-font-size
            #})

       #(if (equal? clef "")
            #{
              \unset Staff.middleCPosition
              \unset Staff.middleCClefPosition
              % To suppress the clef inserted by default by LilyPond at the
              % beginning of a piece.
              \once \omit Staff.Clef
            #}
            #{ \clef #clef #})

       \override Staff.StaffSymbol.line-positions = #positions

       \applyContext
       #(lambda (ctx)
          (let* ((c (ly:context-find ctx 'Staff))
                 (clef-p (ly:context-property c 'clefPosition))
                 (middle-c-p (ly:context-property c 'middleCPosition))
                 (middle-c-clef-p (ly:context-property c 'middleCClefPosition))
                 (use-offset (not (string-contains clef "percussion")))
                 (delta (+ delta (if use-offset 6 0))))
            (when only-even-pos
              (ly:context-set-property! c 'clefPosition (+ clef-p delta))
              (ly:context-set-property! c 'forceClef #t))
            (ly:context-set-property! c 'middleCPosition (+ middle-c-p delta))
            (ly:context-set-property! c 'middleCClefPosition
                                      (+ middle-c-clef-p delta))))
       \startStaff
     #}))

D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "チャンカパーナ"
  composer = "Music21"
  "id: software" = "music21 v.9.9.1"
  "id: encoding-date" = "2026-03-01"
}
#(set-global-staff-size 19.916929133858268)
\paper {
}
\layout {
  \context {
    \Staff
    printKeyCancellation = ##f
  }
  \context {
    \Score
    autoBeaming = ##f
  }
}
PartPOneVoiceOne = \relative cis {
  \clef "bass" \numericTimeSignature \time 4/4 \key a \major \U cis16 [ \U cis16
  \U cis16 \U cis16 ] \hideNote r8 \D d16 [ \D d16 ] \D d16 [ \D d16 ] \hideNote
  r4 \U cis16 [ \U d16 ] | % 1
  \D e16 [ \D e16 \D e16 \D e16 ] \D e8 [ \D e16 \D e16 ] \D e16 [ \D fis16 \D
  fis8 ] \hideNote r4 | % 2
  fis1 | % 3
  e2 \D a16 [ \D cis16 ] \hideNote r16 cis16 cis4 | % 4
  \hideNote r4 as2. | % 5
  a!4 \hideNote r8 e8 fis8 \hideNote r16 e16 \hideNote r4 | % 6
  \hideNote R1 | % 7
  fis4 \hideNote r8 e8 fis8 \hideNote r16 e16 \hideNote r8 cis8 | % 8
  \U cis8 [ \U cis8 ] \U b8 [ \U cis8 ] f4 d4 | % 9

  \barNumberCheck #10
  \key fis \major \hideNote r8 es8 \D es8 [ \D es8 ] \D fis!8 [ \D fis8 ] \D es!8
  [ \D bes'8 ] | % 10
  \D as8 [ \D as8 ] \D bes8 [ \D es,8 ] \hideNote r8 es8 \D es8 [ \D es8 ] | % 11
  \U cis8 [ \U cis8 ] \D cis8 [ \D cis'8 ] \D bes8 [ \D as8 ] \D fis8 [ \D bes!8
  ] | % 12
  bes1 | % 13
  \hideNote r8 es,8 \D es8 [ \D es8 ] \D fis8 [ \D fis8 ] \D es!8 [ \D bes'8 ] | % 14
  \D as8 [ \D as8 ] \D bes8 [ \D es,8 ] \hideNote r8 es8 \D es8 [ \D es8 ] | % 15
  \U cis8 [ \U cis8 ] \D cis8 [ \D cis'8 ] \D bes8 [ \D as8 ] \D as8 [ \D fis8 ]
  | % 16
  fis,2 \hideNote r8 fis8 \U fis8 [ \U bes8 ] | % 17
  \key a \major b!4 \hideNote r8 b8 \U b8 [ \U fis8 ] \U b8 [ \U b8 ] | % 18
  e,4 \hideNote r8 e8 \U e8 [ \U b'8 ] \U e8 [ \U e,8 ] | % 19

  \barNumberCheck #20
  cis'4 \hideNote r8 e,8 \U e8 [ \U a8 ] \U e8 [ \U cis'8 ] | % 20
  fis,4 \hideNote r8 fis8 \U fis8 [ \U cis'8 ] \U fis8 [ \U fis,8 ] | % 21
  d4 \hideNote r8 d8 \U d8 [ \U d'8 ] d,4 | % 22
  cis'4 \U a8 [ \U cis8 ] \U cis8 [ \U a8 ] cis4 | % 23
  b4 \U b8 [ \U b8 ] \U b8 [ \U b8 ] \U b8 [ \U b8 ] | % 24
  \U cis8 [ \U cis8 ] \U cis8 [ \U cis8 ] \U cis8 [ \U cis8 ] \U cis8 [ \U cis8
  ] | % 25
  \hideNote r2. \D cis'8 [ \D e8 ] | % 26
  b4 b4 \D b8 [ \D b16 \D b8. ] a8 ] | % 27
  \D b8 [ \D b16 \D b8. ] a8 e4 \D cis'8 [ \D e8 ] | % 28
  b4 b4 \D b8. [ \D b8. ] a8 ] | % 29

  \barNumberCheck #30
  \D b8 [ \D cis8 ] \D b8 [ \D a8 ] fis4 \D cis'8 [ \D e8 ] | % 30
  b4 b4 \D b8. [ \D b8. ] a8 ] | % 31
  b4. b8 \D b8 [ \D cis8 ] \D e8 [ \D d8 ] | % 32
  d2 \D d8 [ \D cis8 ] \D b8 [ \D cis8 ] | % 33
  a2. \hideNote r4 | % 34
  d,,4 d4 d4 d4 | % 35
  a'4 a4 a4 a4 | % 36
  e4 e4 e4 e4 | % 37
  fis4 fis4 fis4 cis'4 | % 38
  d,4 d4 d4 d4 | % 39

  \barNumberCheck #40
  e4 e4 e4 e4 | % 40
  a4 a4 a4 \U a8 [ \U cis8 ] | % 41
  \U cis8 [ \U cis8 ] \U b8 [ \U b8 ] \U a8 [ \U a8 ] \U as8 [ \U as8 ] | % 42
  d,4 d4 d4 d4 | % 43
  \U e16 [ \U e16 \U e16 \U e16 ] \U e8 [ \U e16 \U e16 ] \hideNote r2 | % 44
  \hideNote R1 | % 45
  \hideNote r4. c''8 c8 \hideNote r4. | % 46
  as4. \hideNote r2 \hideNote r8 | % 47
  d,4. e8 e2 | % 48
  \hideNote R1 | % 49

  \barNumberCheck #50
  \hideNote R1 | % 50
  \D c'16 [ \D c16 ] \hideNote r4 \D c16 [ \D c16 ] \hideNote r2 | % 51
  \hideNote r2 \hideNote r8 a8 \D b8 [ \D a8 ] | % 52
  a4. \hideNote r2 b8 | % 53
  b1 | % 54
  \hideNote R1 | % 55
  \hideNote r2. \D cis8 [ \D e8 ] | % 56
  b4 b4 \D b8. [ \D b8. ] a8 ] | % 57
  \D b8 [ \D b16 \D b8. ] a8 e4 \D cis'8 [ \D e8 ] | % 58
  b4 b4 \D b8. [ \D b8. ] a8 ] | % 59

  \barNumberCheck #60
  \D b8 [ \D cis8 ] \D b8 [ \D a8 ] fis4 \D cis'8 [ \D e8 ] | % 60
  b4 b4 \D b8. [ \D b8. ] a8 ] | % 61
  b4. b8 \D b8 [ \D cis8 ] \D e8 [ \D d8 ] | % 62
  d2 \D d8 [ \D cis8 ] \D b8 [ \D cis8 ] | % 63
  cis1 | % 64
  \D d,16 [ \D d16 \D d16 \D d16 ] \D d8 [ \D d16 \D d16 ] \D d16 [ \D d16 \D d8
  ] \hideNote r4 | % 65
  \D d16 [ \D d16 \D d16 \D d16 ] \D d8 [ \D d16 \D d16 ] \D d16 [ \D d16 \D d8
  ] \hideNote r4 | % 66
  \key bes \major es,4 es4 es4 es4 | % 67
  bes'4 bes4 bes4 bes4 | % 68
  f4 f4 f4 f4 | % 69

  \barNumberCheck #70
  g4 g4 g4 g4 | % 70
  es4 es4 es4 es4 | % 71
  f4 f4 f4 f4 | % 72
  bes4 bes4 bes4 \U bes8 [ \U d8 ] | % 73
  \hideNote r2. \D d'8 [ \D f8 ] | % 74
  c4 c4 \D c8 [ \D c16 \D c8. ] bes8 ] | % 75
  \D c8 [ \D c16 \D c8. ] bes8 f4 \D d'8 [ \D f8 ] | % 76
  c4 c4 \D c8. [ \D c8. ] bes8 ] | % 77
  \D c8 [ \D d8 ] \D c8 [ \D bes8 ] g4 \D d'8 [ \D f8 ] | % 78
  c4 c4 \D c8. [ \D c8. ] bes8 ] | % 79

  \barNumberCheck #80
  c4. c8 \D c8 [ \D d8 ] \D f8 [ \D es8 ] | % 80
  es2 \D es8 [ \D es8 ] \D f8 [ \D d8 ] | % 81
  d2 \hideNote r8 bes8 \D d8 [ \D c8 ] | % 82
  \D c8 [ \D bes8 ] \D d8 [ \D c8 ] \D c8 [ \D bes8 ] \D f'8 [ \D c8 ] | % 83
  c2 \hideNote r16 \D d8 [ \D d16 ] \D f8 [ \D d8 ] | % 84
  g1 | % 85
  \hideNote R1 | % 86
  \hideNote R1 | % 87
  \hideNote r2 \hideNote r16 \D d8 [ \D d16 ] \D f8 [ \D d8 ] | % 88
  g1 | % 89

  \barNumberCheck #90
  bes,2. \hideNote r4 | % 90
  f4 f8 \hideNote r2 \hideNote r8 | % 91
  \D d16 [ \D d16 \D d16 \D d16 ] \hideNote r8 \D es16 [ \D es16 ] \D es16 [ \D
  es16 ] \hideNote r4 \D d16 [ \D es16 ] | % 92
  \D f16 [ \D f16 \D f16 \D f16 ] \D f8 [ \D f16 \D f16 ] \D f16 [ \D g16 \D g8
  ] \hideNote r4 | % 93
  \hideNote R1 | % 94
  \hideNote R1 | % 95
  \hideNote R1 | % 96
  \hideNote R1 | % 97
  \hideNote R1 | % 98
  \hideNote R1 | % 99

  \barNumberCheck #100
  \hideNote R1 | % 100
  \hideNote R1 | % 101
  \hideNote R1 | % 102
  \hideNote R1 | % 103
  \hideNote R1 | % 104
  \hideNote R1 | % 105
  \hideNote R1 | % 106
  \hideNote R1 | % 107
  \hideNote R1 | % 108
  \hideNote R1 | % 109

  \barNumberCheck #110
  \hideNote R1 | % 110
  \hideNote R1 | % 111
  \hideNote R1 | % 112
  \hideNote R1 | % 113
  \hideNote R1 | % 114
  \hideNote R1 | % 115
  \hideNote R1 | % 116
  \hideNote R1 | % 117
  \hideNote R1 | % 118
  \hideNote R1 | % 119

  \barNumberCheck #120
  \hideNote R1 | % 120
  \hideNote R1 | % 121
  \hideNote R1 | % 122
  \hideNote R1 | % 123
  \hideNote R1 | % 124
  \hideNote R1 | % 125
  \hideNote R1 | % 126
  \hideNote R1 | % 127
  \hideNote R1 | % 128
  \hideNote R1 | % 129

  \barNumberCheck #130
  \hideNote R1 | % 130
  \hideNote R1 | % 131
  \hideNote R1 | % 132
  \hideNote R1 | % 133
  \hideNote R1 | % 134
  \hideNote R1 | % 135
  \hideNote R1 | % 136
  \hideNote R1 | % 137
  \hideNote R1 | % 138
  \hideNote R1 | % 139

  \barNumberCheck #140
  \hideNote R1 | % 140
  \hideNote R1 | % 141
  \hideNote R1 | % 142
  \hideNote R1 | % 143
  \hideNote R1 | % 144
  \hideNote R1 | % 145
  \hideNote R1 | % 146
  \hideNote R1 | % 147
  \hideNote R1 | % 148
  \hideNote R1 | % 149

  \barNumberCheck #150
  \hideNote R1 | % 150
  \hideNote R1 | % 151
  \hideNote R1 | % 152
  \hideNote R1 | % 153
  \hideNote R1 | % 154
  \hideNote R1 | % 155
  \hideNote R1 | % 156
  \hideNote R1 | % 157
  \hideNote R1 | % 158
  \hideNote R1 | % 159

  \barNumberCheck #160
  \hideNote R1 | % 160
  \hideNote R1 | % 161
  \hideNote R1 | % 162
  \hideNote R1 | % 163
  \hideNote R1 | % 164
  \hideNote R1 | % 165
  \hideNote R1 | % 166
  \hideNote R1 | % 167
  \hideNote R1 | % 168
  \hideNote R1 | % 169

  \barNumberCheck #170
  \hideNote R1 | % 170
  \hideNote R1 | % 171
  \hideNote R1 | % 172
  \hideNote R1 | % 173
  \hideNote R1 | % 174
  \hideNote R1 | % 175
  \hideNote R1 | % 176
  \hideNote R1 | % 177
  \hideNote R1 | % 178
  \hideNote R1 | % 179

  \barNumberCheck #180
  \hideNote R1 | % 180
  \hideNote R1 | % 181
  \hideNote R1 | % 182
  \hideNote R1 | % 183
  \hideNote R1 | % 184
  \hideNote R1 | % 185
  \hideNote R1 | % 186
  \hideNote R1 | % 187
  \hideNote R1 | % 188
  \hideNote R1 | % 189

  \barNumberCheck #190
  \hideNote R1 | % 190
  \hideNote R1 | % 191
  \hideNote R1 | % 192
  \hideNote R1 | % 193
  \hideNote R1 | % 194
  \hideNote R1 | % 195
  \hideNote R1 | % 196
  \hideNote R1 | % 197
  \hideNote R1 | % 198
  \hideNote R1 | % 199

  \barNumberCheck #200
  \hideNote R1 | % 200
  \hideNote R1 | % 201
  \hideNote R1 | % 202
  \hideNote R1 | % 203
  \hideNote R1 | % 204
  \hideNote R1 | % 205
  \hideNote R1 | % 206
  \hideNote R1 | % 207
  \hideNote R1 | % 208
  \hideNote R1 | % 209

  \barNumberCheck #210
  \hideNote R1 | % 210
  \hideNote R1 | % 211
  \hideNote R1 | % 212
  \hideNote R1 | % 213
  \hideNote R1 | % 214
  \hideNote R1 | % 215
  \hideNote R1 | % 216
  \hideNote R1 | % 217
  \hideNote R1 | % 218
  \hideNote R1 | % 219

  \barNumberCheck #220
  \hideNote R1 | % 220
  \hideNote R1 | % 221
  \hideNote R1 | % 222
  \hideNote R1 | % 223
  \hideNote R1 | % 224
  \hideNote R1 | % 225
  \hideNote R1 | % 226
  \hideNote R1 | % 227
  \hideNote R1 | % 228
  \hideNote R1 | % 229

  \barNumberCheck #230
  \hideNote R1 | % 230
  \hideNote R1 | % 231
  \hideNote R1 | % 232
  \hideNote R1 | % 233
  \hideNote R1 | % 234
  \hideNote R1 | % 235
  \hideNote R1 | % 236
  \hideNote R1 | % 237
  \hideNote R1 | % 238
  \hideNote R1 | % 239

  \barNumberCheck #240
  \hideNote R1 | % 240
  \hideNote R1 | % 241
  \hideNote R1 | % 242
  \hideNote R1 | % 243
  \hideNote R1 | % 244
  \hideNote R1 | % 245
  \hideNote R1 | % 246
  \hideNote R1 | % 247
  \hideNote R1 | % 248
  \hideNote R1 | % 249

  \barNumberCheck #250
  \hideNote R1 | % 250
  \hideNote R1 | % 251
  \hideNote R1 | % 252
  \hideNote R1 | % 253
  \hideNote R1 | % 254
  \hideNote R1 | % 255
  \hideNote R1 | % 256
  \hideNote R1 | % 257
  \hideNote R1 | % 258
  \hideNote R1 | % 259

  \barNumberCheck #260
  \hideNote R1 | % 260
  \hideNote R1 | % 261
  \hideNote R1 | % 262
  \hideNote R1 | % 263
  \hideNote R1 | % 264
  \hideNote R1 | % 265
  \hideNote R1 | % 266
  \hideNote R1 | % 267
  \hideNote R1 | % 268
  \hideNote R1 | % 269

  \barNumberCheck #270
  \hideNote R1 | % 270
  \hideNote R1 | % 271
  \hideNote R1 | % 272
  \hideNote R1 | % 273
  \hideNote R1 | % 274
  \hideNote R1 | % 275
  \hideNote R1 | % 276
  \hideNote R1 | % 277
  \hideNote R1 | % 278
  \hideNote R1 | % 279

  \barNumberCheck #280
  \hideNote R1 | % 280
  \hideNote R1 | % 281
  \hideNote R1 | % 282
  \hideNote R1 | % 283
  \hideNote R1 | % 284
  \hideNote R1 | % 285
  \hideNote R1 | % 286
  \hideNote R1 | % 287
  \hideNote R1 | % 288
  \hideNote R1 | % 289

  \barNumberCheck #290
  \hideNote R1 | % 290
  \hideNote R1 | % 291
  \hideNote R1 | % 292
  \hideNote R1 | % 293
  \hideNote R1 | % 294
  \hideNote R1 | % 295
  \hideNote R1 | % 296
  \hideNote R1 | % 297
  \hideNote R1 | % 298
  \hideNote R1 | % 299

  \barNumberCheck #300
  \hideNote R1 | % 300
  \hideNote R1 | % 301
  \hideNote R1 | % 302
  \hideNote R1 | % 303
  \hideNote R1 | % 304
  \hideNote R1 | % 305
  \hideNote R1 | % 306
  \hideNote R1 | % 307
  \hideNote R1 | % 308
  \hideNote R1 | % 309

  \barNumberCheck #310
  \hideNote R1 | % 310
  \hideNote R1 | % 311
  \hideNote R1 | % 312
  \hideNote R1 | % 313
  \hideNote R1 | % 314
  \hideNote R1 | % 315
  \hideNote R1 | % 316
  \hideNote R1 | % 317
  \hideNote R1 | % 318
  \hideNote R1 | % 319

  \barNumberCheck #320
  \hideNote R1 | % 320
  \hideNote R1 | % 321
  \hideNote R1 | % 322
  \hideNote R1 | % 323
  \hideNote R1 | % 324
  \hideNote R1 | % 325
  \hideNote R1 | % 326
  \hideNote R1 | % 327
  \hideNote R1 | % 328
  \hideNote R1 | % 329

  \barNumberCheck #330
  \hideNote R1 | % 330
  \hideNote R1 | % 331
  \hideNote R1 | % 332
  \hideNote R1 | % 333
  \hideNote R1 | % 334
  \hideNote R1 | % 335
  \hideNote R1 | % 336
  \hideNote R1 | % 337
  \hideNote R1 | % 338
  \hideNote R1 | % 339

  \barNumberCheck #340
  \hideNote R1 | % 340
  \hideNote R1 | % 341
  \hideNote R1 | % 342
  \hideNote R1 | % 343
  \hideNote R1 | % 344
  \hideNote R1 | % 345
  \hideNote R1 | % 346
  \hideNote R1 | % 347
  \hideNote R1 | % 348
  \hideNote R1 | % 349

  \barNumberCheck #350
  \hideNote R1 | % 350
  \hideNote R1 | % 351
  \hideNote R1 | % 352
  \hideNote R1 | % 353
  \hideNote R1 | % 354
  \hideNote R1 | % 355
  \hideNote R1 | % 356
  \hideNote R1 | % 357
  \hideNote R1 | % 358
  \hideNote R1 | % 359

  \barNumberCheck #360
  \hideNote R1 | % 360
  \hideNote R1 | % 361
  \hideNote R1 | % 362
  \hideNote R1 | % 363
  \hideNote R1 | % 364
  \hideNote R1 | % 365
  \hideNote R1 | % 366
  \hideNote R1 | % 367
  \hideNote R1 | % 368
  \hideNote R1 | % 369

  \barNumberCheck #370
  \hideNote R1 | % 370
  \hideNote R1 | % 371
  \hideNote R1 | % 372
  \hideNote R1 | % 373
  \hideNote R1 | % 374
  \hideNote R1 | % 375
  \hideNote R1 | % 376
  \hideNote R1 | % 377
  \hideNote R1 | % 378
  \hideNote R1 | % 379

  \barNumberCheck #380
  \hideNote R1 | % 380
  \hideNote R1 | % 381
  \hideNote R1 | % 382
  \hideNote R1 | % 383
  \hideNote R1 | % 384
  \hideNote R1 | % 385
  \hideNote R1 | % 386
  \hideNote R1 | % 387
  \hideNote R1 | % 388
  \hideNote R1 | % 389

  \barNumberCheck #390
  \hideNote R1 | % 390
  \hideNote R1 | % 391
  \hideNote R1 | % 392
  \hideNote R1 | % 393
  \hideNote R1 | % 394
  \hideNote R1 | % 395
  \hideNote R1 | % 396
  \hideNote R1 | % 397
  \hideNote R1 | % 398
  \hideNote R1 | % 399

  \barNumberCheck #400
  \hideNote R1 | % 400
  \hideNote R1 | % 401
  \hideNote R1 | % 402
  \hideNote R1 | % 403
  \hideNote R1 | % 404
  \hideNote R1 | % 405
  \hideNote R1 | % 406
  \hideNote R1 | % 407
  \hideNote R1 | % 408
  \hideNote R1 | % 409

  \barNumberCheck #410
  \hideNote R1 | % 410
  \hideNote R1 | % 411
  \hideNote R1 | % 412
  \hideNote R1 | % 413
  \hideNote R1 | % 414
  \hideNote R1 | % 415
  \hideNote R1 | % 416
  \hideNote R1 | % 417
  \hideNote R1 | % 418
  \hideNote R1 | % 419

  \barNumberCheck #420
  \hideNote R1 | % 420
  \hideNote R1 | % 421
  \hideNote R1 | % 422
  \hideNote R1 | % 423
  \hideNote R1 | % 424
  \hideNote R1 | % 425
  \hideNote R1 | % 426
  \hideNote R1 | % 427
  \hideNote R1 | % 428
  \hideNote R1 | % 429

  \barNumberCheck #430
  \hideNote R1 | % 430
  \hideNote R1 | % 431
  \hideNote R1 | % 432
  \hideNote R1 | % 433
  \hideNote R1 | % 434
  \hideNote R1 | % 435
  \hideNote R1 | % 436
  \hideNote R1 | % 437
  \hideNote R1 | % 438
  \hideNote R1 | % 439

  \barNumberCheck #440
  \hideNote R1 | % 440
  \hideNote R1 | % 441
  \hideNote R1 | % 442
  \hideNote R1 | % 443
  \hideNote R1 | % 444
  \hideNote R1 | % 445
  \hideNote R1 | % 446
  \hideNote R1 | % 447
  \hideNote R1 | % 448
  \hideNote R1 | % 449

  \barNumberCheck #450
  \hideNote R1 | % 450
  \hideNote R1 | % 451
  \hideNote R1 | % 452
  \hideNote R1 | % 453
  \hideNote R1 | % 454
  \hideNote R1 | % 455
  \hideNote R1 | % 456
  \hideNote R1 | % 457
  \hideNote R1 | % 458
  \hideNote R1 | % 459

  \barNumberCheck #460
  \hideNote R1 | % 460
  \hideNote R1 | % 461
  \hideNote R1 | % 462
  \hideNote R1 | % 463
  \hideNote R1 | % 464
  \hideNote R1 | % 465
  \hideNote R1 | % 466
  \hideNote R1 | % 467
  \hideNote R1 | % 468
  \hideNote R1 | % 469

  \barNumberCheck #470
  \hideNote R1 | % 470
  \hideNote R1 | % 471
  \hideNote R1 | % 472
  \hideNote R1 | % 473
  \hideNote R1 | % 474
  \hideNote R1 | % 475
  \hideNote R1 | % 476
  \hideNote R1 | % 477
  \hideNote R1 | % 478
  \hideNote R1 | % 479

  \barNumberCheck #480
  \hideNote R1 | % 480
  \hideNote R1 | % 481
  \hideNote R1 | % 482
  \hideNote R1 | % 483
  \hideNote R1 | % 484
  \hideNote R1 | % 485
  \hideNote R1 | % 486
  \hideNote R1 | % 487
  \hideNote R1 | % 488
  \hideNote R1 | % 489

  \barNumberCheck #490
  \hideNote R1 | % 490
  \hideNote R1 | % 491
  \hideNote R1 | % 492
  \hideNote R1 | % 493
  \hideNote R1 | % 494
  \hideNote R1 | % 495
  \hideNote R1 | % 496
  \hideNote R1 | % 497
  \hideNote R1 | % 498
  \hideNote R1 | % 499

  \barNumberCheck #500
  \hideNote R1 | % 500
  \hideNote R1 | % 501
  \hideNote R1 | % 502
  \hideNote R1 | % 503
  \hideNote R1 | % 504
  \hideNote R1 | % 505
  \hideNote R1 | % 506
  \hideNote R1 | % 507
  \hideNote R1 | % 508
  \hideNote R1 | % 509

  \barNumberCheck #510
  \hideNote R1 | % 510
  \hideNote R1 | % 511
  \hideNote R1 | % 512
  \hideNote R1 | % 513
  \hideNote R1 | % 514
  \hideNote R1 | % 515
  \hideNote R1 | % 516
  \hideNote R1 | % 517
  \hideNote R1 | % 518
  \hideNote R1 | % 519

  \barNumberCheck #520
  \hideNote R1 | % 520
  \hideNote R1 | % 521
  \hideNote R1 | % 522
  \hideNote R1 | % 523
  \hideNote R1 | % 524
  \hideNote R1 | % 525
  \hideNote R1 | % 526
  \hideNote R1 | % 527
  \hideNote R1 | % 528
  \hideNote R1 | % 529

  \barNumberCheck #530
  \hideNote R1 | % 530
  \hideNote R1 | % 531
  \hideNote R1 | % 532
  \hideNote R1 | % 533
  \hideNote R1 | % 534
  \hideNote R1 | % 535
  \hideNote R1 | % 536
  \hideNote R1 | % 537
  \hideNote R1 | % 538
  \hideNote R1 | % 539

  \barNumberCheck #540
  \hideNote R1 | % 540
  \hideNote R1 | % 541
  \hideNote R1 | % 542
  \hideNote R1 | % 543
  \hideNote R1 | % 544
  \hideNote R1 | % 545
  \hideNote R1 | % 546
  \hideNote R1 | % 547
  \hideNote R1 | % 548
  \hideNote R1 | % 549

  \barNumberCheck #550
  \hideNote R1 | % 550
  \hideNote R1 | % 551
  \hideNote R1 | % 552
  \hideNote R1 | % 553
  \hideNote R1 | % 554
  \hideNote R1 | % 555
  \hideNote r2 \hideNote r8. \bar "|."
}

PartPTwoVoiceOne = \relative fis, {
  \clef "bass" \numericTimeSignature \time 4/4 \key a \major \U fis16 [ \U fis16
  \U fis16 \U fis16 ] \hideNote r8 \U d16 [ \U d16 ] \U d16 [ \U d16 ] \hideNote
  r4. | % 1
  \U fis16 [ \U fis16 \U fis16 \U fis16 ] \U fis8 [ \U fis16 \U fis16 ] \U fis16
  [ \U fis16 \U fis8 ] \hideNote r4 | % 2
  d'4 d4 d4 \D d8 [ \D d8 ] | % 3
  a4 a4 a4 \U a8 [ \U a8 ] | % 4
  e4 e4 e4 \U e8 [ \U e8 ] | % 5
  fis4 \hideNote r8 e8 fis8 \hideNote r16 e16 \hideNote r8 cis'8 | % 6
  \U cis8 [ \U cis8 ] \U b8 [ \U cis8 ] a8 \hideNote r16 as16 \hideNote r8 e8 | % 7
  fis4 \hideNote r8 e8 fis8 \hideNote r16 e16 \hideNote r8 cis'8 | % 8
  \U cis8 [ \U cis8 ] \U b8 [ \U cis8 ] bes4 d,4 | % 9

  \barNumberCheck #10
  \key fis \major es4 es4 es4 es4 | % 10
  b'4 b4 b4 b4 | % 11
  cis4 cis4 cis4 cis4 | % 12
  fis,4 fis4 fis4 \U fis8 [ \U f8 ] | % 13
  es4 es4 es4 es4 | % 14
  b'4 b4 b4 b4 | % 15
  cis4 cis4 cis4 cis4 | % 16
  \hideNote r2 \hideNote r8 fis8 \D fis8 [ \D fis8 ] | % 17
  \key a \major fis4. fis8 \D fis8 [ \D fis8 ] \D a8 [ \D as8 ] | % 18
  as4 \D a8 [ \D b8 ] b8 as4 e8 | % 19

  \barNumberCheck #20
  e4. e8 \D e8 [ \D d'8 ] \D d8 [ \D d8 ] | % 20
  d4 \D cis8 [ \D cis8 ] cis8 b4 a8 | % 21
  \hideNote r4 \D a8 [ \D a8 ] \D a8 [ \D fis8 ] \D e8 [ \D e8 ] | % 22
  \D e8 [ \D b'8 ] \D a8 [ \D a8 ] \D a8 [ \D b8 ] \D cis8 [ \D cis8 ~ ] | % 23
  \D cis8 [ \D b8 ] \D b8 [ \D b8 ] a4 \D cis8 [ \D cis8 ~ ] | % 24
  cis2.. \hideNote r8 | % 25
  \D cis16 [ \D cis16 \D e8 ] cis8 b4 \hideNote r4 d,,8 ~ | % 26
  d8 d4 d4 d4 a'8 ~ | % 27
  a8 a4 a4 a4 e8 ~ | % 28
  e8 e4 e4 e4 fis8 ~ | % 29

  \barNumberCheck #30
  fis8 fis4 fis4 fis4 d8 ~ | % 30
  d8 d4 d4 d4 e8 ~ | % 31
  e8 e4 e4 e4 a8 ~ | % 32
  a8 a4 a4 a8 \U cis8 [ \U cis8 ] | % 33
  \U cis8 [ \U b8 ] b8 \hideNote r4 cis'8 \D e8 [ \D b8 ~ ] | % 34
  b8 b4 b8 \D b16 [ \D b8. ] \D a8 [ \D b8 ] | % 35
  \D b16 [ \D b8. ] a8 e4 cis'8 \D e8 [ \D b8 ~ ] | % 36
  b8 b4 b8. \D b8. [ \D a8 \D b8 ] | % 37
  \D cis8 [ \D b8 ] a8 fis4 cis'8 \D e8 [ \D b8 ~ ] | % 38
  b8 b4 b8. \D b8. [ \D a8 \D b8 ~ ] | % 39

  \barNumberCheck #40
  b4 \D b8 [ \D b8 ] \D cis8 [ \D e8 ] \D d8 [ \D d8 ~ ] | % 40
  d4. d8 \D d8 [ \D e8 ] \D cis8 [ \D cis8 ~ ] | % 41
  cis4. \hideNote r8 \D a8 [ \D cis8 ] \D b8 [ \D b8 ] | % 42
  \D a8 [ \D cis8 ] \D b8 [ \D b8 ] \D a8 [ \D e'8 ] \D b8 [ \D b8 ~ ] | % 43
  b4. \hideNote r16 cis8 \D cis16 [ \D e8 ] \D cis8 [ \D fis8 ~ ] | % 44
  fis2.. as,,8 ~ | % 45
  as8 as!4 as4 as4 cis8 ~ | % 46
  cis8 cis4 cis4 cis4 fis,8 ~ | % 47
  fis8 fis4 fis4 fis4 \U fis16 [ \U fis16 ] | % 48
  \hideNote r4 \U fis16 [ \U fis16 ] \hideNote r2 \hideNote r8 | % 49

  \barNumberCheck #50
  fis'4 cis8 fis,4 e4 \U d16 [ \U d16 ] | % 50
  \hideNote r4 \U d16 [ \U d16 ] \hideNote r2 \hideNote r8 | % 51
  \hideNote R1 | % 52
  \hideNote R1 | % 53
  \hideNote R1 | % 54
  \hideNote R1 | % 55
  \hideNote r2.. d8 ~ | % 56
  d4 d8 d2 cis'8 ~ | % 57
  cis4 cis8 cis2 e,8 ~ | % 58
  e4 e8 e2 fis8 ~ | % 59

  \barNumberCheck #60
  fis4 fis8 fis4 fis8 \U e8 [ \U d8 ~ ] | % 60
  d4 d8 d2 e8 ~ | % 61
  e4 e8 e2 a8 ~ | % 62
  a4 a8 a4. \U cis8 [ \U cis8 ] | % 63
  \U cis8 [ \U b8 ] \U b8 [ \U a8 ] \U a8 [ \U as8 ] as8 \hideNote r8 | % 64
  \hideNote R1 | % 65
  \hideNote r2 \hideNote r8 d'8 \D f8 [ \D c8 ~ ] | % 66
  \key bes \major c8 c4 c8 \D c16 [ \D c8. ] \D bes8 [ \D c8 ] | % 67
  \D c16 [ \D c8. ] bes8 f4 d'8 \D f8 [ \D c8 ~ ] | % 68
  c8 c4 c8. \D c8. [ \D bes8 \D c8 ] | % 69

  \barNumberCheck #70
  \D d8 [ \D c8 ] bes8 g4 d'8 \D f8 [ \D c8 ~ ] | % 70
  c8 c4 c8. \D c8. [ \D bes8 \D c8 ~ ] | % 71
  c4 \D c8 [ \D c8 ] \D d8 [ \D f8 ] \D es8 [ \D es8 ~ ] | % 72
  es4. es8 \D d8 [ \D c8 ] \D d8 [ \D d8 ~ ] | % 73
  d2 ~ d8 \hideNote r4 es,,8 ~ | % 74
  es8 es4 es4 es4 bes'8 ~ | % 75
  bes8 bes4 bes4 bes4 f8 ~ | % 76
  f8 f4 f4 f4 g8 ~ | % 77
  g8 g4 g4 d'4 es,8 ~ | % 78
  es8 es4 es4 es4 f8 ~ | % 79

  \barNumberCheck #80
  f8 f4 f4 f4 bes8 ~ | % 80
  bes8 bes4 bes4 bes8 \D d8 [ \D d8 ] | % 81
  \U d8 [ \U c8 ] \U c8 [ \U bes8 ] \U bes8 [ \U a8 ] \U a8 [ \U es8 ~ ] | % 82
  es8 es4 es4 es4 \U f16 [ \U f16 ] | % 83
  \U f16 [ \U f16 \U f8 ] \U f16 [ \U f16 ] \hideNote r2 es'8 ~ | % 84
  es8 es4 es4 es8 \U es8 [ \U bes8 ~ ] | % 85
  bes8 bes4 bes4 bes8 \U bes8 [ \U f8 ~ ] | % 86
  f8 f4 f4 f8 \U f8 [ \U g8 ~ ] | % 87
  g8 g4 g4 g8 \U g8 [ \U es'8 ~ ] | % 88
  es8 es4 es4 es8 \U es8 [ \U bes8 ~ ] | % 89

  \barNumberCheck #90
  bes8 bes4 bes4 bes8 \U bes8 [ \U f8 ~ ] | % 90
  f8 f4 f4 f8 \U f8 [ \U g16 \U g16 ] | % 91
  \U g16 [ \U g16 ] \hideNote r8 \U g16 [ \U g16 \U g16 \U g16 ] \hideNote r4.
  \U g16 [ \U g16 ] | % 92
  \U g16 [ \U g16 \U g8 ] \U g16 [ \U g16 \U g16 \U g16 ] g8 \hideNote r4. | % 93
  \hideNote R1 | % 94
  \hideNote R1 | % 95
  \hideNote R1 | % 96
  \hideNote R1 | % 97
  \hideNote R1 | % 98
  \hideNote R1 | % 99

  \barNumberCheck #100
  \hideNote R1 | % 100
  \hideNote R1 | % 101
  \hideNote R1 | % 102
  \hideNote R1 | % 103
  \hideNote R1 | % 104
  \hideNote R1 | % 105
  \hideNote R1 | % 106
  \hideNote R1 | % 107
  \hideNote R1 | % 108
  \hideNote R1 | % 109

  \barNumberCheck #110
  \hideNote R1 | % 110
  \hideNote R1 | % 111
  \hideNote R1 | % 112
  \hideNote R1 | % 113
  \hideNote R1 | % 114
  \hideNote R1 | % 115
  \hideNote R1 | % 116
  \hideNote R1 | % 117
  \hideNote R1 | % 118
  \hideNote R1 | % 119

  \barNumberCheck #120
  \hideNote R1 | % 120
  \hideNote R1 | % 121
  \hideNote R1 | % 122
  \hideNote R1 | % 123
  \hideNote R1 | % 124
  \hideNote R1 | % 125
  \hideNote R1 | % 126
  \hideNote R1 | % 127
  \hideNote R1 | % 128
  \hideNote R1 | % 129

  \barNumberCheck #130
  \hideNote R1 | % 130
  \hideNote R1 | % 131
  \hideNote R1 | % 132
  \hideNote R1 | % 133
  \hideNote R1 | % 134
  \hideNote R1 | % 135
  \hideNote R1 | % 136
  \hideNote R1 | % 137
  \hideNote R1 | % 138
  \hideNote R1 | % 139

  \barNumberCheck #140
  \hideNote R1 | % 140
  \hideNote R1 | % 141
  \hideNote R1 | % 142
  \hideNote R1 | % 143
  \hideNote R1 | % 144
  \hideNote R1 | % 145
  \hideNote R1 | % 146
  \hideNote R1 | % 147
  \hideNote R1 | % 148
  \hideNote R1 | % 149

  \barNumberCheck #150
  \hideNote R1 | % 150
  \hideNote R1 | % 151
  \hideNote R1 | % 152
  \hideNote R1 | % 153
  \hideNote R1 | % 154
  \hideNote R1 | % 155
  \hideNote R1 | % 156
  \hideNote R1 | % 157
  \hideNote R1 | % 158
  \hideNote R1 | % 159

  \barNumberCheck #160
  \hideNote R1 | % 160
  \hideNote R1 | % 161
  \hideNote R1 | % 162
  \hideNote R1 | % 163
  \hideNote R1 | % 164
  \hideNote R1 | % 165
  \hideNote R1 | % 166
  \hideNote R1 | % 167
  \hideNote R1 | % 168
  \hideNote R1 | % 169

  \barNumberCheck #170
  \hideNote R1 | % 170
  \hideNote R1 | % 171
  \hideNote R1 | % 172
  \hideNote R1 | % 173
  \hideNote R1 | % 174
  \hideNote R1 | % 175
  \hideNote R1 | % 176
  \hideNote R1 | % 177
  \hideNote R1 | % 178
  \hideNote R1 | % 179

  \barNumberCheck #180
  \hideNote R1 | % 180
  \hideNote R1 | % 181
  \hideNote R1 | % 182
  \hideNote R1 | % 183
  \hideNote R1 | % 184
  \hideNote R1 | % 185
  \hideNote R1 | % 186
  \hideNote R1 | % 187
  \hideNote R1 | % 188
  \hideNote R1 | % 189

  \barNumberCheck #190
  \hideNote R1 | % 190
  \hideNote R1 | % 191
  \hideNote R1 | % 192
  \hideNote R1 | % 193
  \hideNote R1 | % 194
  \hideNote R1 | % 195
  \hideNote R1 | % 196
  \hideNote R1 | % 197
  \hideNote R1 | % 198
  \hideNote R1 | % 199

  \barNumberCheck #200
  \hideNote R1 | % 200
  \hideNote R1 | % 201
  \hideNote R1 | % 202
  \hideNote R1 | % 203
  \hideNote R1 | % 204
  \hideNote R1 | % 205
  \hideNote R1 | % 206
  \hideNote R1 | % 207
  \hideNote R1 | % 208
  \hideNote R1 | % 209

  \barNumberCheck #210
  \hideNote R1 | % 210
  \hideNote R1 | % 211
  \hideNote R1 | % 212
  \hideNote R1 | % 213
  \hideNote R1 | % 214
  \hideNote R1 | % 215
  \hideNote R1 | % 216
  \hideNote R1 | % 217
  \hideNote R1 | % 218
  \hideNote R1 | % 219

  \barNumberCheck #220
  \hideNote R1 | % 220
  \hideNote R1 | % 221
  \hideNote R1 | % 222
  \hideNote R1 | % 223
  \hideNote R1 | % 224
  \hideNote R1 | % 225
  \hideNote R1 | % 226
  \hideNote R1 | % 227
  \hideNote R1 | % 228
  \hideNote R1 | % 229

  \barNumberCheck #230
  \hideNote R1 | % 230
  \hideNote R1 | % 231
  \hideNote R1 | % 232
  \hideNote R1 | % 233
  \hideNote R1 | % 234
  \hideNote R1 | % 235
  \hideNote R1 | % 236
  \hideNote R1 | % 237
  \hideNote R1 | % 238
  \hideNote R1 | % 239

  \barNumberCheck #240
  \hideNote R1 | % 240
  \hideNote R1 | % 241
  \hideNote R1 | % 242
  \hideNote R1 | % 243
  \hideNote R1 | % 244
  \hideNote R1 | % 245
  \hideNote R1 | % 246
  \hideNote R1 | % 247
  \hideNote R1 | % 248
  \hideNote R1 | % 249

  \barNumberCheck #250
  \hideNote R1 | % 250
  \hideNote R1 | % 251
  \hideNote R1 | % 252
  \hideNote R1 | % 253
  \hideNote R1 | % 254
  \hideNote R1 | % 255
  \hideNote R1 | % 256
  \hideNote R1 | % 257
  \hideNote R1 | % 258
  \hideNote R1 | % 259

  \barNumberCheck #260
  \hideNote R1 | % 260
  \hideNote R1 | % 261
  \hideNote R1 | % 262
  \hideNote R1 | % 263
  \hideNote R1 | % 264
  \hideNote R1 | % 265
  \hideNote R1 | % 266
  \hideNote R1 | % 267
  \hideNote R1 | % 268
  \hideNote R1 | % 269

  \barNumberCheck #270
  \hideNote R1 | % 270
  \hideNote R1 | % 271
  \hideNote R1 | % 272
  \hideNote R1 | % 273
  \hideNote R1 | % 274
  \hideNote R1 | % 275
  \hideNote R1 | % 276
  \hideNote R1 | % 277
  \hideNote R1 | % 278
  \hideNote R1 | % 279

  \barNumberCheck #280
  \hideNote R1 | % 280
  \hideNote R1 | % 281
  \hideNote R1 | % 282
  \hideNote R1 | % 283
  \hideNote R1 | % 284
  \hideNote R1 | % 285
  \hideNote R1 | % 286
  \hideNote R1 | % 287
  \hideNote R1 | % 288
  \hideNote R1 | % 289

  \barNumberCheck #290
  \hideNote R1 | % 290
  \hideNote R1 | % 291
  \hideNote R1 | % 292
  \hideNote R1 | % 293
  \hideNote R1 | % 294
  \hideNote R1 | % 295
  \hideNote R1 | % 296
  \hideNote R1 | % 297
  \hideNote R1 | % 298
  \hideNote R1 | % 299

  \barNumberCheck #300
  \hideNote R1 | % 300
  \hideNote R1 | % 301
  \hideNote R1 | % 302
  \hideNote R1 | % 303
  \hideNote R1 | % 304
  \hideNote R1 | % 305
  \hideNote R1 | % 306
  \hideNote R1 | % 307
  \hideNote R1 | % 308
  \hideNote R1 | % 309

  \barNumberCheck #310
  \hideNote R1 | % 310
  \hideNote R1 | % 311
  \hideNote R1 | % 312
  \hideNote R1 | % 313
  \hideNote R1 | % 314
  \hideNote R1 | % 315
  \hideNote R1 | % 316
  \hideNote R1 | % 317
  \hideNote R1 | % 318
  \hideNote R1 | % 319

  \barNumberCheck #320
  \hideNote R1 | % 320
  \hideNote R1 | % 321
  \hideNote R1 | % 322
  \hideNote R1 | % 323
  \hideNote R1 | % 324
  \hideNote R1 | % 325
  \hideNote R1 | % 326
  \hideNote R1 | % 327
  \hideNote R1 | % 328
  \hideNote R1 | % 329

  \barNumberCheck #330
  \hideNote R1 | % 330
  \hideNote R1 | % 331
  \hideNote R1 | % 332
  \hideNote R1 | % 333
  \hideNote R1 | % 334
  \hideNote R1 | % 335
  \hideNote R1 | % 336
  \hideNote R1 | % 337
  \hideNote R1 | % 338
  \hideNote R1 | % 339

  \barNumberCheck #340
  \hideNote R1 | % 340
  \hideNote R1 | % 341
  \hideNote R1 | % 342
  \hideNote R1 | % 343
  \hideNote R1 | % 344
  \hideNote R1 | % 345
  \hideNote R1 | % 346
  \hideNote R1 | % 347
  \hideNote R1 | % 348
  \hideNote R1 | % 349

  \barNumberCheck #350
  \hideNote R1 | % 350
  \hideNote R1 | % 351
  \hideNote R1 | % 352
  \hideNote R1 | % 353
  \hideNote R1 | % 354
  \hideNote R1 | % 355
  \hideNote R1 | % 356
  \hideNote R1 | % 357
  \hideNote R1 | % 358
  \hideNote R1 | % 359

  \barNumberCheck #360
  \hideNote R1 | % 360
  \hideNote R1 | % 361
  \hideNote R1 | % 362
  \hideNote R1 | % 363
  \hideNote R1 | % 364
  \hideNote R1 | % 365
  \hideNote R1 | % 366
  \hideNote R1 | % 367
  \hideNote R1 | % 368
  \hideNote R1 | % 369

  \barNumberCheck #370
  \hideNote R1 | % 370
  \hideNote R1 | % 371
  \hideNote R1 | % 372
  \hideNote R1 | % 373
  \hideNote R1 | % 374
  \hideNote R1 | % 375
  \hideNote R1 | % 376
  \hideNote R1 | % 377
  \hideNote R1 | % 378
  \hideNote R1 | % 379

  \barNumberCheck #380
  \hideNote R1 | % 380
  \hideNote R1 | % 381
  \hideNote R1 | % 382
  \hideNote R1 | % 383
  \hideNote R1 | % 384
  \hideNote R1 | % 385
  \hideNote R1 | % 386
  \hideNote R1 | % 387
  \hideNote R1 | % 388
  \hideNote R1 | % 389

  \barNumberCheck #390
  \hideNote R1 | % 390
  \hideNote R1 | % 391
  \hideNote R1 | % 392
  \hideNote R1 | % 393
  \hideNote R1 | % 394
  \hideNote R1 | % 395
  \hideNote R1 | % 396
  \hideNote R1 | % 397
  \hideNote R1 | % 398
  \hideNote R1 | % 399

  \barNumberCheck #400
  \hideNote R1 | % 400
  \hideNote R1 | % 401
  \hideNote R1 | % 402
  \hideNote R1 | % 403
  \hideNote R1 | % 404
  \hideNote R1 | % 405
  \hideNote R1 | % 406
  \hideNote R1 | % 407
  \hideNote R1 | % 408
  \hideNote R1 | % 409

  \barNumberCheck #410
  \hideNote R1 | % 410
  \hideNote R1 | % 411
  \hideNote R1 | % 412
  \hideNote R1 | % 413
  \hideNote R1 | % 414
  \hideNote R1 | % 415
  \hideNote R1 | % 416
  \hideNote R1 | % 417
  \hideNote R1 | % 418
  \hideNote R1 | % 419

  \barNumberCheck #420
  \hideNote R1 | % 420
  \hideNote R1 | % 421
  \hideNote R1 | % 422
  \hideNote R1 | % 423
  \hideNote R1 | % 424
  \hideNote R1 | % 425
  \hideNote R1 | % 426
  \hideNote R1 | % 427
  \hideNote R1 | % 428
  \hideNote R1 | % 429

  \barNumberCheck #430
  \hideNote R1 | % 430
  \hideNote R1 | % 431
  \hideNote R1 | % 432
  \hideNote R1 | % 433
  \hideNote R1 | % 434
  \hideNote R1 | % 435
  \hideNote R1 | % 436
  \hideNote R1 | % 437
  \hideNote R1 | % 438
  \hideNote R1 | % 439

  \barNumberCheck #440
  \hideNote R1 | % 440
  \hideNote R1 | % 441
  \hideNote R1 | % 442
  \hideNote R1 | % 443
  \hideNote R1 | % 444
  \hideNote R1 | % 445
  \hideNote R1 | % 446
  \hideNote R1 | % 447
  \hideNote R1 | % 448
  \hideNote R1 | % 449

  \barNumberCheck #450
  \hideNote R1 | % 450
  \hideNote R1 | % 451
  \hideNote R1 | % 452
  \hideNote R1 | % 453
  \hideNote R1 | % 454
  \hideNote R1 | % 455
  \hideNote R1 | % 456
  \hideNote R1 | % 457
  \hideNote R1 | % 458
  \hideNote R1 | % 459

  \barNumberCheck #460
  \hideNote R1 | % 460
  \hideNote R1 | % 461
  \hideNote R1 | % 462
  \hideNote R1 | % 463
  \hideNote R1 | % 464
  \hideNote R1 | % 465
  \hideNote R1 | % 466
  \hideNote R1 | % 467
  \hideNote R1 | % 468
  \hideNote R1 | % 469

  \barNumberCheck #470
  \hideNote R1 | % 470
  \hideNote R1 | % 471
  \hideNote R1 | % 472
  \hideNote R1 | % 473
  \hideNote R1 | % 474
  \hideNote R1 | % 475
  \hideNote R1 | % 476
  \hideNote R1 | % 477
  \hideNote R1 | % 478
  \hideNote R1 | % 479

  \barNumberCheck #480
  \hideNote R1 | % 480
  \hideNote R1 | % 481
  \hideNote R1 | % 482
  \hideNote R1 | % 483
  \hideNote R1 | % 484
  \hideNote R1 | % 485
  \hideNote R1 | % 486
  \hideNote R1 | % 487
  \hideNote R1 | % 488
  \hideNote R1 | % 489

  \barNumberCheck #490
  \hideNote R1 | % 490
  \hideNote R1 | % 491
  \hideNote R1 | % 492
  \hideNote R1 | % 493
  \hideNote R1 | % 494
  \hideNote R1 | % 495
  \hideNote R1 | % 496
  \hideNote R1 | % 497
  \hideNote R1 | % 498
  \hideNote R1 | % 499

  \barNumberCheck #500
  \hideNote R1 | % 500
  \hideNote R1 | % 501
  \hideNote R1 | % 502
  \hideNote R1 | % 503
  \hideNote R1 | % 504
  \hideNote R1 | % 505
  \hideNote R1 | % 506
  \hideNote R1 | % 507
  \hideNote R1 | % 508
  \hideNote R1 | % 509

  \barNumberCheck #510
  \hideNote R1 | % 510
  \hideNote R1 | % 511
  \hideNote R1 | % 512
  \hideNote R1 | % 513
  \hideNote R1 | % 514
  \hideNote R1 | % 515
  \hideNote R1 | % 516
  \hideNote R1 | % 517
  \hideNote R1 | % 518
  \hideNote R1 | % 519

  \barNumberCheck #520
  \hideNote R1 | % 520
  \hideNote R1 | % 521
  \hideNote R1 | % 522
  \hideNote R1 | % 523
  \hideNote R1 | % 524
  \hideNote R1 | % 525
  \hideNote R1 | % 526
  \hideNote R1 | % 527
  \hideNote R1 | % 528
  \hideNote R1 | % 529

  \barNumberCheck #530
  \hideNote R1 | % 530
  \hideNote R1 | % 531
  \hideNote R1 | % 532
  \hideNote R1 | % 533
  \hideNote R1 | % 534
  \hideNote R1 | % 535
  \hideNote R1 | % 536
  \hideNote R1 | % 537
  \hideNote R1 | % 538
  \hideNote R1 | % 539

  \barNumberCheck #540
  \hideNote R1 | % 540
  \hideNote R1 | % 541
  \hideNote R1 | % 542
  \hideNote R1 | % 543
  \hideNote R1 | % 544
  \hideNote R1 | % 545
  \hideNote R1 | % 546
  \hideNote R1 | % 547
  \hideNote R1 | % 548
  \hideNote R1 | % 549

  \barNumberCheck #550
  \hideNote R1 | % 550
  \hideNote R1 | % 551
  \hideNote R1 | % 552
  \hideNote R1 | % 553
  \hideNote R1 | % 554
  \hideNote R1 | % 555
  \hideNote r2 \hideNote r8. \bar "|."
}

PartPThreeVoiceOne = \relative fis' {
  \clef "treble" \numericTimeSignature \time 4/4 \key a \major \U fis16 [ \U fis16
  \U fis16 \U fis16 ] \hideNote r8 \U fis16 [ \U fis16 ] \U fis16 [ \U fis16 ]
  \hideNote r4. | % 1
  \U as16 [ \U as16 \U as16 \U as16 ] \U as8 [ \U as16 \U as16 ] \U as16 [ \U a16
  \U a8 ] \hideNote r4 | % 2
  a1 | % 3
  a2 \hideNote r4 \D b16 [ \D a16 \D b16 \D cis16 ] | % 4
  as4 \U as8 [ \U cis16 \U b16 ] \U a16 [ \U a16 \U b16 \U a16 ] \U as16 [ \U as16
  \U a16 \U as16 ] | % 5
  fis2. \hideNote r8 cis'8 | % 6
  \D cis8 [ \D cis8 ] \D b8 [ \D cis8 ] a8 \hideNote r16 as16 \hideNote r8 e8 | % 7
  \hideNote r2.. cis'8 | % 8
  \D cis8 [ \D cis8 ] \D b8 [ \D cis8 ] as4 bes4 | % 9

  \barNumberCheck #10
  \key fis \major bes4 \hideNote r2. | % 10
  \hideNote R1 | % 11
  \hideNote R1 | % 12
  \hideNote R1 | % 13
  bes1 | % 14
  b!1 | % 15
  cis1 | % 16
  \hideNote r4 bes2. | % 17
  \key a \major fis4 \hideNote r8 fis8 fis2 | % 18
  as4 \hideNote r8 as8 as2 | % 19

  \barNumberCheck #20
  as4 \hideNote r8 as8 as2 | % 20
  as2 a2 | % 21
  a4 \hideNote r8 a8 a2 | % 22
  a4 \hideNote r8 a8 a2 | % 23
  fis2. \U fis8 [ \U as8 ] | % 24
  as1 | % 25
  \hideNote r8 \D cis16 [ \D cis16 ] \D e8 [ \D cis8 ] b4 \hideNote r4 | % 26
  a1 | % 27
  a1 | % 28
  b4 b4 b2 | % 29

  \barNumberCheck #30
  a1 | % 30
  a4 a4 \U a8. [ \U a8. ] a8 ] | % 31
  as4 \hideNote r8 b2 b8 | % 32
  a!2 \U a8 [ \U a8 ] \U b8 [ \U a8 ] | % 33
  cis2. \hideNote r4 | % 34
  a1 | % 35
  a1 | % 36
  as4 as4 as2 | % 37
  \U as8 [ \U a8 ] \U as8 [ \U fis8 ] fis2 | % 38
  a!1 | % 39

  \barNumberCheck #40
  b1 | % 40
  b2 \D b8 [ \D b8 ] \D cis8 [ \D a8 ] | % 41
  a1 | % 42
  d1 | % 43
  \D b16 [ \D b16 \D b16 \D b16 ] \D b8 [ \D b16 \D b16 ] \hideNote r2 | % 44
  a1 | % 45
  c1 | % 46
  \hideNote r4 \D cis!8 [ \D cis8 ] \U b8 [ \U as8 ] \U e8 [ \U a8 ~ ] | % 47
  a2.. \D cis16 [ \D cis16 ] | % 48
  \hideNote r4 \D cis16 [ \D cis16 ] \hideNote r2 \hideNote r8 | % 49

  \barNumberCheck #50
  \hideNote r2.. \U c,16 [ \U c16 ] | % 50
  \hideNote r4 \U c16 [ \U c16 ] \hideNote r2 \hideNote r8 | % 51
  \hideNote r2 \hideNote r4 \hideNote r16 cis'!8. ~ | % 52
  \D cis8. [ \D b16 ] \D cis16 [ \D d8 \D cis16 ] d16 \hideNote r8 e8 e8. ~ ] | % 53
  e2 ~ e4 ~ e16 \hideNote r8. | % 54
  \hideNote R1 | % 55
  \hideNote R1 | % 56
  \hideNote R1 | % 57
  \hideNote R1 | % 58
  \hideNote R1 | % 59

  \barNumberCheck #60
  \hideNote R1 | % 60
  \hideNote R1 | % 61
  \hideNote R1 | % 62
  \hideNote R1 | % 63
  \hideNote r2 \hideNote r4 \hideNote r16 \U g,16 [ \U g16 \U g16 ] | % 64
  \U g16 [ \U g8 \U g16 ] \U g16 [ \U g16 \U fis16 \U fis8 ] \hideNote r4 \U g!16
  [ \U g16 \U g16 ] | % 65
  \U g16 [ \U g8 \U g16 ] \U g16 [ \U g16 \U a16 \U a8 ] \hideNote r4 bes8. ~ | % 66
  \key bes \major bes2 ~ bes4 ~ bes16 bes8. ~ | % 67
  bes2 ~ bes4 ~ bes16 c8. ~ | % 68
  c16 c4 c2 \U a8 [ \U bes16 ~ ] | % 69

  \barNumberCheck #70
  \U bes16 [ \U a8 \U g8 ] es4 \hideNote r4 bes'8. ~ | % 70
  bes16 bes4 bes8. \D bes8. [ \D bes8 ] c8. ~ ] | % 71
  c2 ~ c4 ~ c16 bes8. ~ | % 72
  bes4 ~ bes16 \D bes8 [ \D bes8 ] \D c8 [ \D bes8 ] bes8. ~ ] | % 73
  bes2 ~ bes16 \hideNote r4 bes8. ~ | % 74
  bes2 ~ bes4 ~ bes16 bes8. ~ | % 75
  bes2 ~ bes4 ~ bes16 c8. ~ | % 76
  c16 c4 c2 \U a8 [ \U bes16 ~ ] | % 77
  \U bes16 [ \U a8 \U g8 ] g2 bes8. ~ | % 78
  bes2 ~ bes4 ~ bes16 c8. ~ | % 79

  \barNumberCheck #80
  c2 ~ c4 ~ c16 bes8. ~ | % 80
  bes4 ~ bes16 \D bes8 [ \D bes8 ] \D c8 [ \D bes8 ] bes8. ~ ] | % 81
  bes4 ~ bes16 \hideNote r2 bes8. ~ | % 82
  bes2 ~ bes4 ~ bes16 \D c16 [ \D c16 \D c16 ] | % 83
  \D c16 [ \D c8 \D c16 ] c16 \hideNote r2 g8. ~ | % 84
  g2 ~ g4 ~ g16 bes8. ~ | % 85
  bes2 ~ bes16 \hideNote r4 a8. ~ | % 86
  a4 ~ a16 \U a8 [ \U bes16 ] \D c16 [ \D d8 \D c16 ] \U bes16 [ \U g8. ~ ] | % 87
  g2 ~ g16 \hideNote r4 g8. ~ | % 88
  g2 ~ g4 ~ g16 \hideNote r8. | % 89

  \barNumberCheck #90
  \hideNote r2 \hideNote r16 \D c16 [ \D bes16 \D c16 ] \D d16 [ \D a8. ~ ] | % 90
  \D a16 [ \D a8 \D d16 ] \D c16 [ \D bes16 \D bes16 \D c16 ] \D bes16 [ \D a16
  \D a16 \D bes16 ] \U a16 [ \U g16 \U g16 \U g16 ] | % 91
  g16 \hideNote r8 g16 \U g16 [ \U g16 \U g16 ] \hideNote r4. \U a16 [ \U a16 \U
  a16 ] | % 92
  \U a16 [ \U a8 \U a16 ] \U a16 [ \U a16 \U bes16 \U bes8 ] \hideNote r4.. | % 93
  \hideNote R1 | % 94
  \hideNote R1 | % 95
  \hideNote R1 | % 96
  \hideNote R1 | % 97
  \hideNote R1 | % 98
  \hideNote R1 | % 99

  \barNumberCheck #100
  \hideNote R1 | % 100
  \hideNote R1 | % 101
  \hideNote R1 | % 102
  \hideNote R1 | % 103
  \hideNote R1 | % 104
  \hideNote R1 | % 105
  \hideNote R1 | % 106
  \hideNote R1 | % 107
  \hideNote R1 | % 108
  \hideNote R1 | % 109

  \barNumberCheck #110
  \hideNote R1 | % 110
  \hideNote R1 | % 111
  \hideNote R1 | % 112
  \hideNote R1 | % 113
  \hideNote R1 | % 114
  \hideNote R1 | % 115
  \hideNote R1 | % 116
  \hideNote R1 | % 117
  \hideNote R1 | % 118
  \hideNote R1 | % 119

  \barNumberCheck #120
  \hideNote R1 | % 120
  \hideNote R1 | % 121
  \hideNote R1 | % 122
  \hideNote R1 | % 123
  \hideNote R1 | % 124
  \hideNote R1 | % 125
  \hideNote R1 | % 126
  \hideNote R1 | % 127
  \hideNote R1 | % 128
  \hideNote R1 | % 129

  \barNumberCheck #130
  \hideNote R1 | % 130
  \hideNote R1 | % 131
  \hideNote R1 | % 132
  \hideNote R1 | % 133
  \hideNote R1 | % 134
  \hideNote R1 | % 135
  \hideNote R1 | % 136
  \hideNote R1 | % 137
  \hideNote R1 | % 138
  \hideNote R1 | % 139

  \barNumberCheck #140
  \hideNote R1 | % 140
  \hideNote R1 | % 141
  \hideNote R1 | % 142
  \hideNote R1 | % 143
  \hideNote R1 | % 144
  \hideNote R1 | % 145
  \hideNote R1 | % 146
  \hideNote R1 | % 147
  \hideNote R1 | % 148
  \hideNote R1 | % 149

  \barNumberCheck #150
  \hideNote R1 | % 150
  \hideNote R1 | % 151
  \hideNote R1 | % 152
  \hideNote R1 | % 153
  \hideNote R1 | % 154
  \hideNote R1 | % 155
  \hideNote R1 | % 156
  \hideNote R1 | % 157
  \hideNote R1 | % 158
  \hideNote R1 | % 159

  \barNumberCheck #160
  \hideNote R1 | % 160
  \hideNote R1 | % 161
  \hideNote R1 | % 162
  \hideNote R1 | % 163
  \hideNote R1 | % 164
  \hideNote R1 | % 165
  \hideNote R1 | % 166
  \hideNote R1 | % 167
  \hideNote R1 | % 168
  \hideNote R1 | % 169

  \barNumberCheck #170
  \hideNote R1 | % 170
  \hideNote R1 | % 171
  \hideNote R1 | % 172
  \hideNote R1 | % 173
  \hideNote R1 | % 174
  \hideNote R1 | % 175
  \hideNote R1 | % 176
  \hideNote R1 | % 177
  \hideNote R1 | % 178
  \hideNote R1 | % 179

  \barNumberCheck #180
  \hideNote R1 | % 180
  \hideNote R1 | % 181
  \hideNote R1 | % 182
  \hideNote R1 | % 183
  \hideNote R1 | % 184
  \hideNote R1 | % 185
  \hideNote R1 | % 186
  \hideNote R1 | % 187
  \hideNote R1 | % 188
  \hideNote R1 | % 189

  \barNumberCheck #190
  \hideNote R1 | % 190
  \hideNote R1 | % 191
  \hideNote R1 | % 192
  \hideNote R1 | % 193
  \hideNote R1 | % 194
  \hideNote R1 | % 195
  \hideNote R1 | % 196
  \hideNote R1 | % 197
  \hideNote R1 | % 198
  \hideNote R1 | % 199

  \barNumberCheck #200
  \hideNote R1 | % 200
  \hideNote R1 | % 201
  \hideNote R1 | % 202
  \hideNote R1 | % 203
  \hideNote R1 | % 204
  \hideNote R1 | % 205
  \hideNote R1 | % 206
  \hideNote R1 | % 207
  \hideNote R1 | % 208
  \hideNote R1 | % 209

  \barNumberCheck #210
  \hideNote R1 | % 210
  \hideNote R1 | % 211
  \hideNote R1 | % 212
  \hideNote R1 | % 213
  \hideNote R1 | % 214
  \hideNote R1 | % 215
  \hideNote R1 | % 216
  \hideNote R1 | % 217
  \hideNote R1 | % 218
  \hideNote R1 | % 219

  \barNumberCheck #220
  \hideNote R1 | % 220
  \hideNote R1 | % 221
  \hideNote R1 | % 222
  \hideNote R1 | % 223
  \hideNote R1 | % 224
  \hideNote R1 | % 225
  \hideNote R1 | % 226
  \hideNote R1 | % 227
  \hideNote R1 | % 228
  \hideNote R1 | % 229

  \barNumberCheck #230
  \hideNote R1 | % 230
  \hideNote R1 | % 231
  \hideNote R1 | % 232
  \hideNote R1 | % 233
  \hideNote R1 | % 234
  \hideNote R1 | % 235
  \hideNote R1 | % 236
  \hideNote R1 | % 237
  \hideNote R1 | % 238
  \hideNote R1 | % 239

  \barNumberCheck #240
  \hideNote R1 | % 240
  \hideNote R1 | % 241
  \hideNote R1 | % 242
  \hideNote R1 | % 243
  \hideNote R1 | % 244
  \hideNote R1 | % 245
  \hideNote R1 | % 246
  \hideNote R1 | % 247
  \hideNote R1 | % 248
  \hideNote R1 | % 249

  \barNumberCheck #250
  \hideNote R1 | % 250
  \hideNote R1 | % 251
  \hideNote R1 | % 252
  \hideNote R1 | % 253
  \hideNote R1 | % 254
  \hideNote R1 | % 255
  \hideNote R1 | % 256
  \hideNote R1 | % 257
  \hideNote R1 | % 258
  \hideNote R1 | % 259

  \barNumberCheck #260
  \hideNote R1 | % 260
  \hideNote R1 | % 261
  \hideNote R1 | % 262
  \hideNote R1 | % 263
  \hideNote R1 | % 264
  \hideNote R1 | % 265
  \hideNote R1 | % 266
  \hideNote R1 | % 267
  \hideNote R1 | % 268
  \hideNote R1 | % 269

  \barNumberCheck #270
  \hideNote R1 | % 270
  \hideNote R1 | % 271
  \hideNote R1 | % 272
  \hideNote R1 | % 273
  \hideNote R1 | % 274
  \hideNote R1 | % 275
  \hideNote R1 | % 276
  \hideNote R1 | % 277
  \hideNote R1 | % 278
  \hideNote R1 | % 279

  \barNumberCheck #280
  \hideNote R1 | % 280
  \hideNote R1 | % 281
  \hideNote R1 | % 282
  \hideNote R1 | % 283
  \hideNote R1 | % 284
  \hideNote R1 | % 285
  \hideNote R1 | % 286
  \hideNote R1 | % 287
  \hideNote R1 | % 288
  \hideNote R1 | % 289

  \barNumberCheck #290
  \hideNote R1 | % 290
  \hideNote R1 | % 291
  \hideNote R1 | % 292
  \hideNote R1 | % 293
  \hideNote R1 | % 294
  \hideNote R1 | % 295
  \hideNote R1 | % 296
  \hideNote R1 | % 297
  \hideNote R1 | % 298
  \hideNote R1 | % 299

  \barNumberCheck #300
  \hideNote R1 | % 300
  \hideNote R1 | % 301
  \hideNote R1 | % 302
  \hideNote R1 | % 303
  \hideNote R1 | % 304
  \hideNote R1 | % 305
  \hideNote R1 | % 306
  \hideNote R1 | % 307
  \hideNote R1 | % 308
  \hideNote R1 | % 309

  \barNumberCheck #310
  \hideNote R1 | % 310
  \hideNote R1 | % 311
  \hideNote R1 | % 312
  \hideNote R1 | % 313
  \hideNote R1 | % 314
  \hideNote R1 | % 315
  \hideNote R1 | % 316
  \hideNote R1 | % 317
  \hideNote R1 | % 318
  \hideNote R1 | % 319

  \barNumberCheck #320
  \hideNote R1 | % 320
  \hideNote R1 | % 321
  \hideNote R1 | % 322
  \hideNote R1 | % 323
  \hideNote R1 | % 324
  \hideNote R1 | % 325
  \hideNote R1 | % 326
  \hideNote R1 | % 327
  \hideNote R1 | % 328
  \hideNote R1 | % 329

  \barNumberCheck #330
  \hideNote R1 | % 330
  \hideNote R1 | % 331
  \hideNote R1 | % 332
  \hideNote R1 | % 333
  \hideNote R1 | % 334
  \hideNote R1 | % 335
  \hideNote R1 | % 336
  \hideNote R1 | % 337
  \hideNote R1 | % 338
  \hideNote R1 | % 339

  \barNumberCheck #340
  \hideNote R1 | % 340
  \hideNote R1 | % 341
  \hideNote R1 | % 342
  \hideNote R1 | % 343
  \hideNote R1 | % 344
  \hideNote R1 | % 345
  \hideNote R1 | % 346
  \hideNote R1 | % 347
  \hideNote R1 | % 348
  \hideNote R1 | % 349

  \barNumberCheck #350
  \hideNote R1 | % 350
  \hideNote R1 | % 351
  \hideNote R1 | % 352
  \hideNote R1 | % 353
  \hideNote R1 | % 354
  \hideNote R1 | % 355
  \hideNote R1 | % 356
  \hideNote R1 | % 357
  \hideNote R1 | % 358
  \hideNote R1 | % 359

  \barNumberCheck #360
  \hideNote R1 | % 360
  \hideNote R1 | % 361
  \hideNote R1 | % 362
  \hideNote R1 | % 363
  \hideNote R1 | % 364
  \hideNote R1 | % 365
  \hideNote R1 | % 366
  \hideNote R1 | % 367
  \hideNote R1 | % 368
  \hideNote R1 | % 369

  \barNumberCheck #370
  \hideNote R1 | % 370
  \hideNote R1 | % 371
  \hideNote R1 | % 372
  \hideNote R1 | % 373
  \hideNote R1 | % 374
  \hideNote R1 | % 375
  \hideNote R1 | % 376
  \hideNote R1 | % 377
  \hideNote R1 | % 378
  \hideNote R1 | % 379

  \barNumberCheck #380
  \hideNote R1 | % 380
  \hideNote R1 | % 381
  \hideNote R1 | % 382
  \hideNote R1 | % 383
  \hideNote R1 | % 384
  \hideNote R1 | % 385
  \hideNote R1 | % 386
  \hideNote R1 | % 387
  \hideNote R1 | % 388
  \hideNote R1 | % 389

  \barNumberCheck #390
  \hideNote R1 | % 390
  \hideNote R1 | % 391
  \hideNote R1 | % 392
  \hideNote R1 | % 393
  \hideNote R1 | % 394
  \hideNote R1 | % 395
  \hideNote R1 | % 396
  \hideNote R1 | % 397
  \hideNote R1 | % 398
  \hideNote R1 | % 399

  \barNumberCheck #400
  \hideNote R1 | % 400
  \hideNote R1 | % 401
  \hideNote R1 | % 402
  \hideNote R1 | % 403
  \hideNote R1 | % 404
  \hideNote R1 | % 405
  \hideNote R1 | % 406
  \hideNote R1 | % 407
  \hideNote R1 | % 408
  \hideNote R1 | % 409

  \barNumberCheck #410
  \hideNote R1 | % 410
  \hideNote R1 | % 411
  \hideNote R1 | % 412
  \hideNote R1 | % 413
  \hideNote R1 | % 414
  \hideNote R1 | % 415
  \hideNote R1 | % 416
  \hideNote R1 | % 417
  \hideNote R1 | % 418
  \hideNote R1 | % 419

  \barNumberCheck #420
  \hideNote R1 | % 420
  \hideNote R1 | % 421
  \hideNote R1 | % 422
  \hideNote R1 | % 423
  \hideNote R1 | % 424
  \hideNote R1 | % 425
  \hideNote R1 | % 426
  \hideNote R1 | % 427
  \hideNote R1 | % 428
  \hideNote R1 | % 429

  \barNumberCheck #430
  \hideNote R1 | % 430
  \hideNote R1 | % 431
  \hideNote R1 | % 432
  \hideNote R1 | % 433
  \hideNote R1 | % 434
  \hideNote R1 | % 435
  \hideNote R1 | % 436
  \hideNote R1 | % 437
  \hideNote R1 | % 438
  \hideNote R1 | % 439

  \barNumberCheck #440
  \hideNote R1 | % 440
  \hideNote R1 | % 441
  \hideNote R1 | % 442
  \hideNote R1 | % 443
  \hideNote R1 | % 444
  \hideNote R1 | % 445
  \hideNote R1 | % 446
  \hideNote R1 | % 447
  \hideNote R1 | % 448
  \hideNote R1 | % 449

  \barNumberCheck #450
  \hideNote R1 | % 450
  \hideNote R1 | % 451
  \hideNote R1 | % 452
  \hideNote R1 | % 453
  \hideNote R1 | % 454
  \hideNote R1 | % 455
  \hideNote R1 | % 456
  \hideNote R1 | % 457
  \hideNote R1 | % 458
  \hideNote R1 | % 459

  \barNumberCheck #460
  \hideNote R1 | % 460
  \hideNote R1 | % 461
  \hideNote R1 | % 462
  \hideNote R1 | % 463
  \hideNote R1 | % 464
  \hideNote R1 | % 465
  \hideNote R1 | % 466
  \hideNote R1 | % 467
  \hideNote R1 | % 468
  \hideNote R1 | % 469

  \barNumberCheck #470
  \hideNote R1 | % 470
  \hideNote R1 | % 471
  \hideNote R1 | % 472
  \hideNote R1 | % 473
  \hideNote R1 | % 474
  \hideNote R1 | % 475
  \hideNote R1 | % 476
  \hideNote R1 | % 477
  \hideNote R1 | % 478
  \hideNote R1 | % 479

  \barNumberCheck #480
  \hideNote R1 | % 480
  \hideNote R1 | % 481
  \hideNote R1 | % 482
  \hideNote R1 | % 483
  \hideNote R1 | % 484
  \hideNote R1 | % 485
  \hideNote R1 | % 486
  \hideNote R1 | % 487
  \hideNote R1 | % 488
  \hideNote R1 | % 489

  \barNumberCheck #490
  \hideNote R1 | % 490
  \hideNote R1 | % 491
  \hideNote R1 | % 492
  \hideNote R1 | % 493
  \hideNote R1 | % 494
  \hideNote R1 | % 495
  \hideNote R1 | % 496
  \hideNote R1 | % 497
  \hideNote R1 | % 498
  \hideNote R1 | % 499

  \barNumberCheck #500
  \hideNote R1 | % 500
  \hideNote R1 | % 501
  \hideNote R1 | % 502
  \hideNote R1 | % 503
  \hideNote R1 | % 504
  \hideNote R1 | % 505
  \hideNote R1 | % 506
  \hideNote R1 | % 507
  \hideNote R1 | % 508
  \hideNote R1 | % 509

  \barNumberCheck #510
  \hideNote R1 | % 510
  \hideNote R1 | % 511
  \hideNote R1 | % 512
  \hideNote R1 | % 513
  \hideNote R1 | % 514
  \hideNote R1 | % 515
  \hideNote R1 | % 516
  \hideNote R1 | % 517
  \hideNote R1 | % 518
  \hideNote R1 | % 519

  \barNumberCheck #520
  \hideNote R1 | % 520
  \hideNote R1 | % 521
  \hideNote R1 | % 522
  \hideNote R1 | % 523
  \hideNote R1 | % 524
  \hideNote R1 | % 525
  \hideNote R1 | % 526
  \hideNote R1 | % 527
  \hideNote R1 | % 528
  \hideNote R1 | % 529

  \barNumberCheck #530
  \hideNote R1 | % 530
  \hideNote R1 | % 531
  \hideNote R1 | % 532
  \hideNote R1 | % 533
  \hideNote R1 | % 534
  \hideNote R1 | % 535
  \hideNote R1 | % 536
  \hideNote R1 | % 537
  \hideNote R1 | % 538
  \hideNote R1 | % 539

  \barNumberCheck #540
  \hideNote R1 | % 540
  \hideNote R1 | % 541
  \hideNote R1 | % 542
  \hideNote R1 | % 543
  \hideNote R1 | % 544
  \hideNote R1 | % 545
  \hideNote R1 | % 546
  \hideNote R1 | % 547
  \hideNote R1 | % 548
  \hideNote R1 | % 549

  \barNumberCheck #550
  \hideNote R1 | % 550
  \hideNote R1 | % 551
  \hideNote R1 | % 552
  \hideNote R1 | % 553
  \hideNote R1 | % 554
  \hideNote R1 | % 555
  \hideNote r2 \hideNote r8. \bar "|."
}

PartPFourVoiceOne = \relative cis' {
  \clef "treble" \numericTimeSignature \time 4/4 \key a \major \U cis16 [ \U cis16
  \U cis16 \U cis16 ] \hideNote r8 \U d16 [ \U d16 ] \U d16 [ \U d16 ] \hideNote
  r4 \U cis16 [ \U d16 ] | % 1
  \U e16 [ \U e16 \U e16 \U e16 ] \U e8 [ \U e16 \U e16 ] \U e16 [ \U fis16 \U
  fis8 ] \hideNote r4 | % 2
  fis2 \U fis8 [ \U d16 \U e16 ] \U fis8 [ \U e16 \U d16 ] | % 3
  e2. \hideNote r4 | % 4
  \hideNote r4 e2. | % 5
  fis2. \hideNote r4 | % 6
  \hideNote R1 | % 7
  \hideNote r2.. cis8 | % 8
  \U cis8 [ \U cis8 ] \U b8 [ \U cis8 ] es4 f4 | % 9

  \barNumberCheck #10
  \key fis \major fis!4 \hideNote r2. | % 10
  \hideNote R1 | % 11
  \hideNote R1 | % 12
  \hideNote r8 \U fis16 [ \U as16 ] bes8 \hideNote r8 as!4 \U fis8 [ \U as!16 \U
  fis16 ] | % 13
  es1 | % 14
  fis1 | % 15
  as1 | % 16
  \hideNote r2. fis4 | % 17
  \key a \major d4 \hideNote r8 d8 d2 | % 18
  e4 \hideNote r8 e8 e2 | % 19

  \barNumberCheck #20
  e4 \hideNote r8 e8 e2 | % 20
  e2 fis2 | % 21
  a,4. d8 d2 | % 22
  e4 \hideNote r8 e8 e2 | % 23
  d2. \U d8 [ \U fis8 ] | % 24
  fis1 | % 25
  \hideNote r8 \U cis16 [ \U cis16 ] \U e8 [ \U cis8 ] b4 \hideNote r4 | % 26
  fis'1 | % 27
  e1 | % 28
  as4 as4 as2 | % 29

  \barNumberCheck #30
  fis1 | % 30
  fis4 fis4 \U fis8. [ \U fis8. ] fis8 ] | % 31
  e4 \hideNote r8 as8 as2 | % 32
  fis2 \U fis8 [ \U e8 ] \U d8 [ \U e8 ] | % 33
  e2. \hideNote r4 | % 34
  fis1 | % 35
  e1 | % 36
  e4 e4 e2 | % 37
  \U d8 [ \U e8 ] \U d8 [ \U cis8 ] cis2 | % 38
  fis1 | % 39

  \barNumberCheck #40
  as1 | % 40
  fis2 \U fis8 [ \U fis8 ] \U as8 [ \U e8 ] | % 41
  e1 | % 42
  a1 | % 43
  \U as16 [ \U as16 \U as16 \U as16 ] \U as8 [ \U as16 \U as16 ] \hideNote r2 | % 44
  fis1 | % 45
  as1 | % 46
  e1 | % 47
  a1 | % 48
  \U a16 [ \U a16 ] \hideNote r4 \U a16 [ \U a16 ] \hideNote r2 | % 49

  \barNumberCheck #50
  fis4. e8 e2 | % 50
  \U a16 [ \U a16 ] \hideNote r4 \U a16 [ \U a16 ] \hideNote r2 | % 51
  a4. g8 g8 \hideNote r4. | % 52
  e2. \hideNote r8 as8 | % 53
  as1 | % 54
  \hideNote r8 cis,8 \U d8 [ \U f8 ] \U f8 [ \U a!8 ] b4 | % 55
  b1 | % 56
  \hideNote R1 | % 57
  \hideNote R1 | % 58
  \hideNote R1 | % 59

  \barNumberCheck #60
  \hideNote R1 | % 60
  \hideNote R1 | % 61
  \hideNote R1 | % 62
  \hideNote R1 | % 63
  \hideNote R1 | % 64
  \U g16 [ \U g16 \U g16 \U g16 ] \U g8 [ \U g16 \U g16 ] \U g16 [ \U fis16 \U
  fis8 ] \hideNote r4 | % 65
  \U g16 [ \U g16 \U g16 \U g16 ] \U g8 [ \U g16 \U g16 ] \U g16 [ \U a16 \U a8
  ] \hideNote r4 | % 66
  \key bes \major g1 | % 67
  f1 | % 68
  a4 a4 a2 | % 69

  \barNumberCheck #70
  \U es8 [ \U f8 ] \U es8 [ \U d8 ] bes4 \hideNote r4 | % 70
  g'4 g4 \U g8. [ \U g8. ] g8 ] | % 71
  a1 | % 72
  g2 \U g8 [ \U f8 ] \U es8 [ \U f8 ] | % 73
  f2. \hideNote r4 | % 74
  g1 | % 75
  f1 | % 76
  a4 a4 a2 | % 77
  \U es8 [ \U f8 ] \U es8 [ \U d8 ] d2 | % 78
  g1 | % 79

  \barNumberCheck #80
  a1 | % 80
  g2 \U g8 [ \U g8 ] \U f8 [ \U f8 ] | % 81
  f2 \hideNote r2 | % 82
  g1 | % 83
  \U a16 [ \U a16 \U a16 \U a16 ] \U a8 [ \U a16 \U a16 ] \hideNote r2 | % 84
  g2 \U g8 [ \U es16 \U f16 ] \U g8 [ \U f16 \U es16 ] | % 85
  f2. \hideNote r4 | % 86
  f4 f8 \hideNote r2 \hideNote r8 | % 87
  d2. \hideNote r4 | % 88
  g2 \U g8 [ \U es16 \U f16 ] \U g8 [ \U f16 \U es16 ] | % 89

  \barNumberCheck #90
  f2. \hideNote r4 | % 90
  f4 f8 \hideNote r2 \hideNote r8 | % 91
  \U g16 [ \U g16 \U g16 \U g16 ] \hideNote r8 \U g16 [ \U g16 ] \U g16 [ \U g16
  ] \hideNote r4. | % 92
  \U a16 [ \U a16 \U a16 \U a16 ] \U a8 [ \U a16 \U a16 ] \U a16 [ \U bes16 \U
  bes8 ] \hideNote r4 | % 93
  \hideNote R1 | % 94
  \hideNote R1 | % 95
  \hideNote R1 | % 96
  \hideNote R1 | % 97
  \hideNote R1 | % 98
  \hideNote R1 | % 99

  \barNumberCheck #100
  \hideNote R1 | % 100
  \hideNote R1 | % 101
  \hideNote R1 | % 102
  \hideNote R1 | % 103
  \hideNote R1 | % 104
  \hideNote R1 | % 105
  \hideNote R1 | % 106
  \hideNote R1 | % 107
  \hideNote R1 | % 108
  \hideNote R1 | % 109

  \barNumberCheck #110
  \hideNote R1 | % 110
  \hideNote R1 | % 111
  \hideNote R1 | % 112
  \hideNote R1 | % 113
  \hideNote R1 | % 114
  \hideNote R1 | % 115
  \hideNote R1 | % 116
  \hideNote R1 | % 117
  \hideNote R1 | % 118
  \hideNote R1 | % 119

  \barNumberCheck #120
  \hideNote R1 | % 120
  \hideNote R1 | % 121
  \hideNote R1 | % 122
  \hideNote R1 | % 123
  \hideNote R1 | % 124
  \hideNote R1 | % 125
  \hideNote R1 | % 126
  \hideNote R1 | % 127
  \hideNote R1 | % 128
  \hideNote R1 | % 129

  \barNumberCheck #130
  \hideNote R1 | % 130
  \hideNote R1 | % 131
  \hideNote R1 | % 132
  \hideNote R1 | % 133
  \hideNote R1 | % 134
  \hideNote R1 | % 135
  \hideNote R1 | % 136
  \hideNote R1 | % 137
  \hideNote R1 | % 138
  \hideNote R1 | % 139

  \barNumberCheck #140
  \hideNote R1 | % 140
  \hideNote R1 | % 141
  \hideNote R1 | % 142
  \hideNote R1 | % 143
  \hideNote R1 | % 144
  \hideNote R1 | % 145
  \hideNote R1 | % 146
  \hideNote R1 | % 147
  \hideNote R1 | % 148
  \hideNote R1 | % 149

  \barNumberCheck #150
  \hideNote R1 | % 150
  \hideNote R1 | % 151
  \hideNote R1 | % 152
  \hideNote R1 | % 153
  \hideNote R1 | % 154
  \hideNote R1 | % 155
  \hideNote R1 | % 156
  \hideNote R1 | % 157
  \hideNote R1 | % 158
  \hideNote R1 | % 159

  \barNumberCheck #160
  \hideNote R1 | % 160
  \hideNote R1 | % 161
  \hideNote R1 | % 162
  \hideNote R1 | % 163
  \hideNote R1 | % 164
  \hideNote R1 | % 165
  \hideNote R1 | % 166
  \hideNote R1 | % 167
  \hideNote R1 | % 168
  \hideNote R1 | % 169

  \barNumberCheck #170
  \hideNote R1 | % 170
  \hideNote R1 | % 171
  \hideNote R1 | % 172
  \hideNote R1 | % 173
  \hideNote R1 | % 174
  \hideNote R1 | % 175
  \hideNote R1 | % 176
  \hideNote R1 | % 177
  \hideNote R1 | % 178
  \hideNote R1 | % 179

  \barNumberCheck #180
  \hideNote R1 | % 180
  \hideNote R1 | % 181
  \hideNote R1 | % 182
  \hideNote R1 | % 183
  \hideNote R1 | % 184
  \hideNote R1 | % 185
  \hideNote R1 | % 186
  \hideNote R1 | % 187
  \hideNote R1 | % 188
  \hideNote R1 | % 189

  \barNumberCheck #190
  \hideNote R1 | % 190
  \hideNote R1 | % 191
  \hideNote R1 | % 192
  \hideNote R1 | % 193
  \hideNote R1 | % 194
  \hideNote R1 | % 195
  \hideNote R1 | % 196
  \hideNote R1 | % 197
  \hideNote R1 | % 198
  \hideNote R1 | % 199

  \barNumberCheck #200
  \hideNote R1 | % 200
  \hideNote R1 | % 201
  \hideNote R1 | % 202
  \hideNote R1 | % 203
  \hideNote R1 | % 204
  \hideNote R1 | % 205
  \hideNote R1 | % 206
  \hideNote R1 | % 207
  \hideNote R1 | % 208
  \hideNote R1 | % 209

  \barNumberCheck #210
  \hideNote R1 | % 210
  \hideNote R1 | % 211
  \hideNote R1 | % 212
  \hideNote R1 | % 213
  \hideNote R1 | % 214
  \hideNote R1 | % 215
  \hideNote R1 | % 216
  \hideNote R1 | % 217
  \hideNote R1 | % 218
  \hideNote R1 | % 219

  \barNumberCheck #220
  \hideNote R1 | % 220
  \hideNote R1 | % 221
  \hideNote R1 | % 222
  \hideNote R1 | % 223
  \hideNote R1 | % 224
  \hideNote R1 | % 225
  \hideNote R1 | % 226
  \hideNote R1 | % 227
  \hideNote R1 | % 228
  \hideNote R1 | % 229

  \barNumberCheck #230
  \hideNote R1 | % 230
  \hideNote R1 | % 231
  \hideNote R1 | % 232
  \hideNote R1 | % 233
  \hideNote R1 | % 234
  \hideNote R1 | % 235
  \hideNote R1 | % 236
  \hideNote R1 | % 237
  \hideNote R1 | % 238
  \hideNote R1 | % 239

  \barNumberCheck #240
  \hideNote R1 | % 240
  \hideNote R1 | % 241
  \hideNote R1 | % 242
  \hideNote R1 | % 243
  \hideNote R1 | % 244
  \hideNote R1 | % 245
  \hideNote R1 | % 246
  \hideNote R1 | % 247
  \hideNote R1 | % 248
  \hideNote R1 | % 249

  \barNumberCheck #250
  \hideNote R1 | % 250
  \hideNote R1 | % 251
  \hideNote R1 | % 252
  \hideNote R1 | % 253
  \hideNote R1 | % 254
  \hideNote R1 | % 255
  \hideNote R1 | % 256
  \hideNote R1 | % 257
  \hideNote R1 | % 258
  \hideNote R1 | % 259

  \barNumberCheck #260
  \hideNote R1 | % 260
  \hideNote R1 | % 261
  \hideNote R1 | % 262
  \hideNote R1 | % 263
  \hideNote R1 | % 264
  \hideNote R1 | % 265
  \hideNote R1 | % 266
  \hideNote R1 | % 267
  \hideNote R1 | % 268
  \hideNote R1 | % 269

  \barNumberCheck #270
  \hideNote R1 | % 270
  \hideNote R1 | % 271
  \hideNote R1 | % 272
  \hideNote R1 | % 273
  \hideNote R1 | % 274
  \hideNote R1 | % 275
  \hideNote R1 | % 276
  \hideNote R1 | % 277
  \hideNote R1 | % 278
  \hideNote R1 | % 279

  \barNumberCheck #280
  \hideNote R1 | % 280
  \hideNote R1 | % 281
  \hideNote R1 | % 282
  \hideNote R1 | % 283
  \hideNote R1 | % 284
  \hideNote R1 | % 285
  \hideNote R1 | % 286
  \hideNote R1 | % 287
  \hideNote R1 | % 288
  \hideNote R1 | % 289

  \barNumberCheck #290
  \hideNote R1 | % 290
  \hideNote R1 | % 291
  \hideNote R1 | % 292
  \hideNote R1 | % 293
  \hideNote R1 | % 294
  \hideNote R1 | % 295
  \hideNote R1 | % 296
  \hideNote R1 | % 297
  \hideNote R1 | % 298
  \hideNote R1 | % 299

  \barNumberCheck #300
  \hideNote R1 | % 300
  \hideNote R1 | % 301
  \hideNote R1 | % 302
  \hideNote R1 | % 303
  \hideNote R1 | % 304
  \hideNote R1 | % 305
  \hideNote R1 | % 306
  \hideNote R1 | % 307
  \hideNote R1 | % 308
  \hideNote R1 | % 309

  \barNumberCheck #310
  \hideNote R1 | % 310
  \hideNote R1 | % 311
  \hideNote R1 | % 312
  \hideNote R1 | % 313
  \hideNote R1 | % 314
  \hideNote R1 | % 315
  \hideNote R1 | % 316
  \hideNote R1 | % 317
  \hideNote R1 | % 318
  \hideNote R1 | % 319

  \barNumberCheck #320
  \hideNote R1 | % 320
  \hideNote R1 | % 321
  \hideNote R1 | % 322
  \hideNote R1 | % 323
  \hideNote R1 | % 324
  \hideNote R1 | % 325
  \hideNote R1 | % 326
  \hideNote R1 | % 327
  \hideNote R1 | % 328
  \hideNote R1 | % 329

  \barNumberCheck #330
  \hideNote R1 | % 330
  \hideNote R1 | % 331
  \hideNote R1 | % 332
  \hideNote R1 | % 333
  \hideNote R1 | % 334
  \hideNote R1 | % 335
  \hideNote R1 | % 336
  \hideNote R1 | % 337
  \hideNote R1 | % 338
  \hideNote R1 | % 339

  \barNumberCheck #340
  \hideNote R1 | % 340
  \hideNote R1 | % 341
  \hideNote R1 | % 342
  \hideNote R1 | % 343
  \hideNote R1 | % 344
  \hideNote R1 | % 345
  \hideNote R1 | % 346
  \hideNote R1 | % 347
  \hideNote R1 | % 348
  \hideNote R1 | % 349

  \barNumberCheck #350
  \hideNote R1 | % 350
  \hideNote R1 | % 351
  \hideNote R1 | % 352
  \hideNote R1 | % 353
  \hideNote R1 | % 354
  \hideNote R1 | % 355
  \hideNote R1 | % 356
  \hideNote R1 | % 357
  \hideNote R1 | % 358
  \hideNote R1 | % 359

  \barNumberCheck #360
  \hideNote R1 | % 360
  \hideNote R1 | % 361
  \hideNote R1 | % 362
  \hideNote R1 | % 363
  \hideNote R1 | % 364
  \hideNote R1 | % 365
  \hideNote R1 | % 366
  \hideNote R1 | % 367
  \hideNote R1 | % 368
  \hideNote R1 | % 369

  \barNumberCheck #370
  \hideNote R1 | % 370
  \hideNote R1 | % 371
  \hideNote R1 | % 372
  \hideNote R1 | % 373
  \hideNote R1 | % 374
  \hideNote R1 | % 375
  \hideNote R1 | % 376
  \hideNote R1 | % 377
  \hideNote R1 | % 378
  \hideNote R1 | % 379

  \barNumberCheck #380
  \hideNote R1 | % 380
  \hideNote R1 | % 381
  \hideNote R1 | % 382
  \hideNote R1 | % 383
  \hideNote R1 | % 384
  \hideNote R1 | % 385
  \hideNote R1 | % 386
  \hideNote R1 | % 387
  \hideNote R1 | % 388
  \hideNote R1 | % 389

  \barNumberCheck #390
  \hideNote R1 | % 390
  \hideNote R1 | % 391
  \hideNote R1 | % 392
  \hideNote R1 | % 393
  \hideNote R1 | % 394
  \hideNote R1 | % 395
  \hideNote R1 | % 396
  \hideNote R1 | % 397
  \hideNote R1 | % 398
  \hideNote R1 | % 399

  \barNumberCheck #400
  \hideNote R1 | % 400
  \hideNote R1 | % 401
  \hideNote R1 | % 402
  \hideNote R1 | % 403
  \hideNote R1 | % 404
  \hideNote R1 | % 405
  \hideNote R1 | % 406
  \hideNote R1 | % 407
  \hideNote R1 | % 408
  \hideNote R1 | % 409

  \barNumberCheck #410
  \hideNote R1 | % 410
  \hideNote R1 | % 411
  \hideNote R1 | % 412
  \hideNote R1 | % 413
  \hideNote R1 | % 414
  \hideNote R1 | % 415
  \hideNote R1 | % 416
  \hideNote R1 | % 417
  \hideNote R1 | % 418
  \hideNote R1 | % 419

  \barNumberCheck #420
  \hideNote R1 | % 420
  \hideNote R1 | % 421
  \hideNote R1 | % 422
  \hideNote R1 | % 423
  \hideNote R1 | % 424
  \hideNote R1 | % 425
  \hideNote R1 | % 426
  \hideNote R1 | % 427
  \hideNote R1 | % 428
  \hideNote R1 | % 429

  \barNumberCheck #430
  \hideNote R1 | % 430
  \hideNote R1 | % 431
  \hideNote R1 | % 432
  \hideNote R1 | % 433
  \hideNote R1 | % 434
  \hideNote R1 | % 435
  \hideNote R1 | % 436
  \hideNote R1 | % 437
  \hideNote R1 | % 438
  \hideNote R1 | % 439

  \barNumberCheck #440
  \hideNote R1 | % 440
  \hideNote R1 | % 441
  \hideNote R1 | % 442
  \hideNote R1 | % 443
  \hideNote R1 | % 444
  \hideNote R1 | % 445
  \hideNote R1 | % 446
  \hideNote R1 | % 447
  \hideNote R1 | % 448
  \hideNote R1 | % 449

  \barNumberCheck #450
  \hideNote R1 | % 450
  \hideNote R1 | % 451
  \hideNote R1 | % 452
  \hideNote R1 | % 453
  \hideNote R1 | % 454
  \hideNote R1 | % 455
  \hideNote R1 | % 456
  \hideNote R1 | % 457
  \hideNote R1 | % 458
  \hideNote R1 | % 459

  \barNumberCheck #460
  \hideNote R1 | % 460
  \hideNote R1 | % 461
  \hideNote R1 | % 462
  \hideNote R1 | % 463
  \hideNote R1 | % 464
  \hideNote R1 | % 465
  \hideNote R1 | % 466
  \hideNote R1 | % 467
  \hideNote R1 | % 468
  \hideNote R1 | % 469

  \barNumberCheck #470
  \hideNote R1 | % 470
  \hideNote R1 | % 471
  \hideNote R1 | % 472
  \hideNote R1 | % 473
  \hideNote R1 | % 474
  \hideNote R1 | % 475
  \hideNote R1 | % 476
  \hideNote R1 | % 477
  \hideNote R1 | % 478
  \hideNote R1 | % 479

  \barNumberCheck #480
  \hideNote R1 | % 480
  \hideNote R1 | % 481
  \hideNote R1 | % 482
  \hideNote R1 | % 483
  \hideNote R1 | % 484
  \hideNote R1 | % 485
  \hideNote R1 | % 486
  \hideNote R1 | % 487
  \hideNote R1 | % 488
  \hideNote R1 | % 489

  \barNumberCheck #490
  \hideNote R1 | % 490
  \hideNote R1 | % 491
  \hideNote R1 | % 492
  \hideNote R1 | % 493
  \hideNote R1 | % 494
  \hideNote R1 | % 495
  \hideNote R1 | % 496
  \hideNote R1 | % 497
  \hideNote R1 | % 498
  \hideNote R1 | % 499

  \barNumberCheck #500
  \hideNote R1 | % 500
  \hideNote R1 | % 501
  \hideNote R1 | % 502
  \hideNote R1 | % 503
  \hideNote R1 | % 504
  \hideNote R1 | % 505
  \hideNote R1 | % 506
  \hideNote R1 | % 507
  \hideNote R1 | % 508
  \hideNote R1 | % 509

  \barNumberCheck #510
  \hideNote R1 | % 510
  \hideNote R1 | % 511
  \hideNote R1 | % 512
  \hideNote R1 | % 513
  \hideNote R1 | % 514
  \hideNote R1 | % 515
  \hideNote R1 | % 516
  \hideNote R1 | % 517
  \hideNote R1 | % 518
  \hideNote R1 | % 519

  \barNumberCheck #520
  \hideNote R1 | % 520
  \hideNote R1 | % 521
  \hideNote R1 | % 522
  \hideNote R1 | % 523
  \hideNote R1 | % 524
  \hideNote R1 | % 525
  \hideNote R1 | % 526
  \hideNote R1 | % 527
  \hideNote R1 | % 528
  \hideNote R1 | % 529

  \barNumberCheck #530
  \hideNote R1 | % 530
  \hideNote R1 | % 531
  \hideNote R1 | % 532
  \hideNote R1 | % 533
  \hideNote R1 | % 534
  \hideNote R1 | % 535
  \hideNote R1 | % 536
  \hideNote R1 | % 537
  \hideNote R1 | % 538
  \hideNote R1 | % 539

  \barNumberCheck #540
  \hideNote R1 | % 540
  \hideNote R1 | % 541
  \hideNote R1 | % 542
  \hideNote R1 | % 543
  \hideNote R1 | % 544
  \hideNote R1 | % 545
  \hideNote R1 | % 546
  \hideNote R1 | % 547
  \hideNote R1 | % 548
  \hideNote R1 | % 549

  \barNumberCheck #550
  \hideNote R1 | % 550
  \hideNote R1 | % 551
  \hideNote R1 | % 552
  \hideNote R1 | % 553
  \hideNote R1 | % 554
  \hideNote R1 | % 555
  \hideNote r2 \hideNote r8. \bar "|."
}

PartPFiveVoiceOne = \relative a {
  \clef "treble" \numericTimeSignature \time 4/4 \key a \major \U a16 [ \U a16
  \U a16 \U a16 ] \hideNote r8 \U a16 [ \U a16 ] \U a16 [ \U a16 ] \hideNote r4.
  | % 1
  \U b16 [ \U b16 \U b16 \U b16 ] \U b8 [ \U b16 \U b16 ] \U b16 [ \U cis16 \U
  cis8 ] \hideNote r4 | % 2
  d1 | % 3
  cis2 \U cis16 [ \U e16 ] \hideNote r16 e16 e4 | % 4
  \hideNote r4 b2. | % 5
  cis4 \hideNote r8 e8 fis8 \hideNote r16 e16 \hideNote r4 | % 6
  \hideNote R1 | % 7
  fis4 \hideNote r8 e8 fis8 \hideNote r16 e16 \hideNote r8 cis8 | % 8
  \U cis8 [ \U cis8 ] \U b8 [ \U cis8 ] es4 f4 | % 9

  \barNumberCheck #10
  \key fis \major es4 \hideNote r2. | % 10
  \hideNote R1 | % 11
  \hideNote R1 | % 12
  \hideNote r8 \U es16 [ \U f16 ] fis8 \hideNote r8 f4 \U es!8 [ \U f!16 \U es!16
  ] | % 13
  es1 | % 14
  es1 | % 15
  f1 | % 16
  fis,!2 cis'2 | % 17
  \key a \major a4 \hideNote r8 a8 a2 | % 18
  b4 \hideNote r8 b8 b2 | % 19

  \barNumberCheck #20
  cis4 \hideNote r8 cis8 cis2 | % 20
  b2 cis2 | % 21
  d4 \hideNote r8 d8 d2 | % 22
  cis4 \hideNote r8 cis8 cis2 | % 23
  a2. \U a8 [ \U cis8 ] | % 24
  cis1 | % 25
  \hideNote r8 \U cis16 [ \U cis16 ] \U e8 [ \U cis8 ] b4 \hideNote r4 | % 26
  d1 | % 27
  cis1 | % 28
  e4 e4 e2 | % 29

  \barNumberCheck #30
  cis1 | % 30
  d4 d4 \U d8. [ \U d8. ] d8 ] | % 31
  b4 \hideNote r8 e8 e2 | % 32
  d2 \U d8 [ \U cis8 ] \U cis8 [ \U cis8 ] | % 33
  cis2. \hideNote r4 | % 34
  d1 | % 35
  cis1 | % 36
  b4 b4 b2 | % 37
  \U b8 [ \U cis8 ] \U b8 [ \U a8 ] a2 | % 38
  d1 | % 39

  \barNumberCheck #40
  e1 | % 40
  d2 \U d8 [ \U d8 ] \U e8 [ \U cis8 ] | % 41
  cis1 | % 42
  fis1 | % 43
  \U e16 [ \U e16 \U e16 \U e16 ] \U e8 [ \U e16 \U e16 ] \hideNote r2 | % 44
  \hideNote r2 \hideNote r8 d8 \U e8 [ \U fis8 ] | % 45
  es4. c8 c8 e4. | % 46
  cis!1 | % 47
  d4. e8 e2 | % 48
  \U fis16 [ \U fis16 ] \hideNote r4 \U fis16 [ \U fis16 ] \hideNote r2 | % 49

  \barNumberCheck #50
  cis4. b8 b2 | % 50
  \U f'16 [ \U f16 ] \hideNote r4 \U f16 [ \U f16 ] \hideNote r2 | % 51
  e4. d8 d8 \hideNote r4. | % 52
  cis2. \hideNote r8 e8 | % 53
  e1 | % 54
  \hideNote r8 cis8 \U d8 [ \U f8 ] \U f8 [ \U a8 ] b4 | % 55
  b1 | % 56
  \hideNote R1 | % 57
  \hideNote R1 | % 58
  \hideNote R1 | % 59

  \barNumberCheck #60
  \hideNote R1 | % 60
  \hideNote R1 | % 61
  \hideNote R1 | % 62
  \hideNote R1 | % 63
  \hideNote R1 | % 64
  \U c,16 [ \U c16 \U c16 \U c16 ] \U c8 [ \U c16 \U c16 ] \U c16 [ \U c16 \U c8
  ] \hideNote r4 | % 65
  \U c16 [ \U c16 \U c16 \U c16 ] \U c8 [ \U c16 \U c16 ] \U c16 [ \U d16 \U d8
  ] \hideNote r4 | % 66
  \key bes \major es1 | % 67
  d1 | % 68
  f4 f4 f2 | % 69

  \barNumberCheck #70
  \U c8 [ \U d8 ] \U c8 [ \U bes8 ] g4 \hideNote r4 | % 70
  es'4 es4 \U es8. [ \U es8. ] es8 ] | % 71
  f1 | % 72
  es2 \U es8 [ \U d8 ] \U d8 [ \U d8 ] | % 73
  d2. \hideNote r4 | % 74
  es1 | % 75
  d1 | % 76
  f4 f4 f2 | % 77
  \U c8 [ \U d8 ] \U c8 [ \U bes8 ] bes2 | % 78
  es1 | % 79

  \barNumberCheck #80
  f1 | % 80
  es2 \U es8 [ \U es8 ] \U d8 [ \U d8 ] | % 81
  d2 \hideNote r2 | % 82
  es1 | % 83
  \U f16 [ \U f16 \U f16 \U f16 ] \U f8 [ \U f16 \U f16 ] \hideNote r2 | % 84
  es1 | % 85
  d2. \U c16 [ \U bes16 \U c16 \U d16 ] | % 86
  c4 c8 \hideNote r2 \hideNote r8 | % 87
  bes2. \hideNote r4 | % 88
  es1 | % 89

  \barNumberCheck #90
  d2. \hideNote r4 | % 90
  c4 c8 \hideNote r2 \hideNote r8 | % 91
  \U d16 [ \U d16 \U d16 \U d16 ] \hideNote r8 \U es16 [ \U es16 ] \U es16 [ \U
  es16 ] \hideNote r4 \U d16 [ \U es16 ] | % 92
  \U f16 [ \U f16 \U f16 \U f16 ] \U f8 [ \U f16 \U f16 ] \U f16 [ \U g16 \U g8
  ] \hideNote r4 | % 93
  \hideNote R1 | % 94
  \hideNote R1 | % 95
  \hideNote R1 | % 96
  \hideNote R1 | % 97
  \hideNote R1 | % 98
  \hideNote R1 | % 99

  \barNumberCheck #100
  \hideNote R1 | % 100
  \hideNote R1 | % 101
  \hideNote R1 | % 102
  \hideNote R1 | % 103
  \hideNote R1 | % 104
  \hideNote R1 | % 105
  \hideNote R1 | % 106
  \hideNote R1 | % 107
  \hideNote R1 | % 108
  \hideNote R1 | % 109

  \barNumberCheck #110
  \hideNote R1 | % 110
  \hideNote R1 | % 111
  \hideNote R1 | % 112
  \hideNote R1 | % 113
  \hideNote R1 | % 114
  \hideNote R1 | % 115
  \hideNote R1 | % 116
  \hideNote R1 | % 117
  \hideNote R1 | % 118
  \hideNote R1 | % 119

  \barNumberCheck #120
  \hideNote R1 | % 120
  \hideNote R1 | % 121
  \hideNote R1 | % 122
  \hideNote R1 | % 123
  \hideNote R1 | % 124
  \hideNote R1 | % 125
  \hideNote R1 | % 126
  \hideNote R1 | % 127
  \hideNote R1 | % 128
  \hideNote R1 | % 129

  \barNumberCheck #130
  \hideNote R1 | % 130
  \hideNote R1 | % 131
  \hideNote R1 | % 132
  \hideNote R1 | % 133
  \hideNote R1 | % 134
  \hideNote R1 | % 135
  \hideNote R1 | % 136
  \hideNote R1 | % 137
  \hideNote R1 | % 138
  \hideNote R1 | % 139

  \barNumberCheck #140
  \hideNote R1 | % 140
  \hideNote R1 | % 141
  \hideNote R1 | % 142
  \hideNote R1 | % 143
  \hideNote R1 | % 144
  \hideNote R1 | % 145
  \hideNote R1 | % 146
  \hideNote R1 | % 147
  \hideNote R1 | % 148
  \hideNote R1 | % 149

  \barNumberCheck #150
  \hideNote R1 | % 150
  \hideNote R1 | % 151
  \hideNote R1 | % 152
  \hideNote R1 | % 153
  \hideNote R1 | % 154
  \hideNote R1 | % 155
  \hideNote R1 | % 156
  \hideNote R1 | % 157
  \hideNote R1 | % 158
  \hideNote R1 | % 159

  \barNumberCheck #160
  \hideNote R1 | % 160
  \hideNote R1 | % 161
  \hideNote R1 | % 162
  \hideNote R1 | % 163
  \hideNote R1 | % 164
  \hideNote R1 | % 165
  \hideNote R1 | % 166
  \hideNote R1 | % 167
  \hideNote R1 | % 168
  \hideNote R1 | % 169

  \barNumberCheck #170
  \hideNote R1 | % 170
  \hideNote R1 | % 171
  \hideNote R1 | % 172
  \hideNote R1 | % 173
  \hideNote R1 | % 174
  \hideNote R1 | % 175
  \hideNote R1 | % 176
  \hideNote R1 | % 177
  \hideNote R1 | % 178
  \hideNote R1 | % 179

  \barNumberCheck #180
  \hideNote R1 | % 180
  \hideNote R1 | % 181
  \hideNote R1 | % 182
  \hideNote R1 | % 183
  \hideNote R1 | % 184
  \hideNote R1 | % 185
  \hideNote R1 | % 186
  \hideNote R1 | % 187
  \hideNote R1 | % 188
  \hideNote R1 | % 189

  \barNumberCheck #190
  \hideNote R1 | % 190
  \hideNote R1 | % 191
  \hideNote R1 | % 192
  \hideNote R1 | % 193
  \hideNote R1 | % 194
  \hideNote R1 | % 195
  \hideNote R1 | % 196
  \hideNote R1 | % 197
  \hideNote R1 | % 198
  \hideNote R1 | % 199

  \barNumberCheck #200
  \hideNote R1 | % 200
  \hideNote R1 | % 201
  \hideNote R1 | % 202
  \hideNote R1 | % 203
  \hideNote R1 | % 204
  \hideNote R1 | % 205
  \hideNote R1 | % 206
  \hideNote R1 | % 207
  \hideNote R1 | % 208
  \hideNote R1 | % 209

  \barNumberCheck #210
  \hideNote R1 | % 210
  \hideNote R1 | % 211
  \hideNote R1 | % 212
  \hideNote R1 | % 213
  \hideNote R1 | % 214
  \hideNote R1 | % 215
  \hideNote R1 | % 216
  \hideNote R1 | % 217
  \hideNote R1 | % 218
  \hideNote R1 | % 219

  \barNumberCheck #220
  \hideNote R1 | % 220
  \hideNote R1 | % 221
  \hideNote R1 | % 222
  \hideNote R1 | % 223
  \hideNote R1 | % 224
  \hideNote R1 | % 225
  \hideNote R1 | % 226
  \hideNote R1 | % 227
  \hideNote R1 | % 228
  \hideNote R1 | % 229

  \barNumberCheck #230
  \hideNote R1 | % 230
  \hideNote R1 | % 231
  \hideNote R1 | % 232
  \hideNote R1 | % 233
  \hideNote R1 | % 234
  \hideNote R1 | % 235
  \hideNote R1 | % 236
  \hideNote R1 | % 237
  \hideNote R1 | % 238
  \hideNote R1 | % 239

  \barNumberCheck #240
  \hideNote R1 | % 240
  \hideNote R1 | % 241
  \hideNote R1 | % 242
  \hideNote R1 | % 243
  \hideNote R1 | % 244
  \hideNote R1 | % 245
  \hideNote R1 | % 246
  \hideNote R1 | % 247
  \hideNote R1 | % 248
  \hideNote R1 | % 249

  \barNumberCheck #250
  \hideNote R1 | % 250
  \hideNote R1 | % 251
  \hideNote R1 | % 252
  \hideNote R1 | % 253
  \hideNote R1 | % 254
  \hideNote R1 | % 255
  \hideNote R1 | % 256
  \hideNote R1 | % 257
  \hideNote R1 | % 258
  \hideNote R1 | % 259

  \barNumberCheck #260
  \hideNote R1 | % 260
  \hideNote R1 | % 261
  \hideNote R1 | % 262
  \hideNote R1 | % 263
  \hideNote R1 | % 264
  \hideNote R1 | % 265
  \hideNote R1 | % 266
  \hideNote R1 | % 267
  \hideNote R1 | % 268
  \hideNote R1 | % 269

  \barNumberCheck #270
  \hideNote R1 | % 270
  \hideNote R1 | % 271
  \hideNote R1 | % 272
  \hideNote R1 | % 273
  \hideNote R1 | % 274
  \hideNote R1 | % 275
  \hideNote R1 | % 276
  \hideNote R1 | % 277
  \hideNote R1 | % 278
  \hideNote R1 | % 279

  \barNumberCheck #280
  \hideNote R1 | % 280
  \hideNote R1 | % 281
  \hideNote R1 | % 282
  \hideNote R1 | % 283
  \hideNote R1 | % 284
  \hideNote R1 | % 285
  \hideNote R1 | % 286
  \hideNote R1 | % 287
  \hideNote R1 | % 288
  \hideNote R1 | % 289

  \barNumberCheck #290
  \hideNote R1 | % 290
  \hideNote R1 | % 291
  \hideNote R1 | % 292
  \hideNote R1 | % 293
  \hideNote R1 | % 294
  \hideNote R1 | % 295
  \hideNote R1 | % 296
  \hideNote R1 | % 297
  \hideNote R1 | % 298
  \hideNote R1 | % 299

  \barNumberCheck #300
  \hideNote R1 | % 300
  \hideNote R1 | % 301
  \hideNote R1 | % 302
  \hideNote R1 | % 303
  \hideNote R1 | % 304
  \hideNote R1 | % 305
  \hideNote R1 | % 306
  \hideNote R1 | % 307
  \hideNote R1 | % 308
  \hideNote R1 | % 309

  \barNumberCheck #310
  \hideNote R1 | % 310
  \hideNote R1 | % 311
  \hideNote R1 | % 312
  \hideNote R1 | % 313
  \hideNote R1 | % 314
  \hideNote R1 | % 315
  \hideNote R1 | % 316
  \hideNote R1 | % 317
  \hideNote R1 | % 318
  \hideNote R1 | % 319

  \barNumberCheck #320
  \hideNote R1 | % 320
  \hideNote R1 | % 321
  \hideNote R1 | % 322
  \hideNote R1 | % 323
  \hideNote R1 | % 324
  \hideNote R1 | % 325
  \hideNote R1 | % 326
  \hideNote R1 | % 327
  \hideNote R1 | % 328
  \hideNote R1 | % 329

  \barNumberCheck #330
  \hideNote R1 | % 330
  \hideNote R1 | % 331
  \hideNote R1 | % 332
  \hideNote R1 | % 333
  \hideNote R1 | % 334
  \hideNote R1 | % 335
  \hideNote R1 | % 336
  \hideNote R1 | % 337
  \hideNote R1 | % 338
  \hideNote R1 | % 339

  \barNumberCheck #340
  \hideNote R1 | % 340
  \hideNote R1 | % 341
  \hideNote R1 | % 342
  \hideNote R1 | % 343
  \hideNote R1 | % 344
  \hideNote R1 | % 345
  \hideNote R1 | % 346
  \hideNote R1 | % 347
  \hideNote R1 | % 348
  \hideNote R1 | % 349

  \barNumberCheck #350
  \hideNote R1 | % 350
  \hideNote R1 | % 351
  \hideNote R1 | % 352
  \hideNote R1 | % 353
  \hideNote R1 | % 354
  \hideNote R1 | % 355
  \hideNote R1 | % 356
  \hideNote R1 | % 357
  \hideNote R1 | % 358
  \hideNote R1 | % 359

  \barNumberCheck #360
  \hideNote R1 | % 360
  \hideNote R1 | % 361
  \hideNote R1 | % 362
  \hideNote R1 | % 363
  \hideNote R1 | % 364
  \hideNote R1 | % 365
  \hideNote R1 | % 366
  \hideNote R1 | % 367
  \hideNote R1 | % 368
  \hideNote R1 | % 369

  \barNumberCheck #370
  \hideNote R1 | % 370
  \hideNote R1 | % 371
  \hideNote R1 | % 372
  \hideNote R1 | % 373
  \hideNote R1 | % 374
  \hideNote R1 | % 375
  \hideNote R1 | % 376
  \hideNote R1 | % 377
  \hideNote R1 | % 378
  \hideNote R1 | % 379

  \barNumberCheck #380
  \hideNote R1 | % 380
  \hideNote R1 | % 381
  \hideNote R1 | % 382
  \hideNote R1 | % 383
  \hideNote R1 | % 384
  \hideNote R1 | % 385
  \hideNote R1 | % 386
  \hideNote R1 | % 387
  \hideNote R1 | % 388
  \hideNote R1 | % 389

  \barNumberCheck #390
  \hideNote R1 | % 390
  \hideNote R1 | % 391
  \hideNote R1 | % 392
  \hideNote R1 | % 393
  \hideNote R1 | % 394
  \hideNote R1 | % 395
  \hideNote R1 | % 396
  \hideNote R1 | % 397
  \hideNote R1 | % 398
  \hideNote R1 | % 399

  \barNumberCheck #400
  \hideNote R1 | % 400
  \hideNote R1 | % 401
  \hideNote R1 | % 402
  \hideNote R1 | % 403
  \hideNote R1 | % 404
  \hideNote R1 | % 405
  \hideNote R1 | % 406
  \hideNote R1 | % 407
  \hideNote R1 | % 408
  \hideNote R1 | % 409

  \barNumberCheck #410
  \hideNote R1 | % 410
  \hideNote R1 | % 411
  \hideNote R1 | % 412
  \hideNote R1 | % 413
  \hideNote R1 | % 414
  \hideNote R1 | % 415
  \hideNote R1 | % 416
  \hideNote R1 | % 417
  \hideNote R1 | % 418
  \hideNote R1 | % 419

  \barNumberCheck #420
  \hideNote R1 | % 420
  \hideNote R1 | % 421
  \hideNote R1 | % 422
  \hideNote R1 | % 423
  \hideNote R1 | % 424
  \hideNote R1 | % 425
  \hideNote R1 | % 426
  \hideNote R1 | % 427
  \hideNote R1 | % 428
  \hideNote R1 | % 429

  \barNumberCheck #430
  \hideNote R1 | % 430
  \hideNote R1 | % 431
  \hideNote R1 | % 432
  \hideNote R1 | % 433
  \hideNote R1 | % 434
  \hideNote R1 | % 435
  \hideNote R1 | % 436
  \hideNote R1 | % 437
  \hideNote R1 | % 438
  \hideNote R1 | % 439

  \barNumberCheck #440
  \hideNote R1 | % 440
  \hideNote R1 | % 441
  \hideNote R1 | % 442
  \hideNote R1 | % 443
  \hideNote R1 | % 444
  \hideNote R1 | % 445
  \hideNote R1 | % 446
  \hideNote R1 | % 447
  \hideNote R1 | % 448
  \hideNote R1 | % 449

  \barNumberCheck #450
  \hideNote R1 | % 450
  \hideNote R1 | % 451
  \hideNote R1 | % 452
  \hideNote R1 | % 453
  \hideNote R1 | % 454
  \hideNote R1 | % 455
  \hideNote R1 | % 456
  \hideNote R1 | % 457
  \hideNote R1 | % 458
  \hideNote R1 | % 459

  \barNumberCheck #460
  \hideNote R1 | % 460
  \hideNote R1 | % 461
  \hideNote R1 | % 462
  \hideNote R1 | % 463
  \hideNote R1 | % 464
  \hideNote R1 | % 465
  \hideNote R1 | % 466
  \hideNote R1 | % 467
  \hideNote R1 | % 468
  \hideNote R1 | % 469

  \barNumberCheck #470
  \hideNote R1 | % 470
  \hideNote R1 | % 471
  \hideNote R1 | % 472
  \hideNote R1 | % 473
  \hideNote R1 | % 474
  \hideNote R1 | % 475
  \hideNote R1 | % 476
  \hideNote R1 | % 477
  \hideNote R1 | % 478
  \hideNote R1 | % 479

  \barNumberCheck #480
  \hideNote R1 | % 480
  \hideNote R1 | % 481
  \hideNote R1 | % 482
  \hideNote R1 | % 483
  \hideNote R1 | % 484
  \hideNote R1 | % 485
  \hideNote R1 | % 486
  \hideNote R1 | % 487
  \hideNote R1 | % 488
  \hideNote R1 | % 489

  \barNumberCheck #490
  \hideNote R1 | % 490
  \hideNote R1 | % 491
  \hideNote R1 | % 492
  \hideNote R1 | % 493
  \hideNote R1 | % 494
  \hideNote R1 | % 495
  \hideNote R1 | % 496
  \hideNote R1 | % 497
  \hideNote R1 | % 498
  \hideNote R1 | % 499

  \barNumberCheck #500
  \hideNote R1 | % 500
  \hideNote R1 | % 501
  \hideNote R1 | % 502
  \hideNote R1 | % 503
  \hideNote R1 | % 504
  \hideNote R1 | % 505
  \hideNote R1 | % 506
  \hideNote R1 | % 507
  \hideNote R1 | % 508
  \hideNote R1 | % 509

  \barNumberCheck #510
  \hideNote R1 | % 510
  \hideNote R1 | % 511
  \hideNote R1 | % 512
  \hideNote R1 | % 513
  \hideNote R1 | % 514
  \hideNote R1 | % 515
  \hideNote R1 | % 516
  \hideNote R1 | % 517
  \hideNote R1 | % 518
  \hideNote R1 | % 519

  \barNumberCheck #520
  \hideNote R1 | % 520
  \hideNote R1 | % 521
  \hideNote R1 | % 522
  \hideNote R1 | % 523
  \hideNote R1 | % 524
  \hideNote R1 | % 525
  \hideNote R1 | % 526
  \hideNote R1 | % 527
  \hideNote R1 | % 528
  \hideNote R1 | % 529

  \barNumberCheck #530
  \hideNote R1 | % 530
  \hideNote R1 | % 531
  \hideNote R1 | % 532
  \hideNote R1 | % 533
  \hideNote R1 | % 534
  \hideNote R1 | % 535
  \hideNote R1 | % 536
  \hideNote R1 | % 537
  \hideNote R1 | % 538
  \hideNote R1 | % 539

  \barNumberCheck #540
  \hideNote R1 | % 540
  \hideNote R1 | % 541
  \hideNote R1 | % 542
  \hideNote R1 | % 543
  \hideNote R1 | % 544
  \hideNote R1 | % 545
  \hideNote R1 | % 546
  \hideNote R1 | % 547
  \hideNote R1 | % 548
  \hideNote R1 | % 549

  \barNumberCheck #550
  \hideNote R1 | % 550
  \hideNote R1 | % 551
  \hideNote R1 | % 552
  \hideNote R1 | % 553
  \hideNote R1 | % 554
  \hideNote R1 | % 555
  \hideNote r2 \hideNote r8. \bar "|."
}

PartPSixVoiceOne = \relative c, {
  \staffLines "percussion" 5 \numericTimeSignature \time 4/4 \key a \major
  \hideNote r2.. c8 | % 1
  c'4 \hideNote r2. | % 2
  c4 \U d,8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 3
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 4
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 5
  c'4 \U d,8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 6
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 7
  c'4 \U d,8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 8
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 9

  \barNumberCheck #10
  \key fis \major c'4 \U d,8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 10
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 11
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 12
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 13
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 14
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 15
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 16
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 17
  \key a \major c'4 \U f,8 [ \U c8 ] \U f8 [ \U f8 ] \U d8 [ \U f8 ] | % 18
  c4 \U f8 [ \U c8 ] \U f8 [ \U f8 ] \U d8 [ \U f8 ] | % 19

  \barNumberCheck #20
  c4 \U f8 [ \U c8 ] \U f8 [ \U f8 ] \U d8 [ \U f8 ] | % 20
  c4 \U f8 [ \U c8 ] \U f8 [ \U f8 ] \U d8 [ \U f8 ] | % 21
  c4 \U f8 [ \U c8 ] \U f8 [ \U f8 ] \U d8 [ \U f8 ] | % 22
  c4 \U f8 [ \U c8 ] \U f8 [ \U f8 ] \U d8 [ \U f8 ] | % 23
  \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] | % 24
  \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] | % 25
  c'4 \hideNote r4. c,8 d8 \hideNote r8 | % 26
  c'4 \U d,8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 27
  \U c8 [ \U f8 ] \U d8 [ \U f16 \U f16 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 28
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 29

  \barNumberCheck #30
  \U c8 [ \U f8 ] \U d8 [ \U f16 \U f16 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 30
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 31
  \U c8 [ \U f8 ] \U d8 [ \U f16 \U f16 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 32
  \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] | % 33
  \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] | % 34
  c'4 \U d,8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 35
  \U c8 [ \U f8 ] \U d8 [ \U f16 \U f16 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 36
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 37
  \U c8 [ \U f8 ] \U d8 [ \U f16 \U f16 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 38
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 39

  \barNumberCheck #40
  \U c8 [ \U f8 ] \U d8 [ \U f16 \U f16 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 40
  \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] | % 41
  \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] | % 42
  \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] | % 43
  c'4 \hideNote r2. | % 44
  \hideNote R1 | % 45
  \hideNote R1 | % 46
  \hideNote R1 | % 47
  \hideNote R1 | % 48
  \hideNote R1 | % 49

  \barNumberCheck #50
  \hideNote R1 | % 50
  \hideNote R1 | % 51
  \hideNote R1 | % 52
  \hideNote R1 | % 53
  \hideNote R1 | % 54
  \hideNote R1 | % 55
  \hideNote R1 | % 56
  c,4 \hideNote r8 c8 c4 f4 | % 57
  c4 \hideNote r8 c8 c4 f4 | % 58
  c4 \hideNote r8 c8 c4 f4 | % 59

  \barNumberCheck #60
  c4 \hideNote r8 c8 c4 f4 | % 60
  c4 \hideNote r8 c8 c4 f4 | % 61
  c4 \hideNote r8 c8 c4 f4 | % 62
  c4 \hideNote r8 c8 c4 \U f8 [ \U c8 ] | % 63
  \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] | % 64
  c'4 \hideNote r2 \hideNote r8 c,8 | % 65
  c'4 \hideNote r2. | % 66
  \key bes \major c4 \U d,8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 67
  \U c8 [ \U f8 ] \U d8 [ \U f16 \U f16 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 68
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 69

  \barNumberCheck #70
  \U c8 [ \U f8 ] \U d8 [ \U f16 \U f16 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 70
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 71
  \U c8 [ \U f8 ] \U d8 [ \U f16 \U f16 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 72
  \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] | % 73
  \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] | % 74
  c'4 \U d,8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 75
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 76
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 77
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 78
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 79

  \barNumberCheck #80
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 80
  \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] | % 81
  \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] | % 82
  \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] \U c8 [ \U f8 ] | % 83
  c'4 \hideNote r2. | % 84
  c4 \U d,8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 85
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 86
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 87
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 88
  c'4 \U d,8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 89

  \barNumberCheck #90
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 90
  \U c8 [ \U f8 ] \U d8 [ \U f8 ] \U c8 [ \U f8 ] \U d8 [ \U f8 ] | % 91
  c'4 \hideNote r2 \hideNote r8 c,8 | % 92
  c'4 \hideNote r2. | % 93
  \hideNote R1 | % 94
  \hideNote R1 | % 95
  \hideNote R1 | % 96
  \hideNote R1 | % 97
  \hideNote R1 | % 98
  \hideNote R1 | % 99

  \barNumberCheck #100
  \hideNote R1 | % 100
  \hideNote R1 | % 101
  \hideNote R1 | % 102
  \hideNote R1 | % 103
  \hideNote R1 | % 104
  \hideNote R1 | % 105
  \hideNote R1 | % 106
  \hideNote R1 | % 107
  \hideNote R1 | % 108
  \hideNote R1 | % 109

  \barNumberCheck #110
  \hideNote R1 | % 110
  \hideNote R1 | % 111
  \hideNote R1 | % 112
  \hideNote R1 | % 113
  \hideNote R1 | % 114
  \hideNote R1 | % 115
  \hideNote R1 | % 116
  \hideNote R1 | % 117
  \hideNote R1 | % 118
  \hideNote R1 | % 119

  \barNumberCheck #120
  \hideNote R1 | % 120
  \hideNote R1 | % 121
  \hideNote R1 | % 122
  \hideNote R1 | % 123
  \hideNote R1 | % 124
  \hideNote R1 | % 125
  \hideNote R1 | % 126
  \hideNote R1 | % 127
  \hideNote R1 | % 128
  \hideNote R1 | % 129

  \barNumberCheck #130
  \hideNote R1 | % 130
  \hideNote R1 | % 131
  \hideNote R1 | % 132
  \hideNote R1 | % 133
  \hideNote R1 | % 134
  \hideNote R1 | % 135
  \hideNote R1 | % 136
  \hideNote R1 | % 137
  \hideNote R1 | % 138
  \hideNote R1 | % 139

  \barNumberCheck #140
  \hideNote R1 | % 140
  \hideNote R1 | % 141
  \hideNote R1 | % 142
  \hideNote R1 | % 143
  \hideNote R1 | % 144
  \hideNote R1 | % 145
  \hideNote R1 | % 146
  \hideNote R1 | % 147
  \hideNote R1 | % 148
  \hideNote R1 | % 149

  \barNumberCheck #150
  \hideNote R1 | % 150
  \hideNote R1 | % 151
  \hideNote R1 | % 152
  \hideNote R1 | % 153
  \hideNote R1 | % 154
  \hideNote R1 | % 155
  \hideNote R1 | % 156
  \hideNote R1 | % 157
  \hideNote R1 | % 158
  \hideNote R1 | % 159

  \barNumberCheck #160
  \hideNote R1 | % 160
  \hideNote R1 | % 161
  \hideNote R1 | % 162
  \hideNote R1 | % 163
  \hideNote R1 | % 164
  \hideNote R1 | % 165
  \hideNote R1 | % 166
  \hideNote R1 | % 167
  \hideNote R1 | % 168
  \hideNote R1 | % 169

  \barNumberCheck #170
  \hideNote R1 | % 170
  \hideNote R1 | % 171
  \hideNote R1 | % 172
  \hideNote R1 | % 173
  \hideNote R1 | % 174
  \hideNote R1 | % 175
  \hideNote R1 | % 176
  \hideNote R1 | % 177
  \hideNote R1 | % 178
  \hideNote R1 | % 179

  \barNumberCheck #180
  \hideNote R1 | % 180
  \hideNote R1 | % 181
  \hideNote R1 | % 182
  \hideNote R1 | % 183
  \hideNote R1 | % 184
  \hideNote R1 | % 185
  \hideNote R1 | % 186
  \hideNote R1 | % 187
  \hideNote R1 | % 188
  \hideNote R1 | % 189

  \barNumberCheck #190
  \hideNote R1 | % 190
  \hideNote R1 | % 191
  \hideNote R1 | % 192
  \hideNote R1 | % 193
  \hideNote R1 | % 194
  \hideNote R1 | % 195
  \hideNote R1 | % 196
  \hideNote R1 | % 197
  \hideNote R1 | % 198
  \hideNote R1 | % 199

  \barNumberCheck #200
  \hideNote R1 | % 200
  \hideNote R1 | % 201
  \hideNote R1 | % 202
  \hideNote R1 | % 203
  \hideNote R1 | % 204
  \hideNote R1 | % 205
  \hideNote R1 | % 206
  \hideNote R1 | % 207
  \hideNote R1 | % 208
  \hideNote R1 | % 209

  \barNumberCheck #210
  \hideNote R1 | % 210
  \hideNote R1 | % 211
  \hideNote R1 | % 212
  \hideNote R1 | % 213
  \hideNote R1 | % 214
  \hideNote R1 | % 215
  \hideNote R1 | % 216
  \hideNote R1 | % 217
  \hideNote R1 | % 218
  \hideNote R1 | % 219

  \barNumberCheck #220
  \hideNote R1 | % 220
  \hideNote R1 | % 221
  \hideNote R1 | % 222
  \hideNote R1 | % 223
  \hideNote R1 | % 224
  \hideNote R1 | % 225
  \hideNote R1 | % 226
  \hideNote R1 | % 227
  \hideNote R1 | % 228
  \hideNote R1 | % 229

  \barNumberCheck #230
  \hideNote R1 | % 230
  \hideNote R1 | % 231
  \hideNote R1 | % 232
  \hideNote R1 | % 233
  \hideNote R1 | % 234
  \hideNote R1 | % 235
  \hideNote R1 | % 236
  \hideNote R1 | % 237
  \hideNote R1 | % 238
  \hideNote R1 | % 239

  \barNumberCheck #240
  \hideNote R1 | % 240
  \hideNote R1 | % 241
  \hideNote R1 | % 242
  \hideNote R1 | % 243
  \hideNote R1 | % 244
  \hideNote R1 | % 245
  \hideNote R1 | % 246
  \hideNote R1 | % 247
  \hideNote R1 | % 248
  \hideNote R1 | % 249

  \barNumberCheck #250
  \hideNote R1 | % 250
  \hideNote R1 | % 251
  \hideNote R1 | % 252
  \hideNote R1 | % 253
  \hideNote R1 | % 254
  \hideNote R1 | % 255
  \hideNote R1 | % 256
  \hideNote R1 | % 257
  \hideNote R1 | % 258
  \hideNote R1 | % 259

  \barNumberCheck #260
  \hideNote R1 | % 260
  \hideNote R1 | % 261
  \hideNote R1 | % 262
  \hideNote R1 | % 263
  \hideNote R1 | % 264
  \hideNote R1 | % 265
  \hideNote R1 | % 266
  \hideNote R1 | % 267
  \hideNote R1 | % 268
  \hideNote R1 | % 269

  \barNumberCheck #270
  \hideNote R1 | % 270
  \hideNote R1 | % 271
  \hideNote R1 | % 272
  \hideNote R1 | % 273
  \hideNote R1 | % 274
  \hideNote R1 | % 275
  \hideNote R1 | % 276
  \hideNote R1 | % 277
  \hideNote R1 | % 278
  \hideNote R1 | % 279

  \barNumberCheck #280
  \hideNote R1 | % 280
  \hideNote R1 | % 281
  \hideNote R1 | % 282
  \hideNote R1 | % 283
  \hideNote R1 | % 284
  \hideNote R1 | % 285
  \hideNote R1 | % 286
  \hideNote R1 | % 287
  \hideNote R1 | % 288
  \hideNote R1 | % 289

  \barNumberCheck #290
  \hideNote R1 | % 290
  \hideNote R1 | % 291
  \hideNote R1 | % 292
  \hideNote R1 | % 293
  \hideNote R1 | % 294
  \hideNote R1 | % 295
  \hideNote R1 | % 296
  \hideNote R1 | % 297
  \hideNote R1 | % 298
  \hideNote R1 | % 299

  \barNumberCheck #300
  \hideNote R1 | % 300
  \hideNote R1 | % 301
  \hideNote R1 | % 302
  \hideNote R1 | % 303
  \hideNote R1 | % 304
  \hideNote R1 | % 305
  \hideNote R1 | % 306
  \hideNote R1 | % 307
  \hideNote R1 | % 308
  \hideNote R1 | % 309

  \barNumberCheck #310
  \hideNote R1 | % 310
  \hideNote R1 | % 311
  \hideNote R1 | % 312
  \hideNote R1 | % 313
  \hideNote R1 | % 314
  \hideNote R1 | % 315
  \hideNote R1 | % 316
  \hideNote R1 | % 317
  \hideNote R1 | % 318
  \hideNote R1 | % 319

  \barNumberCheck #320
  \hideNote R1 | % 320
  \hideNote R1 | % 321
  \hideNote R1 | % 322
  \hideNote R1 | % 323
  \hideNote R1 | % 324
  \hideNote R1 | % 325
  \hideNote R1 | % 326
  \hideNote R1 | % 327
  \hideNote R1 | % 328
  \hideNote R1 | % 329

  \barNumberCheck #330
  \hideNote R1 | % 330
  \hideNote R1 | % 331
  \hideNote R1 | % 332
  \hideNote R1 | % 333
  \hideNote R1 | % 334
  \hideNote R1 | % 335
  \hideNote R1 | % 336
  \hideNote R1 | % 337
  \hideNote R1 | % 338
  \hideNote R1 | % 339

  \barNumberCheck #340
  \hideNote R1 | % 340
  \hideNote R1 | % 341
  \hideNote R1 | % 342
  \hideNote R1 | % 343
  \hideNote R1 | % 344
  \hideNote R1 | % 345
  \hideNote R1 | % 346
  \hideNote R1 | % 347
  \hideNote R1 | % 348
  \hideNote R1 | % 349

  \barNumberCheck #350
  \hideNote R1 | % 350
  \hideNote R1 | % 351
  \hideNote R1 | % 352
  \hideNote R1 | % 353
  \hideNote R1 | % 354
  \hideNote R1 | % 355
  \hideNote R1 | % 356
  \hideNote R1 | % 357
  \hideNote R1 | % 358
  \hideNote R1 | % 359

  \barNumberCheck #360
  \hideNote R1 | % 360
  \hideNote R1 | % 361
  \hideNote R1 | % 362
  \hideNote R1 | % 363
  \hideNote R1 | % 364
  \hideNote R1 | % 365
  \hideNote R1 | % 366
  \hideNote R1 | % 367
  \hideNote R1 | % 368
  \hideNote R1 | % 369

  \barNumberCheck #370
  \hideNote R1 | % 370
  \hideNote R1 | % 371
  \hideNote R1 | % 372
  \hideNote R1 | % 373
  \hideNote R1 | % 374
  \hideNote R1 | % 375
  \hideNote R1 | % 376
  \hideNote R1 | % 377
  \hideNote R1 | % 378
  \hideNote R1 | % 379

  \barNumberCheck #380
  \hideNote R1 | % 380
  \hideNote R1 | % 381
  \hideNote R1 | % 382
  \hideNote R1 | % 383
  \hideNote R1 | % 384
  \hideNote R1 | % 385
  \hideNote R1 | % 386
  \hideNote R1 | % 387
  \hideNote R1 | % 388
  \hideNote R1 | % 389

  \barNumberCheck #390
  \hideNote R1 | % 390
  \hideNote R1 | % 391
  \hideNote R1 | % 392
  \hideNote R1 | % 393
  \hideNote R1 | % 394
  \hideNote R1 | % 395
  \hideNote R1 | % 396
  \hideNote R1 | % 397
  \hideNote R1 | % 398
  \hideNote R1 | % 399

  \barNumberCheck #400
  \hideNote R1 | % 400
  \hideNote R1 | % 401
  \hideNote R1 | % 402
  \hideNote R1 | % 403
  \hideNote R1 | % 404
  \hideNote R1 | % 405
  \hideNote R1 | % 406
  \hideNote R1 | % 407
  \hideNote R1 | % 408
  \hideNote R1 | % 409

  \barNumberCheck #410
  \hideNote R1 | % 410
  \hideNote R1 | % 411
  \hideNote R1 | % 412
  \hideNote R1 | % 413
  \hideNote R1 | % 414
  \hideNote R1 | % 415
  \hideNote R1 | % 416
  \hideNote R1 | % 417
  \hideNote R1 | % 418
  \hideNote R1 | % 419

  \barNumberCheck #420
  \hideNote R1 | % 420
  \hideNote R1 | % 421
  \hideNote R1 | % 422
  \hideNote R1 | % 423
  \hideNote R1 | % 424
  \hideNote R1 | % 425
  \hideNote R1 | % 426
  \hideNote R1 | % 427
  \hideNote R1 | % 428
  \hideNote R1 | % 429

  \barNumberCheck #430
  \hideNote R1 | % 430
  \hideNote R1 | % 431
  \hideNote R1 | % 432
  \hideNote R1 | % 433
  \hideNote R1 | % 434
  \hideNote R1 | % 435
  \hideNote R1 | % 436
  \hideNote R1 | % 437
  \hideNote R1 | % 438
  \hideNote R1 | % 439

  \barNumberCheck #440
  \hideNote R1 | % 440
  \hideNote R1 | % 441
  \hideNote R1 | % 442
  \hideNote R1 | % 443
  \hideNote R1 | % 444
  \hideNote R1 | % 445
  \hideNote R1 | % 446
  \hideNote R1 | % 447
  \hideNote R1 | % 448
  \hideNote R1 | % 449

  \barNumberCheck #450
  \hideNote R1 | % 450
  \hideNote R1 | % 451
  \hideNote R1 | % 452
  \hideNote R1 | % 453
  \hideNote R1 | % 454
  \hideNote R1 | % 455
  \hideNote R1 | % 456
  \hideNote R1 | % 457
  \hideNote R1 | % 458
  \hideNote R1 | % 459

  \barNumberCheck #460
  \hideNote R1 | % 460
  \hideNote R1 | % 461
  \hideNote R1 | % 462
  \hideNote R1 | % 463
  \hideNote R1 | % 464
  \hideNote R1 | % 465
  \hideNote R1 | % 466
  \hideNote R1 | % 467
  \hideNote R1 | % 468
  \hideNote R1 | % 469

  \barNumberCheck #470
  \hideNote R1 | % 470
  \hideNote R1 | % 471
  \hideNote R1 | % 472
  \hideNote R1 | % 473
  \hideNote R1 | % 474
  \hideNote R1 | % 475
  \hideNote R1 | % 476
  \hideNote R1 | % 477
  \hideNote R1 | % 478
  \hideNote R1 | % 479

  \barNumberCheck #480
  \hideNote R1 | % 480
  \hideNote R1 | % 481
  \hideNote R1 | % 482
  \hideNote R1 | % 483
  \hideNote R1 | % 484
  \hideNote R1 | % 485
  \hideNote R1 | % 486
  \hideNote R1 | % 487
  \hideNote R1 | % 488
  \hideNote R1 | % 489

  \barNumberCheck #490
  \hideNote R1 | % 490
  \hideNote R1 | % 491
  \hideNote R1 | % 492
  \hideNote R1 | % 493
  \hideNote R1 | % 494
  \hideNote R1 | % 495
  \hideNote R1 | % 496
  \hideNote R1 | % 497
  \hideNote R1 | % 498
  \hideNote R1 | % 499

  \barNumberCheck #500
  \hideNote R1 | % 500
  \hideNote R1 | % 501
  \hideNote R1 | % 502
  \hideNote R1 | % 503
  \hideNote R1 | % 504
  \hideNote R1 | % 505
  \hideNote R1 | % 506
  \hideNote R1 | % 507
  \hideNote R1 | % 508
  \hideNote R1 | % 509

  \barNumberCheck #510
  \hideNote R1 | % 510
  \hideNote R1 | % 511
  \hideNote R1 | % 512
  \hideNote R1 | % 513
  \hideNote R1 | % 514
  \hideNote R1 | % 515
  \hideNote R1 | % 516
  \hideNote R1 | % 517
  \hideNote R1 | % 518
  \hideNote R1 | % 519

  \barNumberCheck #520
  \hideNote R1 | % 520
  \hideNote R1 | % 521
  \hideNote R1 | % 522
  \hideNote R1 | % 523
  \hideNote R1 | % 524
  \hideNote R1 | % 525
  \hideNote R1 | % 526
  \hideNote R1 | % 527
  \hideNote R1 | % 528
  \hideNote R1 | % 529

  \barNumberCheck #530
  \hideNote R1 | % 530
  \hideNote R1 | % 531
  \hideNote R1 | % 532
  \hideNote R1 | % 533
  \hideNote R1 | % 534
  \hideNote R1 | % 535
  \hideNote R1 | % 536
  \hideNote R1 | % 537
  \hideNote R1 | % 538
  \hideNote R1 | % 539

  \barNumberCheck #540
  \hideNote R1 | % 540
  \hideNote R1 | % 541
  \hideNote R1 | % 542
  \hideNote R1 | % 543
  \hideNote R1 | % 544
  \hideNote R1 | % 545
  \hideNote R1 | % 546
  \hideNote R1 | % 547
  \hideNote R1 | % 548
  \hideNote R1 | % 549

  \barNumberCheck #550
  \hideNote R1 | % 550
  \hideNote R1 | % 551
  \hideNote R1 | % 552
  \hideNote R1 | % 553
  \hideNote R1 | % 554
  \hideNote R1 | % 555
  \hideNote r2 \hideNote r8. \bar "|."
}


% The score definition
\score {
  <<
    \new Staff = "P1" <<
      \set Staff.instrumentName = "ピアノ"
      \set Staff.shortInstrumentName = "Pno"
      \context Staff <<
        \override Staff.BarLine.allow-span-bar = ##f
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPOneVoiceOne" {
          \PartPOneVoiceOne
        }
      >>
    >>
    \new Staff = "P2" <<
      \set Staff.instrumentName = "ピアノ"
      \set Staff.shortInstrumentName = "Pno"
      \context Staff <<
        \override Staff.BarLine.allow-span-bar = ##f
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPTwoVoiceOne" {
          \PartPTwoVoiceOne
        }
      >>
    >>
    \new Staff = "P3" <<
      \set Staff.instrumentName = "ボーカル"
      \set Staff.shortInstrumentName = "Pno"
      \context Staff <<
        \override Staff.BarLine.allow-span-bar = ##f
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPThreeVoiceOne" {
          \PartPThreeVoiceOne
        }
      >>
    >>
    \new Staff = "P4" <<
      \set Staff.instrumentName = "ボーカル"
      \set Staff.shortInstrumentName = "Pno"
      \context Staff <<
        \override Staff.BarLine.allow-span-bar = ##f
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPFourVoiceOne" {
          \PartPFourVoiceOne
        }
      >>
    >>
    \new Staff = "P5" <<
      \set Staff.instrumentName = "ボーカル"
      \set Staff.shortInstrumentName = "Pno"
      \context Staff <<
        \override Staff.BarLine.allow-span-bar = ##f
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPFiveVoiceOne" {
          \PartPFiveVoiceOne
        }
      >>
    >>
    \new Staff = "P6" <<
      \set Staff.instrumentName = "ドラムセット"
      \context Staff <<
        \override Staff.BarLine.allow-span-bar = ##f
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPSixVoiceOne" {
          \PartPSixVoiceOne
        }
      >>
    >>
  >>
  \layout {}
  % To create MIDI output, uncomment the following line:
  % \midi { \tempo 4 = 130.0002 }
}
