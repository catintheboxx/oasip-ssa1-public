import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import moment from 'moment';

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue(), moment],
  base: '/ssa1/',
  server: {
    proxy: {
      '/api': {
        target: 'http://intproj21.sit.kmutt.ac.th/ssa1',
        changeOrigin: true,
        secure: false,
      },
    },
  },
});
