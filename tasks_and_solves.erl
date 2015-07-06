  1 -module(lisp99).
  2 -compile(export_all).
  3
  4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  5 % My solutions to L-99: Ninety-Nine Lisp Problems from 
  6 % http://www.ic.unicamp.br/~meidanis/courses/mc336/2006s2/funcional/L-99_Ninety-Nine_Lisp_Problems.html
  7 % Based on a Prolog problem list by werner.hett@hti.bfh.ch
  8 % Note: I am using BIFs for a lot of solutions because learning language library APIs is just as 
  9 % important as learning language constructs.
 10 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 11
 12 %%%%%%%%%%%%%%%%%%%%%%%%%
 13 %%% P01 (*) Find the last box of a list.
 14 %%%%%%%%%%%%%%%%%%%%%%%%%
 15 last(L) ->
 16     lists:nthtail(length(L)-1, L).
 17
 18 %%%%%%%%%%%%%%%%%%%%%%%%%
 19 %%% P02 (*) Find the last but one box of a list.
 20 %%%%%%%%%%%%%%%%%%%%%%%%%
 21 last_but(L) ->
 22     lists:nthtail(length(L)-2, L).
 23
 24 %%%%%%%%%%%%%%%%%%%%%%%%%
 25 %%% P03 (*) Find the K'th element of a list.
 26 %%%%%%%%%%%%%%%%%%%%%%%%%
 27 kth(L, K) ->
 28     lists:nth(K, L).
 29
 30 %%%%%%%%%%%%%%%%%%%%%%%%%
 31 %%% P04 (*) Find the number of elements of a list.
 32 %%%%%%%%%%%%%%%%%%%%%%%%%
 33 len(L) ->
 34     length(L).
 35
 36 %%%%%%%%%%%%%%%%%%%%%%%%%
 37 %%% P05 (*) Reverse a list.
 38 %%%%%%%%%%%%%%%%%%%%%%%%%
 39 rev(L) ->
 40     lists:reverse(L).
 41
 42 %%%%%%%%%%%%%%%%%%%%%%%%%
 43 %%% P06 (*) Find out whether a list is a palindrome.
 44 %%%%%%%%%%%%%%%%%%%%%%%%%
 45 palindrome(L) ->
 46     L == lists:reverse(L).
 47
 48
 49 %%%%%%%%%%%%%%%%%%%%%%%%%
 50 %%% P07 (**) Flatten a nested list structure.
 51 %%%%%%%%%%%%%%%%%%%%%%%%%
 52 flatten(L) ->
 53     lists:flatten(L).
 54
 55 %%%%%%%%%%%%%%%%%%%%%%%%%
 56 %%% P08 (**) Eliminate consecutive duplicates of list elements.
 57 %%%%%%%%%%%%%%%%%%%%%%%%%
 58 compress(L) ->
 59   lists:reverse(lists:foldl(fun compress/2, [], L)).
 60 compress(H, [H|T]) ->
 61   [H|T];
 62 compress(H, L) ->
 63   [H|L].
 64
 65
 66 %%%%%%%%%%%%%%%%%%%%%%%%%
 67 %%% P09 (**) Pack consecutive duplicates of list elements into sublists.
 68 %%%%%%%%%%%%%%%%%%%%%%%%%
 69 pack(L) ->
 70   lists:reverse(lists:foldl(fun pack/2, [], L)).
 71 pack(H, [[H|T]|TT]) ->
 72   [[H,H|T]|TT];
 73 pack(H, L) ->
 74   [[H]|L].
 75
 76 %%%%%%%%%%%%%%%%%%%%%%%%%
 77 %%% P10 (*) Run-length encoding of a list.
 78 %%%%%%%%%%%%%%%%%%%%%%%%%
 79 encode(L) ->
 80   lists:reverse(lists:foldl(fun encode/2, [], L)).
 81 encode(H, []) ->
 82   [[1, H]];
 83 encode(H, [[N,H]|T]) ->
 84   [[N+1,H]|T];
 85 encode(H, [[_N,_X]|_T]=L) ->
 86   [[1,H]|L].
 87
 88 %%%%%%%%%%%%%%%%%%%%%%%%%
 89 %%% P11 (*) Modified run-length encoding.
 90 %%%%%%%%%%%%%%%%%%%%%%%%%
 91 encode_modified(L) ->
 92   lists:reverse(lists:foldl(fun encode_modified/2, [], L)).
 93 encode_modified(H, []) ->
 94   [H];
 95 encode_modified(H, [H|T]) ->
 96   [[2,H]|T];
 97 encode_modified(H, [[N,H]|T]) ->
 98   [[N+1,H]|T];
 99 encode_modified(H, [[_N,_X]|_T]=L) ->
100   [H|L];
101 encode_modified(H, [_X|_T]=L) ->
102   [H|L].
103
104 %%%%%%%%%%%%%%%%%%%%%%%%%
105 %%% P12 (**) Decode a run-length encoded list.
106 %%%%%%%%%%%%%%%%%%%%%%%%%
107 decode(L) ->
108   lists:reverse(lists:foldl(fun decode/2, [], L)).
109 decode([N,H], L) ->
110   lists:duplicate(N, H) ++ L;
111 decode(H, L) ->
112   [H|L].
113
114 %%%%%%%%%%%%%%%%%%%%%%%%%
115 %%% P13 (**) Run-length encoding of a list (direct solution).
116 %%%%%%%%%%%%%%%%%%%%%%%%%
117 direct_encode(L) ->
118     encode_modified(L). %% it already creates RLE by counting
119
120 %%%%%%%%%%%%%%%%%%%%%%%%%
121 %%% P14 (*) Duplicate the elements of a list.
122 %%%%%%%%%%%%%%%%%%%%%%%%%
123 dupli(L) ->
124     lists:reverse(lists:foldl(fun dupli/2, [], L)).
125 dupli(H, L) ->
126     [H,H|L].
127
128 %%%%%%%%%%%%%%%%%%%%%%%%%
129 %%% P15 (**) Replicate the elements of a list a given number of times.
130 %%%%%%%%%%%%%%%%%%%%%%%%%
131 repli(L, N) ->
132     {N, L1} = lists:foldl(fun do_repli/2, {N,[]}, L),
133     lists:reverse(L1).
134 do_repli(H, {N,L}) ->
135     {N, lists:duplicate(N, H) ++ L}.
136
137 %%%%%%%%%%%%%%%%%%%%%%%%%
138 %%% P16 (**) Drop every N'th element from a list.
139 %%%%%%%%%%%%%%%%%%%%%%%%%
140 drop(L, N) ->
141     {_I, N, L1} = lists:foldl(fun do_drop/2, {1,N,[]}, L),
142     lists:reverse(L1).
143 do_drop(H, {I,N,L}) ->
144     Rem = I rem N,
145     if
146         Rem == 0 ->
147             {1,N,L};
148         true ->
149             {I+1,N,[H|L]}
150     end.
151
152 %%%%%%%%%%%%%%%%%%%%%%%%%
153 %%% P17 (*) Split a list into two parts; the length of the first part is given.
154 %%%%%%%%%%%%%%%%%%%%%%%%%
155 split(L,N) ->
156     lists:split(N,L).
157
158 %%%%%%%%%%%%%%%%%%%%%%%%%
159 %%% P18 (**) Extract a slice from a list.
160 %%%%%%%%%%%%%%%%%%%%%%%%%
161 slice(L, Start, End) ->
162     lists:sublist(L, Start, End-Start+1).
163
164
165 %%%%%%%%%%%%%%%%%%%%%%%%%
166 %%% P19 (**) Rotate a list N places to the left.
167 %%%%%%%%%%%%%%%%%%%%%%%%%
168 rotate(L, N) ->
169     N1 = if
170         N > 0 ->
171             N;
172         true ->
173             length(L) + N
174     end,
175     Len = length(L),
176     lists:reverse(do_rotate(N1, Len, L, [])).
177
178 do_rotate(I, Len, In, Out) ->
179     I1 = (I rem Len)+1,       % In Erlang offset of list starts from 1 
180     Out1 = [lists:nth(I1, In)|Out],
181     if
182         length(Out1) == Len ->
183             Out1;
184         true ->
185             do_rotate(I1, Len, In, Out1)
186     end.
187
188 %%%%%%%%%%%%%%%%%%%%%%%%%
189 %%% P20 (*) Remove the K'th element from a list.
190 %%%%%%%%%%%%%%%%%%%%%%%%%
191 remove_at(L, N) ->
192     Elem = lists:nth(N,L),
193     lists:delete(Elem,L).
194
195
196 %%%%%%%%%%%%%%%%%%%%%%%%%
197 %%% P21 (*) Insert an element at a given position into a list.
198 %%%%%%%%%%%%%%%%%%%%%%%%%
199 insert_at(Elem, L, N) ->
200     {L1,L2} = lists:split(N-1,L),         % there got to be better way
201     L1 ++ [Elem] ++ L2.
202
203 %%%%%%%%%%%%%%%%%%%%%%%%%
204 %%% P22 (*) Create a list containing all integers within a given range.
205 %%%%%%%%%%%%%%%%%%%%%%%%%
206 range(Start, End) ->
207     lists:seq(Start, End).
208
209 %%%%%%%%%%%%%%%%%%%%%%%%%
210 %%% P23 (**) Extract a given number of randomly selected elements from a list.
211 %%%%%%%%%%%%%%%%%%%%%%%%%
212 rnd_select(L, N) ->
213     rnd_select(N, L, []).
214 rnd_select(N, In, Out) ->
215     I = random:uniform(length(In)),
216     Out1 = [lists:nth(I, In) | Out],
217     In1 = remove_at(In, I),
218     if
219         length(Out1) == N ->
220             Out1;
221         true ->
222             rnd_select(N, In1, Out1)
223     end.
224
225
226 %%%%%%%%%%%%%%%%%%%%%%%%%
227 %%% P24 (*) Lotto: Draw N different random numbers from the set 1..M.
228 %%%%%%%%%%%%%%%%%%%%%%%%%
229 lotto_select(Count, Max) ->
230     L = range(1, Max),
231     rnd_select(L, Count).
232
233 %%%%%%%%%%%%%%%%%%%%%%%%%
234 %%% P25 (*) Generate a random permutation of the elements of a list.
235 %%%%%%%%%%%%%%%%%%%%%%%%%
236 rnd_permu(L) ->
237     rnd_select(L, length(L)).
238
239
240 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
241 % Tests
242 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
243 test_last() ->
244     last("abcd").
245
246 test_last_but() ->
247     last_but("abcd").
248
249 test_kth() ->
250     [kth("abcd", 3)].
251
252 test_len() ->
253     len("abcd").
254
255 test_rev() ->
256     rev("abcd").
257
258 test_flatten() ->
259     flatten([$a, [$b, [c, d], e]]).
260
261 test_compress() ->
262     compress("aaaabccaadeeee").
263
264 test_pack() ->
265     pack("aaaabccaadeeee").
266
267 test_encode() ->
268     encode("aaaabccaadeeee").
269
270 test_encode_modified() ->
271     encode_modified([1,1,1,1,2,3,3,1,1,4,5,5,5,5]).
272
273 test_decode() ->
274     decode(encode_modified([1,1,1,1,2,3,3,1,1,4,5,5,5,5])).
275
276 test_dupli() ->
277     dupli("abccd").
278
279 test_repli() ->
280     repli("abccd",3).
281
282 test_drop() ->
283     drop("abcdefghik",3).
284
285 test_split() ->
286     split("abcdefghik",3).
287
288 test_slice() ->
289     slice("abcdefghik",3,7).
290
291 test_rotate1() ->
292     rotate("abcdefgh",3).
293
294 test_rotate2() ->
295     rotate("abcdefgh",-2).
296
297 test_remove_at() ->
298     remove_at("abcd", 2).
299
300 test_insert_at() ->
301     insert_at("alfa", "abcd", 2).
302
303 test_range() ->
304     range(4,9).
305
306 test_rnd_select() ->
307     rnd_select("abcdefgh", 3).
308
309 test_lotto_select() ->
310     lotto_select(6,49).
311
312 test_rnd_permu() ->
313     rnd_permu("abcdef").
314
315