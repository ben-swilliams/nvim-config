local wk = require("which-key")

wk.register({
  o = {
    name = "[o]pen",
    p = { function() require("lazy").home() end, "Lazy [p]lugin manager" }
  }
}, {
  prefix = "<leader>"
})
