module.exports = {
    content: ["./src/**/*.{html,js}"],
    theme: {
        extend: {
            colors: {
                // 'transparent': 'transparent',
                // 'current': 'currentColor',
                'surface': {
                    900: '#160F18',
                    800: '#1E1826'
                }
            },

            screens: {
                'md': '820px'
            }
        },

        fontFamily: {
            'serif': ['serif'],
            'sans': ['DM Sans', 'Helvetica Neue', 'Helvetica', 'Roboto', 'sans-serif'],
            'paper': ['Epilogue', 'Helvetica Neue', 'Helvetica', 'Roboto', 'sans-serif'],
            'action': ['Grandstander', 'Helvetica Neue', 'Helvetica', 'Roboto', 'sans-serif'],
        }
    },
    plugins: [],
}
