// @ts-ignore
import * as audio_files from 'url:../static/audio/**/*.m4a';

export class GameAudio {
    private context: AudioContext;
    private output_node: AudioNode;
    private loaded_files: { [k: string]: AudioBuffer } = {};

    constructor() {
        this.context = new AudioContext();

        let gain = this.context.createGain();
        gain.gain.value = 0.3;
        let limiter = this.context.createDynamicsCompressor();
        limiter.attack.value = 0;
        gain.connect(limiter).connect(this.context.destination);

        this.output_node = gain;
    }

    play(file_name: string, loop: boolean) {
        if (this.loaded_files[file_name] === undefined) {
            console.warn(`Tried playing audio file ${file_name}, but it's not loaded`);
            return;
        }

        let source = this.context.createBufferSource();
        source.buffer = this.loaded_files[file_name];
        source.loop = loop;
        let gain = this.context.createGain();
        gain.gain.value = 0.3;
        source.connect(this.output_node);
        source.start();
    }

    async load_file(file_name: string) {
        let file = await fetch(audio_files[file_name]);
        let buffer = await file.arrayBuffer();
        this.loaded_files[file_name] = await this.context.decodeAudioData(buffer);
    }

    async preload() {
        await Promise.all([
            // TODO: add sound files here
            this.load_file('button-click-1'),
            this.load_file('button-hover-1'),
            this.load_file('chime-1'),
            this.load_file('short-chime-1'),
            this.load_file('short-chime-2'),
            this.load_file('short-chime-3'),
            this.load_file('short-chime-4'),

            this.load_file('ben-song-waterways'),
            // this.load_file("ping"),
            // this.load_file("click"),
        ]);
    }
}
