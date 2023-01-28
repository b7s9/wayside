import { Choice } from 'inkjs/engine/Choice';
import { Story } from 'inkjs/engine/Story';
import story_data from '../static/data/the_intercept.json';
import gsap from 'gsap';
import { ScrollToPlugin } from "gsap/ScrollToPlugin";
gsap.registerPlugin(ScrollToPlugin);

class Game {
    story: Story;
    story_display: HTMLDivElement;
    text_display: HTMLDivElement;
    choice_display: HTMLDivElement;

    constructor() {
        this.story_display = document.querySelector("#story-display")!;
        this.text_display = document.querySelector("#text-display")!;
        this.choice_display = document.querySelector("#choice-display")!;
        this.story = new Story(story_data);
    }

    start() {
        this.continue_until_choice();
    }

    async continue_until_choice() {
        await this.clear_choices();

        while (this.story.canContinue) {
            // TODO: figure out if Story::Continue can ever return null here
            await this.add_text(this.story.Continue()!);
        }

        this.add_choices(this.story.currentChoices);
    }

    async add_text(text: string) {
        let prev_paragraph = this.text_display.lastChild;
        gsap.to(prev_paragraph, { autoAlpha: 0.7, duration: 0.3 });
        
        let paragraph = document.createElement("p");
        // Careful here! Safe for now, because the text can only come from our own story
        // We use innerHTML here so story writers can include <span> elements and stuff
        // for all kinds of fun effects
        paragraph.innerHTML = text;
        this.text_display.appendChild(paragraph);
        await gsap.fromTo(paragraph, { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.3 });
        gsap.to(this.story_display.parentElement, { scrollTo: 'max', duration: 0.5 });
    }

    add_choices(choices: Choice[]) {
        for (let choice of choices) {
            let button = document.createElement("button");
            button.innerText = choice.text;
            button.addEventListener("click", () => {
                this.story.ChooseChoiceIndex(choice.index);
                this.continue_until_choice();
            });
            this.choice_display.appendChild(button);
        }
    }

    async clear_choices() {
        await gsap.to(this.choice_display.children, { autoAlpha: 0, duration: 0.2 });
        this.choice_display.replaceChildren();
    }
}

let game = new Game();
game.start();