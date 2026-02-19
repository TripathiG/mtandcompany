/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        'warm-white': '#FDFBF7',
        'primary-purple': '#5A3E8A',
        'accent-purple': '#8C66FF',
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
        mono: ['Space Grotesk', 'monospace'],
      },
    },
  },
  plugins: [],
}