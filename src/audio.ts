import * as Tone from 'tone'

// @ts-ignore
import * as audioMusicUrls from 'url:../static/audio/music/*.m4a';
// @ts-ignore
import * as audioSfxUrls from 'url:../static/audio/sfx/*.m4a';
// @ts-ignore
import * as audioAmbUrls from 'url:../static/audio/amb/*.m4a';

interface AudioPlayers {
    [key: string]: Tone.Player
}
export class GameAudio {
    // masterFader: ToneAudioNode
    volume: Tone.Volume; // master volume
    // compressor: Tone.Compressor
    // limiter: Tone.Limiter
    audioSources: AudioPlayers;

    constructor() {
        this.volume = new Tone.Volume(-6).toDestination();
        // this.compressor = new Tone.Compressor({
        //     threshold: -9,
        //     ratio: 2,
        //     attack: 0.2,
        //     release: 0.4
        // })
        // this.compressor.connect(this.volume)

        this.audioSources = {};
    }

    preload() {
        for (const [name, url] of Object.entries(audioSfxUrls)) {
            this.audioSources[name] = new Tone.Player({
                url: '' + url, //implicit string type conversion needed for some reason
                loop: false
            }).connect(this.volume);
        }
        for (const [name, url] of Object.entries(audioMusicUrls)) {
            this.audioSources[name] = new Tone.Player({
                url: '' + url, //implicit string type conversion needed for some reason
                fadeIn: 1.5,
                fadeOut: 1,
                loop: true
            }).connect(this.volume);
        }
        for (const [name, url] of Object.entries(audioAmbUrls)) {
            this.audioSources[name] = new Tone.Player({
                url: '' + url, //implicit string type conversion needed for some reason
                fadeIn: 2,
                fadeOut: 2,
                loop: true,
                volume: -3,
            }).connect(this.volume);
        }
    }

    playAudio(filename: string) {
        // Tone.loaded().then(() => {
        this.audioSources[filename].start();
        // })
    }

    stopAudio(filename: string) {
        this.audioSources[filename].stop();
    }
}
