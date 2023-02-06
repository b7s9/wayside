import * as Tone from 'tone'

// @ts-ignore
import * as audioMusicUrls from 'url:../static/audio/music/*.m4a';
// @ts-ignore
import * as audioSfxUrls from 'url:../static/audio/sfx/*.m4a';
import { ToneAudioNode, ToneAudioNodeOptions } from 'tone';

interface AudioPlayers {
    [key: string]: Tone.Player
}
export class GameAudio {
    // masterFader: ToneAudioNode
    volume: Tone.Volume // master volume
    // compressor: Tone.Compressor
    // limiter: Tone.Limiter
    audioSources

    constructor() {
        this.volume = new Tone.Volume(-6).toDestination();
        // this.compressor = new Tone.Compressor({
        //     threshold: -9,
        //     ratio: 2,
        //     attack: 0.2,
        //     release: 0.4
        // })
        // this.compressor.connect(this.volume)

        this.audioSources = {}
    }

    preload() {
        for (const [name, url] of Object.entries(audioSfxUrls)) {
            this.audioSources[name] = new Tone.Player({
                url: '' + url, //implicit string type conversion needed for some reason
                loop: false
            }).connect(this.volume)
        }
        for (const [name, url] of Object.entries(audioMusicUrls)) {
            this.audioSources[name] = new Tone.Player({
                url: '' + url, //implicit string type conversion needed for some reason
                fadeIn: 1.5,
                fadeOut: 1,
                loop: true
            }).connect(this.volume)
        }


        // this.audioSources.waterways = new Tone.Player({
        //     url: audioSfxUrls['chime-1'],
        //     // fadeIn: 1.5,
        //     // fadeOut: 1,
        //     // loop: true
        // }).connect(this.volume)
    }

    // file_name: string
    playAudio(filename: string) {
        // Tone.loaded().then(() => {
        this.audioSources[filename].start()
        // })

    }


}

// export class GameAudio {
    // private context: AudioContext;
    // private output_node: AudioNode;
    // private loaded_files: { [k: string]: AudioBuffer } = {};

    // constructor() {
    //     this.context = new AudioContext();

    //     let gain = this.context.createGain();
    //     gain.gain.value = 0.3;
    //     let limiter = this.context.createDynamicsCompressor();
    //     limiter.attack.value = 0;
    //     gain.connect(limiter).connect(this.context.destination);

    //     this.output_node = gain;
    // }

    // play(file_name: string, loop: boolean) {
    //     if (this.loaded_files[file_name] === undefined) {
    //         console.warn(`Tried playing audio file ${file_name}, but it's not loaded`);
    //         return;
    //     }

    //     let source = this.context.createBufferSource();
    //     source.buffer = this.loaded_files[file_name];
    //     source.loop = loop;
    //     source.connect(this.output_node);
    //     source.start();
    // }

    // async load_file(file_name: string) {
    //     let file = await fetch(audio_files[file_name]);
    //     let buffer = await file.arrayBuffer();
    //     this.loaded_files[file_name] = await this.context.decodeAudioData(buffer);
    // }

    // async preload() {
    //     await Promise.all([
    //         // TODO: add sound files here
    //         this.load_file('button-click-1'),
    //         this.load_file('button-hover-1'),
    //         this.load_file('chime-1'),
    //         this.load_file('short-chime-1'),
    //         this.load_file('short-chime-2'),
    //         this.load_file('short-chime-3'),
    //         this.load_file('short-chime-4'),

    //         this.load_file('ben-song-waterways'),
    //         // this.load_file("ping"),
    //         // this.load_file("click"),
    //     ]);
    // }
// }
