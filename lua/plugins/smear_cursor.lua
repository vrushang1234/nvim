return {
  {
    "https://github.com/sphamba/smear-cursor.nvim",
    config = function()
      require("smear_cursor").setup({
        cursor_color = "#ffffff",

        never_draw_over_target = true,

        smear_insert_mode = false,
        min_vertical_distance_smear = 3,
        min_horizontal_distance_smear = 4,

        time_interval = 16,

        stiffness = 0.7,
        trailing_stiffness = 0.65,
        damping = 0.9,

        distance_stop_animating = 0.6,
        max_length = 12,
        smear_between_buffers = false
      })
    end,
  },
}
