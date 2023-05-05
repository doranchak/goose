0 '
1 '  G.O.O.S.E....   by David Oranchak and Jerry Spiller
2 '                  (with sparse help from Keeley Partney)
3 '
4 '                  Version 2, 01/18/93
5 '
10 CLS : SCREEN 0: WIDTH 80: KEY OFF
11 RANDOMIZE TIMER: ZQ = 1
12 REM articles,adjectives,subjects,verbs,infinitives,adverbs,interjections,structures,superlatives
30 GOSUB 10000: DIM A$(A1), B$(A2), C$(A3), D$(A4), E$(A5), F$(A6), G$(A7), S$(A8), H$(A9): GOSUB 10205
50 CLS : Y = 3: A$ = "=====": C = 2: GOSUB 500
51 Y = 4: A$ = "GOOSE": C = 5: GOSUB 500
52 Y = 5: A$ = "=====": C = 2: GOSUB 500
53 Y = 7: A$ = "Grand Oligarchy Of Synthetic English": C = 3: GOSUB 500
54 Y = 10: A$ = "Programming by David Oranchak": C = 4: GOSUB 500
55 Y = 11: A$ = "Ideas and word list help from Jerry Spiller and Keeley Partney": C = 6: GOSUB 500
56 Y = 15
57 RANDOMIZE TIMER
58 WHILE INKEY$ = ""
59 C = INT(RND(1) * 15) + 1: A$ = "<Hit any key to begin>": GOSUB 500
60 WEND: TIME1 = TIMER
70 CLS : COLOR 15
80 DIM Z$(100)
94 :                                                                        
95 :                                                                        
96 REM Main Loop                                                            
98 :                                           
99 :                                           
100 C$ = ""
110 S = INT(RND(1) * A8) + 1
120 A$ = S$(S)
130 X = 1
140 FOR Y = 1 TO LEN(A$)
150 Z$ = MID$(A$, Y, 1)
160 IF Z$ = "A" THEN A = INT(RND(1) * A1) + 1: B$ = A$(A)
162 IF Z$ = "J" THEN A = INT(RND(1) * A2) + 1: B$ = B$(A)
164 IF Z$ = "N" THEN A = INT(RND(1) * A3) + 1: B$ = C$(A)
165 IF Z$ = "V" THEN A = INT(RND(1) * A4) + 1: B$ = D$(A)
167 IF Z$ = "F" THEN A = INT(RND(1) * A5) + 1: B$ = E$(A)
170 IF Z$ = "D" THEN A = INT(RND(1) * A6) + 1: B$ = F$(A)
172 IF Z$ = "I" THEN A = INT(RND(1) * A7) + 1: B$ = G$(A)
174 IF Z$ = "S" THEN A = INT(RND(1) * A9) + 1: B$ = H$(A)
180 IF Z$ <> "(" THEN 300
190 D$ = ""
192 Y = Y + 1
194 E$ = MID$(A$, Y, 1)
196 IF E$ = ")" THEN 220
200 D$ = D$ + E$: GOTO 192
220 B$ = D$
300 IF Y <> 1 THEN C$ = C$ + " " + B$: GOTO 302
301 C$ = C$ + B$
302 NEXT: RAND = 0: FOR I = 1 TO LEN(TIME$): RAND = RAND + ASC(MID$(TIME$, I, 1)): NEXT: RAND = RAND * RND(1): RANDOMIZE RAND
303 :                                                                       
305 :                                                                       
306 :                                                                       
329 GOSUB 20000: GOSUB 21000: GOSUB 22000: GOSUB 23000: PRINT C$; " "; : TIME2 = TIMER
PRINT
330 PRINT : COLOR 6: INPUT "컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴� [p]rint [a]dd [d]isplay [q]uit 컴>"; bubba$: COLOR 15
IF bubba$ = "q" OR bubba$ = "Q" THEN END
332 IF bubba$ = "P" OR bubba$ = "p" THEN LPRINT C$
333 IF bubba$ = "a" OR bubba$ = "A" THEN Z$(ZQ) = C$: ZQ = ZQ + 1
334 IF bubba$ = "d" OR bubba$ = "D" THEN GOSUB 41000
335 IF bubba$ = "g" OR bubba$ = "G" THEN PRINT : WORD = LEN(C$) / 5: MIN = (TIME2 - TIME1) / 60: PRINT : PRINT (TIME2 - TIME1); " seconds, "; WORD / MIN; " GWAM.": PRINT : GOTO 330
340 PRINT : PRINT : COLOR 15: TIME1 = TIMER: GOTO 100
500 IF C = 0 THEN C = 15
510 X = 40 - LEN(A$) / 2: LOCATE Y, X: COLOR C: PRINT A$: RETURN
599 '
600 ' All Words
601 '
610 FOR I = 1 TO A1: PRINT A$(I); ", "; : NEXT: PRINT
620 FOR I = 1 TO A2: PRINT B$(I); ", "; : NEXT: PRINT
630 FOR I = 1 TO A3: PRINT C$(I); ", "; : NEXT: PRINT
640 FOR I = 1 TO A4: PRINT D$(I); ", "; : NEXT: PRINT
650 FOR I = 1 TO A5: PRINT E$(I); ", "; : NEXT: PRINT
660 FOR I = 1 TO A6: PRINT F$(I); ", "; : NEXT: PRINT
670 FOR I = 1 TO A7: PRINT G$(I); ", "; : NEXT: PRINT
680 FOR I = 1 TO A8: PRINT S$(I); ", "; : NEXT: PRINT
690 FOR I = 1 TO A9: PRINT H$(I); ", "; : NEXT: PRINT
700 END
797 '
798 ' Redundancy Checker.
799 '
800 CLS : C = 3: Z = A1 + A2 + A3 + A4 + A5 + A6 + A7 + A8 + A9
810 IF A1 / 2 = INT(A1 / 2) THEN P = A1 / 2
812 IF A1 / 2 <> INT(A1 / 2) THEN P = INT(A1 / 2) + 1
814 FOR I = 1 TO P: LOCATE 1, 1: PRINT INT(I / Z * 100); "% done": FOR J = 1 TO A1
815 IF A1 / 2 <> INT(A1 / 2) THEN P = INT(A1 / 2) + 1
816 IF I <> J THEN IF A$(I) = A$(J) THEN LOCATE C, 1: PRINT "Redundant:"; A$(I); " at "; I; " and "; J: C = C + 1
818 NEXT: NEXT
820 IF A2 / 2 = INT(A2 / 2) THEN P = A2 / 2
822 IF A2 / 2 <> INT(A2 / 2) THEN P = INT(A2 / 2) + 1
824 FOR I = 1 TO P: LOCATE 1, 1: PRINT INT((A1 + I) / Z * 100); "% done": FOR J = 1 TO A2
825 IF I <> J THEN IF B$(I) = B$(J) THEN LOCATE C, 1: PRINT "Redundant:"; B$(I); " at "; I; " and "; J: C = C + 1
826 IF I <> J THEN IF B$(I) = B$(J) THEN LOCATE C, 1: PRINT "Redundant:"; B$(I); " at "; I; " and "; J: C = C + 1
828 NEXT: NEXT
830 IF A3 / 2 = INT(A3 / 2) THEN P = A3 / 2
832 IF A3 / 2 <> INT(A3 / 2) THEN P = INT(A3 / 2) + 1
834 FOR I = 1 TO P: LOCATE 1, 1: PRINT INT((A1 + A2 + I) / Z * 100); "% done": FOR J = 1 TO A3
836 IF I <> J THEN IF C$(I) = C$(J) THEN LOCATE C, 1: PRINT "Redundant:"; C$(I); " at "; I; " and "; J: C = C + 1
838 NEXT: NEXT
840 IF A4 / 2 = INT(A4 / 2) THEN P = A4 / 2
842 IF A4 / 2 <> INT(A4 / 2) THEN P = INT(A4 / 2) + 1
844 FOR I = 1 TO P: LOCATE 1, 1: PRINT INT((A1 + A2 + A3 + I) / Z * 100); "% done": FOR J = 1 TO A4
845 IF A4 / 2 <> INT(A4 / 2) THEN P = INT(A4 / 2) + 1
846 IF I <> J THEN IF D$(I) = D$(J) THEN LOCATE C, 1: PRINT "Redundant:"; D$(I); " at "; I; " and "; J: C = C + 1
848 NEXT: NEXT
850 IF A5 / 2 = INT(A5 / 2) THEN P = A5 / 2
852 IF A5 / 2 <> INT(A5 / 2) THEN P = INT(A5 / 2) + 1
854 FOR I = 1 TO P: LOCATE 1, 1: PRINT INT((A1 + A2 + A3 + A4 + I) / Z * 100); "% done": FOR J = 1 TO A5
856 IF I <> J THEN IF E$(I) = E$(J) THEN LOCATE C, 1: PRINT "Redundant:"; E$(I); " at "; I; " and "; J: C = C + 1
858 NEXT: NEXT
860 IF A6 / 2 = INT(A6 / 2) THEN P = A6 / 2
862 IF A6 / 2 <> INT(A6 / 2) THEN P = INT(A6 / 2) + 1
864 FOR I = 1 TO P: LOCATE 1, 1: PRINT INT((A1 + A2 + A3 + A4 + A5 + I) / Z * 100); "% done": FOR J = 1 TO A6
866 IF I <> J THEN IF F$(I) = F$(J) THEN LOCATE C, 1: PRINT "Redundant:"; F$(I); " at "; I; " and "; J: C = C + 1
868 NEXT: NEXT
870 IF A7 / 2 = INT(A7 / 2) THEN P = A7 / 2
872 IF A7 / 2 <> INT(A7 / 2) THEN P = INT(A7 / 2) + 1
874 FOR I = 1 TO P: LOCATE 1, 1: PRINT INT((A1 + A2 + A3 + A4 + A5 + A6 + I) / Z * 100); "% done": FOR J = 1 TO A7
876 IF I <> J THEN IF G$(I) = G$(J) THEN LOCATE C, 1: PRINT "Redundant:"; G$(I); " at "; I; " and "; J: C = C + 1
878 NEXT: NEXT
880 IF A8 / 2 = INT(A8 / 2) THEN P = A8 / 2
882 IF A8 / 2 <> INT(A8 / 2) THEN P = INT(A8 / 2) + 1
884 FOR I = 1 TO P: LOCATE 1, 1: PRINT INT((A1 + A2 + A3 + A4 + A5 + A6 + A7 + I) / Z * 100); "% done": FOR J = 1 TO A8
886 IF I <> J THEN IF S$(I) = S$(J) THEN LOCATE C, 1: PRINT "Redundant:"; S$(I); " at "; I; " and "; J: C = C + 1
888 NEXT: NEXT
890 IF A9 / 2 = INT(A9 / 2) THEN P = A9 / 2
892 IF A9 / 2 <> INT(A9 / 2) THEN P = INT(A9 / 2) + 1
894 FOR I = 1 TO P: LOCATE 1, 1: PRINT INT((A1 + A2 + A3 + A4 + A5 + A6 + A7 + A8 + I) / Z * 100); "% done": FOR J = 1 TO A9
896 IF I <> J THEN IF H$(I) = H$(J) THEN LOCATE C, 1: PRINT "Redundant:"; H$(I); " at "; I; " and "; J: C = C + 1
898 NEXT: NEXT
899 LOCATE 1, 30: INPUT "<RETURN> "; JUGGERNAUT$: RUN
990 '
991 '
992 ' DATA starts here.  A '*' follows each list to denote
993 ' each list's end.   do  1/18/93
994 '
995 '
996 ' Articles/Possessives
997 '
1005 DATA Bob's,the,a,each,every,my,his,your,its,Gumby's,Hidalgo's,Adolf's,Hilda's,Otis's,Papa Smurf's,yo' Mama's,Spino's,I wonder whose,Mr. Marroquin's,Mrs. Schweikert's,Mr. Crane's,Coach Edge's,Mrs. Drigger's
1010 DATA Bill Clinton's,Mr. Burton's,Roland's,Pepe's,Pedro's,Guadalupe's,Ralph's,Linda's,Gomez's,Raul's,Mr. Sloop's,Dr. Spanky's,Fred's,Larry's,Nabisco's,Rudolph's,Farley's,Hitler's,Benito's,Caesar's,the czar's
1015 DATA Dr. Jackson's,Mother's,Father's,Douglas Byrd's,Woody's,Sam's,Norm's,Napoleon's,Santa's,Sally's,Fatso's,Gorbachev's,Rasputtin's,Wolfgang's,Cuthbert's,Wilberforce's,Ernest's,Bryce's,Sinead's
1020 DATA the Salvation Army's,George Bush's,the Archduke's,der Fuhrer's,the Pope's,"Peter, Paul, and Mary's",Frank's,Cisco's,Colin Powell's,the bishop's,Bill Cosby's,David Letterman's,Phil Donahue's,Martin Scorcese's
1025 DATA Balbir's,Bobcat's,the Doctor's,Icabod's,Isaac's,Claybourne's,Ross Perot's,Dukakis's,Sir Gawaine's,Bouregard's,Oprah's,Leroy's,Jerome's,Augustus's,Lumpy's,Skippy's,the Emperor's,the Jedi's,the Magi's,Bilbo's
1030 DATA il Duce's,Barnaby's,Elfie's,Godzilla's,Pokey's,Goo's,Prickle's,Octavian's,Julius's,Reginald's,Archibald's,King Tut's,Orko's
1989 DATA *
1990 '
1991 ' Adjectives
1992 '
2000 DATA random,rather small,rather large,smelly,humongous,illegitimate,green,nasal,slick,greasy,brown,Austrian,befuddled,exploding,furry,sticky,pus-filled,fiery,scaly,fleshlike,tattered,lustful,adulterous,cleanly
2005 DATA technological,crunchy,sour,imprisoned,puffy,grainlike,peaceful,elongated,funguslike,somewhat erotic,flaky,leathery,moistened,crusted,distended,engorged,pressurized,mellifluous,livid,mischievous,vicious
2010 DATA malignant,benign,surgical,dancing,mountain climbing,lost,prickly,gangliated,castrated,bulging,exuding,calm,bouncing,gleeful,caustic,discorporeal,hard,filmy,dispassionate,red,spacious,Jewish,three-dimensional
2015 DATA touching,borderline,youthful,wet,sedimentary,volcanic,surprised,phallic,icy,shaky,trembling,heroic,suicidal,maniacal,emaciated,obese,real,beautiful,ugly,numerous,ferocious,preserved,rotted,mutinous,mutated
2020 DATA blasphemous,sacrilegious,ceremonial,pubic,putrid,fetid,urban,gargantuan,creamy,opaque,transparent,unctuous,crimson,gory,tepid,stupid,redundant,musical,resonant,rotund,roundabout,laughable,amusing,carnivorous
2025 DATA confused,retarded,moronic,stupefied,woody,stiff,exorbitant,squeaky,rancorous,coffered,gastrointestinal,giant,static,gravitational,massive,stringy,rampant,irrevocable,bombastic,stoic,impermeable,linguistic,curly
2030 DATA pewter,encrusted,dusty,dank,foggy,infantile,bubonic,boyish,girlish,pursed,singular,puzzling,very irregular,incontinent,senile,screaming,sexy,garish,gaudy,homophobic,dashing,dazzling,spiritual,ropy,thread-like
2035 DATA soft,mushy,juicy,wacky,loony,stooge-like,mankey,waggish,jocular,sharp,adhesive,educational,parenthetic,pathetic,ravishing,whimpering,squalid,rampant,gleaming,wanton,distinguished,enthralled,faltering,implacable
2040 DATA nictitating,fruity,ravenous,impertinent,intrepid,diligent,fastidious,ebullient,bilingual,clotted,calculated,pure,pristine,philistine,best-selling,popular,well-liked,mangy,holy,baby-faced,Scottish,farty,hairless
2045 DATA pseudo-Utopian,that,this,many a,Danish,French,murky,simian,rubbery,strong,weak,Soviet,unified,dissected,separated,striped,soulful,bubbly,liquid crystal,orotund,soporific,sleepy,similar,powdery,powerful,first
2050 DATA second,third,fourth,thousandth,omniscient,hollow,junior varsity,daytime,nocturnal,flirtatious,honorable,rare,glowing,screeching,whining,exaggerated,hopelessly lonely,bionic,legendary,inhospitable,indigenous
2055 DATA influential,intuitive,substitute,hilarious,glorious,sophisticated,bubonic,pulpy,foggy,shrouded,ignorant,sagittal,smooth,rough,lacerated,protected,odoriferous
2060 DATA artsy-fartsy,bloody,soapy,grungy,fashionable
2989 DATA *
2990 '
2991 ' Subjects/Objects/Nouns
2992 '
3000 DATA ape,sponge,smegma,collection of smegma,penis,spam,can of spam,plate of spam,gangrene infection,topsoil,walrus,igloo,vaseline,yak,porpoise,mucous membrane,goose,scrotum,spleen,liver,lung,kidney,spine,pancreas
3005 DATA lesion,boil,papercut,locust,hangnail,foot,Kraut,wog,git,crump,motherboy,bowl of porridge,clam,pail,cervix,oyster,marmoset,hobbit,follicle,domain,battle,Simon or Garfunkel,king,leper,pus flareup,pus,lemming
3010 DATA cerebrum,crotch,excretion,fluid,groin,ostrich,psoriasis infection,hostile eruption,dandruff attack,father,empire,economy,retina,sphincter,pixie,pirate,taco,fairy,leprechaun,badger,lump,banjo,parrot,amoeba
3015 DATA vacuole,mitochondria,eunuch,rooster,water buffalo,panda,corpse,bosom,uterus,placenta,cavern of fun,spider monkey,carton of eggs,spelunker,Jew,saliva,alveoli,colon,marble,Pepe,polyp,cyst,baseball,sword
3020 DATA lippage,horn,pot of gruel,home run,youth,sediment,lava stream,phallus,foreskin,nostril,passageway,wildebeest,bag of candy,silverware,pool of vomit,bag of vomit,eyebrow,sibling,leaflet,Bible,outcry of blasphemy
3025 DATA fit of megalomania,suburb,metropolis,mandible,tooth,coating of enamel,wax,planet,meteor,orifice,aperture,flamingo,gorilla,crevice,fissure,axis,musician,toenail,cheese,oxymoron,paradox,vibration,mixture,gynecologist
3030 DATA gala,algae,hyena,telescope,jello,gelatin,tendon,connective tissue,digestive juice,bastard,matter,weight,density,audacity,Smurf,tallywhacker,lard,cellulose,granule,wrinkle,time,slave,breath,odor,emanation,corn
3035 DATA armpit,stub of delight,voltage,spark,utensil,spatula,drug,clitoris,bag of marijuana,injection of heroin,vile of crack,vile of cocaine,palmful of angel dust,tab of orange sunshine,tab of acid,tab of LSD,sperm cell
3040 DATA rose,hashish cake,quaaludes flashback,rock,blunt,hit of reefer,roach,spliff,Rastafarian daisy,alcoholic substance,laxative,siamang,stranger,duelist,gall stone,gibbon,sow,piglet,spirit,challenge,rash,tongue,hive
3045 DATA minister of faith,sex therapist,impotence,eyebrow,lawsuit,necktie,germ,jewel,protrusion,egg salad,koala
3050 DATA spam,highlander,sheep,haggis,cod,garland,barrel of chum,buccaneer,warthog,boar,pork rind,banana peel
3055 DATA telephone pole,insulation,sprocket,bullfighter,incision,glacier,double chin,polyglot,emperor of the Holy Roman Empire,Spanish air-traffic controller,will-o-wisp,bellhop,busboy,chauffeur,situation comedy,psychodrama
3060 DATA best-seller,bagpipe,buffalo,water buffalo,musk ox,chowder,water baby,jester,genus,rhododendron,subspecies,perineum,terrarium,aquarium,society,Utopia,xylem,relationship,prosperity,amendment,mammary gland,Skeen's duct
3065 DATA union,tarmac,silly putty,basketball,hockey stick,puck,goal,look of disdain,buckyball,particle,grid,gristle,sinus,eardrum,virginity,pencil,chart,computer,podiatrist,soup,leather jacket,cheekbone,gift,pimple,acne flareup
3070 DATA blackhead,philosopher,salmon,dragon,brownie,sphinx,howler monkey,supersoldier,butter,elf,gnome,porcupine,aardvark,anteater,insect,daddy long-legs,antelope,pawn,King of the Visigoths,Overlord of the West,phalange
3075 DATA bowels,Keeper of the Flame of Astaroth,Gatekeeper,Ralzebub,Lucifoo-foo,royalty,kangaroo,pulp,Ruler of the Dead,planetary fragment,succotash,facial hair,bushtit,sarcophagus,indention,nuclear warhead
3080 DATA presidential campaign,presidential candidate,wormfeast,bottle of vodka,legend,myth,ghost,apparition,banshee,Valkyrie,beeper,multiplexer,nipple,soloist,band,peninsula,house,block of flats,matchbox,apartment complex
3085 DATA optic nerve,halibut,dog license,stegosaurus,brontosaurus,brachiosaurus,triceratops,pterodactyl,element,atom,atomizer,centrifuge,jellybean,emu,imp,pike,shrimp,scalawag,carpetbagger,meltdown,Mongol,Tar-tar
3090 DATA barbarian,packet of tartar sauce,barnacle,scimitar,Viking,constellation,goblin,ogre,gremlin,hippo,giraffe,knight,motorcycle,frisbee,ringworm,tapeworm,growth of fungus,petri disk,sledgehammer,anvil,stirrup
3095 DATA thong,polo player,bag of chips,piano,vibraphone,megaphone,shoe,sock,underwear drawer,pile of junk,pile of trash,pile of compost,hood ornament,band of gypsies,vagabond,policeman,psychiatrist
3100 DATA cottage cheese-like discharge,first book of an endless Time-Life series,Time-Life operator,wrestling match,boxing match,boxer,pugilist,surge of energy,embassy,embassador,Rockette,Chippendale dancer,stripper
3105 DATA golf ball cleaner,washing machine,chart,handbasket,work of smut,mirror,block of asphalt,"pi쨅ta"
3989 DATA *
3990 '
3991 ' Verbs (Third person singular, present tense)
3992 '
4000 DATA licks,sucks,defecates,masturbated,chewed,swallows,oscillated,electrifies,joins,gilds,fuses,fornicates with,jumps in,plays with,falls in,hangs,eats,helps,passes,beats,grows into,snaps,buries,likes,becomes
4005 DATA wanders into,sharpens,lathers,forgets to explore,has a speech about,builds,counts,declares war on,slaps,does not inhale,forgets to cover,becomes volatile with the addition of,devolves into,burns,paints
4010 DATA often fondles,cremates,is revolted by the sight of,has a pet which has,enjoys,straps on,practices with,shines,deviates from,falls and worships,throttles,flogs,grapples with,knows lust of,cradles,spawns
4015 DATA herniates,can not fully understand,revolves around,enslaves,points in the direction of,leaks when containing,stretches the seams with,fills another one with,kills with,picks at,tugs at,blows,lacerates
4020 DATA operates on,accosts,runs away with,does away with,makes pulp of,cleaves,mashes,washes,checks,is sick because of,gives refuge to,deposits,plows over,reincarnates,never bends,drops,feels,bakes,extols coitus with
4025 DATA doesn't want to choreograph,spelunks,pops,knights,gyrates,wipes off,takes something away from,has a nostril-full of,takes Mother to,stares out of,keeps,makes a mixture inclusive of,takes care of,ices,shaves
4030 DATA brakes,kisses,thanks,flies into,locates,opens a box chock full of,has vomit containing,prepares,receives a canister filled with,removes,remains with,shakes,battles with,comes into contact with,exchanges blows with
4035 DATA eradicates,pages through,notifies,authorizes,becomes,has a rout with,argues over,slices open,scratches up,gauzes,staunches,issues a warrant on,thoroughly searches,scrutinizes,gazes at,squints at,summarizes
4040 DATA surrenders to,carries,has,dubs over,speeds past,dismembers,has an illicit liaison with,has a rendezvous with,despises,offers,staples Fred to,does,packs,stuffs,bleeds on,puts cellophane on,zips up,puts holes in
4045 DATA warps,disfigures,flies by,rains on,throws dung at,tapes up,reimburses,flatulates after eating,removes hair from,does not respond well to,gets coated with a layer of,makes a sublime reference to
4050 DATA gives a large sum of money to,has sex with,is killed by,bruises,detaches Larry from,carries the popular vote with,produces a vacuum on,extends curtesies for,flees upon the sight of,flattens,smokes,inhales
4055 DATA injects,absorbs,mistakenly eats,constructs a bonfire with,hallucinates after consuming,lights up,gets caught with,goes to jail due to possession of,is tested for,mixes up a batch of,is stained with,trips on
4060 DATA is stoned because of,gets dizzy from,is high due to,has steep levels of,sees pink elephants because of,is above the legal limit for,blacks out from,halts upon sight of,gasps at,is executed by
4065 DATA justifies the actions of,for a living instructs,hazards a glimpse at,gives injections to ease,capitulates,surrenders to,is making love to,drops a load on,says 'hello' to,does not bother with,invents
4070 DATA realizes the importance of,indiscriminately juggles,sacrifices,powers up on,is dilating,writes a program for,is secretly watching,is hiding in,stalks,sees George behind,recommends,co-pilots,is wallowing in
4075 DATA falsely accuses,sentences,constructs an edifice made only of,applies torque to,becomes truculent upon sight of,is a clone of,has held a grudge against,speaks endlessly about
4989 DATA *
4990 '
4991 ' Infinitives
4992 '
5000 DATA eat,sleep with,sleep on,lick,run towards,pick up,peel,defecate on,stand on top of,drive,wait for,describe,make fun of,delegate,puncture,circumsize,speak with,vibrate,moisten,wet,make love with,point at
5005 DATA grasp,choke on,choke,throttle,rearrange,invade,spoil,aggravate,rot,decompose,blister,smoke,gangliate,coalesce,feed,ignore,ask,command,force,shred,coerce,persuade,fuse,mangle,risk,expel,excommunicate,pardon,knight
5010 DATA bake,fry,scrape,scramble,thicken,coagulate,insert,leave out,fax,irritate,call,include,burn,heal,strike,forget,remember,dance,thrash,beleager,wish for,desire,throw up,mash,enlarge,light up,lose,let loose,unleash,flay,attack
5015 DATA rush,strip,inhale,divide,vaporize,inform,waste,soil,confuse,wash,bedazzle,bewilder,throw away,define,test,rely on,worry about,screw up,tease,wipe,smell,taste,feel,make,plaster,grip,grapple with,eat,pay attention to,relocate
5020 DATA repeat,form,shape,tend to,feed,ooze,bag,box,interrupt,silence,watch,be inside,give away,dress,tear,slurp up,gander at,stroll past,fire,whip up,kiss,plaster,ask,pander to,delegate,metamorphosize,wink at,lounge around,plunder
5025 DATA pillage,rape,raid,squander,smuggle in,drool on,quiz,regulate,vomit on,account for,feast on,rob,belittle,collect,write about,log the progress of,cannonize,verify,verify the existence of,double-check,strain,cook with,sleep on,lift
5030 DATA locate,punish,clean up,sub for,paint,translate,translate for,ponder,represent,make a fuss over,freeze,take note of,sweep,mop,comfort,confiscate,become intimate with,sing to,irritate,reinstate,shake it at,poke,prod,arouse
5035 DATA flop out,compliment,pasteurize,amuse,entertain,make faces at,wiggle,dress,salute,dance with,burst through,ionize,grease down,splatter bile on
5989 DATA *
5990 '
5991 ' Adverbs
5992 '
6000 DATA quickly,quietly,stupidly,slovenly,abstrusely,religiously,devoutly,nasally,redundantly,accidentally,secretively,vibrantly,arrogantly,bombastically,horrendously,disgustingly,shakenly,divinely,well,purposefully
6005 DATA purposelessly,smartly,decrepitly,wastefully,musically,happily,savagely,algebraically,graphically,humbly,intravenously,numerically,intelligently,convolutely,visibly,corrosively,odoriferously,notably,condescendingly
6010 DATA destructively,wonderfully,visually,graciously,generously,imperially,wretchedly,orally,blindly,deftly,adeptly,wrongly,tiredly,drunkenly,soulfully,wistfully,patronizingly,clandestinely,rosily,moronically,morosely
6015 DATA actively,gloriously,amazingly,surprisingly,voraciously,accusingly,embarrassingly
6989 DATA *
6990 '
6991 ' Interjections/Colloquialisms/Slang/Parenthetical Expressions
6992 '
7000 DATA hey,oh boy,yes,no,oh my God,hey Regis,dammit,gods and fishes,holy cow,ye gad,egad,Bohemia,Aargh,Humph,hello,ouch,wait,hurry,stop,look out,hot damn,good Lord,aack,Jesus,ay carumba,wah,yeow,pow,zap,zounds,gak
7005 DATA whoa,giddy-up,gosh,drat,darn,whew,plbbbt,thud,zoop,bong,bang,dang,holy shit,smack,at last,eureka,dude,boo hoo,whee,yee hah,heh heh heh,pssst,eeek,yikes,whoopee,whoop-de-doo,wait,by Jiminy,by George,by Jove
7010 DATA oh Henry,whoopsies,Odin's beard,by Odin,bowels of Loki,call Geraldo,oh, please,pleeeaase,I beg you kind sir,whoops,hold up,just a second,wait just a smeg,oh, smeg,huh?,what?,say what?,I say,how odd,how strange
7015 DATA fascinating,perplexing,what a revolting concept,eww,yuck,bleah,blah blah,urrp,woe is me,alas
7979 DATA *
7980 '
7981 '  The core:  Sentence Structures
7982 '
7983 '  (xxxxxxxxx)  -  Text always printed
7984 '  A,J,N,V,F,D,I,S:  Word forms
7985 '  (Articles, adjectives, nouns, verbs, infinitives, adverbs,
7986 '  interjections, and superlatives, respectively.
7987 '
7988 '
8010 DATA"(Stolen: )AJN(.)","(Missing: )AJJJN(.)","(Together, we shall rule this)N(!)","JJN(!  I hate that)JN(,)D(!)","(Our main problem:  the damn)N(.)","(Now I get it!  The)JJN(, not the)JJN(!)"
8020 DATA"(Don't ask why, just watch)AJN(.)","AJ(,)J(,)JN(?  No, I don't have one of those.)","(You didn't tell me that you had a)N(.)","I(, I say,)I(, this)N(is)S(my)N(.)"
8030 DATA"(My)N(cannot be)SAN(...it's rather)J(to even mention that to my)N(.)","I(...)AJN(...it was)D(...and...)D(moving about...and it was)J(and)J(as it...stalked my)N(...)","I(!  Somehow)AJN(has gotten into my colon!)"
8040 DATA"I(!  Somehow)AJN(has gotten into my)N(!)","('Give)AN(a chance, you people.  Some day, you shall see, it will become)SAN(.')","(I turned)AN(into)ANN(in order to accommodate my)N(.)","AN(is)J(, but)AN(is)J(.)"
8050 DATA"(He stood there,)D(smiling at)AN(.)","(Praise the)N(!)","(Long live the)N(!)","(God save the)N(!)","(Some people like)AN(while other people like)AN(.)","N(,)N(,)N(, and)N(: )J(.)"
8060 DATA"(You)JN(!  That's my)N(, tell)AN(to get his own)JN(!)"
8070 DATA"(Yes, I read the manual, but)AJN(is)SAN(.)","(Pardon me,)JN(, but is that your)JN(or just)AJN(?)","(Brutus usurped his throne too)D(.)","(Come on!  I've seen your)N(and you've probably had it in your pants the whole time!)"
8080 DATA"I(!  I forgot the)JN(that was in my)N(!)","(I enjoyed myself, although I really didn't understand why)AJNVAN(.)","(What a funny-looking)N(!)","ANN(!)","ANVAJN(?  Not after)AJNVAN(and)AJN(, it won't!)"
8090 DATA"I(!  Not enough)N(if)ANVAN(!)","I(!)AJJN(is in)AN(!)","JNN(?  What the hell does that mean?)","(What the)N(is going on?)","(I asked)AN(to be)J(.)","(Do not take)AN(to class.)","I(!  The)N(has become)SAN(!)"
8100 DATA"(Take this)N(and shove it!)","(To be or not to be, that is the)N(.)","(Listen to)AN(, stupid.)","(Stop that)N(!)","I(!  I said ')N(,' not ')N(.')","(You better take that damn)N(out of my)N(!)"
8110 DATA"(I'm warning you!  If you keep touching me with that)JN(, something)J(might happen to your)N(!)","(I did not realize that)AN(could fit inside)AN(.)","(My mistake was in assuming that it was)AN(.)"
8120 DATA"(But of course!  I always carry a spare)N(.)","(Don't mess with)AN(.)","N(force equals the mass of the)N(times the displacement of the)N(.)","(I have not shaved)AN(with)AN(.)","(The)N(joint is fastened to the)N(joint.)"
8130 DATA"(It pays to be)J(.)","D(and)D(.  That's how)AN(gets through life.)","(Sally beat)AN(in a test of wits.)","(Larry turned out that way because when he was a baby, he was)SAN(.)","I(, I'm choking on my own)N(.)"
8140 DATA"(Grandpa bought)AN(.)","(Look at that)J(bastard!)","AN(is a)J(twit!)","(Pack your bags with)AN(,)AN(,)AN(,)AN(, and, oh, don't forget)AN(.)","(They were happy in spite of that awful)N(.)"
8150 DATA"(I purse my)N(at your)N(.)","(Ignorant wog motherboy)N(.)","(He told me about his)N(, shifting)D(in his)N(.)","(I said 'No, I do not and never shall have a)N(stuffed with a)N(.')","(Donde esta la)N(de Pepe?)"
8160 DATA"(Take that)N(out of my)N(or I'll)D(force my)N(into your)N(!!)","JN(?  Well...piss on my)JN(!)","(How do you say ')AJ(,)J(,)JN(' in Esperanto?)","(Como se dice ')N(' en espanol?)"
8170 DATA"(What did Regis mean when he said ')J(and)J(is my)NN('?)","(If you mix)AN(and)AJN(together, the mixture will turn)J(and mutate into)ANN(.)","(The Pope)D(grasped the man's)N(and placed it in the sacred)N(.)"
8180 DATA"(After hours of medical study, the waggish student exclaimed ')I(!  His sexual organs look like)AN(!)","(I followed)AN(until I bumped into)ANN(.  At that time, I realized I was standing in a)N(puddle.)"
8190 DATA"(Oh, yeah, you)JN(?  Suck my)N(!)","(Praise the Lord; I saw the)N(!)","(...but when he's around)AN(, he's as)J(as a)N(!)","N(:  noun; a)J(kind of)JN(.)","(They're)J(and they're)J(...The)N(Family.)"
8200 DATA"D(, I learned my place in the)N(community.)","(Ingredients:  )N(,)N(,)N(for flavor and)N(as a preservative.)","(You slimy little)N(!  I've had enough of you and your)N(friends!  Take your)N(and get your)J(ass outta this)N(!)"
8210 DATA"(That's what you get for having)AN(in your)N(in your)N(.)","(That's what you get for having)AN(in your)N(.)","I(!  I was sitting on)AN(!)","(Do not groom)AN(during class.)","(Now that's a poor IQ for a glass of)N(!)"
8220 DATA"(Don't touch that)N(or you'll catch something.)","(A)N(is not a)N(or a)N(or a)N(.)","(Life is like a)N(,)D(wandering amidst the joy that is)AN(.)","I(!  I lost my)N(!)"
8230 DATA"(Synonyms for)N(:  )N(,)N(,)N(,)N(,)N(,)N(,)NN(, and)NNNNN(.)","(I'll have yours, Darling.  I love it.  I'm having)N(,)N(,)N(,)N(,)N(and)N(!)","(I can't take these)N(Vikings always chanting ')NN(' over and over again!)"
8240 DATA"(I'm a)N(, I'm OK...I sleep all night and I work all day.)","(I wish I'd been a)N(, just like my dear Papa.)","(This is an ex-)N(!)","(Eat)N(and die, you son of a)N(!)"
8250 DATA"(May I take this opportunity to tell you that you are a)J(little smeg-head.)"
8260 DATA"(Gourmet)N(!  Bon appetit!)","(Does ')N(' really mean ')J('?)","(If you look carefully, you may see the wild)N(thrusher has eaten the)N(, but now it is being stalked)D(by a hungry red-breasted)N(.)"
8270 DATA"(The)N(concert began an hour ago.)","(No, you cannot wear)AN(.)","(It's your turn to give)AN(a bath.)","(Feed that)N(!)"
8280 DATA"(A good leader would be)J(,)J(,)J(,)J(,)J(,)J(, and)J(, and he or she would have an undying)N(for America.)"
8290 DATA"(My)N(does not smell right, and my)N(has the texture of a)N(.)","(You smell like a)JN(.)","(I am not fond of my)N(-in-law.)","(Oh!  YOURS is)J(!  I thought you meant MY)N(!)","(All I wanna do is use my)NNN(and-a)NN(!)"
8300 DATA"(Check, baby!  Check, baby:  )NN(!)","(Baby got)N(!)","(I'm so)J(!  I'm, I'm so)J(!)","(Happy)NN(day!)","(I'm so)J(I could cry!)","(What a dreary-looking)N(!  I would never buy one for my)N(!)"
8310 DATA"(The dignity of)AN(cannot exceed the)N(threshold.)","(Check, baby!  Check, baby:  )NNNN(; Check, baby!  Check, baby: )NNN(; Check, baby!  Check, baby:  )NN(; Check, baby!  Check, baby:)NN(;  Shake that)N(!)"
8320 DATA"(A)N(a day keeps the)N(away.)","(A fool and his)N(are soon parted.)","(Once upon a time, there was a great)N(who lived in a large)N(in the clouds.)"
8330 DATA"(Inventory: )N(,)N(,)N(,)N(,)N(,)N(,)N(, and)N(.  Ok, we're missing: )N(,)N(,)N(,)N(, and)N(, but we still have)AN(on special order.)","(Why can't I have a)N(?)","(You deserve that)N(more than anyone.)"
8340 DATA"(A horse is a)N(, of course, of course...)","(Give me my)NN(, please!)","(Give my drink a twist of)N(, would you?  And go easy on the)N(.)","(One for the)N(, two for the)N(, three to get ready, and)NN(!)"
8350 DATA"(Hey, Spike!  You're scaring my)N(!)","(Don't you step on my)JN(shoes!)","(The)N(factor has diminished in oh, so many ways!)","(Angel of)N(!)"
8360 DATA"(Oh, Lord, savior of)AN(, messenger of)AN(, keeper of the holy)N(, I call unto thee.)","(Fifth floor: )N(,)NN(,)N(,)N(,)NNN(, and)JN(.)","(Ashes to ashes, dust to)N(...)","(Bow to the)N(of the Kingdom of)AN(!)"
8370 DATA"(What's it like being)AN(?)","(...in)N(and in)N(, until)N(do you part?)","(Do you take this)N(to be your lawfully wedded)N(?)","(I now pronounce you)N(and)N(.)","(You may kiss the)N(.)"
8380 DATA"(...and they lived)D(ever after.)","AN(must live!)","(The ink is)J(.  The page is)J(.)","(Do you agree to tell the)N(, the whole)N(, and nothing but the)N(?)","(Just like Muhammad Ali, they called him ')N(!')"
8390 DATA"(Get from in front-a me, the)N(runs to me, my DJ's)J(, he's X, I call him ')N(,' ya know, he could cut a)N(from side to side...)","(I pledge allegiance to the)N(of the)JN(of America.)"
8400 DATA"(...o'er the land of the)N(, and the home of the)N(!)","I(!  We're under attack!  Every)N(to his post!)","IIIII(!  Did you see THAT??!?)","D(, I dub thee 'Sir)N('!)","(Thou hast an odd)N(betwixt thy)N(and thy)N(!)"
8410 DATA"(We are the knights who say: ')NNN('!)","(And we are the knights who say ')III('!)","(Goodness gracious,)J(balls of)NN(!)","(That's one melodramatic)N(!)","(Isn't that)N(romantic?)","(That's one)JN(!)"
8420 DATA"I(!  I beat you by a)N(and half of a)NN(!)","(Boris Becker's got a great big)N(in his nose, ha! Ha! Ha!)","AJN(...there's something)D(evil about it...)","(It won't work without)AN(.)"
8430 DATA"(Sooner or later we're gonna pay for)AN(!)","N(is to)N(as)N(is to)N(.)","(What's the matter with)AN(?  It's awful)J(lately.)","(He has the posture of)AN(.)","I(!  I thought I was rid of)AJN(!)"
8440 DATA"(It's my turn to lick)AN(.)","(Fun:  high voltage and my)N(.)","(Shut the)N(up!)","(Abso-)N(-in'-lutley!)","(Yes, Emperor)N(, I am painfully aware of your)NN(.)","(...and a)N(in a)N(tree.)"
8450 DATA"III(!  I've got more)NN(in my)N(than anybody!)","(Hey,)N(boy!  Meet)N(boy!)","(Critical mass will be achieved when)AN(inserts)AN(into itself.)","(I see no danger in allowing him to keep the stray)N(.)"
8460 DATA"(What'dya say 'bout)AN(?)","(All I said was ')JNN(' and)AN(got all)J(.)","(I swear it on my father's)N(.)","(Do not hold me accountable for the)N(incident.)"
8470 DATA"(I knew ')N(,' but I had to look up: )N(,)N(,)N(,)N(,)N(, and)NN(.)","(It is a classic tale of)N(,)N(, and)N(.)"
8480 DATA"(The main character emphasizes)AN(by using)AN(,)AN(,)AN(, and)AN(, but not as much as the other)N(evident in the sub-plot.)"
8490 DATA"(The director of)J(relations met with the)N(administrator and discussed the future of)AN(with the chairman of the)N(.)","(I want to be a)N(counselor when I grow up.)","(They call me ')N(.'  What a stupid nickname!)"
8500 DATA"(Make room in your heart for)AN(.)","(Make room for)AN(.)","(Find me a)N(real quick and give it to)AN(.)","(What a)JN(!)","(Would you like paper or)J(bags for your groceries?)","I(!  Hey...)I(!  Get the mop!  Get the...)I(!)"
8510 DATA"(You have the charm, wit, and intelligence of)AN(.)","(I'v seen a better)N(on my)JN(!)","(The nonorable knight was overcome by)AN(,)AN(, and)AN(, who all banded to vanquish to brave warrior.)"
8520 DATA"(What does)AN(have to do with)AN(?)","(What does)AN(have to do with it?)","(How do you make)ANN(?)","(How do you make a)N(?)","(How do you make a)NN(?)","I(!  That)N(needs a haircut!)"
8530 DATA"AN(oozed ever so)D(into)AN(.)","AN(does not match)AN(, but)AN(would complete my)N(outfit.)","(Supreme divine authority comes from a mandate from the masses, not because some watery)N(threw a)N(at you.)"
8540 DATA"(We will never complete the quest for the Holy)N(.)","(Holy)N(!  Oh my)N(!  I've been bitten by)AN(!)","(You)J(pile of)N(droppings!  I've had enough of you, you)J(,)J(,)JN(!)","(Shut your)J(gob, you)N(!)"
8550 DATA"(Oh, yeah, it's not difficult to grow weary of)AN(.)","(What a lousy)N(!)","(You remind me of)AN(.)"
8555 DATA "(You can't say ')N(' on the radio.  Or ')N(,' or ')N(,' or ')NN(.')","(Eventually I'm gonna get damn sick of that)N(.)"
8560 DATA "(No, I won't let you)FAN(.)","(I like to)FAN(.)","F(that)N(, right now!)","(If you don't)F(my)N(as soon as possible, you will suffer the consequences.)","(Do you like to)F(that)N(often?)","(To)F(or not to)F(, that is the question.)"
8565 DATA "(The rules are:  A> Always)F(your)N(;  B>  Never)F(your)N(.)"
8570 DATA "(Sure, I always)F(my)N(.)","(What?!  You never)F(your)N(?)","(I find it difficult to)FAN(.)","(Is it possible to)FAN(?)","(If you won't)F(the)N(, I'll do it myself!)","(Yes, dear, you may)FAN(.)"
8575 DATA "(You see, I...oh, God...I used to...to...uh...)F(the, um...well, the neighborhood)N(...)"
8580 DATA "(I never)F(my)N(, and neither does that)N(.)","FN(and die!)","(Don't forget to)FAN(if)AN(is)J(.)","(Don't)F(that)N(or you'll catch something.)"
8585 DATA (Fred complained about the)N(he just bought.),"(Its)J(!  Its)J(!  Its)J(and)J(!  What a)N(!  And its mine!)","(Do you have any)N(poison?)","I(!  The)J(order of the)N(has sent my acceptance letter!)"
8590 DATA "(Don't stand like that!  You look like a)N(!)","I(!  Don't overreact...its just a)N(...albeit a)J(,)J(,)J(one...)","(But)AN(is not meant to)FAN(so it shall all come to naught!)"
8592 DATA "(I don't care how many times you)F(the)N(...it just won't work!)","(Okay, one more time.  Don't)FAN(, don't)FAN(and whatever you do, don't ever)FANN(.)","(If you're going to)F(the)N(then do it right.)"
8594 DATA "(I don't want to)F(.)","(So who's gonna)FAN(?)","(I need a favor--can you)F(my)N(for me?)","(Okay, okay, I'll)F(my)N(tomorrow.)"
8596 DATA "I(!  I'll wipe it on my)N(!)","(It was about this long and it was attached to Dave's)N(...)","(Well, 'FBI' can't stand for Federal Bureau of)NNN(, can it?)","(I'll)F(HIS)N(as soon as I get the chance to)F(my OWN)N(.)"
8598 DATA "(A)NN(a day...well, it won't keep)AN(away will it?)","(I can't)FAN(because it's only legal in two states.)","F(this and)F( that!  This job is Hell on me and the)N(.)","(I really wish you'd)F(yourself!)"
8600 DATA "(Close your eyes and)F(that)N(for all it's worth!)","(He said he'd)F(me if I didn't)FAN(!)","(Don't try to)F(me!  I know the value of a)N(!)","I(!  Where's that)N(guy?)","(I'll go wherever I can)F(my)N(in peace.)"
8602 DATA "I(!  Yes!  I can)FAN(!  And you can't!)","(I did not realize my)N(was that dangerous.)","(Don't)FAN(!  Oh,)I(!  What a complete)N(!)","(Well)FAN(!  You were right about that)N(.)","(I'm so)J(I could)FAN(.)"
8604 DATA "(And I wonder, wonder who, buh doo-doo-doo...Who wrote the)N(of)N(?)","(Se쨚r le gusta el)N(, y habla mucho con la)N(.)"
8606 DATA "(Remind me to take my)N(home.  And don't leave my)N(in your car.)","(We're gonna have one helluva)N(tonight!)","(Let's get ready to)F(!!!)","(Pump up the)N(, pump it up, 'til yo')N(is movin'.)"
8608 DATA "I(!  The)N(colony is never on any of these maps.)","(So, whaddya say, baby?  Your)N(, or mine?)","(On my paper, the word ')N(' looked like the word ')N('.)
8610 DATA "(Under the)N(downtown, is where I drew some)N(.)","(Leave that damn)N(at home.  If you bring it to the wedding, I will)F(you.)"
8612 DATA "(Your)NN(is embarrassing me again.)","(I see that the)N(and the)N(get along quite well.)","(Stop!  Collaborate and)F(!  Ice is back with a brand new)N(!)","(So let's go at it,)N(, 'cuz I'm gonna)F(you up.)"
8614 DATA "(I hate)N(-huggers.)","(Every)N(is sacred.)","(Isn't it fun to charter a)N(, on the wide open)N(sea.)","(Sit on my)N(, and tell me that you love me.  I'll sit on your)N(and tell you I love you, too.)"
8989 DATA *
8990 '
8991 ' Superlatives
8992 '
9000 DATA as large as,as big as,not as small as,bigger than,as smelly as,as sexy as,as radioactive as,smaller than,slower than,faster than,as fast as
9290 DATA *
9990 '
9991 ' Read the data
9992 '
10000 A1 = 0: A2 = 0: A3 = 0: A4 = 0: A5 = 0: A6 = 0: A7 = 0: A8 = 0: A9 = 0
10005 CLS : C = 5: A$ = "<<  Reading Words  >>:gosub 500"
10010 READ A$: A1 = A1 + 1: IF A$ = "*" THEN A1 = A1 - 1: GOTO 10030
10020 GOTO 10010
10030 READ A$: A2 = A2 + 1: IF A$ = "*" THEN A2 = A2 - 1: GOTO 10050
10040 GOTO 10030
10050 READ A$: A3 = A3 + 1: IF A$ = "*" THEN A3 = A3 - 1: GOTO 10070
10060 GOTO 10050
10070 READ A$: A4 = A4 + 1: IF A$ = "*" THEN A4 = A4 - 1: GOTO 10090
10080 GOTO 10070
10090 READ A$: A5 = A5 + 1: IF A$ = "*" THEN A5 = A5 - 1: GOTO 10110
10100 GOTO 10090
10110 READ A$: A6 = A6 + 1: IF A$ = "*" THEN A6 = A6 - 1: GOTO 10130
10120 GOTO 10110
10130 READ A$: A7 = A7 + 1: IF A$ = "*" THEN A7 = A7 - 1: GOTO 10150
10140 GOTO 10130
10150 READ A$: A8 = A8 + 1: IF A$ = "*" THEN A8 = A8 - 1: GOTO 10170
10160 GOTO 10150
10170 READ A$: A9 = A9 + 1: IF A$ = "*" THEN A9 = A9 - 1: GOTO 10200
10180 GOTO 10170
10200 RETURN
10205 RESTORE
10210 Z = A1 + A2 + A3 + A4 + A5 + A6 + A7 + A8 + A9: LOCATE 8, 1: COLOR 6: PRINT "Complete lists total: "; Z; " entries.": COLOR 7
10220 FOR I = 1 TO A1
10230 READ A$(I): NEXT: LOCATE 12, 1: PRINT "     "; : LOCATE 12, 1: PRINT INT(A1 / Z * 100); "%": READ A$
10240 FOR I = 1 TO A2
10250 READ B$(I): NEXT: LOCATE 12, 1: PRINT "     "; : LOCATE 12, 1: PRINT INT((A1 + A2) / Z * 100); "%": READ A$
10260 FOR I = 1 TO A3
10270 READ C$(I): NEXT: LOCATE 12, 1: PRINT "     "; : LOCATE 12, 1: PRINT INT((A1 + A2 + A3) / Z * 100); "%": READ A$
10280 FOR I = 1 TO A4
10290 READ D$(I): NEXT: LOCATE 12, 1: PRINT "     "; : LOCATE 12, 1: PRINT INT((A1 + A2 + A3 + A4) / Z * 100); "%": READ A$
10300 FOR I = 1 TO A5
10310 READ E$(I): NEXT: LOCATE 12, 1: PRINT "     "; : LOCATE 12, 1: PRINT INT((A1 + A2 + A3 + A4 + A5) / Z * 100); "%": READ A$
10320 FOR I = 1 TO A6
10330 READ F$(I): NEXT: LOCATE 12, 1: PRINT "     "; : LOCATE 12, 1: PRINT INT((A1 + A2 + A3 + A4 + A5 + A6) / Z * 100); "%": READ A$
10340 FOR I = 1 TO A7
10350 READ G$(I): NEXT: LOCATE 12, 1: PRINT "     "; : LOCATE 12, 1: PRINT INT((A1 + A2 + A3 + A4 + A5 + A6 + A7) / Z * 100); "%": READ A$
10360 FOR I = 1 TO A8
10370 READ S$(I): NEXT: LOCATE 12, 1: PRINT "     "; : LOCATE 12, 1: PRINT INT((A1 + A2 + A3 + A4 + A5 + A6 + A7 + A8) / Z * 100); "%": READ A$
10380 FOR I = 1 TO A9
10390 READ H$(I): NEXT: LOCATE 12, 1: PRINT "     "; : LOCATE 12, 1: PRINT "100 %": READ A$: CLS
10400 RETURN
19997 '                                                                     
19998 '  Now, all the sentence cleaner-uppers.                              
19999 '                                                                     
20000 IF MID$(C$, 1, 1) = " " THEN C$ = RIGHT$(C$, LEN(C$) - 1)
20100 FOR I = 1 TO LEN(C$) - 1
20110 A$ = MID$(C$, I, 1)
20120 B$ = MID$(C$, I + 1, 1)
20130 IF A$ = " " AND (B$ = "," OR B$ = "." OR B$ = ":" OR B$ = "!" OR B$ = "?" OR B$ = ";") THEN C$ = LEFT$(C$, I - 1) + RIGHT$(C$, LEN(C$) - I)
20140 NEXT
20200 RETURN
21000 A = ASC(MID$(C$, 1, 1))
21100 IF A > 96 AND A < 123 THEN C$ = CHR$(A - 32) + RIGHT$(C$, LEN(C$) - 1)
21200 RETURN
22000 Z$ = MID$(C$, 1, 2): IF Z$ = "A " THEN X$ = MID$(C$, 3, 1): IF X$ = "a" OR X$ = "A" OR X$ = "e" OR X$ = "E" OR X$ = "i" OR X$ = "I" OR X$ = "o" OR X$ = "O" OR X$ = "u" OR X$ = "U" THEN C$ = "An " + RIGHT$(C$, LEN(C$) - 2)
22007 FOR I = 1 TO LEN(C$) - 2
22010 A$ = MID$(C$, I, 3)
22020 IF A$ = " a " OR A$ = " A " THEN GOSUB 22800
22030 NEXT: RETURN
22800 IF A$ = " a " THEN C = 0: GOTO 22820
22810 C = 1
22820 B$ = MID$(C$, I + 3, 1)
22830 IF B$ = "a" OR B$ = "A" OR B$ = "e" OR B$ = "E" OR B$ = "i" OR B$ = "I" OR B$ = "o" OR B$ = "O" OR B$ = "u" OR B$ = "U" THEN F = 1: GOTO 22850
22840 F = 0
22850 IF F = 1 AND C = 1 THEN A$ = " An "
22860 IF F = 1 AND C = 0 THEN A$ = " an "
22880 C$ = LEFT$(C$, I - 1) + A$ + RIGHT$(C$, LEN(C$) - I - 2)
22890 RETURN
23000 X$ = ""
23010 X = 70
23020 Y = LEN(C$)
23030 IF X < Y THEN GOSUB 23100
23035 Y = LEN(C$)
23040 X = X + 70: IF X > Y THEN RETURN
23050 GOTO 23030
23100 FOR I = X TO 1 STEP -1
23110 IF MID$(C$, I, 1) = " " THEN C$ = LEFT$(C$, I - 1) + CHR$(13) + RIGHT$(C$, LEN(C$) - I): I = 1: Y = LEN(C$): RETURN
23120 NEXT: RETURN
23999 RETURN
24000 FOR I = 1 TO LEN(C$)
24020 IF ASC(MID$(C$, I, 1)) = 13 THEN PRINT "<ret>";
24100 PRINT (MID$(C$, I, 1));
24110 NEXT
30000 CLS : INPUT "Enter first 2 letters of word:"; QO$
30001 ZO = 1:
30010 FOR I = 1 TO A1
30020 IF LEFT$(A$(I), 2) = QO$ THEN PRINT A$(I)
30030 NEXT
30040 FOR I = 1 TO A2
30050 IF LEFT$(B$(I), 2) = QO$ THEN PRINT B$(I)
30060 NEXT
30070 FOR I = 1 TO A3
30080 IF LEFT$(C$(I), 2) = QO$ THEN PRINT C$(I)
30090 NEXT
30100 FOR I = 1 TO A4
30110 IF LEFT$(D$(I), 2) = QO$ THEN PRINT D$(I)
30120 NEXT
30130 FOR I = 1 TO A5
30140 IF LEFT$(E$(I), 2) = QO$ THEN PRINT E$(I)
30150 NEXT
30160 FOR I = 1 TO A6
30170 IF LEFT$(F$(I), 2) = QO$ THEN PRINT F$(I)
30180 NEXT
30190 FOR I = 1 TO A7
30200 IF LEFT$(G$(I), 2) = QO$ THEN PRINT G$(I)
30210 NEXT
30220 FOR I = 1 TO A9
30230 IF LEFT$(H$(I), 2) = QO$ THEN PRINT H$(I)
30240 NEXT
30247 '                                                        
30248 ' Search for redundant word                              
30249 '                                                        
30250 PRINT : INPUT "Enter two more letters:"; QO$
30260 GOTO 30010
40000 FOR I = 1 TO A2
40001 IF MID$(B$(I), 1, 1) = "s" THEN PRINT B$(I)
40002 NEXT
40003 END
41000 CLS : X = 1
41010 FOR I = 1 TO ZQ - 1
41030 IF CSRLIN > 20 THEN PRINT "<paused>  Hit RETURN   "; : INPUT ""; VV$: CLS : X = 1
41040 PRINT Z$(I); CHR$(13): NEXT: PRINT : PRINT : LOCATE 22, 1: PRINT "<done>  Save?  (y/n):"; : INPUT ""; A$
41050 IF A$ = "Y" OR A$ = "y" THEN PRINT : PRINT : INPUT "Filename   "; F$: IF F$ = "" THEN CLS : SHELL "dir": LOCATE 25, 1: PRINT : PRINT : INPUT "<Return>  "; OO$: CLS : GOTO 41050
41060 CLS : IF A$ = "Y" OR A$ = "y" THEN OPEN F$ FOR OUTPUT AS #1: FOR I = 1 TO ZQ - 1: PRINT #1, Z$(I): LOCATE 1, 1: PRINT INT((I / (ZQ - 1)) * 100); "% Completed.": NEXT: CLS : CLOSE #1: RETURN
41070 CLS : RETURN
41899 '                                                                     
41990 '                                                                     

