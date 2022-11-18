import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import axios from 'redaxios'

// https://vitejs.dev/config/
export default defineConfig({
  server: {
    host: '192.168.50.115',
    port: 5173,
    cors: true
  },
  plugins: [vue()],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
})
