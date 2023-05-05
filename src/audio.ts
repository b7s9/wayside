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
    master: Tone.Volume; // master volume
    musVolume: Tone.Volume; // master volume
    sfxVolume: Tone.Volume; // master volume
    // compressor: Tone.Compressor
    // limiter: Tone.Limiter
    audioSources: AudioPlayers;

    constructor() {
        this.master = new Tone.Volume(0).toDestination();
        this.musVolume = new Tone.Volume(-6).connect(this.master);
        this.sfxVolume = new Tone.Volume(-6).connect(this.master);
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
            }).connect(this.sfxVolume);
        }
        for (const [name, url] of Object.entries(audioMusicUrls)) {
            this.audioSources[name] = new Tone.Player({
                url: '' + url, //implicit string type conversion needed for some reason
                fadeIn: 1.5,
                fadeOut: 1,
                loop: true,
                volume: 0
            }).connect(this.musVolume);
        }
        for (const [name, url] of Object.entries(audioAmbUrls)) {
            this.audioSources[name] = new Tone.Player({
                url: '' + url, //implicit string type conversion needed for some reason
                fadeIn: 2,
                fadeOut: 2,
                loop: true,
                volume: 0,
            }).connect(this.sfxVolume);
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

    setVolume(volume: number, destinationStr: string = 'master') {
        let destination: Tone.Volume;
        if (destinationStr === 'sfx') {
            destination = this.sfxVolume
        } else if (destinationStr === 'mus') {
            destination = this.musVolume
        } else {
            destination = this.master
        }

        destination.volume.value = volume;
    }
}
