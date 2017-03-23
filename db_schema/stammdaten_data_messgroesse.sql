\set ON_ERROR_STOP on

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = stammdaten, pg_catalog;

--
-- Data for Name: messgroesse; Type: TABLE DATA; Schema: stammdaten; Owner: postgres
--

COPY messgroesse (id, beschreibung, messgroesse, default_farbe, idf_nuklid_key, ist_leitnuklid, eudf_nuklid_id, kennung_bvl) FROM stdin;
56	Mangan	Mn 54	175175075	Mn54	f	50	1925054
57	Mangan	Mn 56	\N	Mn56	f	\N	\N
58	Eisen	Fe 52	\N	Fe52	f	\N	\N
59	Eisen	Fe 55	\N	Fe55	f	\N	\N
61	Eisen	Fe 60	\N	Fe60	f	\N	\N
62	Cobalt	Co 55	\N	Co55	f	\N	\N
63	Cobalt	Co 56	\N	Co56	f	\N	\N
64	Cobalt	Co 57	020158179	Co57	f	22	1927057
66	Cobalt	Co 58	099227227	Co58	f	23	1927058
67	Cobalt	Co 60m	\N	Co60m	f	\N	\N
68	Cobalt	Co 60	130171171	Co60	f	24	1927060
69	Cobalt	Co 61	\N	Co61	f	\N	\N
70	Cobalt	Co 62m	\N	Co62m	f	\N	\N
72	Nickel	Ni 57	\N	Ni57	f	\N	\N
73	Nickel	Ni 59	\N	Ni59	f	\N	\N
74	Nickel	Ni 63	\N	Ni63	f	\N	\N
75	Nickel	Ni 65	\N	Ni65	f	\N	\N
77	Kupfer	Cu 60	\N	Cu60	f	\N	\N
78	Kupfer	Cu 61	\N	Cu61	f	\N	\N
79	Kupfer	Cu 62	\N	Cu62	f	\N	\N
80	Kupfer	Cu 64	\N	Cu64	f	\N	\N
81	Kupfer	Cu 66	\N	Cu66	f	\N	\N
83	Zink	Zn 62	\N	Zn62	f	\N	\N
84	Zink	Zn 63	\N	Zn63	f	\N	\N
85	Zink	Zn 65	227172099	Zn65	f	111	1930065
86	Zink	Zn 69m	\N	Zn69m	f	\N	\N
88	Zink	Zn 71m	\N	Zn71m	f	\N	\N
89	Zink	Zn 72	\N	Zn72	f	\N	\N
90	Gallium	Ga 65	\N	Ga65	f	\N	\N
91	Gallium	Ga 66	\N	Ga66	f	\N	\N
93	Gallium	Ga 68	\N	Ga68	f	\N	\N
94	Gallium	Ga 70	\N	Ga70	f	\N	\N
95	Gallium	Ga 72	\N	Ga72	f	\N	\N
96	Gallium	Ga 73	\N	Ga73	f	\N	\N
97	Germanium	Ge 66	\N	Ge66	f	\N	\N
99	Germanium	Ge 68	\N	Ge68	f	\N	\N
100	Germanium	Ge 69	\N	Ge69	f	\N	\N
101	Germanium	Ge 71	\N	Ge71	f	\N	\N
102	Germanium	Ge 75	\N	Ge75	f	\N	\N
103	Germanium	Ge 77	\N	Ge77	f	\N	\N
104	Germanium	Ge 78	\N	Ge78	f	\N	\N
105	Arsen	As 69	\N	As69	f	\N	\N
106	Arsen	As 70	\N	As70	f	\N	\N
108	Arsen	As 72	\N	As72	f	\N	\N
109	Arsen	As 73	\N	As73	f	\N	\N
110	Arsen	As 74	\N	As74	f	\N	\N
111	Arsen	As 76	\N	As76	f	9	\N
112	Arsen	As 77	\N	As77	f	\N	\N
113	Arsen	As 78	\N	As78	f	\N	\N
114	Selen	Se 70	\N	Se70	f	\N	\N
116	Selen	Se 73	\N	Se73	f	\N	\N
117	Selen	Se 75	\N	Se75	f	79	\N
118	Selen	Se 77m	\N	Se77m	f	\N	\N
119	Selen	Se 79	\N	Se79	f	\N	\N
120	Selen	Se 81m	\N	Se81m	f	\N	\N
121	Selen	Se 81	\N	Se81	f	\N	\N
122	Selen	Se 83	\N	Se83	f	\N	\N
124	Brom	Br 74	\N	Br74	f	\N	\N
125	Brom	Br 75	\N	Br75	f	\N	\N
126	Brom	Br 76	\N	Br76	f	\N	\N
127	Brom	Br 77	\N	Br77	f	\N	\N
128	Brom	Br 80m	\N	Br80m	f	\N	\N
129	Brom	Br 80	\N	Br80	f	\N	\N
130	Brom	Br 82	\N	Br82	f	\N	\N
131	Brom	Br 83	\N	Br83	f	\N	\N
133	Krypton	Kr 74	\N	Kr74	f	\N	\N
134	Krypton	Kr 76	\N	Kr76	f	\N	\N
135	Krypton	Kr 77	\N	Kr77	f	\N	\N
136	Krypton	Kr 79	\N	Kr79	f	\N	\N
137	Krypton	Kr 81m	\N	Kr81m	f	\N	\N
138	Krypton	Kr 81	\N	Kr81	f	\N	\N
140	Krypton	Kr 85m	173079196	Kr85m	f	\N	\N
141	Krypton	Kr 85	\N	Kr85	f	\N	1936085
142	Krypton	Kr 87	250075000	Kr87	f	\N	1936087
143	Krypton	Kr 88	225199199	Kr88	f	\N	1936088
144	Krypton	Kr 89	\N	Kr89	f	\N	1936089
145	Rubidium	Rb 79	\N	Rb79	f	\N	\N
146	Rubidium	Rb 80	\N	Rb80	f	\N	\N
147	Rubidium	Rb 81m	\N	Rb81m	f	\N	\N
149	Rubidium	Rb 82m	\N	Rb82m	f	\N	\N
150	Rubidium	Rb 82	\N	Rb82	f	\N	\N
151	Rubidium	Rb 83	\N	Rb83	f	\N	\N
152	Rubidium	Rb 84	\N	Rb84	f	\N	\N
153	Rubidium	Rb 86	\N	Rb86	f	\N	\N
154	Rubidium	Rb 87	\N	Rb87	f	\N	\N
155	Rubidium	Rb 88	\N	Rb88	f	\N	\N
156	Rubidium	Rb 89	\N	Rb89	f	\N	\N
157	Strontium	Sr 80	\N	Sr80	f	\N	\N
958	Uran, natürlich	U-nat	\N	\N	f	\N	\N
978	Curium 243/244	Cm 24344	\N	\N	f	\N	1996487
998	Gamma-Ortsdosisleistung, Minimum	Gamma-ODL-min	\N	\N	f	\N	\N
999	Gamma-Ortsdosisleistung, Maximum	Gamma-ODL-max	\N	\N	f	\N	\N
1000	Neutronen-Ortsdosisleistung, Minimum	Neutr-ODL-min	\N	\N	f	\N	\N
1001	Neutronen-Ortsdosisleistung, Maximum	Neutr-ODL-max	\N	\N	f	\N	\N
159	Strontium	Sr 82	\N	Sr82	f	\N	\N
160	Strontium	Sr 83	\N	Sr83	f	\N	\N
161	Strontium	Sr 85m	\N	Sr85m	f	\N	\N
162	Strontium	Sr 85	\N	Sr85	f	83	\N
163	Strontium	Sr 87m	\N	Sr87m	f	\N	\N
164	Strontium	Sr 89	199207225	Sr89	f	84	1938089
165	Strontium	Sr 90	000000250	Sr90	t	85	1938090
166	Strontium	Sr 91	067031092	Sr91	f	\N	1938091
168	Yttrium	Y 86m	\N	Y86m	f	\N	\N
169	Yttrium	Y 86	\N	Y86	f	\N	\N
170	Yttrium	Y 87	\N	Y87	f	\N	\N
171	Yttrium	Y 88	\N	Y88	f	\N	1939088
172	Yttrium	Y 90m	\N	Y90m	f	\N	\N
173	Yttrium	Y 90	\N	Y90	f	109	\N
174	Yttrium	Y 91m	\N	Y91m	f	110	\N
175	Yttrium	Y 91	\N	Y91	f	\N	1939091
176	Yttrium	Y 92	152221152	Y92	f	\N	1939092
177	Yttrium	Y 93	207225199	Y93	f	\N	1939093
178	Yttrium	Y 94	\N	Y94	f	\N	\N
179	Yttrium	Y 95	\N	Y95	f	\N	\N
180	Zirconium	Zr 86	\N	Zr86	f	\N	\N
181	Zirconium	Zr 88	\N	Zr88	f	\N	\N
183	Zirconium	Zr 93	\N	Zr93	f	\N	\N
185	Zirconium	Zr 97	225207199	Zr97	f	113	1940097
186	Niob	Nb 88	\N	Nb88	f	\N	\N
187	Niob	Nb 89 1	\N	Nb89	f	\N	\N
189	Niob	Nb 90	\N	Nb90	f	\N	\N
190	Niob	Nb 93m	\N	Nb93m	f	\N	\N
192	Niob	Nb 95m	\N	Nb95m	f	\N	\N
193	Niob	Nb 95	225225199	Nb95	f	54	\N
197	Niob	Nb 98	\N	Nb98	f	\N	\N
198	Molybdän	Mo 90	\N	Mo90	f	\N	\N
200	Molybdän	Mo 93	\N	Mo93	f	\N	\N
201	Molybdän	Mo 99	031031092	Mo99	f	51	1942099
202	Molybdän	Mo 101	\N	Mo101	f	\N	\N
204	Technetium	Tc 93	\N	Tc93	f	\N	\N
205	Technetium	Tc 94m	\N	Tc94m	f	\N	\N
208	Technetium	Tc 95	\N	Tc95	f	\N	\N
209	Technetium	Tc 96m	\N	Tc96m	f	\N	\N
210	Technetium	Tc 96	\N	Tc96	f	\N	\N
212	Technetium	Tc 97	\N	Tc97	f	\N	\N
213	Technetium	Tc 98	\N	Tc98	f	\N	\N
214	Technetium	Tc 99m	179020020	Tc99m	f	\N	1943099
215	Technetium	Tc 99	\N	Tc99	f	\N	\N
217	Technetium	Tc 104	\N	Tc104	f	\N	\N
219	Ruthenium	Ru 97	\N	Ru97	f	\N	\N
221	Ruthenium	Ru 105	\N	Ru105	f	\N	\N
222	Ruthenium	Ru 106	193193179	Ru106	f	75	1944106
223	Rhodium	Rh 99m	\N	Rh99m	f	\N	\N
225	Rhodium	Rh 100	\N	Rh100	f	\N	\N
226	Rhodium	Rh 101m	\N	Rh101m	f	\N	\N
228	Rhodium	Rh 102m	\N	Rh102m	f	\N	\N
230	Rhodium	Rh 103m	\N	Rh103m	f	\N	\N
232	Rhodium	Rh 106m	\N	Rh106m	f	75	\N
233	Rhodium	Rh 106	\N	Rh106	f	\N	\N
235	Palladium	Pd 100	\N	Pd100	f	\N	\N
236	Palladium	Pd 101	\N	Pd101	f	\N	\N
237	Palladium	Pd 103	\N	Pd103	f	\N	\N
240	Silber	Ag 102	\N	Ag102	f	\N	\N
241	Silber	Ag 103	\N	Ag103	f	\N	\N
243	Silber	Ag 104	\N	Ag104	f	\N	\N
244	Silber	Ag 105	\N	Ag105	f	\N	\N
245	Silber	Ag 106m	\N	Ag106m	f	\N	\N
247	Silber	Ag 108m	\N	Ag108m	f	\N	\N
250	Silber	Ag 110m	121179020	Ag110m	f	7	1947110
251	Silber	Ag 110	\N	Ag110	f	6	\N
252	Silber	Ag 111	\N	Ag111	f	\N	\N
254	Silber	Ag 115	\N	Ag115	f	\N	\N
255	Cadmium	Cd 104	\N	Cd104	f	\N	\N
257	Cadmium	Cd 109	\N	Cd109	f	16	1948109
259	Cadmium	Cd 113	\N	Cd113	f	\N	\N
261	Cadmium	Cd 115	\N	Cd115	f	\N	\N
262	Cadmium	Cd 117m	\N	Cd117m	f	\N	\N
264	Indium	In 109	\N	In109	f	\N	\N
265	Indium	In 110 2	\N	In110	f	\N	\N
266	Indium	In 110 1	\N	In110	f	\N	\N
269	Indium	In 113m	\N	In113m	f	\N	\N
871	Iod, elementar	I 133E	\N	I133E	f	\N	\N
872	Iod, elementar	I 135E	\N	I135E	f	\N	\N
880	Iod, organisch gebunden	I 131O	\N	I131O	f	\N	\N
881	Iod, organisch gebunden	I 133O	\N	I133O	f	\N	\N
654	Thallium	Tl 202	\N	Tl202	f	\N	\N
656	Thallium	Tl 206	\N	Tl206	f	\N	\N
658	Thallium	Tl 208	221221152	Tl208	f	\N	1981208
659	Thallium	Tl 209	\N	Tl209	f	\N	\N
660	Blei	Pb 195m	\N	Pb195m	f	\N	\N
661	Blei	Pb 198	\N	Pb198	f	\N	\N
662	Blei	Pb 199	\N	Pb199	f	\N	\N
663	Blei	Pb 200	\N	Pb200	f	\N	\N
664	Blei	Pb 201	\N	Pb201	f	\N	\N
666	Blei	Pb 202	\N	Pb202	f	\N	\N
667	Blei	Pb 203	\N	Pb203	f	\N	\N
668	Blei	Pb 205	\N	Pb205	f	\N	\N
669	Blei	Pb 209	\N	Pb209	f	\N	\N
670	Blei	Pb 210	074074074	Pb210	f	59	1982210
672	Blei	Pb 212	119119080	Pb212	f	60	1982212
673	Blei	Pb 214	173173173	Pb214	f	61	1982214
674	Bismut	Bi 200	\N	Bi200	f	\N	\N
675	Bismut	Bi 201	\N	Bi201	f	\N	\N
676	Bismut	Bi 202	\N	Bi202	f	\N	\N
678	Bismut	Bi 205	\N	Bi205	f	\N	\N
679	Bismut	Bi 206	\N	Bi206	f	\N	\N
680	Bismut	Bi 207	\N	Bi207	f	\N	\N
681	Bismut	Bi 210m	\N	Bi210m	f	\N	\N
682	Bismut	Bi 210	\N	Bi210	f	\N	\N
683	Bismut	Bi 211	\N	Bi211	f	\N	\N
685	Bismut	Bi 213	\N	Bi213	f	\N	\N
686	Bismut	Bi 214	067092031	Bi214	f	13	1983214
687	Polonium	Po 203	\N	Po203	f	\N	\N
688	Polonium	Po 205	\N	Po205	f	\N	\N
689	Polonium	Po 207	\N	Po207	f	\N	\N
691	Polonium	Po 211	\N	Po211	f	\N	\N
692	Polonium	Po 212	\N	Po212	f	\N	\N
375	Barium	Ba 126	\N	Ba126	f	\N	\N
376	Barium	Ba 128	\N	Ba128	f	\N	\N
377	Barium	Ba 131m	\N	Ba131m	f	\N	\N
378	Barium	Ba 131	\N	Ba131	f	\N	\N
380	Barium	Ba 133	\N	Ba133	f	\N	\N
381	Barium	Ba 135m	\N	Ba135m	f	\N	\N
382	Barium	Ba 137m	\N	Ba137m	f	\N	\N
383	Barium	Ba 139	\N	Ba139	f	\N	\N
384	Barium	Ba 140	000000000	Ba140	f	10	1956140
385	Barium	Ba 141	\N	Ba141	f	\N	\N
387	Lanthan	La 131	\N	La131	f	\N	\N
388	Lanthan	La 132	\N	La132	f	\N	\N
389	Lanthan	La 134	\N	La134	f	\N	\N
390	Lanthan	La 135	\N	La135	f	\N	\N
391	Lanthan	La 137	\N	La137	f	\N	\N
393	Lanthan	La 140	125000250	La140	f	49	1957140
394	Lanthan	La 141	172099227	La141	f	\N	1957141
395	Lanthan	La 142	\N	La142	f	\N	\N
396	Lanthan	La 143	\N	La143	f	\N	\N
397	Cer	Ce 134	\N	Ce134	f	\N	\N
398	Cer	Ce 135	\N	Ce135	f	\N	\N
400	Cer	Ce 137	\N	Ce137	f	\N	\N
401	Cer	Ce 139	\N	Ce139	f	\N	1958139
402	Cer	Ce 141	031055092	Ce141	f	17	1958141
403	Cer	Ce 143	175000250	Ce143	f	\N	1958143
404	Cer	Ce 144	207199225	Ce144	f	19	1958144
406	Praseodym	Pr 137	\N	Pr137	f	\N	\N
407	Praseodym	Pr 138m	\N	Pr138m	f	\N	\N
408	Praseodym	Pr 138	\N	Pr138	f	\N	\N
409	Praseodym	Pr 139	\N	Pr139	f	\N	\N
410	Praseodym	Pr 142m	\N	Pr142m	f	\N	\N
411	Praseodym	Pr 142	\N	Pr142	f	\N	\N
412	Praseodym	Pr 143	\N	Pr143	f	\N	\N
414	Praseodym	Pr 144	\N	Pr144	f	63	\N
415	Praseodym	Pr 145	\N	Pr145	f	\N	\N
416	Praseodym	Pr 147	\N	Pr147	f	\N	\N
417	Neodym	Nd 136	\N	Nd136	f	\N	\N
418	Neodym	Nd 138	\N	Nd138	f	\N	\N
419	Neodym	Nd 139m	\N	Nd139m	f	\N	\N
420	Neodym	Nd 139	\N	Nd139	f	\N	\N
422	Neodym	Nd 141	\N	Nd141	f	\N	\N
423	Neodym	Nd 147	147147026	Nd147	f	56	1960147
424	Neodym	Nd 149	\N	Nd149	f	\N	\N
425	Neodym	Nd 151	\N	Nd151	f	\N	\N
426	Promethium	Pm 141	\N	Pm141	f	\N	\N
427	Promethium	Pm 142	\N	Pm142	f	\N	\N
429	Promethium	Pm 144	\N	Pm144	f	\N	\N
430	Promethium	Pm 145	\N	Pm145	f	\N	\N
431	Promethium	Pm 146	\N	Pm146	f	\N	\N
432	Promethium	Pm 147	\N	Pm147	f	\N	\N
433	Promethium	Pm 148m	\N	Pm148m	f	\N	\N
434	Promethium	Pm 148	\N	Pm148	f	\N	\N
435	Promethium	Pm 149	\N	Pm149	f	\N	\N
437	Promethium	Pm 151	042027050	Pm151	f	\N	1961151
438	Samarium	Sm 141m	\N	Sm141m	f	\N	\N
439	Samarium	Sm 141	\N	Sm141	f	\N	\N
440	Samarium	Sm 142	\N	Sm142	f	\N	\N
441	Samarium	Sm 145	\N	Sm145	f	\N	\N
442	Samarium	Sm 146	\N	Sm146	f	\N	\N
443	Samarium	Sm 147	\N	Sm147	f	\N	\N
445	Samarium	Sm 153	\N	Sm153	f	\N	\N
446	Samarium	Sm 155	\N	Sm155	f	\N	\N
447	Samarium	Sm 156	\N	Sm156	f	\N	\N
448	Europium	Eu 145	\N	Eu145	f	\N	\N
449	Europium	Eu 146	\N	Eu146	f	\N	\N
450	Europium	Eu 147	\N	Eu147	f	\N	\N
452	Europium	Eu 149	\N	Eu149	f	\N	\N
453	Europium	Eu 150 2	\N	Eu150	f	\N	\N
454	Europium	Eu 150 1	\N	\N	f	\N	\N
455	Europium	Eu 152m	\N	Eu152m	f	\N	\N
456	Europium	Eu 152	\N	Eu152	f	35	\N
457	Europium	Eu 154	\N	Eu154	f	36	\N
458	Europium	Eu 155	\N	Eu155	f	37	1963155
460	Europium	Eu 157	\N	Eu157	f	\N	\N
461	Europium	Eu 158	\N	Eu158	f	\N	\N
693	Polonium	Po 213	\N	Po213	f	\N	\N
694	Polonium	Po 214	\N	Po214	f	\N	\N
695	Polonium	Po 215	\N	Po215	f	\N	\N
696	Polonium	Po 216	\N	Po216	f	\N	\N
697	Polonium	Po 218	\N	Po218	f	\N	\N
699	Astat	At 211	\N	At211	f	\N	\N
700	Astat	At 215	\N	At215	f	\N	\N
701	Astat	At 216	\N	At216	f	\N	\N
702	Astat	At 217	\N	At217	f	\N	\N
703	Astat	At 218	\N	At218	f	\N	\N
705	Radon	Rn 219	\N	Rn219	f	\N	\N
706	Radon	Rn 220	\N	Rn220	f	\N	\N
707	Radon	Rn 222	\N	Rn222	f	\N	\N
708	Francium	Fr 219	\N	Fr219	f	\N	\N
709	Francium	Fr 220	\N	Fr220	f	\N	\N
711	Francium	Fr 222	\N	Fr222	f	\N	\N
712	Francium	Fr 223	\N	Fr223	f	\N	\N
713	Radium	Ra 222	\N	Ra222	f	\N	\N
714	Radium	Ra 223	\N	Ra223	f	\N	\N
715	Radium	Ra 224	\N	Ra224	f	\N	1988224
716	Radium	Ra 225	\N	Ra225	f	\N	\N
717	Radium	Ra 226	119080080	Ra226	f	71	1988226
719	Radium	Ra 228	\N	Ra228	f	\N	1988228
720	Actinium	Ac 223	\N	Ac223	f	\N	\N
721	Actinium	Ac 224	\N	Ac224	f	\N	\N
722	Actinium	Ac 225	\N	Ac225	f	\N	\N
723	Actinium	Ac 226	\N	Ac226	f	\N	\N
725	Actinium	Ac 228	227099135	Ac228	f	\N	1989228
726	Thorium	Th 226	\N	Th226	f	\N	\N
727	Thorium	Th 227	\N	Th227	f	\N	\N
728	Thorium	Th 228	\N	Th228	f	\N	\N
729	Thorium	Th 229	\N	Th229	f	\N	\N
730	Thorium	Th 230	\N	Th230	f	\N	\N
731	Thorium	Th 231	\N	Th231	f	\N	\N
733	Thorium	Th 234	\N	Th234	f	102	1990234
734	Protactinium	Pa 227	\N	Pa227	f	\N	\N
735	Protactinium	Pa 228	\N	Pa228	f	\N	\N
736	Protactinium	Pa 230	\N	Pa230	f	\N	\N
737	Protactinium	Pa 231	\N	Pa231	f	\N	\N
738	Protactinium	Pa 232	\N	Pa232	f	\N	\N
740	Protactinium	Pa 234m	\N	Pa234m	f	\N	\N
741	Protactinium	Pa 234	\N	Pa234	f	\N	1991234
742	Uran	U 230	\N	U230	f	\N	\N
743	Uran	U 231	\N	U231	f	\N	\N
744	Uran	U 232	\N	U232	f	\N	\N
745	Uran	U 233	\N	U233	f	\N	\N
746	Uran	U 234	200250000	U234	f	103	1992234
747	Uran	U 235	000250000	U235	f	\N	1992235
748	Uran	U 236	\N	U236	f	\N	\N
749	Uran	U 237	125250000	U237	f	\N	1992237
751	Uran	U 239	\N	U239	f	\N	\N
752	Uran	U 240	\N	U240	f	\N	\N
753	Neptunium	Np 232	\N	Np232	f	\N	\N
754	Neptunium	Np 233	\N	Np233	f	\N	\N
755	Neptunium	Np 234	\N	Np234	f	\N	\N
757	Neptunium	Np 236 2	\N	Np236	f	\N	\N
758	Neptunium	Np 236 1	\N	Np236	f	\N	\N
759	Neptunium	Np 237	179193179	Np237	f	57	1993237
760	Neptunium	Np 238	\N	Np238	f	\N	\N
761	Neptunium	Np 239	199225199	Np239	f	58	1993239
762	Neptunium	Np 240m	\N	Np240m	f	\N	\N
763	Neptunium	Np 240	\N	Np240	f	\N	\N
765	Plutonium	Pu 235	\N	Pu235	f	\N	\N
766	Plutonium	Pu 236	\N	Pu236	f	\N	\N
767	Plutonium	Pu 237	\N	Pu237	f	\N	\N
768	Plutonium	Pu 238	175075175	Pu238	f	65	1994238
769	Plutonium	Pu 239	\N	Pu239	f	66	\N
770	Plutonium	Pu 240	\N	Pu240	f	\N	\N
771	Plutonium	Pu 241	\N	Pu241	f	\N	\N
774	Plutonium	Pu 244	\N	Pu244	f	\N	\N
775	Plutonium	Pu 245	\N	Pu245	f	\N	\N
777	Americium	Am 237	\N	Am237	f	\N	\N
778	Americium	Am 238	\N	Am238	f	\N	\N
779	Americium	Am 239	\N	Am239	f	\N	\N
781	Americium	Am 241	250000000	Am241	f	8	1995241
783	Americium	Am 242	\N	Am242	f	\N	\N
785	Americium	Am 244m	\N	Am244	f	\N	\N
786	Americium	Am 244	\N	Am244	f	\N	\N
787	Americium	Am 245	\N	Am245	f	\N	\N
789	Americium	Am 246	\N	Am246	f	\N	\N
790	Curium	Cm 238	\N	Cm238	f	\N	\N
791	Curium	Cm 240	\N	Cm240	f	\N	\N
794	Curium	Cm 243	\N	Cm243	f	\N	\N
795	Curium	Cm 244	152221221	Cm244	f	21	\N
797	Curium	Cm 246	\N	Cm246	f	\N	\N
798	Curium	Cm 247	\N	Cm247	f	\N	\N
800	Curium	Cm 249	\N	Cm249	f	\N	\N
801	Curium	Cm 250	\N	Cm250	f	\N	\N
804	Berkelium	Bk 247	\N	Bk247	f	\N	\N
805	Berkelium	Bk 249	\N	Bk249	f	\N	\N
806	Berkelium	Bk 250	\N	Bk250	f	\N	\N
808	Californium	Cf 246	\N	Cf246	f	\N	\N
809	Californium	Cf 248	\N	Cf248	f	\N	\N
810	Californium	Cf 249	\N	Cf249	f	\N	\N
812	Californium	Cf 251	\N	Cf251	f	\N	\N
814	Californium	Cf 253	\N	Cf253	f	\N	\N
816	Einsteinium	Es 250	\N	Es250	f	\N	\N
817	Einsteinium	Es 251	\N	Es251	f	\N	\N
818	Einsteinium	Es 253	\N	Es253	f	\N	\N
819	Einsteinium	Es 254m	\N	Es254m	f	\N	\N
821	Fermium	Fm 252	\N	Fm252	f	\N	\N
822	Fermium	Fm 253	\N	Fm253	f	\N	\N
825	Fermium	Fm 257	\N	Fm257	f	\N	\N
826	Mendelevium	Md 257	\N	Md257	f	\N	\N
827	Mendelevium	Md 258	\N	Md258	f	\N	\N
860	Iod	I 131G	026113147	I131G	f	43	\N
861	Iod	I 133G	000125250	I133G	f	47	\N
862	Iod	I 135G	000250250	I135G	f	\N	\N
901	Gesamt-Gamma-Aktivität	G-Gamma	\N	SumGa	f	89	\N
903	Gesamt-Beta-Aktivität, künstlich	G-Beta-künstl.	227227099	*	f	\N	\N
904	Gesamt-Alpha-Aktivität	G-Alpha	\N	SumAl	f	86	1900100
905	Gesamt-Alpha-Aktivität, künstlich	G-Alpha-künstl.	\N	*	f	\N	\N
906	Gesamt-Cäsium-Aktivität	Cs-Gesamt	147026113	\N	f	\N	1955271
907	Rest-Beta-Aktivität	Rest-Beta	\N	\N	f	\N	1900300
909	Gamma-Ortsdosisleistung, brutto	Gamma-ODL-Brutto	\N	*	f	89	\N
910	Gamma-Ortsdosisleistung,netto	Gamma-ODL-Netto	\N	*	f	\N	\N
911	Gamma-Ortsdosisleistung, künstlich	Gamma-ODL-künstl.	\N	*	f	\N	\N
912	Gamma-Ortsdosis	Gamma-OD	\N	\N	f	\N	\N
913	Neutronen-Ortsdosis	Neutronen-OD	\N	\N	f	\N	\N
914	Neutronen-Ortsdosisleistung	Neutronen-ODL	\N	\N	f	\N	\N
916	Gesamt-Alpha 5h verzögert	G-Alpha-5h_verz	\N	\N	f	\N	\N
918	Gesamt-Alpha 120h verzögert	G-Alpha-120h_verz	\N	\N	f	\N	\N
566	Wolfram	W 177	\N	W177	f	\N	\N
919	Gesamt-Beta 2h verzögert	G-Beta-2h_verz	\N	\N	f	\N	\N
920	Gesamt-Beta 10h verzögert	G-Beta-10h_verz	\N	\N	f	\N	\N
921	Gesamt-Beta 24h verzögert	G-Beta-24h_verz	\N	\N	f	\N	\N
922	Gesamt-Beta 120h verzögert	G-Beta-120h_verz	\N	*	f	\N	\N
923	Gesamt-Alpha-Aktivität, natürlich	G-Alpha-natürl.	\N	\N	f	\N	\N
924	Gesamt-Beta-Aktivität, natürlich	G-Beta-natürl.	\N	\N	f	\N	\N
925	Gamma-Ortsdosis, brutto	Gamma-OD-Brutto	\N	\N	f	\N	\N
926	Gamma-Ortsdosis, netto	Gamma-OD-Netto	\N	\N	f	\N	\N
928	Neutronen-Ortsdosis, netto	Neutr-OD-Netto	\N	\N	f	\N	\N
929	Neutronen-Ortsdosisleistung, brutto	Neutr-ODL-Brutto	\N	\N	f	\N	\N
930	Neutronen-Ortsdosisleistung, netto	Neutr-ODL-Netto	\N	\N	f	\N	\N
950	Regen	Regen	\N	\N	f	\N	\N
951	Schnee	Schnee	\N	\N	f	\N	\N
952	Niederschlag	Niederschlag	\N	\N	f	\N	\N
955	Summe über Nuklide (PARK)	Summe	\N	\N	f	\N	\N
620	Platin	Pt 193	\N	Pt193	f	\N	\N
621	Platin	Pt 195m	\N	Pt195m	f	\N	\N
622	Platin	Pt 197m	\N	Pt197m	f	\N	\N
623	Platin	Pt 197	\N	Pt197	f	\N	\N
624	Platin	Pt 199	\N	Pt199	f	\N	\N
625	Platin	Pt 200	\N	Pt200	f	\N	\N
627	Gold	Au 194	\N	Au194	f	\N	\N
628	Gold	Au 195m	\N	Au195m	f	\N	\N
629	Gold	Au 195	\N	Au195	f	\N	\N
630	Gold	Au 198m	\N	Au198m	f	\N	\N
631	Gold	Au 198	\N	Au198	f	\N	\N
633	Gold	Au 200m	\N	Au200m	f	\N	\N
634	Gold	Au 200	\N	Au200	f	\N	\N
635	Gold	Au 201	\N	Au201	f	\N	\N
636	Quecksilber	Hg 193m	\N	Hg193m	f	\N	\N
637	Quecksilber	Hg 193	\N	Hg193	f	\N	\N
639	Quecksilber	Hg 195m	\N	Hg195m	f	\N	\N
640	Quecksilber	Hg 195	\N	Hg195	f	\N	\N
641	Quecksilber	Hg 197m	\N	Hg197m	f	\N	\N
642	Quecksilber	Hg 197	\N	Hg197	f	\N	\N
643	Quecksilber	Hg 199m	\N	Hg199m	f	\N	\N
644	Quecksilber	Hg 203	\N	Hg203	f	41	1980203
645	Thallium	Tl 194m	\N	Tl194m	f	\N	\N
647	Thallium	Tl 195	\N	Tl195	f	\N	\N
648	Thallium	Tl 197	\N	Tl197	f	\N	\N
649	Thallium	Tl 198m	\N	Tl198m	f	\N	\N
650	Thallium	Tl 198	\N	Tl198	f	\N	\N
651	Thallium	Tl 199	\N	Tl199	f	\N	\N
652	Thallium	Tl 200	\N	Tl200	f	\N	\N
355	Xenon	Xe 133	191227099	Xe133	f	107	\N
356	Xenon	Xe 135m	031092067	Xe135m	f	\N	1954135
357	Xenon	Xe 135	050250000	Xe135	f	108	\N
358	Xenon	Xe 137	\N	Xe137	f	\N	1954137
359	Xenon	Xe 138	\N	Xe138	f	\N	1954138
360	Caesium	Cs 125	\N	Cs125	f	\N	\N
361	Caesium	Cs 126	\N	Cs126	f	\N	\N
362	Caesium	Cs 127	\N	Cs127	f	\N	\N
363	Caesium	Cs 128	\N	Cs128	f	\N	\N
364	Caesium	Cs 129	\N	Cs129	f	\N	\N
365	Caesium	Cs 130	\N	Cs130	f	\N	\N
366	Caesium	Cs 131	\N	Cs131	f	29	\N
367	Caesium	Cs 132	\N	Cs132	f	30	\N
368	Caesium	Cs 134m	\N	Cs134m	f	\N	\N
369	Caesium	Cs 134	225199225	Cs134	f	31	1955134
370	Caesium	Cs 135m	\N	Cs135m	f	\N	\N
373	Caesium	Cs 137	250000250	Cs137	t	33	1955137
374	Caesium	Cs 138	\N	Cs138	f	\N	\N
462	Gadolinium	Gd 145	\N	Gd145	f	\N	\N
463	Gadolinium	Gd 146	\N	Gd146	f	\N	\N
464	Gadolinium	Gd 147	\N	Gd147	f	\N	\N
465	Gadolinium	Gd 148	\N	Gd148	f	\N	\N
467	Gadolinium	Gd 151	\N	Gd151	f	\N	\N
468	Gadolinium	Gd 152	\N	Gd152	f	\N	\N
469	Gadolinium	Gd 153	\N	Gd153	f	\N	\N
470	Gadolinium	Gd 159	\N	Gd159	f	\N	\N
471	Terbium	Tb 147	\N	Tb147	f	\N	\N
472	Terbium	Tb 149	\N	Tb149	f	\N	\N
473	Terbium	Tb 150	\N	Tb150	f	\N	\N
475	Terbium	Tb 153	\N	Tb153	f	\N	\N
476	Terbium	Tb 154	\N	Tb154	f	\N	\N
477	Terbium	Tb 155	\N	Tb155	f	\N	\N
478	Terbium	Tb 156m2	\N	Tb156	f	\N	\N
479	Terbium	Tb 156m1	\N	Tb156m	f	\N	\N
480	Terbium	Tb 156	\N	Tb156	f	\N	\N
482	Terbium	Tb 158	\N	Tb158	f	\N	\N
483	Terbium	Tb 160	\N	Tb160	f	\N	\N
484	Terbium	Tb 161	\N	Tb161	f	\N	\N
485	Dysprosium	Dy 155	\N	Dy155	f	\N	\N
486	Dysprosium	Dy 157	\N	Dy157	f	\N	\N
487	Dysprosium	Dy 159	\N	Dy159	f	\N	\N
489	Dysprosium	Dy 166	\N	Dy166	f	\N	\N
490	Holmium	Ho 155	\N	Ho155	f	\N	\N
491	Holmium	Ho 157	\N	Ho157	f	\N	\N
492	Holmium	Ho 159	\N	Ho159	f	\N	\N
493	Holmium	Ho 161	\N	Ho161	f	\N	\N
495	Holmium	Ho 162	\N	Ho162	f	\N	\N
496	Holmium	Ho 164m	\N	Ho164m	f	\N	\N
499	Holmium	Ho 166	\N	Ho166	f	\N	\N
500	Holmium	Ho 167	\N	Ho167	f	\N	\N
501	Erbium	Er 161	\N	Er161	f	\N	\N
503	Erbium	Er 169	\N	Er169	f	\N	\N
504	Erbium	Er 171	\N	Er171	f	\N	\N
506	Thulium	Tm 162	\N	Tm162	f	\N	\N
509	Thulium	Tm 170	\N	Tm170	f	\N	\N
510	Thulium	Tm 171	\N	Tm171	f	\N	\N
511	Thulium	Tm 172	\N	Tm172	f	\N	\N
513	Thulium	Tm 175	\N	Tm175	f	\N	\N
514	Ytterbium	Yb 162	\N	Yb162	f	\N	\N
515	Ytterbium	Yb 166	\N	Yb166	f	\N	\N
518	Ytterbium	Yb 175	\N	Yb175	f	\N	\N
519	Ytterbium	Yb 177	\N	Yb177	f	\N	\N
521	Lutetium	Lu 169	\N	Lu169	f	\N	\N
522	Lutetium	Lu 170	\N	Lu170	f	\N	\N
523	Lutetium	Lu 171	\N	Lu171	f	\N	\N
525	Lutetium	Lu 173	\N	Lu173	f	\N	\N
526	Lutetium	Lu 174m	\N	Lu174m	f	\N	\N
529	Lutetium	Lu 176	\N	Lu176	f	\N	\N
530	Lutetium	Lu 177m	\N	Lu177m	f	\N	\N
532	Lutetium	Lu 178m	\N	Lu178m	f	\N	\N
533	Lutetium	Lu 178	\N	Lu178	f	\N	\N
534	Lutetium	Lu 179	\N	Lu179	f	\N	\N
536	Hafnium	Hf 172	\N	Hf172	f	\N	\N
538	Hafnium	Hf 175	\N	Hf175	f	\N	\N
540	Hafnium	Hf 178m	\N	Hf178m	f	\N	\N
541	Hafnium	Hf 179m	\N	Hf179m	f	\N	\N
543	Hafnium	Hf 181	080119080	Hf181	f	\N	1972181
544	Hafnium	Hf 182m	\N	Hf182m	f	\N	\N
545	Hafnium	Hf 182	\N	Hf182	f	\N	\N
548	Tantal	Ta 172	\N	Ta172	f	\N	\N
549	Tantal	Ta 173	\N	Ta173	f	\N	\N
551	Tantal	Ta 175	\N	Ta175	f	\N	\N
552	Tantal	Ta 176	\N	Ta176	f	\N	\N
554	Tantal	Ta 178 2	\N	Ta178	f	\N	\N
555	Tantal	Ta 178 1	\N	\N	f	\N	\N
558	Tantal	Ta 180	\N	Ta180	f	\N	\N
559	Tantal	Ta 182m	\N	Ta182m	f	\N	\N
561	Tantal	Ta 183	\N	Ta183	f	\N	\N
562	Tantal	Ta 184	\N	Ta184	f	\N	\N
563	Tantal	Ta 185	\N	Ta185	f	\N	\N
565	Wolfram	W 176	\N	W176	f	\N	\N
569	Wolfram	W 181	\N	W181	f	\N	\N
571	Wolfram	W 187	\N	W187	f	\N	\N
572	Wolfram	W 188	\N	W188	f	\N	\N
573	Rhenium	Re 177	\N	Re177	f	\N	\N
575	Rhenium	Re 180	\N	Re180	f	\N	\N
576	Rhenium	Re 181	\N	Re181	f	\N	\N
579	Rhenium	Re 184m	\N	Re184m	f	\N	\N
580	Rhenium	Re 184	\N	Re184	f	\N	\N
582	Rhenium	Re 186	\N	Re186	f	\N	\N
583	Rhenium	Re 187	\N	Re187	f	\N	\N
584	Rhenium	Re 188m	\N	Re188m	f	\N	\N
586	Rhenium	Re 189	\N	Re189	f	\N	\N
587	Osmium	Os 180	\N	Os180	f	\N	\N
590	Osmium	Os 185	\N	Os185	f	\N	\N
591	Osmium	Os 189m	\N	Os189m	f	\N	\N
593	Osmium	Os 191m	\N	Os191m	f	\N	\N
594	Osmium	Os 191	\N	Os191	f	\N	\N
595	Osmium	Os 193	\N	Os193	f	\N	\N
597	Iridium	Ir 182	\N	Ir182	f	\N	\N
600	Iridium	Ir 186 1	\N	Ir186	f	\N	\N
601	Iridium	Ir 186 2	\N	\N	f	\N	\N
602	Iridium	Ir 187	\N	Ir187	f	\N	\N
604	Iridium	Ir 189	\N	Ir189	f	\N	\N
607	Iridium	Ir 190	\N	Ir190	f	\N	\N
609	Iridium	Ir 192m	\N	Ir192m	f	\N	\N
611	Iridium	Ir 194m	\N	Ir194m	f	\N	\N
612	Iridium	Ir 194	\N	Ir194	f	\N	\N
318	Tellur	Te 125m	\N	Te125m	f	\N	\N
319	Tellur	Te 127m	\N	Te127m	f	\N	\N
321	Tellur	Te 129m	152221179	Te129m	f	\N	1952129
322	Tellur	Te 129	179221152	Te129	f	95	\N
323	Tellur	Te 131m	000250050	Te131m	f	98	1952131
324	Tellur	Te 131	\N	Te131	f	\N	\N
325	Tellur	Te 132	020031031	Te132	f	99	1952132
327	Tellur	Te 133	\N	Te133	f	\N	\N
328	Tellur	Te 134	\N	Te134	f	\N	\N
329	Iod	I 120m	\N	I120m	f	\N	\N
330	Iod	I 120	\N	I120	f	\N	\N
331	Iod	I 121	\N	I121	f	\N	\N
332	Iod	I 122	\N	I122	f	\N	\N
333	Iod	I 123	\N	I123	f	\N	\N
334	Iod	I 124	\N	I124	f	\N	\N
336	Iod	I 126	\N	I126	f	\N	\N
337	Iod	I 128	\N	I128	f	\N	\N
338	Iod	I 129	\N	I129	f	\N	1953129
339	Iod	I 130	\N	I130	f	\N	\N
340	Iod	I 131	250250000	I131	t	42	1953131
341	Iod	I 132m	\N	I132m	f	\N	\N
343	Iod	I 133	250125000	I133	f	47	1953133
344	Iod	I 134	\N	I134	f	\N	\N
345	Iod	I 135	179121020	I135	f	\N	1953135
346	Xenon	Xe 120	\N	Xe120	f	\N	\N
347	Xenon	Xe 121	\N	Xe121	f	\N	\N
349	Xenon	Xe 123	\N	Xe123	f	\N	\N
350	Xenon	Xe 125	\N	Xe125	f	\N	\N
351	Xenon	Xe 127	\N	Xe127	f	\N	\N
352	Xenon	Xe 129m	\N	Xe129m	f	\N	\N
353	Xenon	Xe 131m	\N	Xe131m	f	106	1954131
354	Xenon	Xe 133m	199225207	Xe133m	f	\N	1954133
613	Iridium	Ir 195m	\N	Ir195m	f	\N	\N
615	Platin	Pt 186	\N	Pt186	f	\N	\N
616	Platin	Pt 188	\N	Pt188	f	\N	\N
619	Platin	Pt 193m	\N	Pt193m	f	\N	\N
270	Indium	In 114m	\N	In114m	f	\N	\N
272	Indium	In 115m	\N	In115m	f	\N	\N
273	Indium	In 115	\N	In115	f	\N	\N
274	Indium	In 116m	\N	In116m	f	\N	\N
275	Indium	In 117m	\N	In117m	f	\N	\N
276	Indium	In 117	\N	In117	f	\N	\N
277	Indium	In 119m	\N	In119m	f	\N	\N
279	Zinn	Sn 110	\N	Sn110	f	\N	\N
280	Zinn	Sn 111	\N	Sn111	f	\N	\N
281	Zinn	Sn 113	\N	Sn113	f	\N	\N
282	Zinn	Sn 117m	\N	Sn117m	f	\N	\N
184	Zirconium	Zr 95	175125075	Zr95	f	112	1940095
229	Rhodium	Rh 102	\N	Rh102	f	\N	\N
239	Palladium	Pd 109	\N	Pd109	f	\N	\N
248	Silber	Ag 108	\N	Ag108	f	\N	\N
258	Cadmium	Cd 113m	\N	Cd113m	f	\N	\N
268	Indium	In 112	\N	In112	f	\N	\N
271	Indium	In 114	\N	In114	f	\N	\N
278	Indium	In 119	\N	In119	f	\N	\N
291	Zinn	Sn 128	\N	Sn128	f	\N	\N
299	Antimon	Sb 120 1	\N	Sb120	f	\N	\N
310	Antimon	Sb 129	221193152	Sb129	f	\N	1951129
320	Tellur	Te 127	\N	Te127	f	\N	\N
326	Tellur	Te 133m	\N	Te133m	f	\N	\N
335	Iod	I 125	\N	I125	f	\N	\N
342	Iod	I 132	250175000	I132	f	46	1953132
348	Xenon	Xe 122	\N	Xe122	f	\N	\N
371	Caesium	Cs 135	\N	Cs135	f	\N	\N
372	Caesium	Cs 136	221152221	Cs136	f	32	1955136
379	Barium	Ba 133m	\N	Ba133m	f	\N	\N
386	Barium	Ba 142	\N	Ba142	f	\N	\N
392	Lanthan	La 138	\N	La138	f	\N	\N
399	Cer	Ce 137m	\N	Ce137m	f	\N	\N
405	Praseodym	Pr 136	\N	Pr136	f	\N	\N
413	Praseodym	Pr 144m	\N	Pr144m	f	\N	\N
421	Neodym	Nd 141m	\N	Nd141m	f	\N	\N
428	Promethium	Pm 143	\N	Pm143	f	\N	\N
436	Promethium	Pm 150	\N	Pm150	f	\N	\N
444	Samarium	Sm 151	\N	Sm151	f	\N	\N
451	Europium	Eu 148	\N	Eu148	f	\N	\N
459	Europium	Eu 156	\N	Eu156	f	\N	\N
466	Gadolinium	Gd 149	\N	Gd149	f	\N	\N
474	Terbium	Tb 151	\N	Tb151	f	\N	\N
481	Terbium	Tb 157	\N	Tb157	f	\N	\N
488	Dysprosium	Dy 165	\N	Dy165	f	\N	\N
497	Holmium	Ho 164	\N	Ho164	f	\N	\N
507	Thulium	Tm 166	\N	Tm166	f	\N	\N
517	Ytterbium	Yb 169	\N	Yb169	f	\N	\N
528	Lutetium	Lu 176m	\N	Lu176m	f	\N	\N
537	Hafnium	Hf 173	\N	Hf173	f	\N	\N
547	Hafnium	Hf 184	\N	Hf184	f	\N	\N
556	Tantal	Ta 179	\N	Ta179	f	\N	\N
568	Wolfram	W 179	\N	W179	f	\N	\N
578	Rhenium	Re 182 1	\N	Re182	f	\N	\N
588	Osmium	Os 181	\N	Os181	f	\N	\N
598	Iridium	Ir 184	\N	Ir184	f	\N	\N
617	Platin	Pt 189	\N	Pt189	f	\N	\N
626	Gold	Au 193	\N	Au193	f	\N	\N
605	Iridium	Ir 190m2	\N	Ir190m	f	\N	\N
632	Gold	Au 199	\N	Au199	f	\N	\N
638	Quecksilber	Hg 194	\N	Hg194	f	\N	\N
646	Thallium	Tl 194	\N	Tl194	f	\N	\N
655	Thallium	Tl 204	\N	Tl204	f	\N	\N
657	Thallium	Tl 207	\N	Tl207	f	\N	\N
665	Blei	Pb 202m	\N	Pb202m	f	\N	\N
671	Blei	Pb 211	\N	Pb211	f	\N	\N
677	Bismut	Bi 203	\N	Bi203	f	\N	\N
684	Bismut	Bi 212	135227099	Bi212	f	12	1983212
690	Polonium	Po 210	\N	Po210	f	62	1984210
698	Astat	At 207	\N	At207	f	\N	\N
704	Radon	Rn 218	\N	Rn218	f	\N	\N
710	Francium	Fr 221	\N	Fr221	f	\N	\N
718	Radium	Ra 227	\N	Ra227	f	\N	\N
724	Actinium	Ac 227	\N	Ac227	f	\N	\N
732	Thorium	Th 232	080080119	Th232	f	101	1990232
739	Protactinium	Pa 233	227099099	Pa233	f	\N	1991233
750	Uran	U 238	031092031	U238	f	104	1992238
756	Neptunium	Np 235	\N	Np235	f	\N	\N
764	Plutonium	Pu 234	\N	Pu234	f	\N	\N
773	Plutonium	Pu 243	\N	Pu243	f	\N	\N
782	Americium	Am 242m	\N	Am242	f	\N	\N
793	Curium	Cm 242	000250250	Cm242	f	20	1996242
802	Berkelium	Bk 245	\N	Bk245	f	\N	\N
813	Californium	Cf 252	\N	Cf252	f	\N	\N
823	Fermium	Fm 254	\N	Fm254	f	\N	\N
900	Gamma-Ortsdosisleistung	Gamma-ODL	\N	\N	f	\N	\N
915	Gesamt-Alpha 2,5h verzögert	G-Alpha-2,5h_verz	\N	\N	f	\N	\N
956	Summe über künstliche IMIS-Nuklide(PARK)	SumPARK	\N	\N	f	\N	\N
188	Niob	Nb 89 2	\N	Nb89	f	\N	\N
191	Niob	Nb 94	\N	Nb94	f	\N	\N
194	Niob	Nb 96	\N	Nb96	f	\N	1941095
196	Niob	Nb 97	227135099	Nb97	f	55	1941097
199	Molybdän	Mo 93m	\N	Mo93m	f	\N	\N
203	Technetium	Tc 93m	\N	Tc93m	f	\N	\N
207	Technetium	Tc 95m	\N	Tc95m	f	\N	\N
211	Technetium	Tc 97m	\N	Tc97m	f	\N	\N
216	Technetium	Tc 101	\N	Tc101	f	\N	\N
220	Ruthenium	Ru 103	092092031	Ru103	f	73	1944103
224	Rhodium	Rh 99	\N	Rh99	f	\N	\N
227	Rhodium	Rh 101	\N	Rh101	f	\N	\N
231	Rhodium	Rh 105	\N	Rh105	f	\N	\N
234	Rhodium	Rh 107	\N	Rh107	f	\N	\N
238	Palladium	Pd 107	\N	Pd107	f	\N	\N
242	Silber	Ag 104m	\N	Ag104m	f	\N	\N
246	Silber	Ag 106	\N	Ag106	f	\N	\N
249	Silber	Ag 109m	\N	Ag109m	f	\N	\N
253	Silber	Ag 112	\N	Ag112	f	\N	\N
256	Cadmium	Cd 107	\N	Cd107	f	\N	\N
260	Cadmium	Cd 115m	\N	Cd115m	f	\N	\N
263	Cadmium	Cd 117	\N	Cd117	f	\N	\N
267	Indium	In 111	\N	In111	f	\N	\N
283	Zinn	Sn 119m	\N	Sn119m	f	\N	\N
287	Zinn	Sn 123	\N	Sn123	f	\N	\N
290	Zinn	Sn 127	\N	Sn127	f	\N	\N
293	Antimon	Sb 116m	\N	Sb116m	f	\N	\N
296	Antimon	Sb 118m	\N	Sb118m	f	\N	\N
300	Antimon	Sb 122	\N	Sb122	f	\N	\N
304	Antimon	Sb 125	092067031	Sb125	f	77	1951125
307	Antimon	Sb 127	147113026	Sb127	f	78	1951127
311	Antimon	Sb 130	\N	Sb130	f	\N	\N
314	Tellur	Te 121m	\N	Te121m	f	\N	\N
494	Holmium	Ho 162m	\N	Ho162m	f	\N	\N
498	Holmium	Ho 166m	\N	Ho166m	f	\N	\N
502	Erbium	Er 165	\N	Er165	f	\N	\N
505	Erbium	Er 172	\N	Er172	f	\N	\N
508	Thulium	Tm 167	\N	Tm167	f	\N	\N
512	Thulium	Tm 173	\N	Tm173	f	\N	\N
516	Ytterbium	Yb 167	\N	Yb167	f	\N	\N
520	Ytterbium	Yb 178	\N	Yb178	f	\N	\N
524	Lutetium	Lu 172	\N	Lu172	f	\N	\N
527	Lutetium	Lu 174	\N	Lu174	f	\N	\N
531	Lutetium	Lu 177	\N	Lu177	f	\N	\N
535	Hafnium	Hf 170	\N	Hf170	f	\N	\N
539	Hafnium	Hf 177m	\N	Hf177m	f	\N	\N
542	Hafnium	Hf 180m	\N	Hf180m	f	\N	\N
546	Hafnium	Hf 183	\N	Hf183	f	\N	\N
550	Tantal	Ta 174	\N	Ta174	f	\N	\N
553	Tantal	Ta 177	\N	Ta177	f	\N	\N
557	Tantal	Ta 180m	\N	Ta180m	f	\N	\N
560	Tantal	Ta 182	\N	Ta182	f	\N	\N
564	Tantal	Ta 186	\N	Ta186	f	\N	\N
567	Wolfram	W 178	\N	W178	f	\N	\N
570	Wolfram	W 185	\N	W185	f	\N	\N
574	Rhenium	Re 178	\N	Re178	f	\N	\N
577	Rhenium	Re 182 2	\N	Re182	f	\N	\N
581	Rhenium	Re 186m	\N	Re186m	f	\N	\N
585	Rhenium	Re 188	\N	Re188	f	\N	\N
589	Osmium	Os 182	\N	Os182	f	\N	\N
592	Osmium	Os 190m	\N	Os190m	f	\N	\N
596	Osmium	Os 194	\N	Os194	f	\N	\N
599	Iridium	Ir 185	\N	Ir185	f	\N	\N
603	Iridium	Ir 188	\N	Ir188	f	\N	\N
610	Iridium	Ir 192	\N	Ir192	f	\N	\N
614	Iridium	Ir 195	\N	Ir195	f	\N	\N
618	Platin	Pt 191	\N	Pt191	f	\N	\N
653	Thallium	Tl 201	\N	Tl201	f	\N	\N
772	Plutonium	Pu 242	\N	Pu242	f	\N	\N
776	Plutonium	Pu 246	\N	Pu246	f	\N	\N
780	Americium	Am 240	\N	Am240	f	\N	\N
784	Americium	Am 243	\N	Am243	f	\N	\N
788	Americium	Am 246m	\N	Am246	f	\N	\N
792	Curium	Cm 241	\N	Cm241	f	\N	\N
796	Curium	Cm 245	\N	Cm245	f	\N	\N
799	Curium	Cm 248	\N	Cm248	f	\N	\N
803	Berkelium	Bk 246	\N	Bk246	f	\N	\N
807	Californium	Cf 244	\N	Cf244	f	\N	\N
811	Californium	Cf 250	\N	Cf250	f	\N	\N
815	Californium	Cf 254	\N	Cf254	f	\N	\N
820	Einsteinium	Es 254	\N	Es254	f	\N	\N
824	Fermium	Fm 255	\N	Fm255	f	\N	\N
850	Plutonium 239/240	Pu 23940	160020179	Pu239	f	64	1994479
870	Iod, elementar	I 131E	\N	I131E	f	44	\N
882	Iod, organisch gebunden	I 135O	\N	I135O	f	\N	\N
902	Gesamt-Beta-Aktivität	G-Beta	125125125	SumBe	f	87	1900200
908	Gesamt-Gamma-Aktivität, künstlich	G-Gamma-künstl.	\N	\N	f	\N	\N
917	Gesamt-Alpha 24h verzögert	G-Alpha-24h_verz	\N	\N	f	\N	\N
927	Neutronen-Ortsdosis, brutto	Neutr-OD-Brutto	\N	\N	f	\N	\N
957	Summe über relevante IMIS-Nuklide (PARK)	Sumrelv	\N	\N	f	\N	\N
10	Natrium	Na 22	099172227	Na22	f	53	1911022
16	Silicium	Si 32	\N	Si32	f	\N	\N
24	Argon	Ar 37	\N	Ar37	f	\N	\N
31	Kalium	K 44	\N	K44	f	\N	\N
36	Calcium	Ca 49	\N	Ca49	f	\N	\N
42	Scandium	Sc 48	\N	Sc48	f	\N	\N
49	Chrom	Cr 48	\N	Cr48	f	\N	\N
54	Mangan	Mn 52	\N	Mn52	f	\N	\N
60	Eisen	Fe 59	193221152	Fe59	f	39	1926059
65	Cobalt	Co 58m	\N	Co58m	f	\N	\N
71	Nickel	Ni 56	\N	Ni56	f	\N	\N
76	Nickel	Ni 66	\N	Ni66	f	\N	\N
82	Kupfer	Cu 67	\N	Cu67	f	\N	\N
87	Zink	Zn 69	\N	Zn69	f	\N	\N
92	Gallium	Ga 67	\N	Ga67	f	\N	\N
98	Germanium	Ge 67	\N	Ge67	f	\N	\N
107	Arsen	As 71	\N	As71	f	\N	\N
115	Selen	Se 73m	\N	Se73m	f	\N	\N
123	Brom	Br 74m	\N	Br74m	f	\N	\N
132	Brom	Br 84	\N	Br84	f	\N	\N
139	Krypton	Kr 83m	\N	Kr83m	f	\N	\N
148	Rubidium	Rb 81	\N	Rb81	f	\N	\N
158	Strontium	Sr 81	\N	Sr81	f	\N	\N
167	Strontium	Sr 92	179020179	Sr92	f	\N	1938092
182	Zirconium	Zr 89	\N	Zr89	f	\N	\N
195	Niob	Nb 97m	\N	Nb97m	f	\N	\N
206	Technetium	Tc 94	\N	Tc94	f	\N	\N
218	Ruthenium	Ru 94	\N	Ru94	f	\N	\N
284	Zinn	Sn 121m	\N	Sn121m	f	\N	\N
285	Zinn	Sn 121	\N	Sn121	f	\N	\N
286	Zinn	Sn 123m	\N	Sn123m	f	\N	\N
288	Zinn	Sn 125	\N	Sn125	f	\N	\N
289	Zinn	Sn 126	\N	Sn126	f	\N	\N
292	Antimon	Sb 115	\N	Sb115	f	\N	\N
294	Antimon	Sb 116	\N	Sb116	f	\N	\N
295	Antimon	Sb 117	\N	Sb117	f	\N	\N
297	Antimon	Sb 119	\N	Sb119	f	\N	\N
298	Antimon	Sb 120 2	\N	Sb120	f	\N	\N
301	Antimon	Sb 124m1	\N	Sb124m	f	\N	\N
302	Antimon	Sb 124m2	\N	Sb124m	f	\N	\N
303	Antimon	Sb 124	031020031	Sb124	f	76	1951124
305	Antimon	Sb 126m	\N	Sb126m	f	\N	\N
306	Antimon	Sb 126	\N	Sb126	f	\N	\N
308	Antimon	Sb 128 2	\N	Sb128	f	\N	\N
309	Antimon	Sb 128 1	\N	Sb128	f	\N	\N
312	Antimon	Sb 131	\N	Sb131	f	\N	\N
313	Tellur	Te 116	\N	Te116	f	\N	\N
315	Tellur	Te 121	\N	Te121	f	\N	\N
316	Tellur	Te 123m	250000125	Te123m	f	\N	1952123
317	Tellur	Te 123	\N	Te123	f	\N	\N
1	Tritium	H 3	199225225	H3	f	40	1901003
2	Beryllium	Be 7	050027027	Be7	f	11	1904007
3	Beryllium	Be 10	\N	Be10	f	\N	\N
4	Kohlenstoff	C 11	\N	C11	f	\N	\N
5	Kohlenstoff	C 14	\N	C14	f	14	1906014
6	Stickstoff	N 13	\N	N13	f	\N	\N
7	Sauerstoff	O 15	\N	O15	f	\N	\N
8	Fluor	F 18	\N	F18	f	\N	\N
9	Neon	Ne 19	\N	Ne19	f	\N	\N
11	Natrium	Na 24	\N	Na24	f	\N	\N
12	Magnesium	Mg 28	\N	Mg28	f	\N	\N
13	Aluminium	Al 26	\N	Al26	f	\N	\N
14	Aluminium	Al 28	\N	Al28	f	\N	\N
15	Silicium	Si 31	\N	Si31	f	\N	\N
17	Phosphor	P 30	\N	P30	f	\N	\N
18	Phosphor	P 32	\N	P32	f	\N	\N
19	Phosphor	P 33	\N	P33	f	\N	\N
20	Schwefel	S 35	\N	S35	f	\N	\N
21	Chlor	Cl 36	\N	Cl36	f	\N	\N
22	Chlor	Cl 38	\N	Cl38	f	\N	\N
23	Chlor	Cl 39	\N	Cl39	f	\N	\N
25	Argon	Ar 39	\N	Ar39	f	\N	\N
26	Argon	Ar 41	147060026	Ar41	f	\N	1918041
27	Kalium	K 38	\N	K38	f	\N	\N
28	Kalium	K 40	000250175	K40	f	48	1919040
29	Kalium	K 42	\N	K42	f	\N	\N
30	Kalium	K 43	\N	K43	f	\N	\N
32	Kalium	K 45	\N	K45	f	\N	\N
33	Calcium	Ca 41	\N	Ca41	f	\N	\N
34	Calcium	Ca 45	\N	Ca45	f	\N	\N
35	Calcium	Ca 47	\N	Ca47	f	\N	\N
37	Scandium	Sc 43	\N	Sc43	f	\N	\N
38	Scandium	Sc 44m	\N	Sc44m	f	\N	\N
39	Scandium	Sc 44	\N	Sc44	f	\N	\N
40	Scandium	Sc 46	\N	Sc46	f	\N	\N
41	Scandium	Sc 47	\N	Sc47	f	\N	\N
43	Scandium	Sc 49	\N	Sc49	f	\N	\N
44	Titan	Ti 44	\N	Ti44	f	\N	\N
45	Titan	Ti 45	\N	Ti45	f	\N	\N
46	Vanadium	V 47	\N	V47	f	\N	\N
47	Vanadium	V 48	\N	V48	f	\N	\N
48	Vanadium	V 49	\N	V49	f	\N	\N
50	Chrom	Cr 49	\N	Cr49	f	\N	\N
51	Chrom	Cr 51	250050000	Cr51	f	\N	1924051
52	Mangan	Mn 51	\N	Mn51	f	\N	\N
53	Mangan	Mn 52m	\N	Mn52m	f	\N	\N
55	Mangan	Mn 53	\N	Mn53	f	\N	\N
608	Iridium	Ir 191m	\N	Ir191m	f	\N	\N
606	Iridium	Ir 190m1	\N	Ir190m	f	\N	\N
1039	Gesamt-Radon-Aktivität	Rn-Gesamt	\N	\N	f	\N	\N
1040	Nullmessung (QS bei LIMS)	Nullmessung	\N	\N	f	\N	\N
1041	Temperatur	Temperatur	\N	\N	f	\N	\N
890	Iod, elementar und organisch gebunden	I 131GO	\N	I131GO	f	\N	\N
891	Iod, elementar und organisch gebunden	I 133GO	\N	I133GO	f	\N	\N
892	Iod, elementar und organisch gebunden	I 135GO	\N	I135GO	f	\N	\N
\.


--
-- Name: messgroesse_id_seq; Type: SEQUENCE SET; Schema: stammdaten; Owner: postgres
--

SELECT pg_catalog.setval('messgroesse_id_seq', 1041, true);


--
-- PostgreSQL database dump complete
--

