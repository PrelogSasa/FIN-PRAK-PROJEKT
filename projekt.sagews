︠97f897e4-5cc5-4764-9ebb-533defb51349s︠
drevesa5 = [dr for dr in graphs.trees(5)] #na tak nacin dobis seznam objektov dreves s petimi vozlisci (ni duplikatov)
stevilo_dreves5 = len(drevesa5) #stevilo dreves s petimi vozlisci
G = drevesa5[1] #vzamem taprvo drevo iz seznama in pogledam seznam sosedov za vsako vozlisce
for voz in G:
    print voz, G[voz]

show(G) #narisem drevo


︡e8ab0244-b938-4122-aedb-49b52755db3b︡{"stdout":"0 [1, 3, 4]\n1 [0, 2]\n2 [1]\n3 [0]\n4 [0]\n"}︡{"d3":{"data":{"charge":-120,"directed":false,"edge_labels":false,"edge_thickness":2,"gravity":0.04,"height":null,"link_distance":50,"link_strength":1,"links":[{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":1},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":3},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":4},{"color":"#aaa","curve":0,"name":"","source":1,"strength":0,"target":2}],"loops":[],"nodes":[{"group":"0","name":"0"},{"group":"0","name":"1"},{"group":"0","name":"2"},{"group":"0","name":"3"},{"group":"0","name":"4"}],"pos":[],"vertex_labels":true,"vertex_size":7,"width":null},"viewer":"graph"}}︡{"done":true}
︠43b1b637-2250-42c5-bcfa-fb74b25af7c5s︠
def ABCindeks(drevo): #izracun ABC indeksa za neko drevo, len(drevo[u]) ti da dolzino seznama sosedov za vozlisce u torej je to stopnja vozlisca u
    produkt = 1
    for u in drevo:
        for v in drevo[u]:
            produkt = produkt * (len(drevo[u]) + len(drevo[v]) - 2) / (len(drevo[u]) * len(drevo[v]))
    return sqrt(produkt)

ABCindeks(G)
︡caf2c7b9-8b21-4c9e-97f1-682f79773aac︡{"stdout":"1/9\n"}︡{"done":true}
︠b110b1de-0952-4039-a3fb-ba1c599f2cc5s︠
def minABCindeks(n): #izracun najmanjsega ABC indeksa za vsa drevesa z n vozlisci, vrne tudi seznam dreves, ki imajo ta najmanjsi indeks
    drevesa = [dr for dr in graphs.trees(n)]
    indeksi = []
    for dr in drevesa:
        indeksi.append(ABCindeks(dr))
    minimum = min(indeksi)
    pozicije = [i for i, v in enumerate(indeksi) if v == minimum] # to je da dobimo pozicije na katerih so min indeksi, da vemo katera drevesa imajo te indekse
    drevesa_z_min_ind = [drevesa[i] for i in pozicije]
    return minimum , drevesa_z_min_ind

[vrednost, graf] = minABCindeks(5)
show(graf) #pri drevesih s petimi vozlisci je samo en graf z min ABC indeksom, tu ga narisemo
︡bf88504d-8611-447d-9660-e593f0945f18︡{"d3":{"data":{"charge":-120,"directed":false,"edge_labels":false,"edge_thickness":2,"gravity":0.04,"height":null,"link_distance":50,"link_strength":1,"links":[{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":1},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":3},{"color":"#aaa","curve":0,"name":"","source":1,"strength":0,"target":2},{"color":"#aaa","curve":0,"name":"","source":3,"strength":0,"target":4}],"loops":[],"nodes":[{"group":"0","name":"0"},{"group":"0","name":"1"},{"group":"0","name":"2"},{"group":"0","name":"3"},{"group":"0","name":"4"}],"pos":[],"vertex_labels":true,"vertex_size":7,"width":null},"viewer":"graph"}}︡{"html":"<div align='center'>[]</div>"}︡{"done":true}
︠ed9c16f0-f310-4947-a308-c1210cbc9ce2︠
rezultati = []
for n in range(15) : #range naredi seznam od 0 do 9, midva hoceva grafe z vozlisci od 1 do 10 zato je spodaj n+1
        rez = [vrednost, seznam_grafov] = minABCindeks(n+1)
        rezultati.append(rez)
rezultati #rabu je mejbi 2 do 3 sekunde da je to vn vrgu tkoda mormo za vecje grafe probat
︡d5dca5f9-2e92-4514-8642-59d299b10608︡{"stdout":"[(1, [Graph on 1 vertex]), (0, [Graph on 2 vertices]), (1/4, [Graph on 3 vertices]), (1/8, [Graph on 4 vertices]), (1/16, [Graph on 5 vertices]), (1/32, [Graph on 6 vertices]), (1/64, [Graph on 7 vertices, Graph on 7 vertices]), (1/128, [Graph on 8 vertices, Graph on 8 vertices]), (1/256, [Graph on 9 vertices, Graph on 9 vertices, Graph on 9 vertices, Graph on 9 vertices]), (1/576, [Graph on 10 vertices]), (1/1152, [Graph on 11 vertices]), (5/12288, [Graph on 12 vertices]), (1/5184, [Graph on 13 vertices]), (3/32768, [Graph on 14 vertices]), (25/589824, [Graph on 15 vertices])]\n"}︡{"done":true}
︠e2dd4ae5-c7c5-450c-a073-311366a09eccs︠
# recimo da naju zanimajo premeri teh grafov, uporabiva lahko metodo diameter za objekte graphs
premeri = []
for (vrednost, seznam_grafov) in rezultati:
    pr = []
    for graf in seznam_grafov:
        pr.append(graf.diameter())
    premeri.append(pr)
premeri
︡f0c6be1a-8500-4613-8f09-84ebcf969f80︡{"stdout":"[[0], [1], [2], [3], [4], [5], [6, 4], [7, 5], [8, 6, 6, 4], [5], [6], [5], [6], [5], [6]]\n"}︡{"done":true}
︠85588a96-f8cc-4884-9bf8-a4d9457c225bs︠
#ce naju zanimajo dolzine najdaljsih poti v grafih (se nism pogruntala kako napisat algoritem)
# def najdaljsa_pot(graf):
#     for u in graf:
#         if len(graf[u]) == 2:
#             if len()
# dolzine = []
#
# for for (vrednost, seznam_grafov) in rezultati:
#     dol = []
#     for graf in seznam_grafov:
︡ed45bd94-12c7-49c0-9eb4-96c7c02b0da9︡{"done":true}
︠de8a6a38-ef6e-4253-a9aa-27c0299ec305s︠
#ce naju zanima unikatnost dreves, lahko v seznamu dreves v rezultatih vidiva ali je samo eno drevo z min indeksom ali jih je vec, ce jih je vec si jih je morda smiselno narisati
for (vrednost, seznam_grafov) in rezultati:
    if len(seznam_grafov) >= 2:
        for graf in seznam_grafov:
            show(graf)
︡17f0034d-e6a0-4e4b-9494-9eba3c3f5ebe︡{"d3":{"data":{"charge":-120,"directed":false,"edge_labels":false,"edge_thickness":2,"gravity":0.04,"height":null,"link_distance":50,"link_strength":1,"links":[{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":1},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":4},{"color":"#aaa","curve":0,"name":"","source":1,"strength":0,"target":2},{"color":"#aaa","curve":0,"name":"","source":2,"strength":0,"target":3},{"color":"#aaa","curve":0,"name":"","source":4,"strength":0,"target":5},{"color":"#aaa","curve":0,"name":"","source":5,"strength":0,"target":6}],"loops":[],"nodes":[{"group":"0","name":"0"},{"group":"0","name":"1"},{"group":"0","name":"2"},{"group":"0","name":"3"},{"group":"0","name":"4"},{"group":"0","name":"5"},{"group":"0","name":"6"}],"pos":[],"vertex_labels":true,"vertex_size":7,"width":null},"viewer":"graph"}}︡{"d3":{"data":{"charge":-120,"directed":false,"edge_labels":false,"edge_thickness":2,"gravity":0.04,"height":null,"link_distance":50,"link_strength":1,"links":[{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":1},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":3},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":5},{"color":"#aaa","curve":0,"name":"","source":1,"strength":0,"target":2},{"color":"#aaa","curve":0,"name":"","source":3,"strength":0,"target":4},{"color":"#aaa","curve":0,"name":"","source":5,"strength":0,"target":6}],"loops":[],"nodes":[{"group":"0","name":"0"},{"group":"0","name":"1"},{"group":"0","name":"2"},{"group":"0","name":"3"},{"group":"0","name":"4"},{"group":"0","name":"5"},{"group":"0","name":"6"}],"pos":[],"vertex_labels":true,"vertex_size":7,"width":null},"viewer":"graph"}}︡{"d3":{"data":{"charge":-120,"directed":false,"edge_labels":false,"edge_thickness":2,"gravity":0.04,"height":null,"link_distance":50,"link_strength":1,"links":[{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":1},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":5},{"color":"#aaa","curve":0,"name":"","source":1,"strength":0,"target":2},{"color":"#aaa","curve":0,"name":"","source":2,"strength":0,"target":3},{"color":"#aaa","curve":0,"name":"","source":3,"strength":0,"target":4},{"color":"#aaa","curve":0,"name":"","source":5,"strength":0,"target":6},{"color":"#aaa","curve":0,"name":"","source":6,"strength":0,"target":7}],"loops":[],"nodes":[{"group":"0","name":"0"},{"group":"0","name":"1"},{"group":"0","name":"2"},{"group":"0","name":"3"},{"group":"0","name":"4"},{"group":"0","name":"5"},{"group":"0","name":"6"},{"group":"0","name":"7"}],"pos":[],"vertex_labels":true,"vertex_size":7,"width":null},"viewer":"graph"}}︡{"d3":{"data":{"charge":-120,"directed":false,"edge_labels":false,"edge_thickness":2,"gravity":0.04,"height":null,"link_distance":50,"link_strength":1,"links":[{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":1},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":4},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":6},{"color":"#aaa","curve":0,"name":"","source":1,"strength":0,"target":2},{"color":"#aaa","curve":0,"name":"","source":2,"strength":0,"target":3},{"color":"#aaa","curve":0,"name":"","source":4,"strength":0,"target":5},{"color":"#aaa","curve":0,"name":"","source":6,"strength":0,"target":7}],"loops":[],"nodes":[{"group":"0","name":"0"},{"group":"0","name":"1"},{"group":"0","name":"2"},{"group":"0","name":"3"},{"group":"0","name":"4"},{"group":"0","name":"5"},{"group":"0","name":"6"},{"group":"0","name":"7"}],"pos":[],"vertex_labels":true,"vertex_size":7,"width":null},"viewer":"graph"}}︡{"d3":{"data":{"charge":-120,"directed":false,"edge_labels":false,"edge_thickness":2,"gravity":0.04,"height":null,"link_distance":50,"link_strength":1,"links":[{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":1},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":5},{"color":"#aaa","curve":0,"name":"","source":1,"strength":0,"target":2},{"color":"#aaa","curve":0,"name":"","source":2,"strength":0,"target":3},{"color":"#aaa","curve":0,"name":"","source":3,"strength":0,"target":4},{"color":"#aaa","curve":0,"name":"","source":5,"strength":0,"target":6},{"color":"#aaa","curve":0,"name":"","source":6,"strength":0,"target":7},{"color":"#aaa","curve":0,"name":"","source":7,"strength":0,"target":8}],"loops":[],"nodes":[{"group":"0","name":"0"},{"group":"0","name":"1"},{"group":"0","name":"2"},{"group":"0","name":"3"},{"group":"0","name":"4"},{"group":"0","name":"5"},{"group":"0","name":"6"},{"group":"0","name":"7"},{"group":"0","name":"8"}],"pos":[],"vertex_labels":true,"vertex_size":7,"width":null},"viewer":"graph"}}︡{"d3":{"data":{"charge":-120,"directed":false,"edge_labels":false,"edge_thickness":2,"gravity":0.04,"height":null,"link_distance":50,"link_strength":1,"links":[{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":1},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":6},{"color":"#aaa","curve":0,"name":"","source":1,"strength":0,"target":2},{"color":"#aaa","curve":0,"name":"","source":1,"strength":0,"target":4},{"color":"#aaa","curve":0,"name":"","source":2,"strength":0,"target":3},{"color":"#aaa","curve":0,"name":"","source":4,"strength":0,"target":5},{"color":"#aaa","curve":0,"name":"","source":6,"strength":0,"target":7},{"color":"#aaa","curve":0,"name":"","source":7,"strength":0,"target":8}],"loops":[],"nodes":[{"group":"0","name":"0"},{"group":"0","name":"1"},{"group":"0","name":"2"},{"group":"0","name":"3"},{"group":"0","name":"4"},{"group":"0","name":"5"},{"group":"0","name":"6"},{"group":"0","name":"7"},{"group":"0","name":"8"}],"pos":[],"vertex_labels":true,"vertex_size":7,"width":null},"viewer":"graph"}}︡{"d3":{"data":{"charge":-120,"directed":false,"edge_labels":false,"edge_thickness":2,"gravity":0.04,"height":null,"link_distance":50,"link_strength":1,"links":[{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":1},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":4},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":7},{"color":"#aaa","curve":0,"name":"","source":1,"strength":0,"target":2},{"color":"#aaa","curve":0,"name":"","source":2,"strength":0,"target":3},{"color":"#aaa","curve":0,"name":"","source":4,"strength":0,"target":5},{"color":"#aaa","curve":0,"name":"","source":5,"strength":0,"target":6},{"color":"#aaa","curve":0,"name":"","source":7,"strength":0,"target":8}],"loops":[],"nodes":[{"group":"0","name":"0"},{"group":"0","name":"1"},{"group":"0","name":"2"},{"group":"0","name":"3"},{"group":"0","name":"4"},{"group":"0","name":"5"},{"group":"0","name":"6"},{"group":"0","name":"7"},{"group":"0","name":"8"}],"pos":[],"vertex_labels":true,"vertex_size":7,"width":null},"viewer":"graph"}}︡{"d3":{"data":{"charge":-120,"directed":false,"edge_labels":false,"edge_thickness":2,"gravity":0.04,"height":null,"link_distance":50,"link_strength":1,"links":[{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":1},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":3},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":5},{"color":"#aaa","curve":0,"name":"","source":0,"strength":0,"target":7},{"color":"#aaa","curve":0,"name":"","source":1,"strength":0,"target":2},{"color":"#aaa","curve":0,"name":"","source":3,"strength":0,"target":4},{"color":"#aaa","curve":0,"name":"","source":5,"strength":0,"target":6},{"color":"#aaa","curve":0,"name":"","source":7,"strength":0,"target":8}],"loops":[],"nodes":[{"group":"0","name":"0"},{"group":"0","name":"1"},{"group":"0","name":"2"},{"group":"0","name":"3"},{"group":"0","name":"4"},{"group":"0","name":"5"},{"group":"0","name":"6"},{"group":"0","name":"7"},{"group":"0","name":"8"}],"pos":[],"vertex_labels":true,"vertex_size":7,"width":null},"viewer":"graph"}}︡{"done":true}










