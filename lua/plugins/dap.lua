return {
  "mfussenegger/nvim-dap",

  -- stylua: ignore
  keys = {
    { "<F8>", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<F9>", function() require("dap").continue() end, desc = "Continue" },
    { "<F10>", function() require("dap").step_over() end, desc = "Step Over" },
    { "<F11>", function() require("dap").step_into() end, desc = "Step Into" },
    -- -- in kitty.teminfo 	F23 corresponds to Shift-F11 (kf23=\E[23;2~,)
    { "<F23>", function() require("dap").step_out() end, desc = "Step Out" },
    { "<F12>", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },
}
