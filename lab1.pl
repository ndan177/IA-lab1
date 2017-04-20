%Grupa 243 Nohai Daniel
parinte(anca,ioana).
parinte(vlad,ioana).
parinte(anca,george).
parinte(vlad,george).
parinte(cristi,ana).
parinte(ioana,ana).
parinte(cristi,bogdan).
parinte(ioana,bogdan).
parinte(george,dan).
parinte(george,elena).
parinte(alexandra,dan).
parinte(alexandra,elena).

barbat(vlad).
barbat(cristi).
barbat(bogdan).
barbat(george).
barbat(dan).

femeie(anca).
femeie(ioana).
femeie(ana).
femeie(alexandra).
femeie(elena).

tata(B,A):- barbat(B),parinte(B,A).
mama(M,A):- femeie(M),parinte(M,A).

frate(B,A):-barbat(B),parinte(P,B),parinte(P,A),B\==A.
sora(B,A):-femeie(B),parinte(P,B),parinte(P,A),B\==A.
bunic(B,A):-barbat(B),parinte(B,C),parinte(C,A).
bunica(B,A):-femeie(B),parinte(B,C),parinte(C,A).

sot(B,F):-femeie(F),barbat(B),parinte(B,C),parinte(F,C).
sotie(F,B):-sot(B,F).

unchi(M,N):-frate(M,A),parinte(A,N); sot(M,F),sora(F,C),parinte(C,N).
matusa(M,N):-sora(M,A),parinte(A,N); sotie(M,F),frate(F,C),parinte(C,N).

cumnat(B,A):-sot(B,C),sora(C,A); sot(B,C),sora(C,D),sot(D,A);frate(B,C),sotie(C,A).
cumnata(B,A):-sotie(B,C),frate(C,A); sotie(B,c),frate(C,D),sotie(D,A);sora(B,C),sot(C,A).
var(B,A):-bunica(C,B),bunica(C,A),\+frate(B,A),barbat(B),B\==A.
vara(B,A):-bunica(C,B),bunica(C,A),\+sora(B,A),femeie(B),B\==A.