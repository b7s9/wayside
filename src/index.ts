import { Choice } from 'inkjs/engine/Choice';
import { Story } from 'inkjs/engine/Story';
import story_data from '../static/data/the_intercept.json';
// @ts-ignore
import * as images from '../static/img/*.png';
import gsap from 'gsap';
import { ScrollToPlugin } from "gsap/ScrollToPlugin";
import { GameAudio } from './audio';
gsap.registerPlugin(ScrollToPlugin);

class Game {
    story: Story;
    story_display: HTMLDivElement;
    text_display: HTMLDivElement;
    choice_display: HTMLDivElement;
    image_container: HTMLDivElement;
    audio: GameAudio;

    constructor() {
        this.story_display = document.querySelector("#story-display")!;
        this.text_display = document.querySelector("#text-display")!;
        this.choice_display = document.querySelector("#choice-display")!;
        this.image_container = document.querySelector("#image-container")!;
        this.story = new Story(story_data);
        this.audio = new GameAudio();
        this.audio.preload();
    }

    start() {
        this.next_paragraph();
    }

    async next_paragraph() {
        await this.clear_choices();
        
        let text = this.story.Continue()!;
        for (let image_name of text.matchAll(/@image:([\w\d-_]+)/g)) {
            this.add_image(image_name[1]);
        }

        for (let audio_name of text.matchAll(/@audio:([\w\d-_]+)/g)) {
            this.audio.play(audio_name[1], true);
        }
        await this.add_text(text);
        
        if (this.story.canContinue) {
            this.add_next_button();
        } else {
            this.add_choices(this.story.currentChoices);
        }
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
        gsap.to(this.text_display, { scrollTo: 'max', duration: 0.5 });
    }

    async add_choices(choices: Choice[]) {
        for (let choice of choices) {
            let button = document.createElement("button");
            button.innerText = choice.text;
            button.addEventListener("click", () => {
                this.story.ChooseChoiceIndex(choice.index);
                this.next_paragraph();
            });
            this.choice_display.appendChild(button);
            gsap.fromTo(button, { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.2, delay: 0.1 * choice.index });
        }
    }

    async add_next_button() {
        let button = document.createElement("button");
        button.innerText = ">";
        button.addEventListener("click", () => {
            this.next_paragraph();
        });
        this.choice_display.replaceChildren(button);
        gsap.fromTo(button, { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.2 });
    }

    async add_image(image_name: string) {
        // WARNING: only works with PNG images
        let new_img = document.createElement("img");
        new_img.src = images[image_name];
        new_img.classList.add("object-contain", "w-full", "h-fit", "absolute", "top-0", "left-0");
        game.image_container.appendChild(new_img);
        gsap.fromTo(new_img, { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.2 });
    }

    async clear_choices() {
        await gsap.to(this.choice_display.children, { autoAlpha: 0, duration: 0.2 });
        this.choice_display.replaceChildren();
    }
}

let game = new Game();
game.start();

let play_popup = document.querySelector("#play-popup")!;
let play_popup_button = play_popup.querySelector("button")!;
play_popup_button.addEventListener("click", () => {
    gsap.to(play_popup, { autoAlpha: 0, duration: 0.5 });
});