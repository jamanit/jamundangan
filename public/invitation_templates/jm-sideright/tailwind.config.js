module.exports = {
  content: [
    "./dist/*.html",
    "./dist/assets/*.js"],
  theme: {
    extend: {
      colors: {
        "primary-golden-brown": {
          DEFAULT: "#D89959",
          400: "#D89959",
          500: "#D6A157",
          600: "#B88849",
        },
      },
      fontFamily: {
        worksans: ["Work Sans", "sans-serif"],
        sacramento: ["Sacramento", "cursive"],
      },
    },
  },
  plugins: [],
};
