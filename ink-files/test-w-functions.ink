=== function start_chat_bubble(character) ===
<span class="chat-bubble"> <img src="img/{character}.png" />

=== function end_chat_bubble ===
</span>

=== main ===
    As you sit at the fire, soaking in its subtle warmth, you begin to feel the sometimes-familiar sensation of curious eyes burrowing into you.
    
    
    You look around for a sign of the mystery observer, but there doesn't seem to be anyone around. There's just the quiet sound of the wind, and the lapping of the lakewater against the mossy islands.
    
    
    You turn your head back to the fire, and there it is. Staring at you.
    
    
    @image:ljs
    
    
    The creature doesn't say anything when you express your surprise at its sudden appearance. It just smiles.
    
    
    After a moment, your eyes are drawn to the creature's one item of clothing: a pair of blue, denim shorts. They notice you noticing, and flap their fins against their tummy in excitement.
    
    
    Finally, they say something.
    
    {start_chat_bubble("Littimer")}
    You like my jawts?
    {end_chat_bubble()}
    
    It's a question that's hard to answer. You've not seen anything quite like it before - such scandalously short shorts are certainly not the fashion in any of the communes you've visited.
    
    
    But there's a local rumour, some story you've heard about a person like this - something about a wasteland wanderer with a peculiar eye for style.
    
    
    You meet that peculiar eye - just one of them, since the creature's fish-like body means they have to stand slightly side-on in order to see you - and answer their question.
    
    
    Do you like their jawts?
    
    
    * [Yes] They curl the sides of their gawping mouth like a feasting sturgeon - you think that's a smile - and pat their tummy again, excited.
    
    {start_chat_bubble("Littimer")}
    Littimer loves the joornts. Supercool!
    {end_chat_bubble()}
    -> END
    
    * [No] The fish-man seems saddened, and for a moment you're worried that honesty was not the best policy. But then they speak.
    
    {start_chat_bubble("Littimer")}
    That's okay. Littimer likes them. Good enough for Littimer.
    {end_chat_bubble()}
    
    A peaceful moment passes, and the mood between you seems to lighten up. Littimer doesn't seem like a threat. Just another traveller, looking for the warmth of a pyre.
    
-> main

