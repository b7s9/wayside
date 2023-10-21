import { Choice } from 'inkjs/engine/Choice';
import { Story } from 'inkjs/engine/Story';
import story_data from '../static/data/main.json';
// @ts-ignore
import * as sceneImages from '../static/img/dynamic-img/*.png';
// @ts-ignore
import * as bgImages from '../static/img/bg-img/*.png';
// @ts-ignore
import * as emotes from '../static/img/emotes/*.png';
import { dynamicLayerMap, bgLayerMap } from './layer-map';

import gsap from 'gsap';
import { ScrollToPlugin } from "gsap/ScrollToPlugin";
import { GameAudio } from './audio';
gsap.registerPlugin(ScrollToPlugin);

class Game {
    private displayChat = false //if true, all following msgs treated as chat bubbles
    private chatImgSrc = '' //the image source for chat box emotes. Use in context as emotes[chatImgSrc]

    story: Story;
    story_display: HTMLDivElement;
    text_display: HTMLDivElement;
    choice_display: HTMLDivElement;
    image_container: HTMLDivElement;
    audio: GameAudio;
    active_image: string;
    last_choice: string

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

        if (this.last_choice) {
            this.add_text(this.last_choice, true)
            this.last_choice = ''
        }

        let text = this.story.Continue()!;

        for (let image_name of text.matchAll(/@image:([\w\d-_]+)/g)) {
            this.add_image(image_name[1]);
        }

        for (let audio_name of text.matchAll(/@audioPlay:([\w\d-_]+)/g)) {
            // TODO:
            // load new scene audio track
            // fade out last scene audio track
            // fade in new scene audio track
            // music files will automatically loop, sfx files will not
            game.audio.playAudio(audio_name[1]);
        }
        for (let audio_name of text.matchAll(/@audioStop:([\w\d-_]+)/g)) {
            game.audio.stopAudio(audio_name[1]);
        }

        for (let char_emote of text.matchAll(/@chatStart:([\w\d-_]+)/g)) {
            this.displayChat = true
            this.chatImgSrc = emotes[char_emote[1]]
        }
        for (let char_emote of text.matchAll(/@chatEnd:([\w\d-_]+)/g)) {
            this.displayChat = false
            this.chatImgSrc = ''
        }

        text = text.replace(/@([\w\d-_]+):([\w\d-_]+)/g, '');
        if (text.trim().length === 0 && this.story.canContinue) {
            this.next_paragraph();
            return;
        }

        await this.add_text(text);

        if (this.story.canContinue) {
            this.add_next_button();
        } else {
            this.add_choices(this.story.currentChoices);
        }
    }

    async add_text(text: string, isChoice: boolean = false) {
        let prev_paragraph = this.text_display.lastChild;
        gsap.to(prev_paragraph, { autoAlpha: 0.7, duration: 0.3 });

        let paragraph: HTMLElement

        if (this.displayChat) {
            paragraph = this.add_chat_bubble(this.chatImgSrc, text)
        } else {
            paragraph = document.createElement("p");
            isChoice && paragraph.classList.add('repeated-choice-text')
            // Careful here! Safe for now, because the text can only come from our own story
            // We use innerHTML here so story writers can include <span> elements and stuff
            // for all kinds of fun effects
            paragraph.innerHTML = text;
        }

        this.text_display.appendChild(paragraph);
        await gsap.fromTo(paragraph, { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.3 });
        gsap.to(this.text_display, { scrollTo: 'max', duration: 0.5 });
    }

    // TODO: add different CSS classes for Next button vs. Choices
    async add_choices(choices: Choice[]) {
        for (let choice of choices) {
            let button = document.createElement("button");
            button.classList.add('choice-button')
            button.innerText = choice.text;
            button.addEventListener("click", () => {
                game.audio.playAudio('short-chime-2')
                this.setLastChoice(choice.text)
                this.story.ChooseChoiceIndex(choice.index);
                this.next_paragraph();
            });
            this.choice_display.appendChild(button);
            gsap.fromTo(button, { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.2, delay: 0.1 * choice.index });
        }
    }

    async add_next_button() {
        let button = document.createElement("button");
        button.classList.add('next-button')
        button.innerText = "Next ->";
        button.addEventListener("click", () => {
            this.next_paragraph();
            game.audio.playAudio('page-turn-1')
        });
        this.choice_display.replaceChildren(button);
        gsap.fromTo(button, { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.2 });
    }

    add_image(image_name: string, is_background: boolean = false, is_fire_animation: boolean = false) {
        // WARNING: only works with PNG images
        let new_img = document.createElement("img");

        const src = is_background ? bgImages[bgLayerMap[image_name].src] : sceneImages[dynamicLayerMap[image_name].src]
        new_img.src = src;

        new_img.classList.add("game-img");
        const zIndex = is_background ? bgLayerMap[image_name].layer : dynamicLayerMap[image_name].layer;
        new_img.style.zIndex = zIndex.toString();
        game.image_container.appendChild(new_img);

        !is_background && new_img.classList.add("current-img")

        gsap.set(new_img, { autoAlpha: 0 });
        new_img.addEventListener("load", () => gsap.fromTo(new_img, { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.5 }));

        is_fire_animation && new_img.classList.add("fire-animation")

        setTimeout(() => {
            new_img.classList.remove("current-img")
        }, 1000);
    }

    add_chat_bubble(image_name: string, text_content: string) {
        const chatBubbleContainer = document.createElement('div')
        chatBubbleContainer.classList.add('chat-bubble')

        const chatDialog = document.createElement('p')
        chatDialog.classList.add('dialog')
        chatDialog.textContent = text_content

        const avatar = document.createElement('img')
        avatar.src = image_name
        avatar.classList.add('avatar')

        chatBubbleContainer.appendChild(chatDialog)
        chatBubbleContainer.appendChild(avatar)

        return chatBubbleContainer
    }

    async renderBackground() {
        for (let [imgName, img] of Object.entries(bgLayerMap)) {
            // this.add_image(img.src, img.layer, true)

            if (imgName === 'fireLight') {
                this.add_image(imgName, true, true)
            } else {
                this.add_image(imgName, true)
            }

        }
    }

    setLastChoice(buttonText) {
        if (buttonText.indexOf(' ') > -1) return false;
        this.last_choice = buttonText;
    }

    async clear_choices() {
        await gsap.to(this.choice_display.children, { autoAlpha: 0, duration: 0.2 });
        this.choice_display.replaceChildren();
    }
}

let game = new Game();
game.start();
game.renderBackground()

let play_popup = document.querySelector("#play-popup")!;
let play_popup_button = play_popup.querySelector("button")!;
play_popup_button.addEventListener("click", () => {
    gsap.to(play_popup, { autoAlpha: 0, duration: 0.5 });
    game.audio.playAudio('chime-1')
    game.audio.playAudio('amb-loop-1')
});

let overlayBg = document.getElementById('overlay-bg')
let settingsMenu = document.getElementById('settings-menu')
let settingsMenuButton = document.getElementById('settings-menu-toggle')
settingsMenuButton?.addEventListener('click', (e) => {
    console.log('click')
    overlayBg?.classList.remove('hidden')
    settingsMenu?.classList.remove('hidden')
})

let settingsMenuClose = document.getElementById('settings-menu-close')
settingsMenuClose?.addEventListener('click', (e) => {
    console.log('close')
    overlayBg?.classList.add('hidden')
    settingsMenu?.classList.add('hidden')

})

// let volumeInputs = document.querySelectorAll('.vol')
// for(const [key, input] of volumeInputs){
//     input.value[key]
// }

let masterVolumeInput = document.getElementById('master-volume-input')
// masterVolumeInput.value = game.audio.master.volume.value;
masterVolumeInput.value = 1;

masterVolumeInput?.addEventListener('change', (e) => {
    setVolume(e.currentTarget.value, 'master')
})

let musVolumeInput = document.getElementById('mus-volume-input')
// musVolumeInput.value = game.audio.musVolume.volume.value;
musVolumeInput.value = 1;

musVolumeInput?.addEventListener('change', (e) => {
    setVolume(e.currentTarget.value, 'mus')
})

let sfxVolumeInput = document.getElementById('sfx-volume-input')
// sfxVolumeInput.value = game.audio.sfxVolume.volume.value;
sfxVolumeInput.value = 1;

sfxVolumeInput?.addEventListener('change', (e) => {
    setVolume(e.currentTarget.value, 'sfx')
})






function setVolume(inputValue, volumeDestination) {
    let x = Number(inputValue)

    if (x == 0) {
        game.audio.setVolume(-Number.MAX_VALUE, volumeDestination)
        return false
    }

    // let g = (Math.exp(x) - 1) / (Math.E - 1)

    // let base = 10000
    // let g = (Math.pow(base, x) - 1) / (base - 1)
    // let y = Math.log(g)
    // let y = (g - 1) / g


    //discord
    let y = (x * 24) - 24
    // let y = 10 * (g / 20)
    // let y = Math.pow(10, (g / 20))

    console.log('x = ' + x)
    console.log('y = ' + y)
    console.log('------------')
    game.audio.setVolume(y, volumeDestination)
}
