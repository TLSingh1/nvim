 require("obsidian").setup({
   dir = "~/brain",
   completion = {
     nvim_cmp = true,
   },
   templates = {
     subdir = "Templates",
     date_format = "%a-%m-%d-%Y",
     time_format = "%H:%M",
   },
   finder = "telescope.nvim"
 })
