module Colors
  RGB_COLOR_MAP = {
    black: "0;0;0",
    white: "255;255;255",
    red: "255;0;0",
    lime: "0;255;0",
    blue: "0;0;255",
    yellow: "255;255;0",
    green: "0;128;0",
    aqua: "0;255;255"
  }.freeze

  refine String do
    def fg_color(color_name)
      rgb_val = RGB_COLOR_MAP[color_name]
      "\e[38;2;#{rgb_val}m#{self}\e[0m"
    end
  end

end
