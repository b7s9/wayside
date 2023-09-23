-> intro

// --------------------------------
// VARIABLES
// --------------------------------

VAR decorationCount = 0

// --------------------------------
// CHOICES
// --------------------------------

=== choice1 ===
	+ [inspect fish] -> littimer
	+ [inspect coffin] -> coffin
	+ [DEBUG: inspect wooly friend] -> ljs
	+ [DEBUG: inspect pylon] -> pylon
	+ [DEBUG: inspect sage] -> uriah
	+ [DEBUG: inspect sword] -> weapons
	+ [DEBUG: inspect friend] -> egbert
	+ [DEBUG: inspect cauldron] -> cauldron
	+ [DEBUG: inspect hippie] -> pecksniff
	+ [DEBUG: inspect pile of junk] -> drone

=== choice2 ===
	+ [inspect wooly friend] -> ljs
	+ [inspect pylon] -> pylon
    + [DEBUG: inspect sword] -> weapons
	+ [DEBUG: inspect friend] -> egbert
	+ [DEBUG: inspect cauldron] -> cauldron
	+ [DEBUG: inspect hippie] -> pecksniff
	+ [DEBUG: inspect pile of junk] -> drone

// Jellychair will happen here

// content in choice3 is not yet complete
=== choice3 ===
	+ [inspect sage] -> uriah
	+ [inspect sword] -> weapons
    + [DEBUG: inspect cauldron] -> cauldron
	+ [DEBUG: inspect hippie] -> pecksniff
	+ [DEBUG: inspect pile of junk] -> drone

=== choice4 ===
	+ [inspect friend] -> egbert
	+ [inspect cauldron] -> cauldron
	+ [DEBUG: inspect hippie] -> pecksniff
	+ [DEBUG: inspect pile of junk] -> drone

// Plant will happen here
    
=== choice5 ===
	+ [inspect hippie] -> pecksniff
	+ [inspect pile of junk] -> drone
	
// Bunting will happen here

// Outros happen here
// END
// ---------------------------------------------------

// --------------------------------
// INTRODUCTION
// --------------------------------
=== intro ===
	The shore of the mottled lake is an unlikely meeting spot for friends, allies, or even acquaintances – but for the wanderers and vagrants of the Froglands, it almost feels like home.
    
	Some countless centuries ago, the world was struck by misfortune; in the days after, its people diminished, faded, and were replaced by new people – people of a different kind.
    
	Few of those that wander the new world carry the legacy of the old; they carry strange mutations, grimy haversacks, and interminable feelings of anxiety.
	
	There are few places to find comfort in the Froglands; walled communes and isolationist tendencies are common, and few are trusted to join the larger groups. It's safer that way.
    
	But on the shore of the mottled lake, on the wayside of a seldom-walked trade route, there is a place to sit, talk, and perhaps find camaraderie…
    
	-> choice1

// --------------------------------
// Littimer
// --------------------------------
=== littimer ===
    As you sit at the fire, soaking in its subtle warmth, you begin to feel the sometimes-familiar sensation of curious eyes burrowing into you.
    
    You look around for a sign of the mystery observer, but there doesn't seem to be anyone around. There's just the quiet sound of the wind, and the lapping of the lakewater against the mossy islands.
    
    You turn your head back to the fire, and there it is. Staring at you.
    
    @audioPlay:looking-frogward-to-the-end
    @image:littimer
    
    The creature doesn't say anything when you express your surprise at its sudden appearance. It just smiles.
    
    After a moment, your eyes are drawn to the creature's one item of clothing: a pair of blue, denim shorts. They notice you noticing, and flap their fins against their tummy in excitement.
    
    Finally, they say something.
    
    @chatStart:littimer_neutral
    
    You like my jawts?
    
    @chatEnd:null
    
    It's a question that's hard to answer. You've not seen anything quite like it before - such scandalously short shorts are certainly not the fashion in any of the communes you've visited.
    
    But there's a local rumour, some story you've heard about a person like this - something about a wasteland wanderer with a peculiar eye for style.
    
    You meet that peculiar eye - just one of them, since the creature's fish-like body means they have to stand slightly side-on in order to see you - and answer their question.
    
    Do you like their jawts?
    
	* [Yes] -> littimer2a
	* [No] -> littimer2b
    
=== littimer2a ===
    They curl the sides of their gawping mouth like a feasting sturgeon - you think that's a smile - and pat their tummy again, excited.

    @chatStart:littimer_intense
    
    Littimer loves the joornts. Supercool!
    
    @chatEnd:null
    -> littimer3
    
=== littimer2b ===
    The fish-man seems saddened, and for a moment you're worried that honesty was not the best policy. But then they speak. 

    @chatStart:littimer_sad
    
    That's okay. Littimer likes them. Good enough for Littimer.
    
    @chatEnd:null
    -> littimer3
    
=== littimer3 ===
	A peaceful moment passes, and the mood between you seems to lighten up. Littimer doesn't seem like a threat. Just another traveller, looking for the warmth of a pyre.
    
	@audioStop:looking-frogward-to-the-end
    
	-> choice2

// --------------------------------
// Coffin
// --------------------------------

=== coffin ===
    ~ decorationCount += 1

	You find yourself drifting in and out of sleep as the long night drags on. That is until the sound of the sound of grinding metal and clanking pierces the peaceful ambience.
    
	It's easy enough to locate the source. Down by the water, beyond the mossy berms, a grey-blue box rocks in the gentle laketide.
    
	@audioPlay:coffin
    
	@image:coffin
    
	The thing is big and square and sealed tight, with something like a porthole at the top of its front face. It almost looks like a piece of old-tech - something you'd expect to find in the collection of the salvopriests.

    Maybe it's worth something, but it's far too huge to move without the aid of some sort of crane. It's strange, given its weight, that it was seemingly able to wash up on the shore at all.
    
    You wonder what its purpose is. Perhaps some kind funerary box? It seems like it has the right proportions for a coffin. But how did it get here? And if it is a coffin...is there someone inside? 
    
    On further inspection, you find a frayed black rope around the midsection of the box; it leads down into the water, so you try pulling on it. That action quickly reveals that there's something attached on the other end. You keep pulling.
    
    What emerges from the water is a ragged fishing net, containing a peculiar catch: a bundle of crates. Tough plastic cubes, sides smeared with muck from the lakebed as if they had been used as dredging tools.
    
    With a little effort, the lids pop open, and their contents are revealed: in each, a mass of green moss - like a protective layer for the real treasure underneath.
    
    Beneath the squelchy moss layer are dozens and dozens of books, packed neatly, but waterlogged and stained. As you lift them from their watery caskets, some of them come apart in your hands, turning to valueless mush.
    
    There are a few that can be salvaged - those that were protected from the moisture by virtue of being tucked beneath a dozen soggier books, a couple in watertight bags, some with laminated pages.
    
    But in all of them, the crinkled pages are filled with runes and symbols you don't recognise. Some forgotten language - nothing new.
    
    Still, they're pretty to look at. So engaging, in fact, that as you're flipping through the pages, you almost don't notice the rope tighten, and the net begin to slide.
    
    For a second, it seems as if the crates are moving on their own...until you hear it again: the sound of grinding metal.
    
    You turn, and can't quite believe your eyes. The coffin is moving. Walking.
    
    Somehow, whilst you were distracted, the thing must have managed to lift itself up from the silt. On stubby little legs, the metal box, the coffin, machine...whatever it is, has made it halfway up the berm.
    
    You quickly catch up to it, but as soon as you do, a red light flashes from its porthole, and it drops down like a stone, telescoping the hidden legs back into its body.
    
    The sudden, panicked movement imparts a shake on the top-heavy automaton's body, and on the unsteady ground, it keels to the side, slamming into the wall of the nearby ruin with a heavy thud.
    
    Then, it stays there. Silent.
    
    You wait for it to move again, but it doesn't.
    
    As you collect the salvageable books, you keep a careful eye on the walking box. But still it remains dormant, as if embarrassed, scared or broken.
    
    Eventually, you give up waiting for it to wake, and try to go back to sleep. You drift off, and expect it to be gone when you open your eyes. But it isn't...so there's little else to do but accept its presence.
    
    Perhaps, one day, a passing traveller might offer some insight into what this thing is, or be able to decipher the unknown code in the books it brought. But for now, the walking coffin slumbers.

    
	@audioStop:coffin

	-> choice2

// --------------------------------
// lexis, Jude, Sparks
// --------------------------------

=== ljs ===
	It’s a peaceful night, and the nocturnal denizens of the area are out and about, filling the air with their various calls and croaks – mostly croaks. You decide to close your eyes and contemplate the soundscape for a time, letting it all soak in.
    
	Then, suddenly, you hear a voice cutting through the ambience.
    
	@audioPlay:bubbly
    
	@image:ljs
    
	@chatStart:jude_neutral
	
	Is that a CAMPYRE!?
	
	@chatEnd:null
    
	You try to ignore the commotion and keep your eyes closed. But then you hear a rhythmic series of huge, loud splashes approaching your position. You open your eyes and peer out across the misty darkness of the lake, and hear a flustered shout.
	
	@chatStart:lexis_neutral
	
	SLOW DOWN, JUDE!
	
	@chatEnd:null
    
	At first, you don’t see anything more than a vague, gargantuan shape. Something big is running right for you. You get ready to run, but as it gets closer you start to make out some fuzzy features. Not ‘fuzzy’ as in ‘hazy’ or ‘blurry’, ‘fuzzy’ as in…well…covered in fuzz!

    You’ve seen creatures with hair and fur before, but this one is covered head to toe in long, thick fur…
    
    …better make that “heads to toe”, actually.The figure has two distinct heads, and two distinct necks – one of them with an overjoyed expression and a pinpoint focus on the campyre.
    
    The other head is wearing an exasperated and overwhelmed expression, and seems to be trying to pull their shared body away, in the other direction.
    
    @chatStart:lexis_neutral
	
	JUDE! NOT AGAIN! YOU’RE GONNA SOAK THE PYRE!
	
	@chatEnd:null
	
	The excited head – Jude, apparently — suddenly adopts a near-mortified expression, and instantly starts pulling away as well. The left half of the animal tries to plant its limbs in the ground to completely slow its momentum and the right half skitters to a halt, causing a big wave to build in front of them.

    Luckily, the wave dissipates before it reaches the campyre. In a much quieter voice – though one that’s still relatively loud due to the creature’s size – the recuperating right head speaks

    @chatStart:lexis_neutral
	
	…okay. Now that we’ve stopped, let’s walk over there. SLOWLY.

    @chatStart:lexis_neutral
	
	Right. Sorry for getting too excited…
	
	@chatEnd:null
    
    The now-resynchronised creature walks more elegantly toward you.

    The head on the left, Jude, eyes the campfire with glee; then, looking around, it spots you sitting.

	@chatStart:jude_neutral
	
	Hey! Do you have any gooey puffballs?
	
	@chatStart:lexis_neutral
	
	They don’t know what you’re talking about, Jude. Let’s at least introduce ourselves first.
	
	@chatStart:jude_neutral
	
	Right, sorry.
	
	@chatEnd:null
	
	The figure turns to address you, right half leading.
	
	@chatStart:lexis_neutral
	
	I’m Lexis – but you can call me Lex.
	
	@chatStart:jude_neutral
	
	I’M JUDE!
	
	@chatEnd:null
	
	Jude seems to have a habit of yelling; their voice is strikingly loud even when speaking in a softer tone. Your ears hurt.
	
	@chatStart:lexis_neutral
	
	And this here is Sparks.
	
	@chatStart:sparks_neutral
	
	...
	
	@chatEnd:null
	
	Lex indicates their tail and, to your surprise, it waves at you. The paw on the end of it seems to have a mind of its own.
	
	@chatStart:lexis_neutral
	
	We’re explorers, just passing through these parts. Mind if we sit with you?
	
	@chatEnd:null
	
	Jude is chafing with anticipation, and seems ready to burst with excitement. They seem to be waiting for Lex to stop speaking, you wonder if-
    
	@chatStart:jude_neutral
	DO YOU HAVE ANY GOOEY PUFFBALLS!?
	@chatEnd:null
    
	You’re not sure what a gooey puffball is, and your ears are starting to ring from all of Jude’s shouting, but you figure this friendly, threefold creature will at least be fun to hang out with.
    
	@audioStop:bubbly
    
	-> jellychair
    
// --------------------------------
// Pylon
// --------------------------------
=== pylon ===
    ~ decorationCount += 1
    
	You overheard some locals mentioning that the Salvopriests are coming by this area today to perform a Salvo Raising.
    
	You know something about the Salvopriests, heard bits and pieces of their doctrine from followers in the area or passing by. There’s a monastery not too far from here and the monks have come by before to help repair huts and tents after a great storm.
    
	@image:pylon
    
	You know that the tower by the campfire and a couple other structures in the area were Raised by the priests, but you’ve never seen a Raising actually happen. You might go check it out, if it isn’t too far out of the way.
    
	@audioPlay:salvopriests
    
	In the afternoon, an unusual sound starts to fill the air. It’s very subtle at first, very distant, but it’s getting closer.

    It’s a harmonious low droning, overlaid with rhythmic chantings of, as far as you can tell, Gibberish.
    
    It takes you a bit to make the connection, but you’re pretty sure the sound must be the ritual chanting of the Salvopriests you’ve heard would arrive today.
    
    The chanting keeps getting closer, and eventually you decide to move from your regular spot at the campyre and go take a look.
    
    Sure enough, just over the hills behind you, you see a procession of about 20 creatures of varying sizes wearing the distinctive blue robes of the Salvopriests. They’re walking, slowly and steadily, in a direction towards the campyre.
    
    Many locals are following alongside the procession, some watching with genuine interest, some laughing and jeering, some chanting along with them, either mockingly or reverently.
    
    The priests, who, last time you saw them, were very jovial and personable, are solemnly chanting with their hoods up and heads down, acting as though nobody else was around. Clearly this ritual, they believe, requires utmost reverence and focus.
    
    A good amount of the younger creatures are doing their best to try and make them flinch or break form, making a game out of it and having much fun. The priests don’t, however, flinch.
    
    Before you know it, the procession has reached your location, along with all the locals following them. It’s a lot more people than you’re used to being here, and you feel very nervous with such a big crowd.
    
    The procession continues forward, going past the campyre and wading out into the water, where the most persistent hangers-on finally break off and hang back to watch with the crowd. They’re definitely not walking on the water, but you could swear they aren’t sinking nearly as deep as they should be.
    
    The Salvopriests form a circle around a spot a bit of a ways into the water, and they finally stop chanting with a decisive shout on the last beat.
    
    All is still for a few moments.
    
    Then, the largest of the priests starts a very low, very quiet note, gradually increasing in volume. You now notice that the priests are arranged from largest to smallest around the circle.
    
    The second largest priest starts a slightly higher note, harmonising with the larger priest, again very quiet at first and gradually growing louder.
    
    This pattern continues around the circle, with each priest being smaller than the last and singing a higher note. All the while, there is a distinct change in the air, becoming dense and electric with energy.
    
    As the turn for the priests to sing approaches the end of the circle, a swirl of blue, flowing energy starts to form in the circle, over the water. 
    
    When the final, smallest priest begins their note, the energy flashes and sends shockwaves outwards, kicking up waves and gusts of wind.
    
    Then the blue energy starts to shoot up in branching, triangular patterns, forming a web that shoots high up out of the water. It’s an unstable formation at first, but the energy starts to converge on a particular permutation.
    
    Then, starting from below the water and moving upwards, the energy gradually condenses.
    
    It turns in on itself in endless complex folds until what you see is no longer blue energy, but a metallic surface in the web-like shape traced out by the energy earlier. At three points on the structure, on the tips of triangles, there form hanging beaded decorations of a different material.
    
    Where, just seconds ago, there was nothing but open air and water, there now stands a towering metal structure of undeniable beauty.
    
    The Salvopriests, now finished with their ritual, stand back and start to adopt more relaxed postures once again.
    
    The priests look upon this structure with more awe and reverence than a mother looks at their own child.
    
    Barely a word is spoken as the people gathered slowly peel off and return to their homes. The priests stay around the structure for as long as they can, but they have other duties to attend to.
    
    You stare at the pylon all night.

    
	@audioStop:salvopriests

	-> jellychair

// --------------------------------
// Jellychair
// --------------------------------

=== jellychair ===
	The calm of the night is shattered by a litany of screams.

    The voices are close, just beyond a cluster of dry underbrush at the edge of the camp. It sounds like they're in pain, but sometimes it almost sounds like pleasure.
    
    Whatever is happening, it's unnerving. The whole episode takes a few minutes to abate, and by that time you've armed yourself with a sturdy-looking stick.
    
    It takes a few moments to work up the courage to look, but beyond the dry hedgerow, the aftermath of whatever commotion is revealed.

    
	@audioPlay:jellychair
	@image:jellychair

    Out there, beyond the safety of the firelight, there's a cluster of dead trees that glow with a dim blue light. Just in front of the trees, there's a patch of ground littered with detritus.

    There's a dozen haversacks, blankets and other travelling equipment, along with other personal items strewn about. And, at the centre of the debris field, there's something odd.
    
    It looks like a blob of pink jelly, about the size of a chair. It's translucent, squat and wide - and at the rear, there's some sort of handcrafted structure made of intersecting pieces of wood.
    
    The more you think about it, the more the blob looks like a chair. It looks extremely comfortable. A soft, malleable surface that would perfectly cushion your backside, and a rigid back to keep your back straight. The perfect balance.
    
    But what happened here, in the clearing? Where did all the random items come from, and who was screaming? Why were they screaming?
    
    As you contemplate these questions, the warmth of the fire starts to seem far more hospitable than the cold, threatening landscape beyond the camp, so you play it safe. It's too much to figure out right now.
    
    You move around the strange chair, gathering up the most useful salvage you can find. Every so often, you think you hear something and look up, but there's no-one around.
    
    When you have everything together - a few jars of pickled vegetables, some blankets, and a dozen other little trinkets - you make your way back to camp. But something stops you. You turn back to look at the chair.
    
    Before you know it, you're dragging the blob-thing back to the camp. Gripping the backrest, it comes easily enough - the thing is much lighter than one would expect.
    
    You place it on one of the berms overlooking the fire. It seems like the right spot. You wouldn't want it to get cold.
    
    Over the next few hours, you keep looking over at it. It really draws the eye - like it's the perfect addition to the campsite.
    
    Sometimes, you swear it's smiling at you. You constantly imagine how incredible sitting on that chair would be. But something stops you - some basic mammalian instinct. It looks too comfortable.
    
    You try to get some sleep, and the chair appears in your dreams.
    
    In your dreams, the chair has a face. At the bottom of the jelly-blob, where it begins to curve downward, you swear there's a face. It's smiling at you.
    
    Later, when you check in a waking state, you can't find any evidence of a face. Pareidolia, perhaps.
    
    But then you start to hear a voice. It's a whisper at first. But over time it becomes clearer, and more persuasive.
    
    "sit on me :)"
    
    The voice is soft, and squeaky, like it's some tiny creature on your shoulder, or a voice inside your head. But you're sure it's not your own mind playing tricks on you.
    
    It's the chair.
    
    Suddenly, there is a war inside your mind. As you think about the exquisite comfort the mass of jelly and wood could provide, your instincts fight hard to resist. 
    
    Eventually, after some long bouts of staring at the chair, your instincts win out. At the end of your long sojourn, the chair is firmly registered as a threat. 
    
    But you just can't bear to get rid of it.

	@audioStop:jellychair

	-> choice3
    
// --------------------------------
// Uriah
// --------------------------------
=== uriah ===
    It’s just after midday, the sun has been beating down all day and the humidity is making it feel like being steamed alive. You are hunkered under the shade of a tree, sucking on the least rotten, least mutated fruit you could find, waiting for night to come.
    
    You hear the soft shuffling of footsteps and turn your head to get a look at whoever’s walking up.
    
    @audioPlay:uriah
    @image:uriah
    
    The source of the footsteps looks to be an old frog-man, walking slowly, carrying a staff and wearing robes.
    
    Wearing ROBES. In THIS weather. Heavy ones, too.
    
    You inquire if they are faring okay with the heat.
    
    @chatStart:uriah_happy
    
    Doing fine! Thank you! And how are you doing?

    @chatEnd:null
    
    You blink, a bit taken aback by just how cheery and energetic they seem given the conditions, but you assure them that you’re doing fine, as well.
    
    @chatStart:uriah_happy
    
    Glad to hear it!

    @chatEnd:null
    
    At this point you recognize the robes, the characteristic purple and that heavy material… you ask if they are a sage.
    
    @chatStart:uriah_happy
    
    I am indeed! Happy to be one, a sage is a mighty fine thing to be!
    
    @chatStart:uriah_neutral
    
    I hope you don’t mind, I was feeling a bit peckish and in need of rest. I was hoping to sit at the shore here and hopefully catch some flies!

    @chatEnd:null
    
    You indicate that you, indeed, don’t mind- but, wait… flies? You thought sages only ate fruits and mushrooms, and abstained from eating animals, even bugs.
    
    @chatStart:uriah_neutral
    
    A fruit, a fly, what difference does it make?
    
    @chatStart:uriah_satisfied
    
    You eat something, and that thing stops being what it was and becomes a part of you.
    
    @chatStart:uriah_happy
    
    One day, you’ll stop being you and become a part of something else. Everyone does it. The whole universe does!

    @chatEnd:null
    
    The old frog sits down with their legs in the water, and, while talking to you, eyes the flies hovering within reach of their tongue.
    
    @chatStart:uriah_happy
    
    The flies I’ve met don’t much mind becoming part of a frog. To them, it’s just the next thing in life.
    
    As a sage, that is a very wise perspective to learn from. I aspire to be as open to life as the flies!
    
    …speaking of…
    
    @chatEnd:null
    
    The sage flicks out a tongue and hits a fly dead-on, drawing it back into his mouth without hesitation. You can’t help but feel the scene a bit morbid, but the old frog grins broadly at you, seemingly oblivious.
    
    But then, they notice your discomfort, and their expression becomes more sombre.
    
    @chatStart:uriah_neutral
    
    I see the darkness in the situation, too. Those flies were just as alive as you or I, and I silently mourn every one.
    
    But! What am I gonna do? I’m a frog, I eat flies. Nothing in this world stays forever, no matter how precious, how sacred. When I die, the flies will get their revenge!
    
    @chatEnd:null
    
    They smile at you again, cheesily. This time you smile back.
    
    @chatStart:uriah_neutral
    
    We live in a time of much uncertainty, turmoil, and change.
    
    There are many who have a hard time adjusting to new circumstances; mutations, changing ideas about the world…
    
    But life, life is always the same. Life is change.
    
    @chatEnd:null
    
    They pause, and close their eyes, turning away to feel a gust of wind coming from the ocean.

    @chatStart:uriah_neutral
    
    Whatever changes may happen, it’s the natural expiration, renewal and evolution of forms, and the universe will be just as whole as it always is.
    
    @chatEnd:null
    
    …
    
    A long moment of silence passes, and the old sage continues to soak in the breeze, the ocean waves. You find yourself enjoying the scenery that much more.
    
    Eventually they get up, and turn towards you, bowing their head in respect and salutations, and shuffle on back the way they came.
    
    @audioStop:uriah

-> choice4

// --------------------------------
// Weapons
// --------------------------------
=== weapons ===
    ~ decorationCount += 1
    
    You're preparing some food when the first of the blurry shapes flits overhead. Then there's another, and another, and then they become hard to ignore.
    
    Before long, it's a black mass in the sky, and you know what it is. The mosquito-people are starting their annual migration, leaving their swampy hives to find warmer weather to the north.
    
    But they seem more hurried than usual. There's an erratic energy to their movement that's unusual to see. But still, the shifting swarm of migrants twists toward the horizon.
    
    It's a beautiful sight, even if their haste makes you wonder if you should also be fleeing.
    
    @audioPlay:weapons
    
    Just as you consider the thought of packing up your belongings and following, something falls from the swarm.
    
    It splashes into the water beside the fire, and disappears beneath the ripples. A dozen other items follow quickly after it, landing around the camp.
    
    Something small and round falls right in front of you.
    
    It passes through your vision in a split second, and lands with a heavy metallic clang on the surface of the table you were preparing food at.
    
    What you see when you look down is not what you expect to see.
    
    @image:weapons
    
    It's a turtle. With a knife strapped to its back.
    
    The knife is embedded in the wood, leaving the turtle to hang upside down. It cranes its neck up to see you, and you share a silent greeting.
    
    A nasally call from above breaks the strange tension between the two of you.
    
    Hovering outside the stream of flying bodies, a mosquito woman shouts down an apology, and adds that you can keep the things she dropped before promptly disappearing back into the swarm.
    
    Shortly after, the dark cloud departs, and you're left with your strange new gift. It seems only polite to unstick the knife and place the turtle upright.
    
    It doesn't do much else but stare at you. Given the knife, it's a little intimidating.
    
    Eventually, you place the turtle on the grass of the knolls around the fire, and go about searching for the other items that fell.
    
    It doesn't take long to find them, and it quickly becomes clear that there's a common theme: they're all weapons.
    
    There's a club with a nasty-looking nail. A sword with a second blade tied onto the end, and a root-blade that has begun to germinate.
    
    What you have is the beginnings of a small arsenal - one which could be used to arm and defend the camp, if it grows to be any larger.
    
    You feel compelled to place the collected weapons next to the turtle, and it seems pleased with the responsibility of becoming the camp's de-facto quartermaster.
    
    As the turtle settles into its role, you offer it some of the food you were preparing, but it refuses. It seems perfectly capable of fending for itself.
    
    In fact, you’re pretty sure you’re only alive because the turtle allows it.
    
    @audioStop:weapons

-> choice4

// --------------------------------
// Egbert
// --------------------------------

=== egbert ===
	The moment you wake up, directly in front of you, there sits a person you’ve never seen before.
    
	@audioPlay:egbert-choir
	// no stop required
	@image:egbert
    
	@chatStart:egbert_neutral
	Hey.
	@chatEnd:null
    
	They go back to looking around at their surroundings, each of their three eyes pointed in a different direction. They seem blissful.
    
    @chatStart:egbert_neutral
    
	Oh, I’m Egbert, by the way.
	
	@chatEnd:null
	
	…
	
	@chatStart:egbert_neutral
    
	You don’t mind if I sit here, right?
	
	@chatEnd:null
	
	…
	
	@chatStart:egbert_neutral
    
	Cool.
	
	@chatEnd:null
    
	…A slight breeze goes by, and you realise that everything is uncharacteristically, almost unbelievably still. It’s almost like this person is radiating calm into the environment…

    …

    @chatStart:egbert_neutral
    
	You know I almost died, like, this morning.
	
	@chatEnd:null
	
	Despite the perilous nature of this comment, the sense of calm in neither the person, nor the environment so much as wavers…

    @chatStart:egbert_neutral
    
	The whole rest of my crew died. They absolutely bit it, yeah.
	
	I’m a krill farmer. Super dangerous job, as you can imagine.
	
	One of my crewmates messed up the song we use to sedate the krill. She sneezed.
	
	@chatEnd:null
	
	…for the first time you see this person frown, and you feel a deep, intense anger coming from them, seemingly mad at the whole universe. Somehow the calm is not disrupted by this either. Not in the slightest…

    @chatStart:egbert_mad
    
    …It was a bloodbath…

    …I was the only one to survive…
    
    @chatEnd:null
    
    …
    
    …
    
    …she smiles again, then points to her loincloth.
    
    @chatStart:egbert_neutral
	Do you mind if I take this off?
	@chatEnd:null
    
	…
	
    @chatStart:egbert_smug
	Egbert: cool.
	@chatEnd:null
    
	She does.
	
	-> plant
    
    
// --------------------------------
// cauldron
// --------------------------------
=== cauldron ===
    ~ decorationCount += 1
    
	While out in the nearby woods, foraging for some mid-day grub, you find yourself in unfamiliar surroundings. After scanning the area for any recognizable landmarks, you concede that you are, indeed, lost.
    
    Trudging onward in hopes of finding your way again somehow, you stumble into a small clearing by a river. There’s a modest wooden hut here, with a thatched roof and smoke rising from a stone chimney. 
    
    Whoever is in this hut could help you find your way home, or they could be hostile. You’ve heard stories of creatures practising dark magic in these woods.
    
    @audioPlay:foraging-no-sfx
    
    Cautiously, you walk up to the door and, feeling bold, knock firmly. You are greeted by a short slug-woman, with long eyestalks and large tentacles with which she opened the door.
    
    @image:cauldron
    
    By her tattered black shawl and the characteristic pointed black hat, you are certain that this slug-woman is, indeed, a practitioner of the dark arts. She is a witch, and, judging by the large bubbling cauldron over her fire, a soup-witch, to be precise.
    
    Though you expected to run in this scenario, you find yourself oddly unshaken. Perhaps it is the witch’s disarming appearance. Regardless, you gather your courage and ask the soup-witch for directions.
    
    The soup-witch laughs gleefully, and gives you directions back to the lake in a sing-songy rhyme. The directions are clear and the riddle is easy to remember, so you move to thank the witch and be on your way.
    
    Before you can get out the first word, however, the witch says you look like someone who likes riddles and games. 
    
    Before you can respond to that, she proposes a wager: she’ll ask you three riddles. If you can answer a single one, she’ll give you a gift, but fail all three, and she will cook you into her soup.
    
    Before you can respond to that, she says she’s glad you’ll play along and starts saying the first riddle.
    
    [Imma be real with you, chief, we don’t have the energy rn to come up with three food related riddles but it would be a really cool addition to this passage so maybe we can put that in later]
    
    Her riddles are all obscure cooking lore, unknown to you. 
    
    What on earth is mayonnaise and how would one ‘de-emulsify’ it. 
    
    Now you have heard three riddles and failed to answer a single one correctly. You brace for the worst.
    
    But to your surprise, the soup-witch’s malicious expression suddenly gives way to more gleeful cackling, and she puts a tentacle on your shoulder in a reassuring way.
    
    She tells you that soup-witches don’t eat people. “Not usually” she adds with a grin and a wink. Besides, you’re not plump enough to be worth your broth.
    
    She apologises for pulling your leg, saying that she is very much want for company and mischief out here in these woods.
    
    She offers you her cauldron as a gift, which you try to reject at first, but which you accept after much insistence on her part. She also sends you off with a satchel of some pungent spices and some exotic ingredients you’ve never laid eyes upon. 
    
    As she bids you farewell, she thanks you for being a good sport, and tells you to always remember that a good meal is a gift meant to be shared with others.

    @audioStop:foraging-no-sfx
    
	-> plant

// --------------------------------
// Plant
// --------------------------------
=== plant ===

    It’s a warm night, you’re sitting enjoying the sounds of the crickets, and you’re about to go to bed when you hear a rustling nearby.
    
    @audioPlay:waterways

    You look in the direction of the rustling to see a haggard old frog stumbling through the brush, clutching a plant in a pot. His eyes meet yours, and after a momentary pause his expression goes from exhaustion to relief as he rushes over to you. 
    
    @image:plant
    
    When he gets to you, he wordlessly shoves the potted plant into your arms, and asks you, please, to take care of it for him. He wore a kind smile while saying this, but it wasn’t whole-hearted, as you could see in his eyes a deep sense of solemn desperation. 
    
    After you barely indicate that you will take care of the plant, he throws his arms up in glee and proceeds to walk off into the woods, clasping his hands together and muttering cheerfully. 
    
    You ask him to please stay, rest a while. You offer him some of your stew, but he refuses your offers. He says he won’t be needing things like stew, where he’s going.
    
    Before long he’s disappeared into the brush again, and in resignation, you turn to the plant in your arms. Something new to take care of.
    
    You try several different spots around the campfire for it, and every time you move it it readjusts its stalk to turn its petals away from the light of the fire.
    
    Once while moving it something sticky and wet drops on your arm. After closer inspection, it seems to be nectar from the plant, which is indeed dripping off the bulb.
    
    You decide to taste the nectar. It’s thick, overly sweet, and strangely… fizzy. You theorise that if you spread it on a tray and left it out to dry, it might make for an excellent snack.
    
    Thankfully, you come to find that the plant is not hard to maintain. 
    
    When the plant hasn’t been watered enough, its nectar becomes dry and yellowish. Its leaves will droop and whither if it hasn’t received enough moonlight. 
    
    @audioStop:waterways
->choice5


// --------------------------------
// Pecksniff
// --------------------------------
=== pecksniff ===
    
    @image:pecksniff
    @audioPlay:pecksniff

    @chatStart:pecksniff_neutral
    
    Hey, mate.
    
    The writers haven't finished giving a story yet.
    
    @chatStart:pecksniff_excited
    
    I hope they make me the hero who saves the day!!!
    
    @chatStart:pecksniff_doubt
    
    ...but probably not...
    
    @chatStart:pecksniff_neutral
    
    Anyway, try checking back later, and maybe the writers will have given me something interesting to say!
    
    @chatEnd:null
    
    @audioStop:pecksniff

->bunting



// --------------------------------
// Drone
// --------------------------------
=== drone ===

    ~ decorationCount += 1

    CRASH.

    It comes out of nowhere – an explosion of sound and soil, accompanied by a flurry of flying metal debris. With incredible violence, something has landed in the middle of your camp.
    
    You see it strike the earth, and there's a split second before the air quickly starts to fill with dust and smoke where you can see what it is. It's a machine.
    
    @audioPlay:drons-lament
    @image:musicDron
    
    Luckily, there's no damage done to anyone or anything besides the ground. But still, the sudden shock is disorienting. And it only gets more disorienting once the klaxon starts.
    
    It screeches three quick, abrasive tones, pauses, then loops – the sounds emerging from the smoke like the cries of a dying animal.
    
    Eventually, the animal dies. Its cries slow and slur until the loops start to stutter. Then they stop.
    
    Not long after, the smoke clears, and the thing that fell from the sky is fully revealed. Now, it looks like a heap of metal, but there are some familiar shapes.
    
    You recognise the object from tales you’ve heard – tales of a compound in the north that people call Dronpor. This is – was – one of its residents: a sleepless killing machine powered by the sun.
    
    The most common advice given regarding Dronpor is to avoid. it. No-one knows what the machines' purpose is, but they fiercely protect their territory. Nothing good to be found there, folks say, just flying death.
    
    Some have said they've seen the machines moving back and forth beyond the clouds. Whatever they do up there is anyone's guess.
    
    The flyer that has crash-landed in the camp must have come from far up. If you squint, you can see a trail of black smoke leading down to your camp from the dark skies above.
    
    Your gaze returns to the machine, and suddenly, some part of it reactivates. A glowing red eye locks onto you.
    
    You freeze, and brace yourself for annihilation.
    
    Moments pass. Time enough to make peace with your untimely end, but it doesn't come. Instead, the eye only glows brighter, accompanied by a high-pitched whine.
    
    You consider running for cover, finding some boulder to hide behind in the hopes that the monstrous robot doesn't simply shatter it into a rain of gravel.
    
    But still, nothing happens. The whine only climbs in pitch as the mechanical iris regards you with murderous intent. At least, that's what you assume. It looks angry.
    
    As the machine struggles to kill you, the stammering klaxon you heard earlier starts up again. It almost seems to harmonise with the whining, creating a disjointed electronic melody.
    
    After a while, you come to the conclusion that the machine loses no threat. You also become certain there's no way to turn it off.
    
    Hours pass like this, with the machine making its miserable mechanical music. The hunk of twisted metal is too heavy and too unwieldy to move, so you just leave it there.
    
    You're quite sure that the metal melody is a sign that the machine is trying to kill you. Occasionally it gives up, only to resume its attempts once your back is turned. But you get used to it.
    
    By the time dawn starts to break, you catch yourself humming along with it and smiling.

    @audioStop:drons-lament

->bunting


// --------------------------------
// Bunting
// --------------------------------
=== bunting ===

    The sound of familiar music grows steadily in the distance. It's faint at first, but the sound is unmistakable: the song of the circus.
    
    The thrumming of drums, the parping of horns, and the joyful chanting - it's a rare sound, but a welcome one. The Froglands are seldom blessed with a visit from the circus.
    
    There are a dozen settlements nearby, but none big enough to play host to the troupe. They're likely on their way to fairer and more prosperous lands.
    
    Still, even in passing, there's something to see, songs to hear, and joy to be drawn from the simple, temporary presence of the circus.
    
    From the campsite, you have a good view of the trade route that the circus will pass along. Already, if you squint, you can see the head of the procession.
    
    The lead vehicle is gigantic, with huge, powerful front wheels and a long, segmented caterpillar track at the rear. A dozen other jalopies follow behind.
    
    @audioPlay:waver
    @image:bunting
    
    Each member of the caravan has some kind of platform affixed to the top; as the parade gets closer, the blurry figures atop them resolve into the shapes of performers.
    
    Aboard a vehicle that seems more like a boat with wheels, there are clowns with elaborate headdresses, and riding on outriggers, magicians that cast puffs of fire into the air.
    
    From scaffold towers mounted on the backs of other vehicles, trapeze artists swing and guidons wave colourful flags, catching the eye of wanderers far and wide.
    
    By now, the convoy has attracted a small crowd on the wayside. Other denizens have crawled out of their bivouacs and hidey-holes, leaving the safety and comfort of their camps to witness the spectacle.
    
    All along the road, the spectators cheer as the parade passes by. The ringmaster - a squat, five-eyed fellow with a peg-leg and an enormous hat - receives their praise with gratitude, bowing and clasping her hands together.
    
    Behind the ringmaster, standing together beneath a pergola, high up on one of the parade floats, there are an assortment of clowns, performers and dancers all wearing broad smiles and waving.
    
    It's a wistful sight. Only those talented enough to travel with the circus are allowed to join. Those that do enjoy free meals, protection in numbers, and tutelage in arts - such as clownery - that would otherwise be lost to time.
    
    You watch in bittersweet awe as the entertainers give their final performances before moving beyond your sight. Before long, the convoy has moved past your camp, and yet still you watch as they depart.
    
    The circus is moving steadily into the distance by the time you catch sight of the shimmering shape approaching from their direction. It's a flutter of bright colour against the twilight sky – a dozen triangles of red, flying back toward you.
    
    They land in a heap on the muddy road, where the ground has been thoroughly churned by the tracks and wheels of the convoy. But the crimson colour seems brighter than ever. It takes a second to realise what they are.
    
    They're pieces of hessian canvas, cut into flags and stained red with some kind of brilliant dye, strung together on a piece of plastic wire.
    
    You quickly run down to the road to collect them, and a few of the remaining onlookers regard you with jealousy. It takes a few tense moments to gather up the flags before you quickly make your way back to your camp, taking care not to let them drag behind you.
    
    Back at the fire, you admire the craftsmanship of the string of flags. There's no doubt it came from the circus, and you almost feel bad for not trying to return it to them.
    
    But the bunting serves as such a sweet reminder of the joy that the circus can bring that, despite what your senses tell you, you swear you can still hear their song.
    
    You decide to hang the bunting, and after a perilous climb up the monstrous ribs that protrude from the lake, you almost feel like a circus performer yourself.
    
    It takes a little while to find a way to secure them properly, but once you're back on the ground, it's clear that it was the right decision.
    
    Perhaps the magnificence of the bunting will attract the jealousy of your neighbours, or perhaps it will signal to other weary travellers that your campfire is a welcoming place to unwind and recuperate from the stresses of the world.
    
    But, most of all, it's a joy to have a decoration that inspires a smile each time you lift your gaze to the sky.

    @audioStop:waver

->outro


// --------------------------------
// OUTRO Container
// --------------------------------
=== outro ===

...

@audioPlay:rust-magic

Thank you for dropping by! We worked incredibly hard on this project for months. 

If you'd like to listen/download all the music, check out our Bandcamp page linked in the header. There, you can also make an optional donation to support the hosting costs of this site.

If you'd like to browse all of the character and environment art, check out the gallery linked in the header.

To learn our names, see the credits page.

We hope to see you next year with our Creativity Jam 2024 project!

That's all folks!

[Advancing past here will stop the outro song]

@audioStop:rust-magic

->END
