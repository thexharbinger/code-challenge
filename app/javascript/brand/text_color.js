export const text_color = (val) => {
  const r = parseInt(val.slice(1, 3), 16),
        g = parseInt(val.slice(3, 5), 16),
        b = parseInt(val.slice(5, 7), 16);
  // http://www.w3.org/TR/AERT#color-contrast
  const brightness = Math.round(((parseInt(r) * 299) +
                      (parseInt(g) * 587) +
                      (parseInt(b) * 114)) / 1000);
  return (brightness > 125) ? 'black' : 'white';
}