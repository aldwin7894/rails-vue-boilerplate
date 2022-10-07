import { defineConfig, splitVendorChunkPlugin } from "vite";
import RubyPlugin from "vite-plugin-ruby";
import FullReload from "vite-plugin-full-reload";
import { brotliCompressSync } from "zlib";
import gzipPlugin from "rollup-plugin-gzip";
import vue from "@vitejs/plugin-vue";
import { quasar, transformAssetUrls } from "@quasar/vite-plugin";

export default defineConfig({
  plugins: [
    RubyPlugin(),
    vue({
      template: { transformAssetUrls },
    }),
    quasar({
      sassVariables: "app/frontend/stylesheets/quasar-variables.css.scss",
    }),
    ...(
      process.env.NODE_ENV === "production"
        ? [FullReload(["config/routes.rb", "app/views/**/*"], { delay: 200 })]
        : []
    ),
    gzipPlugin(),
    gzipPlugin({
      customCompression: (content) => brotliCompressSync(Buffer.from(content)),
      fileName: ".br",
    }),
    splitVendorChunkPlugin(),
  ],
  build: {
    emptyOutDir: true,
    assetsInlineLimit: 24000,
    cssCodeSplit: true,
    target: "esnext",
    sourcemap: false,
  },
});
